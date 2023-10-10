import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'

interface ThemeType {
  isLight: Ref<boolean>,
  setIsLight: (newBool: boolean) => void
}

export const useThemeStore = defineStore(
  'theme',
  (): ThemeType => {
    const isLight: Ref<boolean> = ref(true)

    function setIsLight(newBool: boolean): void {
      isLight.value = newBool
    }

    return {
      isLight,
      setIsLight
    }
  },
  {
    persist: {
      storage: sessionStorage
    }
  }
)