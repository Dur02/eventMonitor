import type { GlobalThemeOverrides } from 'naive-ui'
import type { CardThemeOverrides, DrawerThemeOverrides, FormThemeOverrides } from '@/types/themeOverrides'

export const commonLightThemeOverrider: GlobalThemeOverrides = {
  common: {

  },
  Card: {
    paddingMedium: '10px 20px',
    colorModal: 'rgb(255, 255, 255)'
  },
  DataTable: {
    borderColor: '#d3d7d4'
  },
  Drawer: {
    color: 'rgb(255, 255, 255)',
  },
  Checkbox: {
    colorDisabled: '#e3e3e3'
  }
}

export const commonDarkThemeOverrider: GlobalThemeOverrides = {
  common: {

  },
  Card: {
    paddingMedium: '10px 20px',
    colorModal: 'rgb(24, 24, 28)'
  },
  DataTable: {

  },
  Drawer: {
    color: 'rgb(24, 24, 28)',
  },
  Checkbox: {
    colorDisabled: '#c2c2c3'
  }
}

// export const cardLightThemeOverrides: CardThemeOverrides = {
//   paddingMedium: '10px 20px',
//   colorModal: 'rgb(255, 255, 255)'
// }
//
// export const cardDarkThemeOverrides: CardThemeOverrides = {
//   paddingMedium: '10px 20px',
//   colorModal: 'rgb(24, 24, 28)'
// }
//
// export const drawerLightThemeOverrides: DrawerThemeOverrides = {
//   color: 'rgb(255, 255, 255)',
// }
//
// export const drawerDarkThemeOverrides: DrawerThemeOverrides = {
//   color: 'rgb(24, 24, 28)',
// }
//
// export const formThemeOverrides: FormThemeOverrides = {
//   blankHeightMedium: '10px'
// }