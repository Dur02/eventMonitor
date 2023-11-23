import type { FormRules, SelectGroupOption, SelectOption } from 'naive-ui'
import type {
  eventConfigRowsType,
  eventConfigSettingInitialValueType
} from '@/types/components/config/event'
import { joinArray } from '@/utils/function/arrayToString'
import { splitString } from '@/utils/function/stringToArray'

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
  orderPriority: [
    { type: 'number', required: true, message: '请输入优先级', trigger: ['change', 'blur'] }
  ],
  purview: [
    { type: 'number', required: true, message: '请选择权限', trigger: ['change', 'blur'] }
  ],
  isMonitor: [
    { type: 'number', required: true, message: '请选择实时监测', trigger: ['change', 'blur'] }
  ]
}

export const eventConfigSettingInitialValue: eventConfigSettingInitialValueType = {
  configName: '',
  configType: null,
  remark: '',
  orderPriority: 1,
  purview: 1,
  isMonitor: 0
}

export const getConfigSettingInitialValue = (rowData: eventConfigRowsType) => ({
  configName: rowData.configName,
  configType: splitString(rowData.configType),
  remark: rowData.remark,
  orderPriority: rowData.orderPriority,
  purview: rowData.purview,
  isMonitor: rowData.isMonitor
})

export const getConfigSettingValue = (configSetting: any) => ({
  ...configSetting.formValue,
  configType: joinArray(configSetting.formValue.configType)
})