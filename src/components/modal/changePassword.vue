<script setup lang="ts">
import {
  type FormInst, type FormItemInst, type FormItemRule, type FormRules,
  NModal, NForm, NFormItem, NInput, NButton, NCol, NRow,
  useMessage
} from 'naive-ui'

import { ref } from 'vue'

interface ModelType {
  password: string | null
  reenteredPassword: string | null
}

const props = defineProps<{
  showModal: boolean
}>()

const emits = defineEmits<{
  ModalClose: [showModal: boolean]
}>()

const model = ref<ModelType>({
  password: null,
  reenteredPassword: null
})

const formRef = ref<FormInst | null>(null)
const rPasswordFormItemRef = ref<FormItemInst | null>(null)
const message = useMessage()

function validatePasswordStartWith (
  rule: FormItemRule,
  value: string
): boolean {
  return (
    !!model.value.password &&
    model.value.password.startsWith(value) &&
    model.value.password.length >= value.length
  )
}
function validatePasswordSame (rule: FormItemRule, value: string): boolean {
  return value === model.value.password
}

const rules: FormRules = {
  password: [
    {
      required: true,
      message: '请输入密码'
    }
  ],
  reenteredPassword: [
    {
      required: true,
      message: '请再次输入密码',
      trigger: ['input', 'blur']
    },
    {
      validator: validatePasswordStartWith,
      message: '两次密码输入不一致',
      trigger: 'input'
    },
    {
      validator: validatePasswordSame,
      message: '两次密码输入不一致',
      trigger: ['blur', 'password-input']
    }
  ]
}

const handleModalClose = (value: boolean): void => {
  emits("ModalClose", value)
}

const handleClearForm = (): void => {
  model.value = {
    password: null,
    reenteredPassword: null
  }
}

const handlePasswordInput = (): void => {
  if (model.value.reenteredPassword) {
    rPasswordFormItemRef.value?.validate({ trigger: 'password-input' })
  }
}

const handleValidateButtonClick = (e: MouseEvent): void => {
  formRef.value?.validate((errors) => {
    if (!errors) {
      message.success('修改成功')
      handleModalClose(false)
    }
  })
}
</script>

<template>
  <n-modal
    :show="showModal"
    class="custom-card"
    preset="card"
    title="修改密码"
    size="small"
    :segmented="{
      content: 'soft',
      footer: 'soft'
    }"
    style="width: 500px;"
    @update:show="handleModalClose"
    @after-leave="handleClearForm"
  >
    <n-form ref="formRef" :model="model" :rules="rules">
      <n-form-item
        path="password"
        label="密码"
      >
        <n-input
          v-model:value="model.password"
          type="password"
          @input="handlePasswordInput"
          @keydown.enter.prevent
        />
      </n-form-item>
      <n-form-item
        ref="rPasswordFormItemRef"
        first
        path="reenteredPassword"
        label="重复密码"
      >
        <n-input
          v-model:value="model.reenteredPassword"
          :disabled="!model.password"
          type="password"
          @keydown.enter.prevent
        />
      </n-form-item>
      <n-row :gutter="[0, 24]">
        <n-col :span="24">
          <div style="display: flex; justify-content: flex-end">
            <n-button
              round
              type="primary"
              @click.prevent="handleValidateButtonClick"
            >
              验证
            </n-button>
          </div>
        </n-col>
      </n-row>
    </n-form>
  </n-modal>
</template>

<style scoped lang="scss">

</style>