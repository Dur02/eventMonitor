import request from './index'
import type { EventListResultType, EventListType } from '@/types/api/event'

// 查询事件信息列表
export function getEventList(
  {
    pageNum,
    pageSize,
  }: EventListType
): Promise<EventListResultType> {
  return request({
    url: '/eventMonitor/event/list',
    method: 'get',
    params: {
      pageNum,
      pageSize
    }
  })
}