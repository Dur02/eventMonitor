import type { Ref } from 'vue'
import { ref } from 'vue'
import { defineStore } from 'pinia'

interface FooterBtnType {
  name: 'string'
}

interface FooterType {
  footerBtn: Ref<FooterBtnType[]>,
  selectedBtn: Ref<string>,
  currentRoute: Ref<string>,
  initialData: Ref<any>,
  setFooterBtn: (newValue: FooterBtnType[]) => void,
  setSelectedBtn: (newValue: string) => void,
  setCurrentRoute: (newValue: string) => void,
  setInitialData: (newValue: any) => void
}

export const useFooterStore = defineStore(
  'footer',
  (): FooterType => {
    const footerBtn: Ref<FooterBtnType[]> = ref([])
    const selectedBtn: Ref<string> = ref('')
    const currentRoute: Ref<string> = ref('')
    const initialData: Ref<any> = ref({})

    function setFooterBtn(newValue: FooterBtnType[]): void {
      footerBtn.value = newValue
    }

    function setSelectedBtn(newValue: string): void {
      selectedBtn.value = newValue
    }

    function setCurrentRoute(newValue: string): void {
      currentRoute.value = newValue
    }

    function setInitialData(newValue: any): void {
      initialData.value = newValue
    }

    return {
      footerBtn,
      selectedBtn,
      currentRoute,
      initialData,
      setFooterBtn,
      setSelectedBtn,
      setCurrentRoute,
      setInitialData
    }
  }
)