<script setup lang="ts">
import type { Ref, Component } from 'vue'
import type { searchFormType } from '@/types/components/config/common'
import type { eventConfigFormInitialValueType } from '@/types/components/form/event'
import { nextTick, ref } from 'vue'
import type { SelectOption } from 'naive-ui'
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
import { configStatus } from '@/utils/constant/config/common/search'
import { configSettingInitialValue } from '@/utils/constant/form/common/configSetting'
import deepCopy from '@/utils/function/deepcopy'
import type { configSettingInitialValueType } from '@/types/components/form/common/configSetting'
import { renderOption } from '@/utils/function/renderOption'

const props = defineProps<{
  configTypeList: SelectOption[],
  configStore: any,
  configDrawer: Component,
  formInitialValue: eventConfigFormInitialValueType,
  allColumns: Function
}>()

const { tableLoading, dataRef, checkedRowKeysRef, paginationReactive } = storeToRefs(props.configStore)
const {
  changeLastSearchValue,
  setCheckedRowKeys,
  reloadTableData,
  handleMultipleDelete: handleStoreDeleteInStore,
  runTask,
  updateSingle,
  changeIsShow,
  stopTask,
  handleSingleDelete
} = props.configStore

const searchBtnLoading: Ref<boolean> = ref(false)
const refreshBtnLoading: Ref<boolean> = ref(false)
const multipleDeleteBtnLoading: Ref<boolean> = ref(false)
const drawerShow: Ref<boolean>  = ref(false)
const drawerTitle: Ref<string> = ref('')
const settingDisabled: Ref<boolean>  = ref(false)
const formDisabled: Ref<boolean>  = ref(false)
const settingInitialValue: Ref<configSettingInitialValueType> = ref(configSettingInitialValue)
const formInitialValue: Ref<eventConfigFormInitialValueType> = ref(props.formInitialValue)
const configId: Ref<number | null> = ref(null)

// 保存搜索表单的值
const searchFormValue: Ref<searchFormType> = ref({
  configName: '',
  configType: null,
  runStatus: null,
  createByName: ''
})

const handleSearch = async () => {
  changeLastSearchValue(deepCopy(searchFormValue.value))
  searchBtnLoading.value = true
  await handlePageChange(1)
  searchBtnLoading.value = false
}

const handleRefresh = async () => {
  refreshBtnLoading.value = true
  await handlePageChange(paginationReactive.value.page!)
  refreshBtnLoading.value = false
}

const handleMultipleDelete = () => {
  multipleDeleteBtnLoading.value = true
  handleStoreDeleteInStore()
  multipleDeleteBtnLoading.value = false
}

const handleInputClear = () => {
  nextTick(async () => await handleSearch())
}

const handlePageChange = async (currentPage: number): Promise<void> => {
  await reloadTableData(currentPage)
}

const handleUpdateDrawer = (
  title: string,
  settingInitial: configSettingInitialValueType,
  formInitial: eventConfigFormInitialValueType,
  show: boolean,
  settingDisabledParam: boolean,
  formDisabledParam: boolean,
  id: number | null
) => {
  drawerTitle.value = title
  settingInitialValue.value = settingInitial
  formInitialValue.value = formInitial
  drawerShow.value = show
  settingDisabled.value = settingDisabledParam
  formDisabled.value = formDisabledParam
  configId.value = id
}

const handleOpenCreate = () => {
  handleUpdateDrawer(
    '创建配置',
    configSettingInitialValue,
    props.formInitialValue,
    true,
    false,
    false,
    null
  )
}

const updateDrawerShow = (bool: boolean): void => {
  drawerShow.value = bool
}

// 关闭drawer后重置初始值
const resetValue = () => {
  handleUpdateDrawer(
    '',
    configSettingInitialValue,
    props.formInitialValue,
    false,
    false,
    false,
    null
  )
}
</script>

<template>
  <n-spin :show="tableLoading">
    <n-form
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
          :options="configTypeList"
          placeholder="请选择"
          :render-option="renderOption"
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
          style="width: 100px;"
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
          :loading="searchBtnLoading"
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
          :loading="refreshBtnLoading"
          type="info"
          @click="handleRefresh"
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
              :loading="multipleDeleteBtnLoading"
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
      :columns="allColumns(handleUpdateDrawer, runTask, updateSingle, changeIsShow, stopTask, handleSingleDelete, configTypeList)"
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
    <component
      :is="configDrawer"
      :drawer-title="drawerTitle"
      :drawerShow="drawerShow"
      :settingInitialValue="settingInitialValue"
      :formInitialValue="formInitialValue"
      :settingDisabled="settingDisabled"
      :formDisabled="formDisabled"
      :configId="configId"
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