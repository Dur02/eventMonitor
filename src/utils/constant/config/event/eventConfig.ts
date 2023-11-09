import type { FormRules, SelectGroupOption, SelectOption, DataTableColumns, EllipsisProps, ConfigProviderProps } from 'naive-ui'
import type {
  eventConfigRowsType,
  eventConfigFormInitialValueType,
  eventConfigSettingInitialValueType
} from '@/types/components/config/event'
import type { CardThemeOverrides, FormThemeOverrides, DrawerThemeOverrides } from '@/types/themeOverrides'
import { h, computed } from 'vue'
import type { TreeSelectOption } from 'naive-ui'
import {
  NButton,
  NIcon,
  NSpace,
  NTag,
  NTooltip,
  NPopconfirm,
  createDiscreteApi,
  lightTheme,
  darkTheme,
} from 'naive-ui'
import pinia from '@/stores/pinia'
import { storeToRefs } from 'pinia'
import { Eye, EyeOff, PlayCircleOutline, Download, Trash, Duplicate, PauseCircle } from '@vicons/ionicons5'
import {
  find,
  flow,
  prop,
  propEq,
  split,
  drop,
  dropRight,
  join,
  concat,
  compact,
  filter,
  map,
  flatten, includes
} from 'lodash/fp'
import { CalendarEdit20Filled } from '@vicons/fluent'
import { useConstantStore } from '@/stores/constant'
import { useEventConfigStore } from '@/stores/eventConfig'
import { useSystemStore } from '@/stores/system'
import { eventConfigExport } from '@/api/eventAnalyse'
import deepCopy from '@/utils/function/deepcopy'


const systemStore = useSystemStore(pinia)
const { isLight } = storeToRefs(systemStore)
const constantStore = useConstantStore(pinia)
const { eventConfigTypeList } = storeToRefs(constantStore)
const eventConfigStore = useEventConfigStore(pinia)
const { updateSingle, changeIsShow, runTask, stopTask, handleSingleDelete } = eventConfigStore

const configProviderPropsRef = computed<ConfigProviderProps>(() => ({
  theme: isLight.value ? lightTheme : darkTheme
}))

const { message } = createDiscreteApi(
  ['message'],
  {
    configProviderProps: configProviderPropsRef
  }
)

export const drawerLightThemeOverrides: DrawerThemeOverrides = {
  color: 'rgb(255, 255, 255)',
}

export const drawerDarkThemeOverrides: DrawerThemeOverrides = {
  color: 'rgb(24, 24, 28)',
}

export const cardLightThemeOverrides: CardThemeOverrides = {
  paddingMedium: '10px 20px',
  colorModal: 'rgb(255, 255, 255)'
}

export const cardDarkThemeOverrides: CardThemeOverrides = {
  paddingMedium: '10px 20px',
  colorModal: 'rgb(24, 24, 28)'
}

export const formThemeOverrides: FormThemeOverrides = {
  blankHeightMedium: '10px'
}

const splitString = (param: string | null) => param ? split(',')(param) : null

const getSqlDate = (beginSqldate: number, endSqldate: number): [number, number] => {
  const getDateValue = (type: string, date: number) => {
    switch (type) {
      case 'year': {
        return flow(
          split(''),
          dropRight(4),
          join('')
        )(String(date))
      }
      case 'month': {
        return flow(
          split(''),
          drop(4),
          dropRight(2),
          join('')
        )(String(date))
      }
      default: {
        return flow(
          split(''),
          drop(6),
          join('')
        )(String(date))
      }
    }
  }

  const begin = `${getDateValue('year', beginSqldate)}-${getDateValue('month', beginSqldate)}-${getDateValue('day', beginSqldate)}`
  const end = `${getDateValue('year', endSqldate)}-${getDateValue('month', endSqldate)}-${getDateValue('day', endSqldate)}`

  return [new Date(begin).getTime(), new Date(end).getTime()]
}

const getSettingInitialValue = (rowData: eventConfigRowsType) => ({
  configName: rowData.configName,
  configType: splitString(rowData.configType),
  remark: rowData.remark,
  orderPriority: rowData.orderPriority,
  purview: rowData.purview,
  isShow: rowData.isShow
})

const getFormInitialValue = (rowData: eventConfigRowsType) => ({
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
  avgtone: [rowData.beginAvgtone, rowData.endAvgtone],
  goldsteinscale: [rowData.beginGoldsteinscale, rowData.endGoldsteinscale],
  isrootevent: rowData.isrootevent
})

export const allColumns = (
  handleUpdateDrawer: (
    title: string,
    settingInitial: eventConfigSettingInitialValueType,
    formInitial: eventConfigFormInitialValueType,
    show: boolean,
    disabled: boolean,
    id: number | null
  ) => void
): DataTableColumns<eventConfigRowsType> => {

  const align = 'center'
  const ellipsisComponent = 'performant-ellipsis'
  const ellipsis: EllipsisProps = {
    tooltip: true,
    lineClamp: 1,
  }

  const findValueInTarget = (value: string | number, target: any) => flow(
    find(propEq('value', value)),
    prop('label')
  )(target)

  const getTagColor = (orderPriority: number) => {
    switch (orderPriority) {
      case 1: return 'error'
      case 2: return 'success'
      case 3: return 'warning'
      default: return 'info'
    }
  }

  return [
    {
      type: 'selection',
      disabled ({ runStatus }) {
        return runStatus === 1 || runStatus === 4
      }
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
      width: 80,
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
      render: ({ isShow, id }) => h(
        NButton,
        {
          text: true,
          style: {
            fontSize: '20px'
          },
          onClick: async () => {
            try {
              await changeIsShow(id, isShow)
              message.success('操作成功')
            } catch (e) {
              //
            }
          }
        },
        {
          default: () => h(
            NIcon,
            {
              component: isShow ? Eye : EyeOff,
            },
            { default: () => {} }
          )
        }
      )
    },
    {
      title: '配置名称',
      key: 'configName',
      // width: 200,
      align,
      ellipsisComponent,
      ellipsis
    },
    {
      title: '配置分类',
      key: 'configType',
      // width: 200,
      align,
      ellipsisComponent,
      ellipsis,
      render: ({ configType }) => findValueInTarget(configType, eventConfigTypeList.value)
    },
    {
      title: '创建人',
      key: 'createByName',
      // width: 100,
      align,
      ellipsisComponent,
      ellipsis,
    },
    {
      title: '权限',
      key: 'purview',
      width: 80,
      align,
      //ellipsisComponent,
      // ellipsis,
      render: ({ purview }) => purview === 1 ? '私有' : '公有'
    },
    {
      title: '创建日期',
      key: 'createTime',
      width: 200,
      align,
      //ellipsisComponent,
      // ellipsis,
    },
    {
      title: '备注信息',
      key: 'remark',
      // width: 100,
      align,
      ellipsisComponent,
      ellipsis,
    },
    {
      title: '状态',
      key: 'runStatus',
      width: 100,
      align,
      //ellipsisComponent,
      // ellipsis,
      render: ({ runStatus }) => {
        const getRunStatusType = (runStatus: number): 'default' | 'primary' | 'success' | 'info' | 'warning' | 'error' => {
          switch (runStatus) {
            case 1: return 'warning'
            case 2: return 'success'
            case 3: return 'error'
            case 4: return 'info'
            default: return 'default'
          }
        }
        const getRunStatusText = (runStatus: number): string => {
          switch (runStatus) {
            case 0: return '待执行'
            case 1: return '执行中'
            case 2: return '执行成功'
            case 3: return '执行失败'
            default: return '排队中'
          }
        }
        return h(
          NButton,
          {
            text: true,
            tag: 'span',
            type: getRunStatusType(runStatus)
          },
          {
            default: () => getRunStatusText(runStatus)
          }
        )
      }
    },
    {
      title: '操作',
      key: 'numbers',
      width: 200,
      // fixed: 'right',
      align,
      render: (rowData) => {
        return h(
          NSpace,
          { justify: 'start' },
          { default: () => [
            h(
              NTooltip,
              null,
              {
                trigger: () => h(
                  NButton,
                  {
                    text: true,
                    style: {
                      fontSize: '20px',
                    },
                    disabled: !(rowData.runStatus === 0 || rowData.runStatus === 3),
                    onClick: async () => {
                      try {
                        const runStatus = await updateSingle(rowData.id)
                        switch (runStatus === 0 || runStatus === 3) {
                          case true: {
                            await runTask(rowData.id)
                            message.success('操作成功')
                            break
                          }
                          default: {
                            message.error('执行状态已改变,操作失败')
                            break
                          }
                        }
                      } catch (e) {
                        //
                      }
                    }
                  },
                  {
                    default: () => h(
                      NIcon,
                      {
                        component: PlayCircleOutline,
                      },
                      {}
                    )
                  }
                ),
                default: () => '执行'
              }
            ),
            h(
              NTooltip,
              null,
              {
                trigger: () => h(
                  NButton,
                  {
                    text: true,
                    style: {
                      fontSize: '20px',
                    },
                    onClick: async () => {
                      try {
                        const runStatus = await updateSingle(rowData.id)
                        handleUpdateDrawer(
                          '修改配置',
                          getSettingInitialValue(rowData),
                          getFormInitialValue(rowData),
                          true,
                          (!(runStatus === 0 || runStatus === 3)),
                          rowData.id
                        )
                      } catch (e) {
                        //
                      }
                    }
                  },
                  {
                    default: () => h(
                      NIcon,
                      {
                        component: CalendarEdit20Filled,
                      },
                      {}
                    )
                  }
                ),
                default: () => '修改'
              }
            ),
            h(
              NTooltip,
              null,
              {
                trigger: () => h(
                  NButton,
                  {
                    text: true,
                    style: {
                      fontSize: '20px',
                    },
                    disabled: rowData.runStatus !== 2,
                    onClick: async () => {
                      try {
                        const runStatus = await updateSingle(rowData.id)
                        switch (runStatus === 2) {
                          case true: {
                            await eventConfigExport({ configId: rowData.id })
                            message.success('开始下载')
                            break
                          }
                          default: {
                            message.error('执行状态已改变,操作失败')
                            break
                          }
                        }
                      } catch (e) {
                        //
                      }
                    }
                  },
                  { default: () => h(
                      NIcon,
                      {
                        component: Download,
                      },
                      {}
                  )}
                ),
                default: () => '下载'
              }
            ),
            h(
              NTooltip,
              null,
              {
                trigger: () => h(
                  NPopconfirm,
                  {
                    onPositiveClick: async () => {
                      try {
                        const runStatus = await updateSingle(rowData.id)
                        switch (runStatus !== 1 && runStatus !== 4) {
                          case true: {
                            await handleSingleDelete(rowData.id)
                            message.success('操作成功')
                            break
                          }
                          default: {
                            message.error('执行状态已改变,操作失败')
                            break
                          }
                        }
                      } catch (e) {
                        //
                      }
                    }
                  },
                  {
                    trigger: () => h(
                      NButton,
                      {
                        text: true,
                        style: {
                          fontSize: '20px',
                        },
                        disabled: (rowData.runStatus === 1 || rowData.runStatus === 4)
                      },
                      {
                        default: () => h(
                          NIcon,
                          {
                            component: Trash,
                          },
                          {}
                        )
                      }
                    ),
                    default: () => '确定要删除吗?'
                  }
                ),
                default: () => '删除'
              }
            ),
            h(
              NTooltip,
              null,
              {
                trigger: () => h(
                  NButton,
                  {
                    text: true,
                    style: {
                      fontSize: '20px',
                    },
                    onClick: async () => {
                      handleUpdateDrawer(
                        '创建配置',
                        getSettingInitialValue(rowData),
                        getFormInitialValue(rowData),
                        true,
                        false,
                        null
                      )
                    }
                  },
                  {
                    default: () => h(
                      NIcon,
                      {
                        component: Duplicate,
                      },
                      {}
                    )
                  }
                ),
                default: () => '复制'
              }
            ),
            (rowData.runStatus === 1 || rowData.runStatus === 4) ? h(
              NTooltip,
              null,
              {
                trigger: () => h(
                  NButton,
                  {
                    text: true,
                    style: {
                      fontSize: '20px',
                    },
                    onClick: async () => {
                      try {
                        const runStatus = await updateSingle(rowData.id)
                        switch (runStatus === 1 || runStatus === 4) {
                          case true: {
                            await stopTask(rowData.id)
                            message.success('操作成功')
                            break
                          }
                          default: {
                            message.error('执行状态已改变,操作失败')
                            break
                          }
                        }
                      } catch (e) {
                        //
                      }
                    }
                  },
                  {
                    default: () => h(
                      NIcon,
                      {
                        component: PauseCircle,
                      },
                      {}
                    )
                  }
                ),
                default: () => '停止'
              }
            ) : '',
          ]}
        )
      }
    },
  ]
}

export const configStatus = [
  { label: '待执行', value: 0 },
  { label: '执行中', value: 1 },
  { label: '执行成功', value: 2 },
  { label: '执行失败', value: 3 },
  { label: '排队中', value: 4 }
]

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

export const priorityOption: Array<SelectOption | SelectGroupOption> = [
  {
    label: '公有',
    value: 2
  },
  {
    label: '私有',
    value: 1
  }
]

export const monitorOption: Array<SelectOption | SelectGroupOption> = [
  {
    label: '是',
    value: 1
  },
  {
    label: '否',
    value: 0
  }
]

export const eventConfigSettingInitialValue: eventConfigSettingInitialValueType = {
  configName: '',
  configType: null,
  remark: '',
  orderPriority: 1,
  purview: 1,
  isShow: null
}

export const eventConfigSettingRules: FormRules = {
  configName: [
    {
      required: true,
      message: '请输入配置名称',
      trigger: ['change', 'blur']
    },
  ],
  configType: [
    { type: 'array', required: true, message: '请选择配置类型', trigger: ['change', 'blur']  }
  ],
  // remark: [
  //   { required: true, message: '请输入备注信息', trigger: ['change', 'blur'] }
  // ],
  orderPriority: [
    { type: 'number', required: true, message: '请输入优先级', trigger: ['change', 'blur'] }
  ],
  purview: [
    { type: 'number', required: true, message: '请选择权限', trigger: ['change', 'blur'] }
  ],
  isShow: [
    { type: 'number', required: true, message: '请选择实时监测', trigger: ['change', 'blur'] }
  ]
}

export const eventConfigFormInitialValue: eventConfigFormInitialValueType = {
  sqldate: null,
  dataSource: 'dataSource1',
  weightBasis: 1,
  statisticsBasis: 1,
  actor1countrycode: [],
  actor1knowngroupcode: [],
  actor1religion1code: [],
  actor1religion2code: [],
  actor1ethniccode: [],
  actor1type1code: [],
  actor1type2code: [],
  actor1type3code: [],
  actor1name: '',
  actor1nameIsBig: 0,
  actor1geoType: [],
  actor1geoCountrycodeAndAdm1code: [],
  actor1geoFullname: '',
  actor1geoFullnameIsBig: 0,
  actor2countrycode: [],
  actor2knowngroupcode: [],
  actor2religion1code: [],
  actor2religion2code: [],
  actor2ethniccode: [],
  actor2type1code: [],
  actor2type2code: [],
  actor2type3code: [],
  actor2name: '',
  actor2nameIsBig: 0,
  actor2geoType: [],
  actor2geoCountrycodeAndAdm1code: [],
  actor2geoFullname: '',
  actor2geoFullnameIsBig: 0,
  quadclass: [],
  eventrootcode: [],
  eventbasecode: [],
  eventcode: [],
  actiongeoType: [],
  actiongeoCountrycodeAndAdm1code: [],
  actiongeoFullname: '',
  actiongeoFullnameIsBig: 0,
  sourceUrl: '',
  avgtone: [],
  goldsteinscale: [],
  isrootevent: null
}

export const eventConfigFormBaseRules: FormRules = {
  sqldate: {
    type: 'array',
    required: true,
    message: '请选择日期',
    trigger: ['change', 'blur']
  },
  dataSource: {
    required: true,
    message: '请选择数据源',
    trigger: ['input', 'blur']
  },
  weightBasis: {
    type: 'number',
    required: true,
    message: '请选择权重依据',
    trigger: ['input', 'blur']
  },
  statisticsBasis: {
    type: 'number',
    required: true,
    message: '请选择统计依据',
    trigger: ['input', 'blur']
  }
}

export const getEventConfigParam = (configSetting: any, configForm: any, geoCountryCodeList: TreeSelectOption[]) => {
  const joinArray = (target: Array<number | string>): number | string => {
    return join(',')(target)
  }

  const getGeoCountryCode = (target: string[]) => flow(
    filter((item) => find(propEq('key', item))(deepCopy(geoCountryCodeList))),
    join(',')
  )(deepCopy(target))

  const getGeoAdmCode = (target: string[]) => flow(
    map((item: any) => item.children),
    flatten,
    compact,
    filter(({ key }) => includes(key)(deepCopy(target))),
    map((item) => item.key),
    join(',')
  )(deepCopy(geoCountryCodeList))

  const getDateString = (timestamp: number) => {
    const date = new Date(timestamp)

    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2);
    const day = ('0' + date.getDate()).slice(-2);

    return (year + month + day);
  }

  return ({
    ...configSetting.formValue,
    ...configForm.formValue,
    configType: joinArray(configSetting.formValue.configType),
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
    actiongeoCountrycode  : getGeoCountryCode(configForm.formValue.actiongeoCountrycodeAndAdm1code),
    actiongeoAdm1code: getGeoAdmCode(configForm.formValue.actiongeoCountrycodeAndAdm1code),
    actiongeoType: joinArray(configForm.formValue.actiongeoType),
    eventbasecode: joinArray(configForm.formValue.eventbasecode),
    eventcode: joinArray(configForm.formValue.eventcode),
    eventrootcode: joinArray(configForm.formValue.eventrootcode),
    quadclass: joinArray(configForm.formValue.quadclass),
    beginSqldate: getDateString(configForm.formValue.sqldate[0]),
    endSqldate: getDateString(configForm.formValue.sqldate[1]),
    beginAvgtone: configForm.formValue.avgtone[0] || null,
    endAvgtone: configForm.formValue.avgtone[1] || null,
    beginGoldsteinscale: configForm.formValue.goldsteinscale[0] || null,
    endGoldsteinscale: configForm.formValue.goldsteinscale[1] || null,
  })
}
