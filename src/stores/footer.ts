import type { Ref } from 'vue'
import { ref } from 'vue'
import { defineStore } from 'pinia'

export const useFooterStore = defineStore('footer', () => {
  const selectedBtn: Ref<string> = ref('')
  const needToUpdate: Ref<boolean> = ref(false)
  const initialData: Ref<any> = ref({})

  const setSelectedBtn = (newValue: string): void => {
    selectedBtn.value = newValue
  }

  const setNeedToUpdate = (newValue: boolean): void => {
    needToUpdate.value = newValue
  }

  const setInitialData = (newValue: any): void => {
    initialData.value = newValue
  }

  return {
    selectedBtn,
    initialData,
    needToUpdate,
    setSelectedBtn,
    setInitialData,
    setNeedToUpdate
  }
})