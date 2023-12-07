import request from './index'
import type {
  GetEventConfigListByConfigName,
  GetResultDataByConfigIdRespType,
  GetResultDataByConfigIdType
} from '@/types/api/eventAnalyse'

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

// 事件库分析-事件配置列表
export function getEventConfigListByConfigName(
  {
    configType,
    pageSize,
    pageNum,
    orderByColumn,
    isAsc
  }: GetEventConfigListByConfigName
) {
  return request({
    url: '/eventMonitor/eventAnalyze/configList',
    method: 'get',
    params: {
      configType,
      pageSize,
      pageNum,
      orderByColumn,
      isAsc
    }
  })
}

// 事件库分析-根据事件配置id查询结果数据
export function getResultDataByConfigId({ configId }: GetResultDataByConfigIdType): Promise<GetResultDataByConfigIdRespType> {
  return request({
    url: '/eventMonitor/eventAnalyze/resultDataQuery',
    method: 'post',
    params: {
      configId
    }
  })
}

// 事件库分析-根据事件配置id查询结果数据
export function eventInstantQuery(data: any): Promise<GetResultDataByConfigIdRespType> {
  return request({
    url: '/eventMonitor/eventAnalyze/instantQuery',
    method: 'post',
    data
  })
}