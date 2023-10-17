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

export function getSearchInitial(name: string) {
  switch (name) {
    case 'A关系': {
      return {
        date: [1183135260000, Date.now()],
        dataSource: 'dataSource1',
        weight: 'weight1',
        statistics: 'statistics1',
        role: {
          role1: {
            country: 'A',
            organization: 'A',
            religion1: 'A',
            religion2: 'A',
            race: 'A',
            type1: 'A',
            type2: 'A',
            type3: 'A',
            geographicFeature: null,
            state: 'A',
            fullyGeographic: 'A',
            caseSensitive: true
          },
          role2: {
            country: 'A',
            organization: 'A',
            religion1: 'A',
            religion2: 'A',
            race: 'A',
            type1: 'A',
            type2: 'A',
            type3: 'A',
            geographicFeature: null,
            state: 'A',
            fullyGeographic: 'A',
            caseSensitive: true
          }
        },
        event: {
          type: {
            class: 'A',
            root: 'A',
            base: 'A',
            sub: 'A'
          },
          place: {
            geographicFeature: null,
            state: 'A',
            fullyGeographic: 'A',
            caseSensitive: true
          },
          other: {
            sourceUrl: 'A',
            emotion: [],
            effect: [],
            isRoot: null
          }
        }
      }
    }
    case 'B关系': {
      return {
        date: [1697525381050, Date.now()],
        dataSource: 'dataSource2',
        weight: 'weight2',
        statistics: 'statistics2',
        role: {
          role1: {
            country: 'B',
            organization: 'B',
            religion1: 'B',
            religion2: 'B',
            race: 'B',
            type1: 'B',
            type2: 'B',
            type3: 'B',
            geographicFeature: null,
            state: 'B',
            fullyGeographic: 'B',
            caseSensitive: true
          },
          role2: {
            country: 'B',
            organization: 'B',
            religion1: 'B',
            religion2: 'B',
            race: 'B',
            type1: 'B',
            type2: 'B',
            type3: 'B',
            geographicFeature: null,
            state: 'B',
            fullyGeographic: 'B',
            caseSensitive: true
          }
        },
        event: {
          type: {
            class: 'B',
            root: 'B',
            base: 'B',
            sub: 'B'
          },
          place: {
            geographicFeature: null,
            state: 'B',
            fullyGeographic: 'B',
            caseSensitive: true
          },
          other: {
            sourceUrl: 'B',
            emotion: [],
            effect: [],
            isRoot: null
          }
        }
      }
    }
    default: {
      return {
        date: null,
        dataSource: 'dataSource1',
        weight: 'weight1',
        statistics: 'statistics1',
        role: {
          role1: {
            country: '',
            organization: '',
            religion1: '',
            religion2: '',
            race: '',
            type1: '',
            type2: '',
            type3: '',
            geographicFeature: null,
            state: '',
            fullyGeographic: '',
            caseSensitive: true
          },
          role2: {
            country: '',
            organization: '',
            religion1: '',
            religion2: '',
            race: '',
            type1: '',
            type2: '',
            type3: '',
            geographicFeature: null,
            state: '',
            fullyGeographic: '',
            caseSensitive: true
          }
        },
        event: {
          type: {
            class: '',
            root: '',
            base: '',
            sub: ''
          },
          place: {
            geographicFeature: null,
            state: '',
            fullyGeographic: '',
            caseSensitive: true
          },
          other: {
            sourceUrl: '',
            emotion: [],
            effect: [],
            isRoot: null
          }
        }
      }
    }
  }
}