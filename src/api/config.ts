import request from './index'
import type { ConfigListResultType, ConfigListType } from '@/types/api/config/types'

// 查询事件配置管理列表
export function getEventConfigList(
  {
    configName,
    configType,
    runStatus,
    createBy,
    pageNum,
    pageSize
  }: ConfigListType
): Promise<ConfigListResultType> {
  return request({
    url: '/eventMonitor/eventConfiguration/list',
    method: 'get',
    params: {
      configName,
      configType,
      runStatus,
      createBy,
      pageNum,
      pageSize
    }
  })
}