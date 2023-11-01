import type { eventRowsType } from '@/types/components/event/display'

export type EventListType = {
  pageNum: number,
  pageSize: number,
}

export type EventListResultType = {
  rows: eventRowsType[],
  total: number
}