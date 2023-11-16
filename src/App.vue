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
  darkTheme,
} from 'naive-ui'
import { commonLightThemeOverrider, commonDarkThemeOverrider } from '@/utils/themeOverrides/common'
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
    :theme-overrides="isLight ? commonLightThemeOverrider : commonDarkThemeOverrider"
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
