import { type Ref, ref } from 'vue'
import { defineStore } from 'pinia'
import type { LoginData } from '@/types/api/event/types'
import { login as LoginApi, getUserInfo, logout as logoutApi } from '@/api/user'

export const useUserStore = defineStore('user', () => {
  const name: Ref<string> = ref('')
  const nickname: Ref<string> = ref('')
  const userId: Ref<string | number> = ref<string | number>('')
  const avatar: Ref<string> = ref('')
  const roles: Ref<string[]> = ref([]) // 用户角色编码集合 → 判断路由权限
  const permissions: Ref<string[]> = ref([]) // 用户权限编码集合 → 判断按钮权限

  const login = async ({ username, password, code, uuid }: LoginData): Promise<void> => {
    const res = await LoginApi({ username, password, code, uuid })
    if (res.data) {
      localStorage.setItem('token', res.data.access_token)
      return Promise.resolve()
    } else {
      return Promise.reject()
    }
  }

  const getInfo = async (): Promise<void> => {
    const res = await getUserInfo()
    if (res) {
      const data = res.data
      const user = data.user
      const profile = user.avatar == '' || user.avatar == null ? '' : user.avatar

      if (data.roles && data.roles.length > 0) {
        // 验证返回的roles是否是一个非空数组
        roles.value = data.roles
        permissions.value = data.permissions
      } else {
        roles.value = ['ROLE_DEFAULT']
      }
      name.value = user.userName
      nickname.value = user.nickName
      avatar.value = profile
      userId.value = user.userId
      return Promise.resolve()
    }
    return Promise.reject()
  }

  const logout = async (): Promise<void> => {
    await logoutApi()
    name.value = ''
    nickname.value = ''
    avatar.value = ''
    userId.value = ''
    roles.value = []
    permissions.value = []
    localStorage.removeItem('token')
  }

  return {
    name,
    nickname,
    userId,
    avatar,
    roles,
    permissions,
    login,
    getInfo,
    logout
  }
})