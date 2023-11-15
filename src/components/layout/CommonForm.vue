<script setup lang="ts">
import { NCard, NScrollbar } from 'naive-ui'
import { cardLightThemeOverrides } from '@/utils/themeOverrides/common'

</script>

<template>
  <n-scrollbar
    ref="scrollBarRef"
    :style="{
      maxHeight: '440px',
      border: '1px solid var(--n-border-color)',
      borderRadius: '3px',
    }"
  >
    <n-card
      :bordered="false"
      :theme-overrides="cardLightThemeOverrides"
    >
      <slot></slot>
    </n-card>
  </n-scrollbar>
</template>

<style scoped lang="scss">

</style>