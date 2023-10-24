import request from './index'
import type { countryType, EventCodeType } from '@/api/types'

// 通过国家编码获取地区编码信息
export function getRegionCodeList({ countryCode }: countryType) {
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
export function getAllCodeList() {
  return request({
    url: '/eventMonitor/eventCodeDict/allCodeList',
    method: 'get'
  })
}