import type { eventConfigRowsType } from '@/types/components/config/event'
import type { eventDisplayRowsType } from '@/types/components/event/display';

export type GetEventConfigListByConfigName = {
  configType: string,
  pageSize: number,
  pageNum: number,
  orderByColumn?: string,
  isAsc?: string
}

export type GetResultDataByConfigIdType = {
  configId: number
}

export type GetResultDataByConfigIdRespType = {
  code: number,
  data: {
    configId: number,
    configType: string,
    isSave: number,
    msg: string | null,
    resultData: {
      code: number,
      msg: string
      rows: Array<eventDisplayRowsType>,
      total: number,
    }
  },
  msg: string
}