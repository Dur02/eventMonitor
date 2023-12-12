import type { Ref, VNodeChild } from 'vue'
import { reactive, ref } from 'vue'
import { defineStore } from 'pinia'
import {
  deleteEventConfig,
  getEventConfigList,
  getSingleEventConfig,
  StopTaskRun,
  updateEventConfigShow
} from '@/api/eventConfiguration'
import type { PaginationInfo, PaginationProps, DataTableRowKey } from 'naive-ui'
import { flow, map } from 'lodash/fp'
import type { searchFormType } from '@/types/components/config/common'
import type { eventConfigRowsType } from '@/types/components/config/event'
import { runTask as runTaskApi } from '@/api/eventAnalyse'
import deepCopy from '@/utils/function/deepcopy'
import {
  deleteGraphConfig,
  getGraphConfigList,
  getSingleGraphConfig
} from '@/api/gkgConfiguration'

// @ts-ignore
const mapWithIndex = map.convert({ cap: false })

export const useConfigStore = defineStore('config', () => {
  const configPage: Ref<'event' | 'graph' | ''> = ref('')
  const reloadFun: Ref<Function | null> = ref(null)
  const updateSingleFun: Ref<Function | null> = ref(null)
  const updateIsShowFun: Ref<Function | null> = ref(null)
  const runTaskFun: Ref<Function | null> = ref(null)
  const stopTaskFun: Ref<Function | null> = ref(null)
  const deleteFun: Ref<Function | null> = ref(null)
  const tableLoading: Ref<boolean> = ref(false)
  const dataRef: Ref<Array<object>> = ref([])
  const checkedRowKeysRef: Ref<DataTableRowKey[]> = ref([])
  const lastSearchValue: Ref<searchFormType> = ref({
    configName: '',
    configType: null,
    runStatus: null,
    createByName: ''
  })
  const paginationReactive: PaginationProps = reactive({
    page: 1,
    pageSize: 10,
    itemCount: 0,
    showQuickJumper: true,
    suffix ({ itemCount }: PaginationInfo): VNodeChild {
      return `共${itemCount}条`
    }
  })

  const setConfigPage = (newValue: 'event' | 'graph' | '') => {
    configPage.value = newValue
    switch (newValue) {
      case "event": {
        reloadFun.value = getEventConfigList
        updateSingleFun.value = getSingleEventConfig
        updateIsShowFun.value = updateEventConfigShow
        runTaskFun.value = runTaskApi
        stopTaskFun.value = StopTaskRun
        deleteFun.value = deleteEventConfig
        break
      }
      case "graph": {
        reloadFun.value = getGraphConfigList
        updateSingleFun.value = getSingleGraphConfig
        updateIsShowFun.value = updateEventConfigShow
        runTaskFun.value = runTaskApi
        stopTaskFun.value = StopTaskRun
        deleteFun.value = deleteGraphConfig
        break
      }
      default: {
        reloadFun.value = null
        updateSingleFun.value = null
        updateIsShowFun.value = null
        runTaskFun.value = null
        stopTaskFun.value = null
        deleteFun.value = null
        break
      }
    }
  }

  const setTableLoading = (newValue: boolean) => {
    tableLoading.value = newValue
  }

  const changeLastSearchValue = (newValue: searchFormType) => {
    lastSearchValue.value = newValue
  }

  const setCheckedRowKeys = (newValue: DataTableRowKey[]) => {
    checkedRowKeysRef.value = newValue
  }


  const reloadTableData = async (page: number) => {
    if (!tableLoading.value) {
      tableLoading.value = true
      paginationReactive.page = page
      // 数据发生变化就重置多选的行为空
      setCheckedRowKeys([])
      try {
        const { rows, total } = await reloadFun.value!({
          ...lastSearchValue.value,
          pageNum: page,
          pageSize: paginationReactive.pageSize!
        })
        dataRef.value = mapWithIndex((item: any, index: number) => ({
          ...item,
          numbers: index + (page - 1) * paginationReactive.pageSize! + 1
        }))(rows)
        paginationReactive.itemCount = total
      } catch (e) {
        tableLoading.value = false
        return Promise.reject()
      }
      tableLoading.value = false
    }
    return Promise.resolve()
  }

  const updateSingle = async (id: number) => {
    if (!tableLoading.value) {
      tableLoading.value = true
      try {
        const { data } = await updateSingleFun.value!({ id })
        dataRef.value = flow(
          map((item: eventConfigRowsType) => {
            if (item.id === data.id) {
              return {
                ...item,
                data
              }
            }
            return item
          })
        )(deepCopy(dataRef.value))
        tableLoading.value = false
        return Promise.resolve(data.runStatus)
      } catch (e) {
        return Promise.reject()
      }
    }
  }

  const changeIsShow = async (id: number, isShow: number) => {
    if (!tableLoading.value) {
      tableLoading.value = true
      try {
        await updateIsShowFun.value!({ configId: id, isShow: isShow === 1 ? 0 : 1 })
        tableLoading.value = false
        await reloadTableData(paginationReactive.page!)
      } catch (e) {
        tableLoading.value = false
        return Promise.reject()
      }
      tableLoading.value = false
    }
    return Promise.resolve()
  }

  const runTask = async (id: number) => {
    try {
      dataRef.value = flow(
        map((item: any) => {
          if (item.id === id) {
            return {
              ...item,
              runStatus: 1
            }
          }
          return item
        })
      )(deepCopy(dataRef.value))
      await runTaskFun.value!({ configId: id })
      await reloadTableData(paginationReactive.page!)
    } catch (e) {
      await reloadTableData(paginationReactive.page!)
      return Promise.reject()
    }
    return Promise.resolve()
  }

  const stopTask = async (id: number) => {
    if (!tableLoading.value) {
      tableLoading.value = true
      try {
        await stopTaskFun.value!({ configId: id })
        tableLoading.value = false
        await reloadTableData(paginationReactive.page!)
      } catch (e) {
        tableLoading.value = false
        await reloadTableData(paginationReactive.page!)
        return Promise.reject()
      }
      tableLoading.value = false
    }
    return Promise.resolve()
  }

  const handleSingleDelete = async (id: number) => {
    if (!tableLoading.value) {
      tableLoading.value = true
      try {
        await deleteFun.value!({ ids: [id] })
        tableLoading.value = false
        // 删除最后一页最后一个时，若当前页码不为1，则把当前页码-1重新请求表格数据
        if (paginationReactive.itemCount! - (paginationReactive.page! - 1) * paginationReactive.pageSize! === 1) {
          await reloadTableData(paginationReactive.page === 1 ? 1 : paginationReactive.page! - 1)
        } else {
          await reloadTableData(paginationReactive.page!)
        }
      } catch (e) {
        tableLoading.value = false
        return Promise.reject()
      }
      tableLoading.value = false
    }
    return Promise.resolve()
  }

  const handleMultipleDelete = async () => {
    if (!tableLoading.value) {
      tableLoading.value = true
      try {
        await deleteEventConfig({ ids: deepCopy(checkedRowKeysRef.value) as number[] })
        tableLoading.value = false
        // 删除最后一页最后一个时，若当前页码不为1，则把当前页码-1重新请求表格数据
        if (paginationReactive.itemCount! - (paginationReactive.page! - 1) * paginationReactive.pageSize! === checkedRowKeysRef.value.length) {
          await reloadTableData(paginationReactive.page === 1 ? 1 : paginationReactive.page! - 1)
        } else {
          await reloadTableData(paginationReactive.page!)
        }
      } catch (e) {
        tableLoading.value = false
        return Promise.reject()
      }
      tableLoading.value = false
    }
    return Promise.resolve()
  }

  const resetAll = () => {
    setConfigPage('')
    tableLoading.value= false
    dataRef.value= []
    checkedRowKeysRef.value = []
    lastSearchValue.value = {
      configName: '',
      configType: null,
      runStatus: null,
      createByName: ''
    }
    paginationReactive.page = 1
    paginationReactive.itemCount = 0
  }

  return {
    configPage,
    tableLoading,
    dataRef,
    checkedRowKeysRef,
    lastSearchValue,
    paginationReactive,
    setConfigPage,
    setTableLoading,
    changeLastSearchValue,
    setCheckedRowKeys,
    reloadTableData,
    updateSingle,
    changeIsShow,
    runTask,
    stopTask,
    handleSingleDelete,
    handleMultipleDelete,
    resetAll
  }
})