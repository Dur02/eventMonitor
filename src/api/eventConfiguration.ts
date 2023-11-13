import request from './index'
import type { GetEventConfigListRespType, GetEventConfigListType, UpdateEventConfigShowType } from 'src/types/api/eventConfiguration'
import type { AxiosResponse } from 'axios'

// 是否挂起转态修改：1->显示(默认)，2->不显示
export function updateEventConfigShow(
  {
    configId,
    isShow
  }: UpdateEventConfigShowType
) {
  return request({
    url: '/eventMonitor/eventConfiguration/updateIsShow',
    method: 'put',
    params: {
      configId,
      isShow
    }
  })
}

// 强制停止
export function StopTaskRun({ configId }: { configId: number }) {
  return request({
    url: '/eventMonitor/eventConfiguration/stop',
    method: 'put',
    params: {
      configId
    }
  })
}

// 修改事件配置管理
export function updateEventConfig(data: any): Promise<AxiosResponse<any, any>> {
  return request({
    url: '/eventMonitor/eventConfiguration',
    method: 'put',
    data
  })
}

// 新增事件配置管理
export function addEventConfig(data: any): Promise<AxiosResponse<any, any>> {
  return request({
    url: '/eventMonitor/eventConfiguration',
    method: 'post',
    data
  })
}

// 查询事件配置管理列表
export function getSingleEventConfig({ id }: { id: number }) {
  return request({
    url: `/eventMonitor/eventConfiguration/${id}`,
    method: 'get'
  })
}

// 查询事件配置管理列表
export function getEventConfigList(
  {
    configName,
    configType,
    runStatus,
    createByName,
    pageNum,
    pageSize
  }: GetEventConfigListType
): Promise<GetEventConfigListRespType> {
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

// 删除事件配置管理
export function deleteEventConfig({ ids}: { ids: number[] }) {
  return request({
    url: `/eventMonitor/eventConfiguration/${ids}`,
    method: 'delete'
  })
}