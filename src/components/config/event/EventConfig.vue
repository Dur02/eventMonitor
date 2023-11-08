<script setup lang="ts">
import type { Ref } from 'vue'
import type { FormInst } from 'naive-ui'
import type { eventConfigFormInitialValueType, searchFormType } from '@/types/components/config/event'
import { nextTick, onMounted, ref } from 'vue'
import {
  NButton,
  NDataTable,
  NForm,
  NFormItem,
  NInput,
  NSelect,
  NSpin,
  NPopconfirm
} from 'naive-ui'
import { storeToRefs } from 'pinia'
import { allColumns, configStatus } from '@/utils/constant/config/event/eventConfig'
import { eventConfigFormInitialValue, eventConfigSettingInitialValue } from '@/utils/constant/config/event/eventConfig'
import EventConfigDrawer from '@/components/drawer/EventConfigDrawer.vue'
import { useConstantStore } from '@/stores/constant'
import { useEventConfigStore } from '@/stores/eventConfig'
import deepCopy from '@/utils/function/deepcopy'
import type { eventConfigSettingInitialValueType } from '@/types/components/config/event'

const constantStore = useConstantStore()
const { eventConfigTypeList } = storeToRefs(constantStore)
const { getAllEventConfigType } = constantStore
const eventConfigStore = useEventConfigStore()
const { tableLoading, dataRef, checkedRowKeysRef, paginationReactive } = storeToRefs(eventConfigStore)
const { setTableLoading, changeLastSearchValue, setCheckedRowKeys, reloadTableData, handleMultipleDelete } = eventConfigStore

const formRef: Ref<FormInst | null> = ref(null)
const drawerShow: Ref<boolean>  = ref(false)
const drawerTitle: Ref<string> = ref('')
const formDisabled: Ref<boolean>  = ref(false)
const settingInitialValue: Ref<eventConfigSettingInitialValueType> = ref(eventConfigSettingInitialValue)
const formInitialValue: Ref<eventConfigFormInitialValueType> = ref(eventConfigFormInitialValue)

// 保存搜索表单的值
const searchFormValue: Ref<searchFormType> = ref({
  configName: '',
  configType: null,
  runStatus: null,
  createByName: ''
})

const handleSearch = async () => {
  changeLastSearchValue(deepCopy(searchFormValue.value))
  await reloadTableData(1)
}

const handleInputClear = () => {
  nextTick(async () => await handleSearch())
}

const handlePageChange = async (currentPage: number): Promise<void> => {
  await reloadTableData(currentPage)
}

const handleUpdateDrawer = (
  title: string,
  settingInitial: eventConfigSettingInitialValueType,
  formInitial: eventConfigFormInitialValueType,
  show: boolean,
  disabled: boolean
) => {
  drawerTitle.value = title
  settingInitialValue.value = settingInitial
  formInitialValue.value = formInitial
  drawerShow.value = show
  formDisabled.value = disabled
}

const handleOpenCreate = () => {
  handleUpdateDrawer(
    '创建配置',
    eventConfigSettingInitialValue,
    eventConfigFormInitialValue,
    true,
    false
  )
}

const updateDrawerShow = (bool: boolean): void => {
  drawerShow.value = bool
}

// 关闭drawer后重置初始值
const resetValue = () => {
  drawerTitle.value = ''
  settingInitialValue.value = eventConfigSettingInitialValue
  formInitialValue.value = eventConfigFormInitialValue
}

onMounted(async () => {
  try {
    setTableLoading(true)
    await getAllEventConfigType()
    setTableLoading(false)
    await reloadTableData(1)
  } catch (e) {
    setTableLoading(false)
  }
})
</script>

<template>
  <n-spin :show="tableLoading">
    <n-form
      ref="formRef"
      class=""
      inline
      :label-width="68"
      label-placement="left"
      size="small"
      :show-feedback="false"
    >
      <n-form-item label="配置名称">
        <n-input
          v-model:value="searchFormValue.configName"
          clearable
          @keyup.enter.prevent="handleSearch"
          @clear="handleInputClear"
        />
      </n-form-item>
      <n-form-item label="类型筛选">
        <n-select
          v-model:value="searchFormValue.configType"
          :options="eventConfigTypeList"
          placeholder="请选择"
          clearable
          style="width: 180px;"
          @update:value="handleSearch"
          @clear="handleInputClear"
        />
      </n-form-item>
      <n-form-item label="配置状态">
        <n-select
          v-model:value="searchFormValue.runStatus"
          :options="configStatus"
          placeholder="请选择"
          clearable
          style="width: 180px;"
          @update:value="handleSearch"
          @clear="handleInputClear"
        />
      </n-form-item>
      <n-form-item label="创建人" label-width="60">
        <n-input
          v-model:value="searchFormValue.createByName"
          clearable
          @keyup.enter.prevent="handleSearch"
          @clear="handleInputClear"
        />
      </n-form-item>
      <n-form-item>
        <n-button
          type="success"
          @click.prevent="handleSearch"
        >
          查询
        </n-button>
      </n-form-item>
      <n-form-item>
        <n-button
          type="info"
          @click="handleOpenCreate"
        >
          新增配置
        </n-button>
      </n-form-item>
      <n-form-item>
        <n-button
          type="info"
          @click="async () => {
            await reloadTableData(paginationReactive.page!)
          }"
        >
          刷新
        </n-button>
      </n-form-item>
      <n-form-item v-if="checkedRowKeysRef.length !== 0">
        <n-popconfirm
          @positive-click="handleMultipleDelete"
        >
          <template #trigger>
            <n-button
              type="error"
            >
              批量删除
            </n-button>
          </template>
          确定要删除吗?
        </n-popconfirm>
      </n-form-item>
    </n-form>
    <n-data-table
      ref="table"
      class="table"
      size="small"
      :checked-row-keys="checkedRowKeysRef"
      :columns="allColumns(handleUpdateDrawer)"
      :data="dataRef"
      :pagination="paginationReactive"
      :row-key="(rowData) => rowData.id"
      max-height="calc(100vh - 295px)"
      :single-line="false"
      remote
      border
      @update:page="handlePageChange"
      @update:checked-row-keys="setCheckedRowKeys"
    />
    <event-config-drawer
      :drawer-title="drawerTitle"
      :drawerShow="drawerShow"
      :settingInitialValue="settingInitialValue"
      :formInitialValue="formInitialValue"
      :formDisabled="formDisabled"
      @DrawerClose="updateDrawerShow"
      @AfterLeave="resetValue"
    />
  </n-spin>
</template>

<style scoped lang="scss">
.table {
  margin-top: 10px;
}
</style>