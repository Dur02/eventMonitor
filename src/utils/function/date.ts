import { drop, dropRight, flow, join, split } from 'lodash/fp'
import { computed } from 'vue'

/*
 从 20230101 中获取年(不带年份）
 例: 20230101 => 2023
 */
export const getYear = (date: string): string => flow(
  split(''),
  dropRight(4),
  join('')
)(String(date))

/*
 从 20230101 中获取月
 例: 20230101 => 01
 */
export const getMonth = (date: string): string => flow(
  split(''),
  drop(4),
  dropRight(2),
  join('')
)(String(date))

/*
 获取 20230101 是年内第几周
 例: 20230101 => 202301
 */
export const getWeek = (date: string): string => {
  const currentDate: Date = new Date(Number(getYear(date)), Number(getMonth(date)) - 1, Number(getDay(date)))
  const beginDate: Date = new Date(Number(getYear(date)), 0, 1)
  // 星期从0-6,0代表星期天，6代表星期六
  let endWeek = currentDate.getDay()
  if (endWeek == 0) endWeek = 7
  let beginWeek = beginDate.getDay()
  if (beginWeek == 0) beginWeek = 7
  // 计算两个日期的天数差
  const millisDiff = currentDate.getTime() - beginDate.getTime()
  const dayDiff = Math.floor(( millisDiff + (beginWeek - endWeek) * (24 * 60 * 60 * 1000)) / 86400000)
  return `${getYear(date)}${Math.ceil(dayDiff / 7) + 1 < 10 ? '0' : ''}${Math.ceil(dayDiff / 7) + 1}`
}

/*
 从 20230101 中获取日
 例: 20230101 => 01
 */
export const getDay = (date: string): string => flow(
  split(''),
  drop(6),
  join('')
)(String(date))

// 把 时间戳 化为 2023-01-01
export const formatTimeStamp = (timestamp: number): string => {
  // 创建一个Date对象
  const date = new Date(timestamp)

  // 获取年份、月份和日期
  const year = date.getFullYear()
  const month = ('0' + (date.getMonth() + 1)).slice(-2)
  const day = ('0' + date.getDate()).slice(-2)

  // 返回格式化的日期字符串
  return (year + '-' + month + '-' + day)
}

// 把 时间戳 化为 20230101
export const getDateString = (timestamp: number) => {
  const date = new Date(timestamp)

  const year = date.getFullYear();
  const month = ('0' + (date.getMonth() + 1)).slice(-2);
  const day = ('0' + date.getDate()).slice(-2);

  return (year + month + day);
}

// 把 beginSqldate和endSqldate 转换为 时间戳数组
export const getSqlDate = (beginSqldate: number, endSqldate: number): [number, number] => {
  const begin = `${getYear(String(beginSqldate))}-${getMonth(String(beginSqldate))}-${getDay(String(beginSqldate))}`
  const end = `${getYear(String(endSqldate))}-${getMonth(String(endSqldate))}-${getDay(String(endSqldate))}`
  return [new Date(begin).getTime(), new Date(end).getTime()]
}