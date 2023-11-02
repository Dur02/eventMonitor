import type { eventDisplayRowsType } from '@/types/components/event/display'

export type EventListType = {
  pageNum: number,
  pageSize: number,
}

export type EventListResultType = {
  rows: eventDisplayRowsType[],
  total: number
}