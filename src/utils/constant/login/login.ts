import type { CheckBoxThemeOverrides, FormThemeOverrides, InputThemeOverrides } from '@/types/themeOverrides'
import type { FormRules } from 'naive-ui'

export const formThemeOverrides: FormThemeOverrides = {
  blankHeightMedium: '30px'
}

export const inputThemeOverrides: InputThemeOverrides = {
  colorFocus: 'rgba(0, 0, 0, 0.1)',
  colorFocusError: 'rgba(0, 0, 0, 0.1)',
  textColor: 'rgba(255, 255, 255, 1)'
}

export const checkBoxThemeOverrides: CheckBoxThemeOverrides = {
  textColor: 'rgba(255, 255, 255, 1)'
}

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