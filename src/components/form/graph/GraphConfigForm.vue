<script setup lang="ts">
import {
  NForm,
  NFormItem,
  NFormItemGi,
  NInput,
  NInputNumber,
  NDatePicker,
  NIcon,
  NRadioGroup,
  NRadio,
  NSpace,
  NGrid,
  NGi,
  NSelect,
  NCheckbox,
  NTreeSelect
} from 'naive-ui'
import { eventConfigFormRules } from '@/utils/constant/form/eventConfigForm'
import type { Ref } from 'vue'
import { onMounted, ref } from 'vue'
import deepCopy from '@/utils/function/deepcopy'

const props = defineProps<{
  initialValue: any,
  configType: string[] | null,
  formDisabled: boolean
}>()

const formValue: Ref<never> = ref(deepCopy(props.initialValue))

onMounted(() => {
  console.log(props)
})
</script>

<template>
  <n-form
    ref="formRef"
    class="form"
    :disabled="formDisabled"
    :rules="eventConfigFormRules"
    :model="formValue"
    size="medium"
    label-placement="left"
    label-align="left"
    label-width="80"
    :show-require-mark="false"
  >
    <pre>{{ props }}</pre>
  </n-form>
</template>

<style scoped lang="scss">

</style>