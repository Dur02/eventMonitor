/**
  * @description 防抖
  * @author Dur02
  * @date 2023/11/28
**/
export const useDebounce = (() => {
  let timer: number = 0
  return (callback: (...args: any[]) => any, wait: number = 200) => {
    clearTimeout(timer)
    timer = setTimeout(() => {
      callback()
      clearTimeout(timer)
      timer = 0
    }, wait)
  }
})()