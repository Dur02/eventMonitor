import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'

export const useSystemStore = defineStore(
  'system',
  (): SystemType => {
    const isLogin: Ref<boolean> = ref(false)
    function setIsLogin(param: boolean): void {
      isLogin.value = param
    }

    return {
      isLogin,
      setIsLogin
    }
  },
  {
    persist: {
      storage: sessionStorage
    }
  }
)

interface SystemType {
  isLogin: Ref<boolean>,
  setIsLogin: (param: boolean) => void
}