import request from './index'
import type { AxiosResponse } from 'axios'
import type { configListRequestType } from '@/types/api/eventConfiguration'

// 新增事件配置管理
export function addGraphConfig(data: any): Promise<AxiosResponse<any, any>> {
  return request({
    url: '/eventMonitor/gkgConfiguration',
    method: 'post',
    data
  })
}

// 删除事件配置管理
export function deleteGraphConfig({ ids}: { ids: number[] }) {
  return request({
    url: `/eventMonitor/gkgConfiguration/${ids}`,
    method: 'delete'
  })
}

// 查询图谱配置列表
export function getGraphConfigList(
  {
    configName,
    configType,
    runStatus,
    createByName,
    pageNum,
    pageSize
  }: configListRequestType
) {
  return request({
    url: '/eventMonitor/gkgConfiguration/list',
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

// 获取图谱配置详细信息
export function getSingleGraphConfig({ id }: { id: number }) {
  return request({
    url: `/eventMonitor/gkgConfiguration/${id}`,
    method: 'get'
  })
}

// 修改事件配置管理
export function updateGraphConfig(data: any): Promise<AxiosResponse<any, any>> {
  return request({
    url: '/eventMonitor/gkgConfiguration',
    method: 'put',
    data
  })
}