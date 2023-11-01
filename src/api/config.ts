import request from './index'
import type { ConfigListResultType, ConfigListType } from '@/types/api/config'

// 查询事件配置管理列表
export function getEventConfigList(
  {
    configName,
    configType,
    runStatus,
    createByName,
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
      createByName,
      pageNum,
      pageSize
    }
  })
}