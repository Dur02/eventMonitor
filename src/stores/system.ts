import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'

export const useSystemStore = defineStore('system', () => {
  const isLight: Ref<boolean> = ref(true)
  const isCollapse: Ref<boolean> = ref(false)
  const setIsLight = (newValue: boolean): void => {
    isLight.value = newValue
  }

  const setIsCollapse = (newValue: boolean): void => {
    isCollapse.value = newValue
  }

  return {
    isLight,
    isCollapse,
    setIsLight,
    setIsCollapse
  }
}, {
  persist: {
    storage: localStorage
  }
})