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

  const year = date.getFullYear()
  const month = ('0' + (date.getMonth() + 1)).slice(-2)
  const day = ('0' + date.getDate()).slice(-2)

  return (year + month + day)
}

// 把 beginSqldate和endSqldate 转换为 时间戳数组
export const getSqlDate = (beginSqldate: number, endSqldate: number): [number, number] => {
  const begin = `${getYear(String(beginSqldate))}-${getMonth(String(beginSqldate))}-${getDay(String(beginSqldate))}`
  const end = `${getYear(String(endSqldate))}-${getMonth(String(endSqldate))}-${getDay(String(endSqldate))}`
  return [new Date(begin).getTime(), new Date(end).getTime()]
}

export const weekGetDay = (year: number, week: number) => {
  const date = new Date(year, 0, 1)
  let time = date.getTime()
  const _week = date.getDay()

  if (_week !== 0) {
    if (week === 54) {
      return '今年没有54周'
    }
    let cnt = 0
    switch (_week) {
      case 0:
        cnt = 7
        break
      case 1:
        cnt = 6
        break
      case 2:
        cnt = 5
        break
      case 3:
        cnt = 4
        break
      case 4:
        cnt = 3
        break
      case 5:
        cnt = 2
        break
      default:
        cnt = 1
        break
    }
    cnt += 1
    time += cnt * 24 * 3600000
    const nextYear = new Date(parseInt(String(year), 10) + 1, 0, 1)
    const nextWeek = nextYear.getDay()
    let lastcnt = 0
    switch (nextWeek) {
      case 0:
        lastcnt = 7
        break
      case 1:
        lastcnt = 6
        break
      case 2:
        lastcnt = 5
        break
      case 3:
        lastcnt = 4
        break
      case 4:
        lastcnt = 3
        break
      case 5:
        lastcnt = 2
        break
      default:
        lastcnt = 1
        break
    }
    if (week === 1) {
      const start = formatTimeStamp(date.getTime())
      date.setTime(time - 24 * 3600000)
      return [start, String(date)]
    } else if (week === 53) {
      const start = time + (week - 2) * 7 * 24 * 3600000
      const end = time + (week - 2) * 7 * 24 * 3600000 + lastcnt * 24 * 3600000 - 24 * 3600000
      date.setTime(start)
      const _start = formatTimeStamp(date.getTime())
      date.setTime(end)
      const _end = formatTimeStamp(date.getTime())
      return [_start, _end]
    } else {
      const start = time + (week - 2) * 7 * 24 * 3600000
      const end = time + (week - 1) * 7 * 24 * 3600000
      date.setTime(start)
      const _start = formatTimeStamp(date.getTime())
      date.setTime(end)
      const _end = formatTimeStamp(date.getTime())
      return [_start, _end]
    }
  } else {
    let cnt = 0
    if (_week === 0 && week === 1) {
      cnt = 0
    } else if (_week === 0) {
      cnt = 7
    } else if (_week === 1) {
      cnt = 6
    } else if (_week === 2) {
      cnt = 5
    } else if (_week === 3) {
      cnt = 4
    } else if (_week === 4) {
      cnt = 3
    } else if (_week === 5) {
      cnt = 2
    } else if (_week === 6) {
      cnt = 1
    }
    cnt += 1
    time += 24 * 3600000
    const nextYear = new Date(parseInt(String(year), 10) + 1, 0, 1)
    const nextWeek = nextYear.getDay()
    let lastcnt = 0
    switch (nextWeek) {
      case 0:
        lastcnt = 7
        break
      case 1:
        lastcnt = 6
        break
      case 2:
        lastcnt = 5
        break
      case 3:
        lastcnt = 4
        break
      case 4:
        lastcnt = 3
        break
      case 5:
        lastcnt = 2
        break
      default:
        lastcnt = 1
        break
    }
    if (week === 1) {
      const start = formatTimeStamp(date.getTime())
      date.setTime(time - 24 * 3600000)
      return [start, String(date)]
    } else if (week === 54) {
      const start = time + (week - 2) * 7 * 24 * 3600000
      const end = time + (week - 2) * 7 * 24 * 3600000 + lastcnt * 24 * 3600000 - 24 * 3600000
      date.setTime(start)
      const _start = formatTimeStamp(date.getTime())
      date.setTime(end)
      const _end = formatTimeStamp(date.getTime())
      return [_start, _end]
    } else {
      const start = time + (week - 2) * 7 * 24 * 3600000
      const end = time + (week - 1) * 7 * 24 * 3600000 - 24 * 3600000
      date.setTime(start)
      const _start = formatTimeStamp(date.getTime())
      date.setTime(end)
      const _end = formatTimeStamp(date.getTime())
      return [_start, _end]
    }
  }
}