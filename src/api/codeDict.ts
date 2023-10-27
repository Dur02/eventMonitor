import request from './index'
import type { CountryType, EventCodeType } from '@/types/api/codeDict/types'

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

// 获取事件配置管理详细信息
export function getConfigCodeList(
  {
    configType,
  }: {
    // 1.事件 2.图谱
    configType: 1 | 2
  }
) {
  return request({
    url: `/eventMonitor/eventCodeDict/configTypeList/${configType}`,
    method: 'get'
  })
}