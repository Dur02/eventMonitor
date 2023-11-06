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

// 事件库分析-导出数据
export function eventConfigExport({ configId }: { configId: number } ) {
  return request({
    url: '/eventMonitor/eventAnalyze/export',
    method: 'post',
    responseType: 'blob',
    params: {
      configId
    }
  })
}