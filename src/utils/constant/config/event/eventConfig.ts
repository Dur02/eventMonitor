import type { FormRules, SelectGroupOption, SelectOption, DataTableColumns, EllipsisProps, ConfigProviderProps } from 'naive-ui'
import type { eventConfigRowsType, eventConfigFormInitialValueType } from '@/types/components/config/event'
import type { CardThemeOverrides, FormThemeOverrides, DrawerThemeOverrides } from '@/types/themeOverrides'
import { h, computed } from 'vue'
import { NButton, NIcon, NSpace, NTag, NTooltip, NPopconfirm, createDiscreteApi, lightTheme, darkTheme } from 'naive-ui'
import { storeToRefs } from 'pinia'
import { Eye, EyeOff, PlayCircleOutline, Download, Trash, Duplicate, PauseCircle } from '@vicons/ionicons5'
import { find, flow, prop, propEq } from 'lodash/fp'
import { CalendarEdit20Filled } from '@vicons/fluent'
import { useConstantStore } from '@/stores/constant'
import { StopTaskRun } from '@/api/eventConfiguration'
import { useEventConfigStore } from '@/stores/eventConfig'
import { useSystemStore } from '@/stores/system'

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)
const constantStore = useConstantStore()
const { eventConfigTypeList } = storeToRefs(constantStore)
const eventConfigStore = useEventConfigStore()
const { paginationReactive, tableLoading } = storeToRefs(eventConfigStore)
const { reloadTableData, changeIsShow, runTask, handleSingleDelete } = eventConfigStore

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

export const allColumns: DataTableColumns<eventConfigRowsType> = [
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
          case 0: return 'info'
          case 1: return 'warning'
          case 2: return 'success'
          case 3: return 'error'
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
    render: ({ id, runStatus }) => {
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
                  disabled: !(runStatus === 0 || runStatus === 3),
                  onClick: async () => {
                    try {
                      await runTask(id)
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
                  onClick: () => {
                    console.log(id)
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
                  onClick: () => {
                    console.log(id)
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
                      await handleSingleDelete(id)
                      message.success('操作成功')
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
                      disabled: (runStatus === 1 || runStatus === 4)
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
                  onClick: () => {
                    console.log(id)
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
          (runStatus === 1 || runStatus === 4) ? h(
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
                    await StopTaskRun({ configId: id })
                    await reloadTableData(paginationReactive.value.page!)
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

export const initialFormValue: eventConfigFormInitialValueType = {
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
