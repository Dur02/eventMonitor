import type { Ref } from 'vue'
import { reactive, ref, watch } from 'vue'
import { defineStore } from 'pinia'

export const useFooterStore = defineStore('footer', () => {
  const selectedBtn: Ref<string> = ref('')
  const initialData: Ref<any> = ref({})

  const setSelectedBtn = (newValue: string): void => {
    selectedBtn.value = newValue
  }

  const setInitialData = (newValue: any): void => {
    initialData.value = newValue
  }

  return {
    selectedBtn,
    initialData,
    setSelectedBtn,
    setInitialData
  }
})