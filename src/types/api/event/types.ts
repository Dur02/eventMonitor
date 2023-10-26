export type CountryType = {
  countryCode: string
}

export type EventCodeType = {
  eventParentsCode?: string,
  eventQuadClass?: string
}

export type EventListType = {
  pageNum: number,
  pageSize: number
}

export type EventListResultType = {
  rows: any,
  total: number
}