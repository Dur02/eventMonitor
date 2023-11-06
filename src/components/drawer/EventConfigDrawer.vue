<script setup lang="ts">
import { ref } from 'vue'
import type { FormValidationError } from 'naive-ui'
import {
  NDrawer,
  NDrawerContent,
  NCard,
  NScrollbar,
  NButton
} from 'naive-ui'
import {
  cardDarkThemeOverrides,
  cardLightThemeOverrides,
  drawerDarkThemeOverrides,
  drawerLightThemeOverrides
} from '@/utils/constant/config/event/eventConfig'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia'
import EventConfigSetting from '@/components/form/EventConfigSetting.vue'
import EventConfigForm from '@/components/form/EventConfigForm.vue'
import type { eventConfigSettingInitialValueType, eventConfigFormInitialValueType } from '@/types/components/config/event'

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)

defineProps<{
  drawerTitle: string,
  drawerShow: boolean,
  settingInitialValue: eventConfigSettingInitialValueType,
  formInitialValue: eventConfigFormInitialValueType
}>()

const emits = defineEmits(['DrawerClose', 'AfterLeave'])

const settingRef: any = ref(null)
const formRef: any = ref(null)

const handleDrawerClose = (value: boolean): void => {
  emits("DrawerClose", value)
}

const handleResetValue = (): void => {
  emits('AfterLeave')
}

const handleSubmit = () => {
  settingRef.value?.formRef.validate((settingErrors: Array<FormValidationError>) => {
    formRef.value?.formRef.validate((formError: Array<FormValidationError>) => {
      if (!settingErrors && !formError) {

      }
    })
  })
}
</script>

<template>
  <n-drawer
    :show="drawerShow"
    to="#config-drawer-target"
    :height="500"
    placement="bottom"
    :trap-focus="false"
    :block-scroll="false"
    :show-mask="false"
    :mask-closable="false"
    :theme-overrides="isLight ? drawerLightThemeOverrides : drawerDarkThemeOverrides"
    @update:show="handleDrawerClose"
    @after-leave="handleResetValue"
  >
    <n-drawer-content
      :native-scrollbar="true"
      :body-content-style="{
        overflow: 'hidden'
      }"
      closable
    >
      <template #header>
        {{ drawerTitle }}
      </template>
      <n-scrollbar
        class="scroll-box"
        :style="{
          maxHeight: '440px',
          border: 'var(--n-header-border-bottom)',
          borderRadius: '3px',
        }"
      >
        <n-card
          :bordered="false"
          :theme-overrides="isLight ? cardLightThemeOverrides : cardDarkThemeOverrides"
        >
          <event-config-setting
            ref="settingRef"
            :initial-value="settingInitialValue"
          />
          <event-config-form
            ref="formRef"
            :initial-value="formInitialValue"
          />
          <div style="text-align: center;">
            <n-button
              type="info"
              @click="handleSubmit"
            >
              提交
            </n-button>
          </div>
        </n-card>
      </n-scrollbar>
    </n-drawer-content>
  </n-drawer>
</template>

<style scoped lang="scss">

</style>