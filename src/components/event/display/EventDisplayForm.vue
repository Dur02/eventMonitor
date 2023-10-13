<script setup lang="ts">
import { ref, onMounted } from 'vue'
import type { FormInst } from 'naive-ui'
import { NForm, NFormItem, NInput, NButton, NCard, NScrollbar } from 'naive-ui'

const props = defineProps({
  selectedBtn: String
})

const formRef = ref<FormInst | null>(null)
const formValue = ref({
  user: {
    name: '',
    age: ''
  },
  phone: ''
})

const rules = {
  user: {
    name: {
      required: true,
      message: '请输入姓名',
      trigger: 'blur'
    },
    age: {
      required: true,
      message: '请输入年龄',
      trigger: ['input', 'blur']
    }
  },
  phone: {
    required: true,
    message: '请输入电话号码',
    trigger: ['input']
  }
}

const handleValidateClick =  (e: MouseEvent) => {
  e.preventDefault()
  formRef.value?.validate((errors) => {
    if (!errors) {
      //
    }
  })
}

onMounted(() => {
  // console.log('123')
})
</script>

<template>
  <n-scrollbar
    :style="{
      maxHeight: '440px',
      border: '1px solid var(--n-border-color)',
      borderRadius: '3px'
    }"
  >
    <n-card :bordered="false">
      <n-form
        ref="formRef"
        :label-width="80"
        :model="formValue"
        :rules="rules"
        size="medium"
      >
        <n-form-item label="姓名" path="user.name">
          <n-input v-model:value="formValue.user.name" placeholder="输入姓名" />
        </n-form-item>
        <n-form-item label="年龄" path="user.age">
          <n-input v-model:value="formValue.user.age" placeholder="输入年龄" />
        </n-form-item>
        <n-form-item label="电话号码" path="phone">
          <n-input v-model:value="formValue.phone" placeholder="电话号码" />
        </n-form-item>
        <n-form-item label="姓名" path="user.name">
          <n-input v-model:value="formValue.user.name" placeholder="输入姓名" />
        </n-form-item>
        <n-form-item label="姓名" path="user.name">
          <n-input v-model:value="formValue.user.name" placeholder="输入姓名" />
        </n-form-item>
        <n-form-item>
          <n-button attr-type="button" @click="handleValidateClick">
            验证
          </n-button>
        </n-form-item>
      </n-form>
    </n-card>
  </n-scrollbar>
</template>

<style scoped lang="scss">

</style>