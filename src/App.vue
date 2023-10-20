<script setup lang="ts">
import {
  NConfigProvider,
  NScrollbar,
  NLoadingBarProvider,
  NMessageProvider,
  NNotificationProvider,
  NGlobalStyle,
  zhCN,
  dateZhCN,
  lightTheme,
  darkTheme
} from 'naive-ui'
import { RouterView } from 'vue-router'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia'

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)
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
            <n-global-style />
          </n-notification-provider>
        </n-message-provider>
      </n-loading-bar-provider>
    </n-scrollbar>
  </n-config-provider>
</template>

<style scoped lang="scss">
</style>
