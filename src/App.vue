<script setup lang="ts">
import {
  NConfigProvider,
  NScrollbar,
  NLoadingBarProvider,
  NMessageProvider,
  NNotificationProvider,
  NModal,
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
const { isLight, showLogoutDialog } = storeToRefs(systemStore)
const { setShowLogoutDialog } = systemStore

const handlePositiveClick = async () => {
  setShowLogoutDialog(false)
}
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
            <n-modal
              v-model:show="showLogoutDialog"
              preset="dialog"
              title="出错"
              content="登录状态已过期，需要重新登录"
              positiveText="确定"
              @after-leave="handlePositiveClick"
            />
          </n-notification-provider>
        </n-message-provider>
      </n-loading-bar-provider>
    </n-scrollbar>
  </n-config-provider>
</template>

<style scoped lang="scss">
</style>
