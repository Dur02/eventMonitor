import type { DataTableColumns, EllipsisProps } from 'naive-ui'
import type { eventRowsType } from '@/types/components/event/display/types'
import { useEventStore } from '@/stores/event'
import { storeToRefs } from 'pinia'
import { flow, find, propEq, prop, includes } from 'lodash/fp'
import deepcopy from '@/utils/function/deepcopy';

const eventStore = useEventStore()
const {
  actorCountryCodeList,
  actorTypeCode,
  baseCodeList,
  ethnicCode,
  eventCodeList,
  geoCountryCodeList,
  geoTypeList,
  knownGroupCode,
  quadClass,
  religionCode,
  rootCodeList
} = storeToRefs(eventStore)

const findValueInTarget = (value: string | number, target: any) => flow(
  find(propEq('value', value)),
  prop('labelZh')
)(target)

const align = 'center'

const ellipsis: EllipsisProps = {
  tooltip: true,
  lineClamp: 1,
}

export const allColumns: DataTableColumns<eventRowsType> = [
  {
    title: '序号',
    key: 'numbers',
    ellipsis,
    align
  },
  {
    title: '事件ID',
    key: 'globaleventid',
    ellipsis,
    align
  },
  {
    title: '日期',
    key: 'sqldate',
    ellipsis,
    align
  },
  {
    title: '时间比例',
    key: 'fractiondate',
    ellipsis,
    align
  },
  {
    title: '大类事件',
    key: 'quadclass',
    render: ({ quadclass }) => findValueInTarget(quadclass, quadClass.value),
    ellipsis,
    align
  },
  {
    title: '根事件',
    key: 'eventrootcode',
    render: ({ eventrootcode }) => findValueInTarget(eventrootcode, rootCodeList.value),
    ellipsis,
    align
  },
  {
    title: '基事件',
    key: 'eventbasecode',
    render: ({ eventbasecode }) => findValueInTarget(eventbasecode, baseCodeList.value),
    ellipsis,
    align
  },
  {
    title: '事件编码',
    key: 'eventcode',
    render: ({ eventcode }) => findValueInTarget(eventcode, eventCodeList.value),
    ellipsis,
    align
  },
  {
    title: '是否根类',
    key: 'isrootevent',
    render: ({ isrootevent }) => isrootevent ? '是' : '否',
    ellipsis,
    align
  },
  {
    title: '来源数',
    key: 'numsources',
    ellipsis,
    align
  },
  {
    title: '文章数',
    key: 'numarticles',
    ellipsis,
    align
  },
  {
    title: '影响度',
    key: 'goldsteinscale',
    ellipsis,
    align
  },
  {
    title: '情感值',
    key: 'avgtone',
    ellipsis,
    align
  },
  {
    title: '角色一编码',
    key: 'actor1code',
    ellipsis,
    align
  },
  {
    title: '角色一实名',
    key: 'actor1name',
    ellipsis,
    align
  },
  {
    title: '角色一国家',
    key: 'actor1countrycode',
    render: ({ actor1countrycode }) => findValueInTarget(actor1countrycode, actorCountryCodeList.value),
    ellipsis,
    align
  },
  {
    title: '角色一组织',
    key: 'actor1knowngroupcode',
    render: ({ actor1knowngroupcode }) => findValueInTarget(actor1knowngroupcode, knownGroupCode.value),
    ellipsis,
    align
  },
  {
    title: '角色一种族',
    key: 'actor1ethniccode',
    render: ({ actor1ethniccode }) => findValueInTarget(actor1ethniccode, ethnicCode.value),
    ellipsis,
    align
  },
  {
    title: '角色一宗教1',
    key: 'actor1religion1code',
    render: ({ actor1religion1code }) => findValueInTarget(actor1religion1code, religionCode.value),
    ellipsis,
    align
  },
  {
    title: '角色一宗教2',
    key: 'actor1religion2code',
    render: ({ actor1religion2code }) => findValueInTarget(actor1religion2code, religionCode.value),
    ellipsis,
    align
  },
  {
    title: '角色一种类1',
    key: 'actor1type1code',
    render: ({ actor1type1code }) => findValueInTarget(actor1type1code, actorTypeCode.value),
    ellipsis,
    align
  },
  {
    title: '角色一种类2',
    key: 'actor1type2code',
    render: ({ actor1type2code }) => findValueInTarget(actor1type2code, actorTypeCode.value),
    ellipsis,
    align
  },
  {
    title: '角色一种类3',
    key: 'actor1type3code',
    render: ({ actor1type3code }) => findValueInTarget(actor1type3code, actorTypeCode.value),
    ellipsis,
    align
  },
  {
    title: '角色一地理种类',
    key: 'actor1geoType',
    render: ({ actor1geoType }) => flow(
      find(({ value }) => includes(actor1geoType)(value)),
      prop('label')
    )(geoTypeList.value),
    ellipsis,
    align
  },
  {
    title: '角色一地理国家',
    key: 'actor1geoCountrycode',
    render: ({ actor1geoCountrycode }) => flow(
      find(propEq('key', actor1geoCountrycode)),
      prop('labelZh')
    )(geoCountryCodeList.value),
    ellipsis,
    align
  },
  {
    title: '角色一地理省份编码',
    key: 'actor1geoAdm1code',
    ellipsis,
    align
  },
  {
    title: '角色一地理全名',
    key: 'actor1geoFullname',
    ellipsis,
    align
  },
  {
    title: '角色一经度',
    key: 'actor1geoLat',
    ellipsis,
    align
  },
  {
    title: '角色一纬度',
    key: 'actor1geoLong',
    ellipsis,
    align
  },
  {
    title: '角色一地理ID',
    key: 'actor1geoFeatureid',
    ellipsis,
    align
  },
  {
    title: '角色二编码',
    key: 'actor2code',
    ellipsis,
    align
  },
  {
    title: '角色二实名',
    key: 'actor2name',
    ellipsis,
    align
  },
  {
    title: '角色二国家',
    key: 'actor2countrycode',
    render: ({ actor2countrycode }) => findValueInTarget(actor2countrycode, actorCountryCodeList.value),
    ellipsis,
    align
  },
  {
    title: '角色二组织',
    key: 'actor2knowngroupcode',
    render: ({ actor2knowngroupcode }) => findValueInTarget(actor2knowngroupcode, knownGroupCode.value),
    ellipsis,
    align
  },
  {
    title: '角色二种族',
    key: 'actor2ethniccode',
    render: ({ actor2ethniccode }) => findValueInTarget(actor2ethniccode, ethnicCode.value),
    ellipsis,
    align
  },
  {
    title: '角色二宗教1',
    key: 'actor2religion1code',
    render: ({ actor2religion1code }) => findValueInTarget(actor2religion1code, religionCode.value),
    ellipsis,
    align
  },
  {
    title: '角色二宗教2',
    key: 'actor2religion2code',
    render: ({ actor2religion2code }) => findValueInTarget(actor2religion2code, religionCode.value),
    ellipsis,
    align
  },
  {
    title: '角色二种类1',
    key: 'actor2type1code',
    render: ({ actor2type1code }) => findValueInTarget(actor2type1code, actorTypeCode.value),
    ellipsis,
    align
  },
  {
    title: '角色二种类2',
    key: 'actor2type2code',
    render: ({ actor2type2code }) => findValueInTarget(actor2type2code, actorTypeCode.value),
    ellipsis,
    align
  },
  {
    title: '角色二种类3',
    key: 'actor2type3code',
    render: ({ actor2type3code }) => findValueInTarget(actor2type3code, actorTypeCode.value),
    ellipsis,
    align
  },
  {
    title: '角色二地理种类',
    key: 'actor2geoType',
    render: ({ actor2geoType }) => flow(
      find(({ value }) => includes(actor2geoType)(value)),
      prop('label')
    )(geoTypeList.value),
    ellipsis,
    align
  },
  {
    title: '角色二地理国家',
    key: 'actor2geoCountrycode',
    render: ({ actor2geoCountrycode }) => flow(
      find(propEq('key', actor2geoCountrycode)),
      prop('labelZh')
    )(geoCountryCodeList.value),
    ellipsis,
    align
  },
  {
    title: '角色二地理省份编码',
    key: 'actor2geoAdm1code',
    ellipsis,
    align
  },
  {
    title: '角色二地理全名',
    key: 'actor2geoFullname',
    ellipsis,
    align
  },
  {
    title: '角色二经度',
    key: 'actor2geoLat',
    ellipsis,
    align
  },
  {
    title: '角色二纬度',
    key: 'actor2geoLong',
    ellipsis,
    align
  },
  {
    title: '角色二地理ID',
    key: 'actor2geoFeatureid',
    ellipsis,
    align
  },
  {
    title: '事件发生地国家(编码)',
    key: 'actiongeoCountrycode',
    render: ({ actiongeoCountrycode }) => flow(
      find(propEq('key', actiongeoCountrycode)),
      prop('labelZh')
    )(geoCountryCodeList.value),
    ellipsis,
    align
  },
  {
    title: '事件发生地州省（编码）',
    key: 'actiongeoAdm1code',
    ellipsis,
    align
  },
  {
    title: '事件发生地地理全名',
    key: 'actiongeoFullname',
    ellipsis,
    align
  },
  {
    title: '事件发生地经度',
    key: 'actiongeoLat',
    ellipsis,
    align
  },
  {
    title: '事件发生地纬度',
    key: 'actiongeoLong',
    ellipsis,
    align
  },
  {
    title: '事件发生地地理ID',
    key: 'actiongeoFeatureid',
    ellipsis,
    align
  },
  {
    title: '入库时间',
    key: 'dateadded',
    ellipsis,
    align
  },
  {
    title: '源URL  ',
    key: 'sourceurl',
    ellipsis,
    align
  }
]