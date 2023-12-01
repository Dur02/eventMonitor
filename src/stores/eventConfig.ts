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
import type { eventConfigRowsType, searchFormType } from '@/types/components/config/event'
import { runTask as runTaskApi } from '@/api/eventAnalyse'
import deepCopy from '@/utils/function/deepcopy'

// @ts-ignore
const mapWithIndex = map.convert({ cap: false })

export const useEventConfigStore = defineStore('eventConfig', () => {
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
        const { rows, total } = await getEventConfigList({
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
        const { data } = await getSingleEventConfig({ id })
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
        await updateEventConfigShow({ configId: id, isShow: isShow === 1 ? 0 : 1 })
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
      await runTaskApi({ configId: id })
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
        await StopTaskRun({ configId: id })
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
        await deleteEventConfig({ ids: [id] })
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
    tableLoading,
    dataRef,
    checkedRowKeysRef,
    lastSearchValue,
    paginationReactive,
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