import type { DrawerProps, CardProps } from 'naive-ui'

type DrawerThemeOverrides = NonNullable<DrawerProps['themeOverrides']>
type CardThemeOverrides = NonNullable<CardProps['themeOverrides']>

export const configStatus = [
  { label: '待执行', value: 0 },
  { label: '执行中', value: 1 },
  { label: '执行成功', value: 2 },
  { label: '执行失败', value: 3 },
  { label: '派对中', value: 4 }
]

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