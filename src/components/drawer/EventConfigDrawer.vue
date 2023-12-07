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
import { getConfigSettingValue } from '@/utils/constant/form/common/configSetting'
import { getConfigFormValue } from '@/utils/constant/form/event/eventConfigForm'
import { storeToRefs } from 'pinia'
import ConfigSetting from '@/components/form/common/ConfigSetting.vue'
import EventConfigForm from '@/components/form/event/EventConfigForm.vue'
import type { configSettingInitialValueType } from '@/types/components/form/common/configSetting'
import type { eventConfigFormInitialValueType } from '@/types/components/form/event'
import { addEventConfig, updateEventConfig } from '@/api/eventConfiguration'
import { useEventConfigStore } from '@/stores/eventConfig'
import { useConstantStore } from '@/stores/constant'

const message = useMessage()

const constantStore = useConstantStore()
const { eventConfigTypeList } = storeToRefs(constantStore)
const eventConfigStore = useEventConfigStore()
const { paginationReactive } = storeToRefs(eventConfigStore)
const { reloadTableData } = eventConfigStore

const props = defineProps<{
  drawerTitle: string,
  drawerShow: boolean,
  settingInitialValue: configSettingInitialValueType,
  formInitialValue: eventConfigFormInitialValueType,
  settingDisabled: boolean,
  formDisabled: boolean,
  configId: number | null
}>()

const emits = defineEmits(['DrawerClose', 'AfterLeave'])

const scrollbarRef: Ref<ScrollbarInst | null> = ref(null)
const configSetting: any = ref(null)
const configForm: any = ref(null)
const configType: Ref<string[]> = ref([])
const btnLoading: Ref<boolean> = ref(false)

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
        btnLoading.value = true
        try {
          await addEventConfig({
            ...getConfigSettingValue(configSetting.value),
            ...getConfigFormValue(configForm.value)
          })
          await reloadTableData(paginationReactive.value.page!)
          message.success('创建成功')
          handleDrawerClose(false)
        } catch (e) {
          // console.log(e)
        }
        btnLoading.value = false
      } else {
        message.error('表单填写错误')
        scrollbarRef.value?.scrollTo({ top: 0 })
      }
    })
  })
}

const handleUpdate = () => {
  configSetting.value?.formRef.validate((settingErrors: Array<FormValidationError>) => {
    configForm.value?.formRef.validate(async (formError: Array<FormValidationError>) => {
      if (!settingErrors && !formError) {
        btnLoading.value = true
        try {
          await updateEventConfig({
            ...getConfigSettingValue(configSetting.value),
            ...getConfigFormValue(configForm.value),
            id: props.configId
          })
          await reloadTableData(paginationReactive.value.page!)
          message.success('修改成功')
          handleDrawerClose(false)
        } catch (e) {
          //
        }
        btnLoading.value = false
      } else {
        message.error('表单填写错误')
        scrollbarRef.value?.scrollTo({ top: 0 })
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
        ref="scrollbarRef"
        :style="{
          maxHeight: '440px',
          border: 'var(--n-header-border-bottom)',
          borderRadius: '3px',
        }"
      >
        <n-card
          :bordered="false"
        >
          <ConfigSetting
            ref="configSetting"
            :configList="eventConfigTypeList"
            :initialValue="settingInitialValue"
            :settingDisabled="settingDisabled"
            @selectConfigType="handleTypesChange"
          />
          <EventConfigForm
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
              :loading="btnLoading"
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
              :loading="btnLoading"
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