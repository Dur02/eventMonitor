import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'

interface FooterBtnType {
  name: 'string'
}

interface FooterType {
  footerBtn: Ref<FooterBtnType[]>,
  selectedBtn: Ref<string>,
  setFooterBtn: (newValue: FooterBtnType[]) => void,
  setSelectedBtn: (newValue: string) => void
}

export const useFooterStore = defineStore(
  'footer',
  (): FooterType => {
    const footerBtn: Ref<FooterBtnType[]> = ref([])
    const selectedBtn: Ref<string> = ref('')

    function setFooterBtn(newValue: FooterBtnType[]): void {
      footerBtn.value = newValue
    }

    function setSelectedBtn (newValue: string): void {
      selectedBtn.value = newValue
    }

    return {
      footerBtn,
      selectedBtn,
      setFooterBtn,
      setSelectedBtn
    }
  },
  {
    persist: {
      storage: sessionStorage
    }
  }
)