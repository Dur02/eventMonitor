import type { GlobalThemeOverrides } from 'naive-ui'

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
  },
  Layout: {
    footerColor: 'rgb(255, 255, 255)'
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
  },
  Layout: {
    footerColor: 'rgb(24, 24, 28)'
  }
}