import type { Ref, VNodeChild } from 'vue'
import { ref, reactive } from 'vue'
import { defineStore } from 'pinia'
import type { PaginationInfo, PaginationProps } from 'naive-ui'

export const useFooterStore = defineStore('footer', () => {
  const configType: Ref<string> = ref('')
  const requestFunc: Ref<Function | null> = ref(null)
  const isSearchNow: Ref<boolean> = ref(false)
  // totalPage = (total + pageSize - 1)/pageSize
  const paginationReactive: PaginationProps = reactive({
    page: 1,
    // pageCount: 1,
    pageSize: 10,
    // pageSizes: [10, 20, 50, 100],
    itemCount: 0,
    // showSizePicker: true,
    showQuickJumper: true,
    suffix ({ itemCount }: PaginationInfo): VNodeChild {
      return `共${itemCount}条`
    }
  })
  const selectedId: Ref<number | null> = ref(null)
  const configList: Ref<any> = ref([])

  const getConfigList = async (newRequestFunc: Function, newConfigType: string, page: number, pageSize: number) => {
    try {
      const { rows, total } = await (newRequestFunc)({
        configType: newConfigType,
        pageNum: page,
        pageSize: pageSize
      })
      configList.value = rows
      configType.value = newConfigType
      requestFunc.value = newRequestFunc
      paginationReactive.page = page
      paginationReactive.pageSize = pageSize
      paginationReactive.itemCount = total
      isSearchNow.value = false
      if (rows.length !== 0) {
        selectedId.value = rows[0].id
      }
      return Promise.resolve()
    } catch (e) {
      console.log(e)
      return Promise.reject()
    }
  }

  const setSelectedId = (newValue: number | null) => {
    selectedId.value = newValue
  }

  const setIsSearchNow = (newValue: boolean) => {
    isSearchNow.value = newValue
  }

  return {
    configType,
    requestFunc,
    isSearchNow,
    paginationReactive,
    selectedId,
    configList,
    getConfigList,
    setSelectedId,
    setIsSearchNow
  }
})