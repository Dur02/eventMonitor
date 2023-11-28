import request from './index'
import type { AxiosResponse } from 'axios'

// 搜索新闻
export function searchNews(data: any): Promise<AxiosResponse<any, any>> {
  return request({
    url: '/eventMonitor/news/search',
    method: 'post',
    data
  })
}

// 通过id（新闻中的urlHash）获取新闻详情
export function getNewsDetail(id: number): Promise<AxiosResponse<any, any>> {
  return request({
    url: `/eventMonitor/news/info/${id}`,
    method: 'get'
  })
}