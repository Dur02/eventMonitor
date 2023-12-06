<script setup lang="ts">
import type { Ref } from 'vue'
import { ref } from 'vue'
import type { FormInst } from 'naive-ui'
import { NForm, NFormItem, NIcon, NRadioGroup, NRadio, NInput, NSpace } from 'naive-ui'
import { eventConfigSaveRules } from '@/utils/constant/form/eventConfigSave'
import { Calendar } from '@vicons/ionicons5'

const formRef: Ref<FormInst | null> = ref(null)
const formValue = ref({
  isSave: 0,
  configName: null
})

const handleRadioChange = (value: number) => {
  if (value === 0) {
    formValue.value.configName = null
  }
}

defineExpose({
  formRef,
  formValue
})
</script>

<template>
  <n-form
    ref="formRef"
    class="form"
    :rules="eventConfigSaveRules"
    :model="formValue"
    size="medium"
    label-placement="left"
    label-align="left"
    label-width="80"
    :show-require-mark="false"
  >
    <n-form-item
      path="isSave"
      label-style="font-weight: 600;"
      label-width="110"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <calendar />
          </n-icon>
          <span>是否保存</span>
        </div>
      </template>
      <n-radio-group
        v-model:value="formValue.isSave"
        @update:value="handleRadioChange"
      >
        <n-space>
          <n-radio :value="1">
            保存
          </n-radio>
          <n-radio :value="0">
            不保存
          </n-radio>
        </n-space>
      </n-radio-group>
    </n-form-item>
    <n-form-item
      v-if="formValue.isSave === 1"
      path="configName"
      label-style="font-weight: 600;"
      label-width="110"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <calendar />
          </n-icon>
          <span>配置名称</span>
        </div>
      </template>
      <n-input
        v-model:value="formValue.configName"
        maxlength="30"
        show-count
        clearable
      />
    </n-form-item>
  </n-form>
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
}
</style>