import request from './index'

export function getDisplayData(page: number, pageSize: number, selectedBtn: string) {
  // return request({
  //   url: `/accounts/${accountId}/state`,
  //   method: 'put'
  // })

  let mockData

  switch (selectedBtn) {
    case 'A关系':
      mockData = Array.from({ length: 500 }).map((_: unknown, index: number) => {
        return {
          column1: index,
          column2: (index % 2) + 1,
          column3: 'a' + index
        }
      })
      break
    default:
      mockData = Array.from({ length: 800 }).map((_: unknown, index: number) => {
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

export function getDisplayBtn() {
  return [
    {
      name: 'A关系'
    },
    {
      name: 'B关系'
    },
    {
      name: 'c关系'
    },
    {
      name: 'd关系'
    },
    {
      name: 'e关系'
    },
    {
      name: 'f关系'
    },
    {
      name: 'g关系'
    },
    {
      name: 'h关系'
    },
    {
      name: 'i关系'
    },
    {
      name: 'j关系'
    },
    {
      name: 'k关系'
    },
    {
      name: 'l关系'
    },
    {
      name: 'm关系'
    },
    {
      name: 'n关系'
    },
    {
      name: 'o关系'
    },
    {
      name: 'p关系'
    },
    {
      name: 'q关系'
    },
    {
      name: 'r关系'
    },
    {
      name: 's关系'
    },
    {
      name: 't关系'
    },
    {
      name: 'u关系'
    },
    {
      name: 'v关系'
    },
    {
      name: 'w关系'
    },
    {
      name: 'x关系'
    },
    {
      name: 'y关系'
    },
    {
      name: 'z关系'
    },
  ]
}