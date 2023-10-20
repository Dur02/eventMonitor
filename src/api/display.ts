import request from './index'

export function getDisplayData(page: number, pageSize: number, selectedBtn: string, params: any) {
  // return request({
  //   url: `/accounts/${accountId}/state`,
  //   method: 'put'
  // })

  let mockData

  switch (selectedBtn) {
    case 'A关系':
      mockData = Array.from({length: 500}).map((_: unknown, index: number) => {
        return {
          column1: index,
          column2: (index % 2) + 1,
          column3: 'a' + index
        }
      })
      break
    default:
      mockData = Array.from({length: 800}).map((_: unknown, index: number) => {
        return {
          column1: index + 1,
          column2: (index % 2) + 2,
          column3: 'a' + (index + 1)
        }
      })
      break
  }

  const copiedData = mockData.map((v) => v)
  const pagedData = copiedData.slice((page - 1) * pageSize, page * pageSize)
  const total = copiedData.length
  const pageCount = Math.ceil(copiedData.length / pageSize)

  return {
    pageCount,
    data: pagedData,
    total
  }
}