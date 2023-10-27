import type { Ref } from 'vue'
import { ref } from 'vue'
import { defineStore } from 'pinia'
import type { SelectOption } from 'naive-ui'
import { getConfigCodeList } from '@/api/codeDict'

export const useConfigStore = defineStore('config', () => {
  const eventConfigTypeList: Ref<SelectOption[]> = ref([])

  const getAllEventConfigType = async () => {
    const { data } = await getConfigCodeList({ configType: 1 })
    eventConfigTypeList.value = data
  }

  return {
    eventConfigTypeList,
    getAllEventConfigType
  }
})