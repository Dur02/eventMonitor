import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'

interface ThemeType {
  isLight: Ref<boolean>,
  setIsLight: (newValue: boolean) => void
}

export const useThemeStore = defineStore(
  'theme',
  (): ThemeType => {
    const isLight: Ref<boolean> = ref(true)

    function setIsLight(newValue: boolean): void {
      isLight.value = newValue
    }

    return {
      isLight,
      setIsLight
    }
  },
  {
    persist: {
      storage: localStorage
    }
  }
)