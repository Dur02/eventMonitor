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