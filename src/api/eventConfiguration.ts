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

// 新增事件配置管理
export function addEventConfig(data: any) {
  return request({
    url: '/eventMonitor/eventConfiguration',
    method: 'post',
    data
  })
}

// 是否挂起转态修改：1->显示(默认)，2->不显示
export function updateEventConfigShow(
  {
    configId,
    isShow
  }: {
    configId: number,
    isShow: number
  }
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
export function StopTaskRun(
  {
    configId
  }: {
    configId: number
  }
) {
  return request({
    url: '/eventMonitor/eventConfiguration/stop',
    method: 'put',
    params: {
      configId
    }
  })
}

// 删除事件配置管理
export function deleteEventConfig(
  {
    ids
  }: {
    ids: number[]
  }
) {
  return request({
    url: `/eventMonitor/eventConfiguration/${ids}`,
    method: 'delete'
  })
}