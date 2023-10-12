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
  setFooterBtn: (newValue: FooterBtnType[]) => void,
  setSelectedBtn: (newValue: string) => void,
  setCurrentRoute: (newValue: string) => void
}

export const useFooterStore = defineStore(
  'footer',
  (): FooterType => {
    const footerBtn: Ref<FooterBtnType[]> = ref([])
    const selectedBtn: Ref<string> = ref('')
    const currentRoute: Ref<string> = ref('')

    function setFooterBtn(newValue: FooterBtnType[]): void {
      footerBtn.value = newValue
    }

    function setSelectedBtn(newValue: string): void {
      selectedBtn.value = newValue
    }

    function setCurrentRoute(newValue: string): void {
      currentRoute.value = newValue
    }

    return {
      footerBtn,
      selectedBtn,
      currentRoute,
      setFooterBtn,
      setSelectedBtn,
      setCurrentRoute
    }
  }
)