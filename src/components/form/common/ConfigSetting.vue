<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, watch } from 'vue'
import type { FormInst, SelectOption } from 'naive-ui'
import {
  NForm,
  NFormItem,
  NFormItemGi,
  NInput,
  NIcon,
  NGrid,
  NSelect,
  NInputNumber
} from 'naive-ui'
import { priorityOption, monitorOption, configSettingRules } from '@/utils/constant/form/common/configSetting'
import { Menu as MenuIcon } from '@vicons/ionicons5'
import { renderOption } from '@/utils/function/renderOption'
import type { configSettingInitialValueType } from '@/types/components/form/common/configSetting'
import deepCopy from '@/utils/function/deepcopy'

const props = defineProps<{
  configList: SelectOption[],
  initialValue: configSettingInitialValueType,
  settingDisabled: boolean
}>()
const emits = defineEmits(['selectConfigType'])

const formRef: Ref<FormInst | null> = ref(null)
const formValue: Ref<configSettingInitialValueType> = ref(deepCopy(props.initialValue) as configSettingInitialValueType)

const handleSelectConfigType = (configType: string[]) => {
  emits('selectConfigType', configType)
}

defineExpose({
  formRef,
  formValue
})

watch(
  () => props.initialValue,
  () => {
    formRef.value?.restoreValidation()
    formValue.value = deepCopy(props.initialValue)
    emits('selectConfigType', deepCopy(formValue.value.configType))
  },
  {
    immediate: true
  }
)
</script>

<template>
  <n-form
    ref="formRef"
    class="form"
    :model="formValue"
    :rules="configSettingRules"
    :label-width="70"
    label-placement='left'
    label-align='left'
    :show-require-mark="false"
    inline
  >
    <n-form-item
      label-style="font-weight: 600;"
      :show-feedback="false"
      label-width="110"
      style="width: 100%;"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <menu-icon   />
          </n-icon>
          <span>基本信息</span>
        </div>
      </template>
      <n-grid
        cols="1 400:2 600:3 800:4 1000:6 1500:9"
        :x-gap="15"
        item-responsive
        responsive="self"
      >
        <n-form-item-gi
          span="2"
          label="配置名称"
          path="configName"
        >
          <n-input
            v-model:value="formValue.configName"
            :maxlength="30"
            show-count
            clearable
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="2"
          label="配置类型"
          path="configType"
        >
          <n-select
            :options="configList"
            v-model:value="formValue.configType"
            :disabled="settingDisabled"
            :render-option="renderOption"
            max-tag-count="responsive"
            multiple
            clearable
            filterable
            style="width: 100%;"
            @update:value="handleSelectConfigType"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="2"
          label="备注信息"
        >
          <n-input
            v-model:value="formValue.remark"
            clearable
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="1"
          label="优先级"
          path="orderPriority"
        >
          <n-input-number
            v-model:value="formValue.orderPriority"
            :show-button="false"
            :min="1"
            :max="10"
            :precision="0"
            clearable
            style="width: 100%;"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="1"
          label="权限"
          label-width="50"
          path="purview"
        >
          <n-select
            v-model:value="formValue.purview"
            :options="priorityOption"
            style="width: 100%;"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="1"
          label="实时监测"
          path="isMonitor"
        >
          <n-select
            v-model:value="formValue.isMonitor"
            :options="monitorOption"
            style="width: 100%;"
          />
        </n-form-item-gi>
      </n-grid>
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