<script setup lang="ts">
import { NCard, NScrollbar } from 'naive-ui'

</script>

<template>
  <n-scrollbar
    :style="{
      maxHeight: '440px',
      border: '1px solid var(--n-border-color)',
      borderRadius: '3px',
    }"
  >
    <n-card
      :bordered="false"
    >
      <slot></slot>
    </n-card>
  </n-scrollbar>
</template>

<style scoped lang="scss">

</style>