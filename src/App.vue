<script setup lang="ts">
import {
  NConfigProvider,
  NScrollbar,
  NLoadingBarProvider,
  NMessageProvider,
  NNotificationProvider,
  zhCN,
  dateZhCN,
  lightTheme,
  darkTheme
} from 'naive-ui'
import { RouterView } from 'vue-router'
import { useThemeStore } from '@/stores/theme'
import { storeToRefs } from 'pinia'

const themeStore = useThemeStore()
const { isLight } = storeToRefs(themeStore)
</script>

<template>
  <n-config-provider
    :locale="zhCN"
    :date-locale="dateZhCN"
    :theme="isLight ? lightTheme : darkTheme"
  >
    <n-scrollbar style="max-height: 100vh;">
      <n-loading-bar-provider>
        <n-message-provider>
          <n-notification-provider>
            <RouterView />
          </n-notification-provider>
        </n-message-provider>
      </n-loading-bar-provider>
    </n-scrollbar>
  </n-config-provider>
</template>

<style scoped lang="scss">
</style>
