import request from './index'
import type { CountryType } from 'src/types/api/eventCodeDict'

// 通过国家编码获取地区编码信息
export function getRegionCodeList({ countryCode }: CountryType) {
  return request({
    url: `/eventMonitor/eventCodeDict/regionCodeList/${countryCode}`,
    method: 'get'
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