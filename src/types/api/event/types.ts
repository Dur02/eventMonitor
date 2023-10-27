import type { eventRowsType } from '@/types/components/event/display/types'

export type CountryType = {
  countryCode: string
}

export type EventCodeType = {
  eventParentsCode?: string,
  eventQuadClass?: string
}

export type EventListType = {
  pageNum: number,
  pageSize: number,
  // param:
}

export type EventListResultType = {
  rows: eventRowsType[],
  total: number
}