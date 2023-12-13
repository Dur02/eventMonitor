import type { Ref } from 'vue'
import { reactive, ref } from 'vue'
import { defineStore } from 'pinia'
import type { NewsSearchValueType } from '@/types/components/news/display'
import type { eventConfigFormInitialValueType } from '@/types/components/form/event'
import { eventConfigFormInitialValue, getEventConfigFormValue } from '@/utils/constant/form/event/eventConfigForm'
import type { graphConfigFormInitialValueType } from '@/types/components/form/graph'
import { getGraphConfigFormValue, graphConfigFormInitialValue } from '@/utils/constant/form/graph/graphConfigForm'
import type { PaginationProps } from 'naive-ui'
import { searchNews } from '@/api/news';
import { formatTimeStamp } from '@/utils/function/date'
import deepCopy from '@/utils/function/deepcopy'

export const useNewsStore = defineStore('news', () => {
  const searchValue: Ref<NewsSearchValueType> = ref({
    publicTime: null,
    orderBy: 'DESC',
    type: 2,
    isExact: 1,
    queryContent: ''
  })

  const lastSearchValue: Ref<NewsSearchValueType> = ref({
    publicTime: null,
    orderBy: 'DESC',
    type: 2,
    isExact: 1,
    queryContent: ''
  })

  const eventConfigFormValue: Ref<eventConfigFormInitialValueType> = ref(eventConfigFormInitialValue)

  const graphConfigFormValue: Ref<graphConfigFormInitialValueType> = ref(graphConfigFormInitialValue)

  const paginationReactive: PaginationProps = reactive({
    page: 1,
    pageSize: 10,
    itemCount: 0
  })

  const updateSearchValue = (newValue: NewsSearchValueType) => {
    searchValue.value = newValue
  }

  const updateLastSearchValue = (newValue: NewsSearchValueType) => {
    lastSearchValue.value = newValue
  }

  const updateEventConfigFormValue = (newValue: eventConfigFormInitialValueType) => {
    eventConfigFormValue.value = newValue
  }

  const updateGraphConfigFormValue = (newValue: graphConfigFormInitialValueType) => {
    graphConfigFormValue.value = newValue
  }

  const updatePaginationReactive = (type: string, newValue: number) => {
    switch (type) {
      case 'page':
        paginationReactive.page = newValue
        break
      case 'pageSize':
        paginationReactive.pageSize = newValue
        break
      default:
        paginationReactive.itemCount = newValue
        break
    }
  }

  const globalSearch = async () => {
    try {
      const {
        data: {
          resultData: {
            rows,
            total
          }
        }
      } = await searchNews({
        pageNum: paginationReactive.pageSize,
        pageSize: paginationReactive.pageSize,
        ...searchValue.value,
        beginPubtime: searchValue.value.publicTime ? formatTimeStamp(searchValue.value.publicTime[0]) : null,
        endPubtime: searchValue.value.publicTime ? formatTimeStamp(searchValue.value.publicTime[1]) : null,
        event: {
          ...getEventConfigFormValue(eventConfigFormValue.value),
          weightBasis: null,
          statisticsBasis: null
        },
        gkg: {
          ...getGraphConfigFormValue(graphConfigFormValue.value),
          weightBasis: null,
          statisticsBasis: null
        }
      })
      updatePaginationReactive('itemCount', total)
      updateLastSearchValue(deepCopy(searchValue.value))
      return Promise.resolve(rows)
    } catch (e) {
      return Promise.reject()
    }
  }

  const resetAll = () => {
    searchValue.value = {
      publicTime: null,
      orderBy: 'DESC',
      type: 2,
      isExact: 1,
      queryContent: ''
    }
    lastSearchValue.value = {
      publicTime: null,
      orderBy: 'DESC',
      type: 2,
      isExact: 1,
      queryContent: ''
    }
    eventConfigFormValue.value = eventConfigFormInitialValue
    graphConfigFormValue.value = graphConfigFormInitialValue
  }

  return {
    searchValue,
    lastSearchValue,
    eventConfigFormValue,
    graphConfigFormValue,
    paginationReactive,
    updateSearchValue,
    updateLastSearchValue,
    updateEventConfigFormValue,
    updateGraphConfigFormValue,
    updatePaginationReactive,
    globalSearch,
    resetAll
  }
})