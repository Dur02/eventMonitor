import type { FormRules } from 'naive-ui'

export const rules: FormRules = {
  username: [
    { required: true, message: '请输入账号', trigger: ['input', 'blur'] }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: ['input', 'blur'] }
  ],
  code: [
    { required: true, message: '请输入验证码', trigger: ['input', 'blur'] }
  ]
}