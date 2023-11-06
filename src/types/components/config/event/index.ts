export interface searchFormType {
  configName: string ,
  configType: string | null,
  runStatus: number | null,
  createByName: string
}

export interface eventConfigSettingInitialValueType {
  configName: string,
  configType: string | null,
  remark: string,
  orderPriority: number | null,
  purview: number | null,
  isShow: number | null
}

export interface eventConfigFormInitialValueType {
  sqldate: [number, number] | null,
  dataSource: string,
  weightBasis: string,
  statisticsBasis: string,
  actor1countrycode: Array<string>,
  actor1knowngroupcode: Array<string>,
  actor1religion1code: Array<string>,
  actor1religion2code: Array<string>,
  actor1ethniccode: Array<string>,
  actor1type1code: Array<string>,
  actor1type2code: Array<string>,
  actor1type3code: Array<string>,
  actor1name: string,
  actor1nameCaseSensitive: boolean,
  actor1geoType: Array<string>,
  actor1geoCountrycodeAndAdm1code: Array<string>,
  actor1geoFullname: string,
  actor1geoFullnameCaseSensitive: boolean,
  actor2countrycode: Array<string>,
  actor2knowngroupcode: Array<string>,
  actor2religion1code: Array<string>,
  actor2religion2code: Array<string>,
  actor2ethniccode: Array<string>,
  actor2type1code: Array<string>,
  actor2type2code: Array<string>,
  actor2type3code: Array<string>,
  actor2name: string,
  actor2nameCaseSensitive: boolean,
  actor2geoType: Array<string>,
  actor2geoCountrycodeAndAdm1code: Array<string>,
  actor2geoFullname: string,
  actor2geoFullnameCaseSensitive: boolean,
  quadclass: Array<string>,
  eventrootcode: Array<string>,
  eventbasecode: Array<string>,
  eventcode: Array<string>,
  actiongeoType: Array<string>,
  actiongeoCountrycodeAndAdm1code: Array<string>,
  actiongeoFullname: string,
  actiongeoFullnameCaseSensitive: boolean,
  sourceUrl: string,
  avgtone: Array<number>,
  goldsteinscale: Array<number>,
  isrootevent: string | null
}

export interface eventConfigSettingProps {
  initialValue: eventConfigSettingInitialValueType
}

export interface eventConfigFormProps {
  initialValue: eventConfigFormInitialValueType
}

export type eventConfigRowsType = {
  numbers: number,
  orderPriority: number,
  isShow: number,
  configName: string,
  configType: string,
  createByName: string,
  purview: number,
  createTime: string,
  remark: string,
  runStatus: number,
  id: number
}