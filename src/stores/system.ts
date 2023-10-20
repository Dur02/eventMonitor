import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'

export const useSystemStore = defineStore(
  'system',
  (): SystemType => {
    const isLogin: Ref<boolean> = ref(false)
    const isLight: Ref<boolean> = ref(true)

    function setIsLogin(param: boolean): void {
      isLogin.value = param
    }

    function setIsLight(newValue: boolean): void {
      isLight.value = newValue
    }

    return {
      isLogin,
      isLight,
      setIsLogin,
      setIsLight
    }
  },
  {
    persist: {
      storage: localStorage
    }
  }
)

interface SystemType {
  isLogin: Ref<boolean>,
  isLight: Ref<boolean>,
  setIsLogin: (param: boolean) => void,
  setIsLight: (newValue: boolean) => void
}