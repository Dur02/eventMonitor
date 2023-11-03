export type ConfigListType = {
  configName?: string,
  configType?: string | null,
  runStatus?: number | null,
  createByName?: string,
  pageNum: number,
  pageSize: number
}

export type ConfigListResultType = {
  rows: any,
  total: number
}