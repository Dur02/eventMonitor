import type { AxiosInstance, InternalAxiosRequestConfig, AxiosError, AxiosResponse } from 'axios'
import axios from 'axios'
import { createDiscreteApi, lightTheme, darkTheme } from 'naive-ui'
import { useUserStore } from '@/stores/user'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia'
import router from '@/router'
import { download } from '@/utils/function/download'

const service: AxiosInstance = axios.create({
  baseURL: import.meta.env.VITE_APP_BASE_API,
  withCredentials: true,
  timeout: 5000
})

service.defaults.headers['Content-Type'] = 'application/json;charset=utf-8'
service.defaults.headers['Content-Language'] = 'zh_CN'
service.defaults.headers['clientid'] = import.meta.env.VITE_APP_CLIENT_ID

// request interceptor
service.interceptors.request.use(
  (config: InternalAxiosRequestConfig<any>): InternalAxiosRequestConfig<any> => {
    if (localStorage.getItem('token') && !((config.headers || {}).isToken === false)) {
      config.headers['Authorization'] = 'Bearer ' + localStorage.getItem('token')
    }
    // FormData数据去请求头Content-Type
    if (config.data instanceof FormData) {
      delete config.headers['Content-Type'];
    }
    return config
  },
  (error: AxiosError): Promise<AxiosError> => {
    return Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  async (res: AxiosResponse) => {

    const userStore = useUserStore()
    const {logout} = userStore
    const systemStore = useSystemStore()
    const {isLight} = storeToRefs(systemStore)

    const {message, dialog} = createDiscreteApi(
      ['message', 'dialog'],
      {
        configProviderProps: {
          theme: isLight.value ? lightTheme : darkTheme
        }
      }
    )

    // 未设置状态码则默认成功状态
    let code = res.data.code || 200
    // 获取错误信息
    let msg = res.data.msg
    // 二进制数据则下载
    if (res.request.responseType === 'blob' || res.request.responseType === 'arraybuffer') {
      if (res.data.type !== 'application/json') {
        download(res)
      } else {
        const resText = await res.data.text()
        const rspObj = JSON.parse(resText)
        code = rspObj.code
        msg = rspObj.msg
      }
    }

    // 处理错误状态码
    if (code === 401) {
      dialog.error({
        title: '出错',
        content: '登录状态已过期，需要重新登录',
        positiveText: '确定',
        onAfterLeave: async () => {
          if (localStorage.getItem('token')) {
            await logout()
            await router.replace('/login')
          }
        }
      })
      return Promise.reject('无效的会话，或者会话已过期，请重新登录。');
    } else if (code !== 200) {
      message.error(msg)
      return Promise.reject(new Error(msg))
    } else {
      return Promise.resolve(res.data)
    }
  },
  async (error: AxiosError): Promise<AxiosError> => {
    const systemStore = useSystemStore()
    const { isLight } = storeToRefs(systemStore)

    const { message } = createDiscreteApi(
      ['message'],
      {
        configProviderProps: {
          theme: isLight.value ? lightTheme : darkTheme
        }
      }
    )

    let { message: msg } = error;
    if (msg == 'Network Error') {
      msg = '后端接口连接异常'
    } else if (msg.includes('timeout')) {
      msg = '系统接口请求超时'
    } else if (msg.includes('Request failed with status code')) {
      msg = '系统接口' + msg.substr(msg.length - 3) + '异常'
    }

    message.error(msg)
    // 错误消息弹出
    return Promise.reject(error)
  }
)

export default service