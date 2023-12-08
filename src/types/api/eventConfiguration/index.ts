// import type { eventConfigRowsType } from '@/types/components/config/event'

export type UpdateEventConfigShowType = {
  configId: number,
  isShow: number
}

export type configListRequestType = {
  configName?: string,
  configType?: string | null,
  runStatus?: number | null,
  createByName?: string,
  pageNum: number,
  pageSize: number
}

// export type GetEventConfigListRespType = {
//   rows: eventConfigRowsType,
//   total: number
// }