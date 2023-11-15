import type { CardThemeOverrides, DrawerThemeOverrides, FormThemeOverrides } from '@/types/themeOverrides';

export const cardLightThemeOverrides: CardThemeOverrides = {
  paddingMedium: '10px 20px',
  colorModal: 'rgb(255, 255, 255)'
}

export const cardDarkThemeOverrides: CardThemeOverrides = {
  paddingMedium: '10px 20px',
  colorModal: 'rgb(24, 24, 28)'
}

export const drawerLightThemeOverrides: DrawerThemeOverrides = {
  color: 'rgb(255, 255, 255)',
}

export const drawerDarkThemeOverrides: DrawerThemeOverrides = {
  color: 'rgb(24, 24, 28)',
}

export const formThemeOverrides: FormThemeOverrides = {
  blankHeightMedium: '10px'
}