import type { GlobalThemeOverrides } from 'naive-ui'
import type { CardThemeOverrides, DrawerThemeOverrides, FormThemeOverrides } from '@/types/themeOverrides'

export const commonLightThemeOverrider: GlobalThemeOverrides = {
  common: {

  },
  Card: {
    paddingMedium: '10px 20px',
    colorModal: 'rgb(255, 255, 255)'
  },
  Drawer: {
    color: 'rgb(255, 255, 255)',
  },
  // Form: {
  //   blankHeightMedium: '10px'
  // },
  Layout: {
    colorEmbedded: '#f5f7f9'
  }
}

export const commonDarkThemeOverrider: GlobalThemeOverrides = {
  common: {

  },
  Card: {
    paddingMedium: '10px 20px',
    colorModal: 'rgb(24, 24, 28)'
  },
  Drawer: {
    color: 'rgb(24, 24, 28)',
  },
  // Form: {
  //   blankHeightMedium: '10px'
  // },
  Layout: {
    // colorEmbedded: '#f5f7f9'
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