import type { DataTableColumns, EllipsisProps, ConfigProviderProps } from 'naive-ui'
import type {
  eventConfigRowsType,
  eventConfigFormInitialValueType,
  eventConfigSettingInitialValueType
} from '@/types/components/config/event'
import { h, computed } from 'vue'
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
  propEq
} from 'lodash/fp'
import { CalendarEdit20Filled } from '@vicons/fluent'
import { useConstantStore } from '@/stores/constant'
import { useEventConfigStore } from '@/stores/eventConfig'
import { useSystemStore } from '@/stores/system'
import { eventConfigExport } from '@/api/eventAnalyse'
import { eventConfigFormInitialValue, getConfigFormInitialValue } from '@/utils/constant/form/eventConfigForm'
import { eventConfigSettingInitialValue, getConfigSettingInitialValue } from '@/utils/constant/form/eventConfigSetting'

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

export const configStatus = [
  { label: '待执行', value: 0 },
  { label: '执行中', value: 1 },
  { label: '执行成功', value: 2 },
  { label: '执行失败', value: 3 },
  { label: '排队中', value: 4 }
]

export const allColumns = (
  handleUpdateDrawer: (
    title: string,
    settingInitial: eventConfigSettingInitialValueType,
    formInitial: eventConfigFormInitialValueType,
    show: boolean,
    settingDisabled: boolean,
    formDisabled: boolean,
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
                        handleUpdateDrawer(
                          '',
                          eventConfigSettingInitialValue,
                          eventConfigFormInitialValue,
                          false,
                          false,
                          false,
                          null
                        )
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
                          getConfigSettingInitialValue(rowData),
                          getConfigFormInitialValue(rowData),
                          true,
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
                        handleUpdateDrawer(
                          '',
                          eventConfigSettingInitialValue,
                          eventConfigFormInitialValue,
                          false,
                          false,
                          false,
                          null
                        )
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
                        getConfigSettingInitialValue(rowData),
                        getConfigFormInitialValue(rowData),
                        true,
                        false,
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



