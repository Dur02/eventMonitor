export type ConfigListType = {
  configName?: string,
  configType?: string,
  runStatus?: string,
  createBy?: string,
  pageNum: number,
  pageSize: number
}

export type ConfigListResultType = {
  rows: any,
  total: number
}