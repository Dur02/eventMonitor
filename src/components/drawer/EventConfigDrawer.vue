<script setup lang="ts">
import type { Ref } from 'vue'
import { ref } from 'vue'
import type { FormValidationError, ScrollbarInst } from 'naive-ui'
import {
  NDrawer,
  NDrawerContent,
  NCard,
  NScrollbar,
  NButton,
  useMessage
} from 'naive-ui'
import {
  cardDarkThemeOverrides,
  cardLightThemeOverrides,
  drawerDarkThemeOverrides,
  drawerLightThemeOverrides,
  getConfigSettingValue,
  getConfigFormValue
} from '@/utils/constant/config/event/eventConfig'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia'
import EventConfigSetting from '@/components/form/EventConfigSetting.vue'
import EventConfigForm from '@/components/form/EventConfigForm.vue'
import type { eventConfigSettingInitialValueType, eventConfigFormInitialValueType } from '@/types/components/config/event'
import { addEventConfig, updateEventConfig } from '@/api/eventConfiguration'
import { useEventConfigStore } from '@/stores/eventConfig'

const message = useMessage()

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)
const eventConfigStore = useEventConfigStore()
const { paginationReactive } = storeToRefs(eventConfigStore)
const { reloadTableData } = eventConfigStore

const props = defineProps<{
  drawerTitle: string,
  drawerShow: boolean,
  settingInitialValue: eventConfigSettingInitialValueType,
  formInitialValue: eventConfigFormInitialValueType,
  settingDisabled: boolean,
  formDisabled: boolean,
  configId: number | null
}>()

const emits = defineEmits(['DrawerClose', 'AfterLeave'])

const scrollBarRef: Ref<ScrollbarInst | null> = ref(null)
const configSetting: any = ref(null)
const configForm: any = ref(null)
const configType: Ref<string[]> = ref([])

const handleTypesChange = (selectedConfigType: string[]) => {
  configType.value = selectedConfigType
}

const handleDrawerClose = (value: boolean): void => {
  emits("DrawerClose", value)
}

const handleResetValue = (): void => {
  emits('AfterLeave')
}

const handleCreate = () => {
  configSetting.value?.formRef.validate((settingErrors: Array<FormValidationError>) => {
    configForm.value?.formRef.validate(async (formError: Array<FormValidationError>) => {
      if (!settingErrors && !formError) {
        try {
          await addEventConfig({
            ...getConfigSettingValue(configSetting.value),
            ...getConfigFormValue(configForm.value)
          })
          await reloadTableData(paginationReactive.value.page!)
          message.success('创建成功')
          handleDrawerClose(false)
        } catch (e) {
          console.log(e)
        }
      } else {
        message.error('表单填写错误')
        scrollBarRef.value?.scrollTo({ top: 0 })
      }
    })
  })
}

const handleUpdate = () => {
  configSetting.value?.formRef.validate((settingErrors: Array<FormValidationError>) => {
    configForm.value?.formRef.validate(async (formError: Array<FormValidationError>) => {
      if (!settingErrors && !formError) {
        try {
          await updateEventConfig({
            ...getConfigSettingValue(configSetting.value),
            ...getConfigFormValue(configForm.value)
          })
          await reloadTableData(paginationReactive.value.page!)
          message.success('修改成功')
          handleDrawerClose(false)
        } catch (e) {
          //
        }
      } else {
        message.error('表单填写错误')
        scrollBarRef.value?.scrollTo({ top: 0 })
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
        ref="scrollBarRef"
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
            ref="configSetting"
            :initialValue="settingInitialValue"
            :settingDisabled="settingDisabled"
            @selectConfigType="handleTypesChange"
          />
          <event-config-form
            ref="configForm"
            :initialValue="formInitialValue"
            :configType="configType"
            :formDisabled="formDisabled"
          />
          <div
            v-if="drawerTitle === '创建配置'"
            style="text-align: center;"
          >
            <n-button
              type="info"
              @click="handleCreate"
            >
              创建
            </n-button>
          </div>
          <div
            v-if="drawerTitle === '修改配置'"
            style="text-align: center;"
          >
            <n-button
              type="info"
              @click="handleUpdate"
            >
              更新
            </n-button>
          </div>
        </n-card>
      </n-scrollbar>
    </n-drawer-content>
  </n-drawer>
</template>

<style scoped lang="scss">

</style>