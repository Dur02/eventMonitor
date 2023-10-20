import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'

export const useSystemStore = defineStore(
  'system',
  (): SystemType => {
    const isLogin: Ref<boolean> = ref(false)
    const isLight: Ref<boolean> = ref(true)
    const token: Ref<string> = ref('')

    function setIsLogin(param: boolean): void {
      isLogin.value = param
    }

    function setIsLight(newValue: boolean): void {
      isLight.value = newValue
    }

    function setToken(newValue: string): void {
      token.value = newValue
    }

    return {
      isLogin,
      isLight,
      token,
      setIsLogin,
      setIsLight,
      setToken
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
  token: Ref<string>
  setIsLogin: (param: boolean) => void,
  setIsLight: (newValue: boolean) => void,
  setToken: (newValue: string) => void
}