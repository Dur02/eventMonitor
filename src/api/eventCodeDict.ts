import request from './index'
import type { CountryType, EventCodeType } from 'src/types/api/eventCodeDict'

// 通过国家编码获取地区编码信息
export function getRegionCodeList({ countryCode }: CountryType) {
  return request({
    url: `/eventMonitor/eventCodeDict/regionCodeList/${countryCode}`,
    method: 'get'
  })
}

// 根据大类和父类的id获取目标的可选项，用于事件配置的基类和子类选项获取，可多选（已废弃）
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

// 获取事件配置的全部选择器的选项
export function getAllEventCodeList() {
  return request({
    url: '/eventMonitor/eventCodeDict/allCodeList',
    method: 'get'
  })
}

// 获取各种配置需要使用的选项
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