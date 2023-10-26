import type { DataTableColumns, EllipsisProps } from 'naive-ui'
import type { rowDataType } from '@/types/components/event/display/types'
import { useEventStore } from '@/stores/event'
import { storeToRefs } from 'pinia'
import { flow, find, propEq, prop } from 'lodash/fp'

const eventStore = useEventStore()
const {
  actorCountryCodeList,
  actorTypeCode,
  baseCodeList,
  ethnicCode,
  eventCodeList,
  geoCountryCodeList,
  knownGroupCode,
  quadClass,
  religionCode,
  rootCodeList
} = storeToRefs(eventStore)

const findValueInTarget = (value: string | number, target: any) => flow(
  find(propEq('value', value)),
  prop('label')
)(target)

const align = 'center'

const ellipsis: EllipsisProps = {
  tooltip: true,
  lineClamp: 1,
}

export const allColumns: DataTableColumns<rowDataType> = [
  {
    title: '序号',
    key: 'numbers',
    align
  },
  {
    title: '事件ID',
    key: 'globaleventid',
    align
  },
  {
    title: '日期',
    key: 'sqldate',
    align
  },
  {
    title: '时间比例',
    key: 'fractiondate',
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
    align
  },
  {
    title: '来源数',
    key: 'numsources',
    align
  },
  {
    title: '文章数',
    key: 'numarticles',
    align
  },
  {
    title: '影响度',
    key: 'goldsteinscale',
    align
  },
  {
    title: '情感值',
    key: 'avgtone',
    align
  },
  {
    title: '角色—编码',
    key: 'actor1code',
    align
  },
  {
    title: '角色—实名',
    key: 'actor1name',
    align
  },
  {
    title: '角色—国家',
    key: 'actor1countrycode',
    align
  },
  {
    title: '角色—组织',
    key: 'actor1knowngroupcode',
    align
  },
  {
    title: '角色—种族',
    key: 'actor1ethniccode',
    align
  },
  {
    title: '角色—宗教1',
    key: 'actor1religion1code',
    align
  },
  {
    title: '角色—宗教2',
    key: 'actor1religion2code',
    align
  },
  {
    title: '角色—种类1',
    key: 'actor1type1code',
    align
  },
  {
    title: '角色—种类2',
    key: 'actor1type2code',
    align
  },
  {
    title: '角色—种类2',
    key: 'actor1type2code',
    align
  },
  {
    title: '角色—种类3',
    key: 'actor1type3code',
    align
  },
  {
    title: '角色—地理种类',
    key: 'actor1geoType',
    align
  },
  {
    title: '角色—地理国家编码',
    key: 'actor1geoCountrycode',
    align
  },
  {
    title: '角色—地理省份编码',
    key: 'actor1geoAdm1code',
    align
  },
  {
    title: '角色—地理全名',
    key: 'actor1geoFullname',
    align
  },
  {
    title: '角色—经度',
    key: 'actor1geoLat',
    align
  },
  {
    title: '角色—纬度',
    key: 'actor1geoLong',
    align
  },
  {
    title: '角色—地理ID',
    key: 'actor1geoFeatureid',
    align
  },
  {
    title: '角色—地理ID',
    key: 'actor1geoFeatureid',
    align
  },
  {
    title: '角色—地理ID',
    key: 'actor1geoFeatureid',
    align
  },
  {
    title: '角色—地理ID',
    key: 'actor1geoFeatureid',
    align
  },
  {
    title: '角色—地理ID',
    key: 'actor1geoFeatureid',
    align
  }
]