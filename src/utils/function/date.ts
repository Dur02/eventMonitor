import { drop, dropRight, flow, join, split } from 'lodash/fp'

// 从 20230101 中获取年
export const getYear = (date: string): string => flow(
  split(''),
  dropRight(4),
  join('')
)(String(date))

// 从 20230101 中获取月
export const getMonth = (date: string): string => flow(
  split(''),
  drop(4),
  dropRight(2),
  join('')
)(String(date))

// 从 20230101 中获取日
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

/*
 获取 20230101 是年内第几周
 date1是当前日期
 date2是当年第一天
 d是当前日期是今年第多少天
 用d + 当前年的第一天的周差距的和在除以7就是本年第几周
 */
export const getWeek = (date: string): string => {
  const date1: Date = new Date(Number(getYear(date)), Number(getMonth(date)) - 1, Number(getDay(date)))
  const date2: Date = new Date(Number(getYear(date)), 0, 1)
  const d: number = Math.round((date1.valueOf() - date2.valueOf()) / 86400000)
  return `${getYear(date)}${Math.ceil((d + ((date2.getDay() + 1) - 1)) / 7)}`
}