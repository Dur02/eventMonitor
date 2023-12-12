import type { Ref } from 'vue'
import { ref } from 'vue'
import { defineStore } from 'pinia'
import type { NewsSearchValueType } from '@/types/components/news/display'
import type { eventConfigFormInitialValueType } from '@/types/components/form/event'
import { eventConfigFormInitialValue } from '@/utils/constant/form/event/eventConfigForm'
import type { graphConfigFormInitialValueType } from '@/types/components/form/graph'
import { graphConfigFormInitialValue } from '@/utils/constant/form/graph/graphConfigForm'

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
    updateSearchValue,
    updateLastSearchValue,
    updateEventConfigFormValue,
    updateGraphConfigFormValue,
    resetAll
  }
})