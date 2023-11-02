import router from './router'
import { createDiscreteApi } from 'naive-ui'
import { useUserStore } from '@/stores/user'
import { storeToRefs } from 'pinia'
import type { NavigationGuardNext, RouteLocationNormalized } from 'vue-router'

const whiteList = ['/login']

const { loadingBar } = createDiscreteApi(
  ['loadingBar']
)

loadingBar.start()

router.beforeEach(async (to: RouteLocationNormalized, from: RouteLocationNormalized, next: NavigationGuardNext): Promise<void> => {
  const userStore = useUserStore()
  const { roles } = storeToRefs(userStore)
  const { getInfo, logout } = userStore

  if (localStorage.getItem('token')) {
    if (whiteList.indexOf(to.path) !== -1) {
      next({ path: '/event' })
      loadingBar.finish()
    } else {
      if (roles.value.length === 0) {
        try {
          await getInfo()
          next({ ...to, replace: true })
        } catch (e) {
          await logout()
          await router.replace('/login')
        }
      } else {
        next()
      }
    }
  } else {
    // 没有token
    if (whiteList.indexOf(to.path) !== -1) {
      // 在免登录白名单，直接进入
      next()
    } else {
      next({ path: `/login` }) // 否则全部重定向到登录页
      loadingBar.finish()
    }
  }
})

router.afterEach(() => {
  loadingBar.finish()
})
