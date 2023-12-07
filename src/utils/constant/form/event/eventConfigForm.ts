import type { FormRules, SelectGroupOption, SelectOption } from 'naive-ui'
import type { eventConfigRowsType } from '@/types/components/config/event'
import type { eventConfigFormInitialValueType } from '@/types/components/form/event'
import { joinArray } from '@/utils/function/arrayToString'
import { splitString } from '@/utils/function/stringToArray'
import { getDateString, getSqlDate } from '@/utils/function/date'
import { getMinValue, getMaxValue } from '@/utils/function/getLimit'
import { compact, concat, filter, find, flatten, flow, includes, join, map, propEq } from 'lodash/fp'
import deepCopy from '@/utils/function/deepcopy'
import { useConstantStore } from '@/stores/constant'
import pinia from '@/stores/pinia'
import { storeToRefs } from 'pinia'

const constantStore = useConstantStore(pinia)
const { geoCountryCodeList } = storeToRefs(constantStore)

export const rootOptions: Array<SelectOption | SelectGroupOption> = [
  {
    label: '是',
    value: 1
  },
  {
    label: '否',
    value: 0
  }
]

export const eventConfigFormInitialValue: eventConfigFormInitialValueType = {
  sqldate: null,
  dataSource: 'dataSource1',
  weightBasis: 4,
  statisticsBasis: 2,
  actor1countrycode: [],
  actor1knowngroupcode: [],
  actor1religion1code: [],
  actor1religion2code: [],
  actor1ethniccode: [],
  actor1type1code: [],
  actor1type2code: [],
  actor1type3code: [],
  actor1name: '',
  actor1nameIsBig: 1,
  actor1geoType: [],
  actor1geoCountrycodeAndAdm1code: [],
  actor1geoFullname: '',
  actor1geoFullnameIsBig: 1,
  actor2countrycode: [],
  actor2knowngroupcode: [],
  actor2religion1code: [],
  actor2religion2code: [],
  actor2ethniccode: [],
  actor2type1code: [],
  actor2type2code: [],
  actor2type3code: [],
  actor2name: '',
  actor2nameIsBig: 1,
  actor2geoType: [],
  actor2geoCountrycodeAndAdm1code: [],
  actor2geoFullname: '',
  actor2geoFullnameIsBig: 1,
  quadclass: [],
  eventrootcode: [],
  eventbasecode: [],
  eventcode: [],
  actiongeoType: [],
  actiongeoCountrycodeAndAdm1code: [],
  actiongeoFullname: '',
  actiongeoFullnameIsBig: 1,
  sourceUrl: '',
  // avgtone: [],
  beginAvgtone: null,
  endAvgtone: null,
  beginGoldsteinscale: null,
  endGoldsteinscale: null,
  // goldsteinscale: [],
  isrootevent: null,
  numsourcesMin: null,
  numsourcesMax: null,
  nummentionsMin: null,
  nummentionsMax: null,
  numarticlesMin: null,
  numarticlesMax: null,
}

export const eventConfigFormRules: FormRules = {
  sqldate: [
    {
      type: 'array',
      required: true,
      message: '请选择日期',
      trigger: ['change', 'blur']
    }
  ],
  dataSource: [
    {
      required: true,
      message: '请选择数据源',
      trigger: ['input', 'blur']
    }
  ],
  weightBasis: [
    {
      type: 'number',
      required: true,
      message: '请选择权重依据',
      trigger: ['input', 'blur']
    }
  ],
  statisticsBasis: [
    {
      type: 'number',
      required: true,
      message: '请选择统计依据',
      trigger: ['input', 'blur']
    }
  ]
}

export const getConfigFormInitialValue = (rowData: eventConfigRowsType): eventConfigFormInitialValueType => ({
  sqldate: getSqlDate(rowData.beginSqldate, rowData.endSqldate),
  dataSource: 'dataSource1',
  weightBasis: rowData.weightBasis,
  statisticsBasis: rowData.statisticsBasis,
  actor1countrycode: splitString(rowData.actor1countrycode),
  actor1knowngroupcode: splitString(rowData.actor1knowngroupcode),
  actor1religion1code: splitString(rowData.actor1religion1code),
  actor1religion2code: splitString(rowData.actor1religion2code),
  actor1ethniccode: splitString(rowData.actor1ethniccode),
  actor1type1code: splitString(rowData.actor1type1code),
  actor1type2code: splitString(rowData.actor1type2code),
  actor1type3code: splitString(rowData.actor1type3code),
  actor1name: rowData.actor1name,
  actor1nameIsBig: rowData.actor1nameIsBig,
  actor1geoType: splitString(rowData.actor1geoType),
  actor1geoCountrycodeAndAdm1code: flow(
    concat(splitString(rowData.actor1geoCountrycode)),
    compact
  )(splitString(rowData.actor1geoAdm1code)),
  actor1geoFullname: rowData.actor1geoFullname,
  actor1geoFullnameIsBig: rowData.actor1geoFullnameIsBig,
  actor2countrycode: splitString(rowData.actor2countrycode),
  actor2knowngroupcode: splitString(rowData.actor2knowngroupcode),
  actor2religion1code: splitString(rowData.actor2religion1code),
  actor2religion2code: splitString(rowData.actor2religion2code),
  actor2ethniccode: splitString(rowData.actor2ethniccode),
  actor2type1code: splitString(rowData.actor2type1code),
  actor2type2code: splitString(rowData.actor2type2code),
  actor2type3code: splitString(rowData.actor2type3code),
  actor2name: rowData.actor2name,
  actor2nameIsBig: rowData.actor2nameIsBig,
  actor2geoType: splitString(rowData.actor2geoType),
  actor2geoCountrycodeAndAdm1code: flow(
    concat(splitString(rowData.actor2geoCountrycode)),
    compact
  )(splitString(rowData.actor2geoAdm1code)),
  actor2geoFullname: rowData.actor2geoFullname,
  actor2geoFullnameIsBig: rowData.actor2geoFullnameIsBig,
  quadclass: splitString(rowData.quadclass),
  eventrootcode: splitString(rowData.eventrootcode),
  eventbasecode: splitString(rowData.eventbasecode),
  eventcode: splitString(rowData.eventcode),
  actiongeoType: splitString(rowData.actiongeoType),
  actiongeoCountrycodeAndAdm1code: flow(
    concat(splitString(rowData.actiongeoCountrycode)),
    compact
  )(splitString(rowData.actiongeoAdm1code)),
  actiongeoFullname: rowData.actiongeoFullname,
  actiongeoFullnameIsBig: rowData.actiongeoFullnameIsBig,
  sourceUrl: rowData.sourceurl,
  beginAvgtone: rowData.beginAvgtone,
  endAvgtone: rowData.endAvgtone,
  // avgtone: [rowData.beginAvgtone, rowData.endAvgtone],
  beginGoldsteinscale: rowData.beginGoldsteinscale,
  endGoldsteinscale: rowData.endGoldsteinscale,
  // goldsteinscale: [rowData.beginGoldsteinscale, rowData.endGoldsteinscale],
  isrootevent: rowData.isrootevent,
  numsourcesMin: rowData.numsourcesMin,
  numsourcesMax: rowData.numsourcesMax,
  nummentionsMin: rowData.nummentionsMin,
  nummentionsMax: rowData.nummentionsMax,
  numarticlesMin: rowData.numarticlesMin,
  numarticlesMax: rowData.numarticlesMax,
})

const getGeoCountryCode = (target: string[]) => flow(
  filter((item) => find(propEq('key', item))(deepCopy(geoCountryCodeList.value))),
  join(',')
)(deepCopy(target))

const getGeoAdmCode = (target: string[]) => flow(
  map((item: any) => item.children),
  flatten,
  compact,
  filter(({ key }) => includes(key)(deepCopy(target))),
  map((item) => item.key),
  join(',')
)(deepCopy(geoCountryCodeList.value))

export const getConfigFormValue = (configForm: any) => ({
  ...configForm.formValue,
  beginSqldate: getDateString(configForm.formValue.sqldate[0]),
  endSqldate: getDateString(configForm.formValue.sqldate[1]),
  weightBasis: configForm.formValue.weightBasis,
  statisticsBasis: configForm.formValue.statisticsBasis,
  actor1countrycode: joinArray(configForm.formValue.actor1countrycode),
  actor1ethniccode: joinArray(configForm.formValue.actor1ethniccode),
  actor1geoCountrycode: getGeoCountryCode(configForm.formValue.actor1geoCountrycodeAndAdm1code),
  actor1geoAdm1code: getGeoAdmCode(configForm.formValue.actor1geoCountrycodeAndAdm1code),
  actor1geoType: joinArray(configForm.formValue.actor1geoType),
  actor1knowngroupcode: joinArray(configForm.formValue.actor1knowngroupcode),
  actor1religion1code: joinArray(configForm.formValue.actor1religion1code),
  actor1religion2code: joinArray(configForm.formValue.actor1religion2code),
  actor1type1code: joinArray(configForm.formValue.actor1type1code),
  actor1type2code: joinArray(configForm.formValue.actor1type2code),
  actor1type3code: joinArray(configForm.formValue.actor1type3code),
  actor1name: configForm.formValue.actor1name,
  actor1nameIsBig: configForm.formValue.actor1nameIsBig,
  actor1geoFullname: configForm.formValue.actor1geoFullname,
  actor1geoFullnameIsBig: configForm.formValue.actor1geoFullnameIsBig,
  actor2countrycode: joinArray(configForm.formValue.actor2countrycode),
  actor2ethniccode: joinArray(configForm.formValue.actor2ethniccode),
  actor2geoCountrycode: getGeoCountryCode(configForm.formValue.actor2geoCountrycodeAndAdm1code),
  actor2geoAdm1code: getGeoAdmCode(configForm.formValue.actor2geoCountrycodeAndAdm1code),
  actor2geoType: joinArray(configForm.formValue.actor2geoType),
  actor2knowngroupcode: joinArray(configForm.formValue.actor2knowngroupcode),
  actor2religion1code: joinArray(configForm.formValue.actor2religion1code),
  actor2religion2code: joinArray(configForm.formValue.actor2religion2code),
  actor2type1code: joinArray(configForm.formValue.actor2type1code),
  actor2type2code: joinArray(configForm.formValue.actor2type2code),
  actor2type3code: joinArray(configForm.formValue.actor2type3code),
  actor2name: configForm.formValue.actor2name,
  actor2nameIsBig: configForm.formValue.actor2nameIsBig,
  actor2geoFullname: configForm.formValue.actor2geoFullname,
  actor2geoFullnameIsBig: configForm.formValue.actor2geoFullnameIsBig,
  actiongeoCountrycode: getGeoCountryCode(configForm.formValue.actiongeoCountrycodeAndAdm1code),
  actiongeoAdm1code: getGeoAdmCode(configForm.formValue.actiongeoCountrycodeAndAdm1code),
  actiongeoType: joinArray(configForm.formValue.actiongeoType),
  eventbasecode: joinArray(configForm.formValue.eventbasecode),
  eventcode: joinArray(configForm.formValue.eventcode),
  eventrootcode: joinArray(configForm.formValue.eventrootcode),
  quadclass: joinArray(configForm.formValue.quadclass),
  actiongeoFullname: configForm.formValue.actor2name,
  actiongeoFullnameIsBig: configForm.formValue.actiongeoFullnameIsBig,
  beginAvgtone: getMinValue(configForm.formValue.beginAvgtone, configForm.formValue.endAvgtone),
  endAvgtone: getMaxValue(configForm.formValue.beginAvgtone, configForm.formValue.endAvgtone),
  beginGoldsteinscale: getMinValue(configForm.formValue.beginGoldsteinscale, configForm.formValue.endGoldsteinscale),
  endGoldsteinscale: getMaxValue(configForm.formValue.beginGoldsteinscale, configForm.formValue.endGoldsteinscale),
  numsourcesMin: getMinValue(configForm.formValue.numsourcesMin, configForm.formValue.numsourcesMax),
  numsourcesMax: getMaxValue(configForm.formValue.numsourcesMin, configForm.formValue.numsourcesMax),
  nummentionsMin: getMinValue(configForm.formValue.nummentionsMin, configForm.formValue.nummentionsMax),
  nummentionsMax: getMaxValue(configForm.formValue.nummentionsMin, configForm.formValue.nummentionsMax),
  numarticlesMin: getMinValue(configForm.formValue.numarticlesMin, configForm.formValue.numarticlesMax),
  numarticlesMax: getMaxValue(configForm.formValue.numarticlesMin, configForm.formValue.numarticlesMax),
})

// const getActorAndActionFormItem = () => {
//   const nullCommonObject = {
//     actor1ethniccode: null,
//     actor1geoCountrycode: null,
//     actor1geoAdm1code: null,
//     actor1geoType: null,
//     actor1knowngroupcode: null,
//     actor1religion1code: null,
//     actor1religion2code: null,
//     actor1type1code: null,
//     actor1type2code: null,
//     actor1type3code: null,
//     actor1name: null,
//     actor1nameIsBig: 0,
//     actor1geoFullname: null,
//     actor1geoFullnameIsBig: 0,
//     actor2ethniccode: null,
//     actor2geoCountrycode: null,
//     actor2geoAdm1code: null,
//     actor2geoType: null,
//     actor2knowngroupcode: null,
//     actor2religion1code: null,
//     actor2religion2code: null,
//     actor2type1code: null,
//     actor2type2code: null,
//     actor2type3code: null,
//     actor2name: null,
//     actor2nameIsBig: 0,
//     actor2geoFullname: null,
//     actor2geoFullnameIsBig: 0,
//     actiongeoCountrycode: null,
//     actiongeoAdm1code: null,
//     actiongeoType: null,
//     eventbasecode: null,
//     eventcode: null,
//     eventrootcode: null,
//     quadclass: null,
//     actiongeoFullname: null,
//     actiongeoFullnameIsBig: 0,
//     beginAvgtone: null,
//     endAvgtone: null,
//     beginGoldsteinscale: null,
//     endGoldsteinscale: null
//   }
//
//   return includes('event_country_monitor')(configSetting.formValue.configType) ? {
//     actor1countrycode: null,
//     actor2countrycode: null,
//     ...nullCommonObject
//   } : includes('event_country_relation_viz')(configSetting.formValue.configType) ? {
//     actor1countrycode: joinArray(configForm.formValue.actor1countrycode),
//     actor2countrycode: joinArray(configForm.formValue.actor2countrycode),
//     ...nullCommonObject
//   } : {
//     actor1countrycode: joinArray(configForm.formValue.actor1countrycode),
//     actor1ethniccode: joinArray(configForm.formValue.actor1ethniccode),
//     actor1geoCountrycode: getGeoCountryCode(configForm.formValue.actor1geoCountrycodeAndAdm1code),
//     actor1geoAdm1code: getGeoAdmCode(configForm.formValue.actor1geoCountrycodeAndAdm1code),
//     actor1geoType: joinArray(configForm.formValue.actor1geoType),
//     actor1knowngroupcode: joinArray(configForm.formValue.actor1knowngroupcode),
//     actor1religion1code: joinArray(configForm.formValue.actor1religion1code),
//     actor1religion2code: joinArray(configForm.formValue.actor1religion2code),
//     actor1type1code: joinArray(configForm.formValue.actor1type1code),
//     actor1type2code: joinArray(configForm.formValue.actor1type2code),
//     actor1type3code: joinArray(configForm.formValue.actor1type3code),
//     actor1name: configForm.formValue.actor1name,
//     actor1nameIsBig: configForm.formValue.actor1nameIsBig,
//     actor1geoFullname: configForm.formValue.actor1geoFullname,
//     actor1geoFullnameIsBig: configForm.formValue.actor1geoFullnameIsBig,
//     actor2countrycode: joinArray(configForm.formValue.actor2countrycode),
//     actor2ethniccode: joinArray(configForm.formValue.actor2ethniccode),
//     actor2geoCountrycode: getGeoCountryCode(configForm.formValue.actor2geoCountrycodeAndAdm1code),
//     actor2geoAdm1code: getGeoAdmCode(configForm.formValue.actor2geoCountrycodeAndAdm1code),
//     actor2geoType: joinArray(configForm.formValue.actor2geoType),
//     actor2knowngroupcode: joinArray(configForm.formValue.actor2knowngroupcode),
//     actor2religion1code: joinArray(configForm.formValue.actor2religion1code),
//     actor2religion2code: joinArray(configForm.formValue.actor2religion2code),
//     actor2type1code: joinArray(configForm.formValue.actor2type1code),
//     actor2type2code: joinArray(configForm.formValue.actor2type2code),
//     actor2type3code: joinArray(configForm.formValue.actor2type3code),
//     actor2name: configForm.formValue.actor2name,
//     actor2nameIsBig: configForm.formValue.actor2nameIsBig,
//     actor2geoFullname: configForm.formValue.actor2geoFullname,
//     actor2geoFullnameIsBig: configForm.formValue.actor2geoFullnameIsBig,
//     actiongeoCountrycode: getGeoCountryCode(configForm.formValue.actiongeoCountrycodeAndAdm1code),
//     actiongeoAdm1code: getGeoAdmCode(configForm.formValue.actiongeoCountrycodeAndAdm1code),
//     actiongeoType: joinArray(configForm.formValue.actiongeoType),
//     eventbasecode: joinArray(configForm.formValue.eventbasecode),
//     eventcode: joinArray(configForm.formValue.eventcode),
//     eventrootcode: joinArray(configForm.formValue.eventrootcode),
//     quadclass: joinArray(configForm.formValue.quadclass),
//     actiongeoFullname: configForm.formValue.actor2name,
//     actiongeoFullnameIsBig: configForm.formValue.actiongeoFullnameIsBig,
//     beginAvgtone: configForm.formValue.beginAvgtone || null,
//     endAvgtone: configForm.formValue.endAvgtone || null,
//     beginGoldsteinscale: configForm.formValue.beginGoldsteinscale || null,
//     endGoldsteinscale: configForm.formValue.endGoldsteinscale || null,
//   }
// }
