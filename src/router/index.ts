import { createRouter, createWebHistory } from 'vue-router'
import type { RouteLocationNormalized } from 'vue-router'
import { createDiscreteApi } from 'naive-ui'
import menuRoutes from '@/router/menuRoutes'

// https://www.naiveui.com/zh-CN/os-theme/components/discrete 脱离上下文使用API
const { loadingBar } = createDiscreteApi(
  ['loadingBar']
)

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      redirect: '/login'
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/login/LoginView.vue')
    },
    ...menuRoutes,
    {
      path: '/:pathMatch(.*)',
      component: () => import('../components/error/404.vue')
    }
  ]
})

router.beforeEach((to: RouteLocationNormalized, from: RouteLocationNormalized): boolean => {
  loadingBar.start()
  return true
})

router.afterEach((to: RouteLocationNormalized, from: RouteLocationNormalized): void => {
  loadingBar.finish()
})

export default router
