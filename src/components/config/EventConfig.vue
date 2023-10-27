<script setup lang="ts">
import { onMounted } from 'vue'
import { NButton, NForm, NFormItem, NInput, NSpace, NSelect } from 'naive-ui'
import { useConfigStore } from '@/stores/config'
import { storeToRefs } from 'pinia'
import { configStatus } from '@/utils/constant/eventConfig'

const configStore = useConfigStore()
const { eventConfigTypeList } = storeToRefs(configStore)
const { getAllEventConfigType } = configStore

onMounted(() => {
  getAllEventConfigType()
})
</script>

<template>
  <n-space justify="space-between" align="baseline">
    <n-button
      size="small"
      type="info"
    >
      新增配置
    </n-button>
    <n-form
      ref="formRef"
      inline
      :label-width="80"
      label-placement="left"
      size="small"
      :show-feedback="false"
    >
      <n-form-item label="配置名称" path="user.name">
        <n-input
          placeholder="请输入"
        />
      </n-form-item>
      <n-form-item label="类型筛选" path="user.age">
        <n-select
          :options="eventConfigTypeList"
          clearable
        />
      </n-form-item>
      <n-form-item label="配置状态" path="phone">
        <n-select
          :options="configStatus"
          clearable
        />
      </n-form-item>
      <n-form-item label="创建人" path="phone">
        <n-input
          placeholder="请输入"
        />
      </n-form-item>
      <n-form-item>
        <n-button
          attr-type="button"
          type="success"
        >
          查询
        </n-button>
      </n-form-item>
    </n-form>
  </n-space>
</template>

<style scoped lang="scss">

</style>