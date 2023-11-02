import type { Ref } from 'vue'
import { ref } from 'vue'
import { defineStore } from 'pinia'
import type { SelectOption } from 'naive-ui'
import { getConfigCodeList } from '@/api/eventCodeDict'

export const useConfigStore = defineStore('config', () => {
  const eventConfigTypeList: Ref<SelectOption[]> = ref([])

  const getAllEventConfigType = async () => {
    try {
      const { data } = await getConfigCodeList({ configType: 1 })
      eventConfigTypeList.value = data
    } catch (e) {
      //
    }
  }

  return {
    eventConfigTypeList,
    getAllEventConfigType
  }
})