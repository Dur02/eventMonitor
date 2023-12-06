import type { Ref, VNodeChild } from 'vue'
import { ref, reactive } from 'vue'
import { defineStore } from 'pinia'
import type { PaginationInfo, PaginationProps } from 'naive-ui'

export const useFooterStore = defineStore('footer', () => {
  const configType: Ref<string> = ref('')
  const requestFunc: Ref<Function | null> = ref(null)
  const instantQueryFunc: Ref<Function | null> = ref(null)
  const isSearchNow: Ref<boolean> = ref(false)
  const footerExpand: Ref<boolean> = ref(false)
  // totalPage = (total + pageSize - 1)/pageSize
  const paginationReactive: PaginationProps = reactive({
    page: 1,
    pageSize: 10,
    itemCount: 0,
  })
  const selectedId: Ref<number | null> = ref(null)
  const configList: Ref<any> = ref([])

  const getConfigList = async (newRequestFunc: Function, newConfigType: string, newInstantQueryFunc: Function, page: number, pageSize: number) => {
    try {
      const { rows, total } = await (newRequestFunc)({
        configType: newConfigType,
        pageNum: page,
        pageSize: pageSize
      })
      configList.value = rows
      configType.value = newConfigType
      requestFunc.value = newRequestFunc
      instantQueryFunc.value = newInstantQueryFunc
      paginationReactive.page = page
      paginationReactive.pageSize = pageSize
      paginationReactive.itemCount = total
      isSearchNow.value = false
      switch (rows.length !== 0) {
        case true:
          selectedId.value = rows[0].id
          break
        default:
          selectedId.value = null
          break
      }
      return Promise.resolve()
    } catch (e) {
      return Promise.reject()
    }
  }

  const setConfigType = (newValue: string) => {
    configType.value = newValue
  }

  const setSelectedId = (newValue: number | null) => {
    selectedId.value = newValue
  }

  const setIsSearchNow = (newValue: boolean) => {
    isSearchNow.value = newValue
  }

  const setFooterExpand = (newValue: boolean) => {
    footerExpand.value = newValue
  }

  const instantQuery = async (
    {
      configType,
      isSaveConfig,
      configName,
      queryType,
      ...data
    }: {
      configType: string,
      isSaveConfig: number,
      queryType: string,
      configName: string | null
    }
  )=> {
    // 需要分页即时查询且不需要保存时
    if (queryType === 'page' && !isSaveConfig) {
      return Promise.resolve({
        configType,
        isSaveConfig,
        configName,
        ...data
      })
    }
    // 需要查询全部数据或需要保存时
    if (queryType === 'all' || isSaveConfig) {
      if (instantQueryFunc.value) {
        try {
          const res = (instantQueryFunc.value)({
            configType,
            isSaveConfig,
            configName,
            ...data
          })
          return Promise.resolve(res)
        } catch (e) {
          return Promise.reject()
        }
      }
    }
  }

  const resetAll = () => {
    configType.value = ''
    requestFunc.value = null
    instantQueryFunc.value = null
    isSearchNow.value = false
    footerExpand.value = false
    paginationReactive.page = 1
    paginationReactive.itemCount = 0
    selectedId.value = null
    configList.value = []
  }

  return {
    configType,
    requestFunc,
    isSearchNow,
    footerExpand,
    paginationReactive,
    selectedId,
    configList,
    getConfigList,
    setConfigType,
    setSelectedId,
    setIsSearchNow,
    setFooterExpand,
    instantQuery,
    resetAll
  }
})