import type { FormRules, SelectGroupOption, SelectOption, DataTableColumns, EllipsisProps } from 'naive-ui'
import type { eventConfigRowsType, eventFormInitialValueType } from '@/types/components/config/event'
import type { CardThemeOverrides, FormThemeOverrides, DrawerThemeOverrides } from '@/types/themeOverrides'
import { h } from 'vue'
import { NIcon, NTag } from 'naive-ui'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia'
import { Eye, EyeOff } from '@vicons/ionicons5'
import renderIcon from '@/utils/function/renderIcon';

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)

export const drawerLightThemeOverrides: DrawerThemeOverrides = {
  color: 'rgb(255, 255, 255)',
}

export const drawerDarkThemeOverrides: DrawerThemeOverrides = {
  color: 'rgb(24, 24, 28)',
}

export const cardLightThemeOverrides: CardThemeOverrides = {
  paddingMedium: '15px 20px',
  colorModal: 'rgb(255, 255, 255)'
}

export const cardDarkThemeOverrides: CardThemeOverrides = {
  paddingMedium: '15px 20px',
  colorModal: 'rgb(24, 24, 28)'
}

export const formThemeOverrides: FormThemeOverrides = {
  blankHeightMedium: '10px'
}

const align = 'center'
const ellipsisComponent = 'performant-ellipsis'
const ellipsis: EllipsisProps = {
  tooltip: true,
  lineClamp: 1,
}

const getTagColor = (orderPriority: number) => {
  switch (orderPriority) {
    case 1: {
      return 'error'
    }
    case 2: {
      return 'success'
    }
    case 3: {
      return 'warning'
    }
    default: {
      return 'info'
    }
  }
}

export const allColumns: DataTableColumns<eventConfigRowsType> = [
  {
    type: 'selection'
  },
  {
    title: '序号',
    key: 'numbers',
    width: 80,
    align,
    ellipsisComponent,
    ellipsis
  },
  {
    title: '排序',
    key: 'orderPriority',
    width: 100,
    align,
    render: ({ orderPriority }) => {
      const type = getTagColor(orderPriority)
      return h(
        NTag,
        {
          bordered: false,
          type
        },
        {
          default: () => orderPriority
        }
      )
    }
  },
  {
    title: '挂起',
    key: 'isShow',
    width: 80,
    align,
    render: ({ isShow }) => renderIcon(isShow ? Eye : EyeOff)
  },
  {
    title: '配置名称',
    key: 'configName',
    align,
  },
  {
    title: '配置分类',
    key: 'configType',
    align,
  },
  {
    title: '创建人',
    key: 'createByName',
    align,
  },
  {
    title: '权限',
    key: 'purview',
    align,
  },
  {
    title: '创建日期',
    key: 'createTime',
    align,
  },
  {
    title: '备注信息',
    key: 'remark',
    align,
  },
  {
    title: '状态',
    key: 'runStatus',
    align,
  },
  {
    title: '操作',
    key: 'numbers',
    align,
  },
]

export const configStatus = [
  { label: '待执行', value: 0 },
  { label: '执行中', value: 1 },
  { label: '执行成功', value: 2 },
  { label: '执行失败', value: 3 },
  { label: '排队中', value: 4 }
]

export const rules: FormRules = {
  sqldate: {
    type: 'array',
    required: true,
    message: '请选择日期',
    trigger: ['change', 'blur']
  },
  dataSource: {
    required: true,
    message: '请选择数据源aaaaa',
    trigger: ['input', 'blur']
  },
  weightBasis: {
    required: true,
    message: '请选择权重依据',
    trigger: ['input', 'blur']
  },
  statisticsBasis: {
    required: true,
    message: '请选择统计依据',
    trigger: ['input', 'blur']
  }
}

export const rootOptions: Array<SelectOption | SelectGroupOption> = [
  {
    label: '是',
    value: 'true'
  },
  {
    label: '否',
    value: 'false'
  }
]

export const initialFormValue: eventFormInitialValueType = {
  sqldate: null,
  dataSource: 'dataSource1',
  weightBasis: 'weight1',
  statisticsBasis: 'statistics1',
  actor1countrycode: [],
  actor1knowngroupcode: [],
  actor1religion1code: [],
  actor1religion2code: [],
  actor1ethniccode: [],
  actor1type1code: [],
  actor1type2code: [],
  actor1type3code: [],
  actor1name: '',
  actor1nameCaseSensitive: true,
  actor1geoType: [],
  actor1geoCountrycodeAndAdm1code: [],
  actor1geoFullname: '',
  actor1geoFullnameCaseSensitive: true,
  actor2countrycode: [],
  actor2knowngroupcode: [],
  actor2religion1code: [],
  actor2religion2code: [],
  actor2ethniccode: [],
  actor2type1code: [],
  actor2type2code: [],
  actor2type3code: [],
  actor2name: '',
  actor2nameCaseSensitive: true,
  actor2geoType: [],
  actor2geoCountrycodeAndAdm1code: [],
  actor2geoFullname: '',
  actor2geoFullnameCaseSensitive: true,
  quadclass: [],
  eventrootcode: [],
  eventbasecode: [],
  eventcode: [],
  actiongeoType: [],
  actiongeoCountrycodeAndAdm1code: [],
  actiongeoFullname: '',
  actiongeoFullnameCaseSensitive: true,
  sourceUrl: '',
  avgtone: [],
  goldsteinscale: [],
  isrootevent: ''
}
