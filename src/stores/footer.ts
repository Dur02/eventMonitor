import type { Ref } from 'vue'
import { reactive, ref, watch } from 'vue'
import { defineStore } from 'pinia'

interface FooterType {
  selectedBtn: Ref<string>,
  initialData: Ref<any>,
  setSelectedBtn: (newValue: string) => void,
  setInitialData: (newValue: any) => void
}

export const useFooterStore = defineStore(
  'footer',
  (): FooterType => {

    const selectedBtn: Ref<string> = ref('')
    const initialData: Ref<any> = ref({})

    function setSelectedBtn(newValue: string): void {
      selectedBtn.value = newValue
    }

    function setInitialData(newValue: any): void {
      initialData.value = newValue
    }

    return {
      selectedBtn,
      initialData,
      setSelectedBtn,
      setInitialData
    }
  }
)