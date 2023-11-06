<script setup lang="ts">
import type { Ref } from 'vue'
import { ref } from 'vue'
import { storeToRefs } from 'pinia'
import type { FormInst } from 'naive-ui'
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
import {
  eventConfigSettingRules,
  formThemeOverrides,
  monitorOption,
  priorityOption
} from '@/utils/constant/config/event/eventConfig'
import { Menu as MenuIcon } from '@vicons/ionicons5'
import { useConstantStore } from '@/stores/constant'
import { renderOption } from '@/utils/function/renderOption'
import type {
  eventConfigSettingInitialValueType,
  eventConfigSettingProps
} from '@/types/components/config/event'
import deepCopy from '@/utils/function/deepcopy'

const props = defineProps<eventConfigSettingProps>()

const constantStore = useConstantStore()
const { eventConfigTypeList } = storeToRefs(constantStore)

const formRef: Ref<FormInst | null> = ref(null)
const formValue: Ref<eventConfigSettingInitialValueType> = ref(deepCopy(props.initialValue) as eventConfigSettingInitialValueType)

defineExpose({
  formRef,
  formValue
})
</script>

<template>
  <n-form
    ref="formRef"
    class="form"
    :model="formValue"
    :rules="eventConfigSettingRules"
    :label-width="70"
    label-placement='left'
    label-align='left'
    :theme-overrides="formThemeOverrides"
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
            clearable
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="2"
          label="配置类型"
          path="configType"
        >
          <n-select
            :options="eventConfigTypeList"
            v-model:value="formValue.configType"
            :render-option="renderOption"
            max-tag-count="responsive"
            multiple
            clearable
            style="width: 100%;"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="2"
          label="备注信息"
          path="remark"
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
            clearable
            style="width: 100%;"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="1"
          label="实时监测"
          path="isShow"
        >
          <n-select
            v-model:value="formValue.isShow"
            :options="monitorOption"
            clearable
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