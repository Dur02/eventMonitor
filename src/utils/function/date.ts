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

import { drop, dropRight, flow, join, split } from 'lodash/fp'

// 把 20230101 转换为 时间戳
export const getSqlDate = (beginSqldate: number, endSqldate: number): [number, number] => {
  const getDateValue = (type: string, date: number) => {
    switch (type) {
      case 'year': {
        return flow(
          split(''),
          dropRight(4),
          join('')
        )(String(date))
      }
      case 'month': {
        return flow(
          split(''),
          drop(4),
          dropRight(2),
          join('')
        )(String(date))
      }
      default: {
        return flow(
          split(''),
          drop(6),
          join('')
        )(String(date))
      }
    }
  }

  const begin = `${getDateValue('year', beginSqldate)}-${getDateValue('month', beginSqldate)}-${getDateValue('day', beginSqldate)}`
  const end = `${getDateValue('year', endSqldate)}-${getDateValue('month', endSqldate)}-${getDateValue('day', endSqldate)}`

  return [new Date(begin).getTime(), new Date(end).getTime()]
}