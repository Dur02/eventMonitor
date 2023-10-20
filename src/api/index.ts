import type { AxiosInstance, InternalAxiosRequestConfig, AxiosError, AxiosResponse } from 'axios'
import axios from 'axios'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia';

const systemStore = useSystemStore()
const { token } = storeToRefs(systemStore)

const service: AxiosInstance = axios.create({
  baseURL: import.meta.env.VITE_APP_BASE_API,
  withCredentials: true,
  timeout: 5000
})

// request interceptor
service.interceptors.request.use(
  (config: InternalAxiosRequestConfig<any>): InternalAxiosRequestConfig<any> => {
    if (token.value) {
      config.headers['Authorization'] = 'Bearer' + token.value
    }
    return config
  },
  (error: AxiosError): Promise<AxiosError> => {
    return Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  (res: AxiosResponse) => {
    // 未设置状态码则默认成功状态
    const code = res.data.code || 200;
    // 获取错误信息
    const msg = res.data.msg
    // 二进制数据则直接返回
    if (res.request.responseType === 'blob' || res.request.responseType === 'arraybuffer') {
      return res.data;
    }

    // 处理错误状态码

    return res.data
  },
  async (error: AxiosError): Promise<AxiosError> => {
    let { message } = error;
    if (message == 'Network Error') {
      message = '后端接口连接异常';
    } else if (message.includes('timeout')) {
      message = '系统接口请求超时';
    } else if (message.includes('Request failed with status code')) {
      message = '系统接口' + message.substr(message.length - 3) + '异常';
    }
    // 错误消息弹出
    return Promise.reject(error)
  }
)

export default service