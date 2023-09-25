import axios, { type AxiosInstance, type InternalAxiosRequestConfig, type AxiosError } from 'axios'

// create an axios instance
const service: AxiosInstance = axios.create({
  baseURL: process.env.VITE_APP_BASE_API, // url = base url + request url
  withCredentials: true, // send cookies when cross-domain requests
  timeout: 5000 // request timeout
})

// request interceptor
service.interceptors.request.use(
  (config: InternalAxiosRequestConfig<any>): InternalAxiosRequestConfig<any> => {
    // do something before request is sent

    // if (store.getters.token) {
    //   // let each request carry token
    //   // ['X-Token'] is a custom headers key
    //   // please modify it according to the actual situation
    //   config.headers['X-Token'] = getToken()
    // }
    return config
  },
  (error: AxiosError): Promise<AxiosError> => {
    // do something with request error
    return Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  response => {
    // const res = response.data

    // if the custom code is not 20000, it is judged as an error.
    // if (res.code !== 20000) {
    //   Message({
    //     message: res.message || 'Error',
    //     type: 'error',
    //     duration: 5 * 1000
    //   })
    //   // 50008: Illegal token; 50012: Other clients logged in; 50014: Token expired;
    //   if (res.code === 50008 || res.code === 50012 || res.code === 50014) {
    //     // to re-login
    //     MessageBox.confirm('You have been logged out, you can cancel to stay on this page, or log in again', 'Confirm logout', {
    //       confirmButtonText: 'Re-Login',
    //       cancelButtonText: 'Cancel',
    //       type: 'warning'
    //     }).then(() => {
    //       store.dispatch('user/resetToken').then(() => {
    //         location.reload()
    //       })
    //     })
    //   }
    //   return Promise.reject(new Error(res.message || 'Error'))
    // } else {
    //   return res
    // }
    return response.data
  },
  async error => {
    // if (!error.response) {
    //   Message({
    //     message: '网络异常',
    //     type: 'error'
    //   })
    //   return Promise.reject('networkError')
    // }

    // const message = error?.response?.data?.message || error.response.data.error || error?.response?.statusText || error?.message || '未知错误'

    // switch (error.response.data.code) {
    //   case 401:
    //     Message({
    //       message,
    //       type: 'error'
    //     })
    //     if (!error.response || (error.response.config.url !== '/api/auth/login/pwd' && error.response.config.url !== '/api/teacher/register')) {
    //       await logout()
    //       await store.dispatch('user/logout')
    //       router.push(`/login`)
    //       // window.location.reload()
    //     }
    //     break
    //   case 403:
    //     Message({
    //       message,
    //       type: 'error'
    //     })
    //     break
    //   default:
    //     Message({
    //       message,
    //       type: 'error'
    //     })
    //     break
    // }
    return Promise.reject(error)
  }
)

export default service