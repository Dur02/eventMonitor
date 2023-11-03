import request from './index'

// 事件库分析-执行任务
export function runTask({ configId }: { configId: number } ) {
  return request({
    url: '/eventMonitor/eventAnalyze/runTask',
    method: 'post',
    params: {
      configId
    }
  })
}