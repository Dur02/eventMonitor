<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, watch } from 'vue'
import type { FormValidationError, ScrollbarInst } from 'naive-ui'
import { NButton, useMessage } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import deepCopy from '@/utils/function/deepcopy'
import EventConfigForm from '@/components/form/event/EventConfigForm.vue'
import { eventConfigFormInitialValue, getConfigFormValue, getConfigFormInitialValue } from '@/utils/constant/form/event/eventConfigForm'
import type { eventConfigFormInitialValueType } from '@/types/components/form/event'
import { flow, find, propEq } from 'lodash/fp'
import ConfigSave from '@/components/form/common/ConfigSave.vue'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useRoute } from 'vue-router'

const route: RouteLocationNormalizedLoaded = useRoute()

const message = useMessage()

const footerStore = useFooterStore()
const { selectedId, configType, configList, isSearchNow, paginationReactive } = storeToRefs(footerStore)
const { getConfigList, setSelectedId, instantQuery } = footerStore

const buttonLoading = ref(false)
const formDisabled = ref(false)
const scrollbarRef: Ref<ScrollbarInst | null> = ref(null)
const formValue: Ref<eventConfigFormInitialValueType> = ref(eventConfigFormInitialValue)
const configFormRef: Ref<any | null> = ref(null)
const configSaveRef: Ref<any | null> = ref(null)

const handleCreate = async (e: MouseEvent) => {
  e.preventDefault()
  configFormRef.value?.formRef.validate((formError: Array<FormValidationError>) => {
    configSaveRef.value?.formRef.validate(async (saveError: Array<FormValidationError>) => {
      if (!formError && !saveError) {
        buttonLoading.value = true
        try {
          await instantQuery({
            configType: configType.value,
            isSaveConfig: configSaveRef.value?.formValue.isSave,
            configName: configSaveRef.value?.formValue.configName,
            queryType: route.meta.queryType,
            ...getConfigFormValue(configFormRef.value)
          })
          setSelectedId(null)
          // && route.meta.requestFunc && route.meta.configType && route.meta.instantQuery
          if (configSaveRef.value?.formValue.isSave) {
            await getConfigList(
              route.meta.requestFunc as Function,
              route.meta.configType as string,
              route.meta.instantQuery as Function,
              1,
              paginationReactive.value.pageSize!
            )
          }
          message.success(configSaveRef.value?.formValue.isSave === 1 ? '保存成功' : '查询成功')
        } catch (e) {
          //
        }
        buttonLoading.value = false
      } else {
        message.error('表单填写错误')
        scrollbarRef.value?.scrollTo({ top: 0 })
      }
    })
  })
}

watch(
  () => [selectedId.value, isSearchNow.value],
  () => {
    switch (isSearchNow.value) {
      case true: {
        if (selectedId.value) {
          formDisabled.value = false
          formValue.value = deepCopy(eventConfigFormInitialValue)
          const end = new Date()
          const start = new Date()
          start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
          formValue.value.sqldate = [start.getTime(), end.getTime()]
        }
        break
      }
      default: {
        if (selectedId.value) {
          formDisabled.value = true
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
  <EventConfigForm
    ref="configFormRef"
    :initialValue="formValue"
    :configType="[configType]"
    :formDisabled="formDisabled"
  />
  <ConfigSave
    v-if="!formDisabled"
    ref="configSaveRef"
  />
  <div
    v-if="!formDisabled"
    style="text-align: center;"
  >
    <n-button
      type="info"
      @click="handleCreate"
      :loading="buttonLoading"
    >
      提交
    </n-button>
  </div>
</template>

<style scoped lang="scss">
</style>