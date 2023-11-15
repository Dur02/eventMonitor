<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, watch } from 'vue'
import type { FormValidationError, ScrollbarInst } from 'naive-ui'
import { NButton, useMessage } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import deepCopy from '@/utils/function/deepcopy'
import EventConfigForm from '@/components/form/EventConfigForm.vue'
import { eventConfigFormInitialValue, getConfigFormValue, getConfigFormInitialValue } from '@/utils/constant/form/eventConfigForm'
import type { eventConfigFormInitialValueType } from '@/types/components/config/event'
import { flow, find, propEq } from 'lodash/fp'
import EventConfigSave from '@/components/form/EventConfigSave.vue'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useRoute } from 'vue-router'

const route: RouteLocationNormalizedLoaded = useRoute()

const message = useMessage()

const footerStore = useFooterStore()
const { selectedId, configType, configList, isSearchNow, paginationReactive } = storeToRefs(footerStore)
const { getConfigList, instantQuery } = footerStore

const disabled = ref(false)
const scrollBarRef: Ref<ScrollbarInst | null> = ref(null)
const formValue: Ref<eventConfigFormInitialValueType> = ref(eventConfigFormInitialValue)
const configFormRef: Ref<any | null> = ref(null)
const configSaveRef: Ref<any | null> = ref(null)

const handleCreate = async (e: MouseEvent) => {
  e.preventDefault()
  configFormRef.value?.formRef.validate((formError: Array<FormValidationError>) => {
    configSaveRef.value?.formRef.validate(async (saveError: Array<FormValidationError>) => {
      if (!formError && !saveError) {
        try {
          await instantQuery({
            configType: configType.value,
            isSaveConfig: configSaveRef.value?.formValue.isSave,
            configName: configSaveRef.value?.formValue.configName,
            ...getConfigFormValue(configFormRef.value)
          })
          if (configSaveRef.value?.formValue.isSave) {
            if (route.meta.requestFunc && route.meta.type && route.meta.instantQuery) {
              try {
                await getConfigList(
                  route.meta.requestFunc as Function,
                  route.meta.type as string,
                  route.meta.instantQuery as Function,
                  1,
                  paginationReactive.value.pageSize!
                )
              } catch (e) {
                //
              }
            }
          }
          message.success('查询成功')
        } catch (e) {
          // console.log(e)
        }
      } else {
        message.error('表单填写错误')
        scrollBarRef.value?.scrollTo({ top: 0 })
      }
    })
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
            getConfigFormInitialValue
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
  <event-config-form
    ref="configFormRef"
    :initialValue="formValue"
    :configType="[configType]"
    :formDisabled="disabled"
  />
  <event-config-save
    v-if="!disabled"
    ref="configSaveRef"
  />
  <div
    v-if="!disabled"
    style="text-align: center;"
  >
    <n-button
      type="info"
      @click="handleCreate"
    >
      提交
    </n-button>
  </div>
</template>

<style scoped lang="scss">
</style>