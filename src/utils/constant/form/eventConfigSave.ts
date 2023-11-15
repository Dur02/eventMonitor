import type { FormRules } from 'naive-ui'

export const eventConfigSaveRules: FormRules = {
  isSave: [
    {
      type: 'number',
      required: true,
      message: '请选择是否保存',
      trigger: ['change', 'blur']
    }
  ],
  configName: [
    {
      required: true,
      message: '请输入配置名称',
      trigger: ['input', 'blur']
    }
  ]
}