<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, watch } from 'vue'
import type { FormValidationError, ScrollbarInst } from 'naive-ui'
import { NButton, NCard, NScrollbar, useMessage } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import deepCopy from '@/utils/function/deepcopy'
import EventConfigForm from '@/components/form/EventConfigForm.vue'
import {
  cardLightThemeOverrides,
  eventConfigFormInitialValue,
  getConfigFormValue,
  getFormInitialValue
} from '@/utils/constant/config/event/eventConfig'
import type { eventConfigFormInitialValueType } from '@/types/components/config/event'
import { flow, find, propEq } from 'lodash/fp'
import { instantQuery } from '@/api/eventAnalyse'

const message = useMessage()

const footerStore = useFooterStore()
const { selectedId, configType, configList, isSearchNow } = storeToRefs(footerStore)

const disabled = ref(false)
const scrollBarRef: Ref<ScrollbarInst | null> = ref(null)
const formValue: Ref<eventConfigFormInitialValueType> = ref(eventConfigFormInitialValue)
const configFormRef: Ref<any | null> = ref(null)

const handleValidateClick = async (e: MouseEvent) => {
  e.preventDefault()
  configFormRef.value?.formRef.validate(async (formError: Array<FormValidationError>) => {
    if (!formError) {
      try {
        await instantQuery({
          configType: 'event_show_viz',
          ...getConfigFormValue(configFormRef.value)
        })
        message.success('创建成功')
      } catch (e) {
        console.log(e)
      }
    } else {
      message.error('表单填写错误')
      scrollBarRef.value?.scrollTo({ top: 0 })
    }
  })
}

watch(
  () => [selectedId.value, isSearchNow.value],
  () => {
    switch (isSearchNow.value) {
      case true: {
        disabled.value = false
        formValue.value = deepCopy(eventConfigFormInitialValue)
        const end = new Date()
        const start = new Date()
        start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
        formValue.value.sqldate = [start.getTime(), end.getTime()]
        break
      }
      default: {
        if (selectedId.value) {
          disabled.value = true
          formValue.value = flow(
            find(propEq('id', selectedId.value)),
            getFormInitialValue
          )(deepCopy(configList.value))
        }
        break
      }
    }
  },
  {
    immediate: true
  }
)

defineExpose({
  restoreValidation: () => {
    configFormRef.value?.formRef.restoreValidation()
  }
})
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
      <event-config-form
        ref="configFormRef"
        :initialValue="formValue"
        :configType="[configType]"
        :formDisabled="disabled"
      />
      <div
        v-if="!disabled"
        style="text-align: center;"
      >
        <n-button
          type="info"
          @click="handleValidateClick"
        >
          提交
        </n-button>
      </div>
    </n-card>
  </n-scrollbar>
</template>

<style scoped lang="scss">
.form {
  .icon-label {
    display: flex;
    align-items: center;

    .icon {
      padding-right: 7px;
    }
  }

  .btn-container {
    .space-box {
      margin: 0 auto;
    }
  }
}
</style>