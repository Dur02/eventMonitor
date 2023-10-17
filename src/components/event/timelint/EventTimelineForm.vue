<script setup lang="ts">
import { ref } from 'vue'
import type { FormInst } from 'naive-ui'

const formValue = ref({})
const formRef = ref<FormInst | null>(null)

defineExpose({
  setFormValue: (newValue: any) => {
    formValue.value = newValue
  },
  resetFormValue: () => {
    formValue.value = {}
  },
  restoreValidation: () => {
    formRef.value?.restoreValidation()
  }
})
</script>

<template>
  <p>123456</p>
</template>

<style scoped lang="scss">
.form-container {
  width: 100%;
  height: 400px;
}
</style>