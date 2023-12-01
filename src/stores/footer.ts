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
    showQuickJumper: true,
    suffix ({ itemCount }: PaginationInfo): VNodeChild {
      return `共${itemCount}条`
    }
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
      ...data
    }: {
      configType: string,
      isSaveConfig: number,
      configName: string | null
    }
  )=> {
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

  return {
    configType,
    requestFunc,
    isSearchNow,
    footerExpand,
    paginationReactive,
    selectedId,
    configList,
    getConfigList,
    setSelectedId,
    setIsSearchNow,
    setFooterExpand,
    instantQuery
  }
})