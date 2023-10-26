import request from './index'
import type { CountryType, EventCodeType, EventListType } from '@/api/types'

// 通过国家编码获取地区编码信息
export function getRegionCodeList({ countryCode }: CountryType) {
  return request({
    url: `/eventMonitor/eventCodeDict/regionCodeList/${countryCode}`,
    method: 'get'
  })
}

// 查询事件编码
export function getEventCodeList(
  {
    eventParentsCode,
    eventQuadClass
  }: EventCodeType
) {
  return request({
    url: '/eventMonitor/eventCodeDict/eventCodeList',
    method: 'get',
    params: {
      eventParentsCode,
      eventQuadClass
    }
  })
}


// 事件配置编码列表
export function getAllEventCodeList() {
  return request({
    url: '/eventMonitor/eventCodeDict/allCodeList',
    method: 'get'
  })
}

export function getEventList(
  {
    pageNum,
    pageSize
  }: EventListType
) {
  return request({
    url: '/eventMonitor/event/list',
    method: 'get',
    params: {
      pageNum,
      pageSize
    }
  })
}