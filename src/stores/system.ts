import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'

export const useSystemStore = defineStore('system', () => {
  const isLight: Ref<boolean> = ref(true)
  const setIsLight = (newValue: boolean): void => {
    isLight.value = newValue
  }

  return {
    isLight,
    setIsLight,
  }
}, {
  persist: {
    storage: localStorage
  }
})