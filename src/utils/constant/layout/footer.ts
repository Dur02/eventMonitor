import type { LayoutFooterProps } from 'naive-ui'

type LayoutFooterThemeOverrides = NonNullable<LayoutFooterProps['themeOverrides']>

export const layoutFooterLightThemeOverrides: LayoutFooterThemeOverrides = {
  footerColor: 'rgb(255, 255, 255)'
}

export const layoutFooterDarkThemeOverrides: LayoutFooterThemeOverrides = {
  footerColor: 'rgb(24, 24, 28)'
}