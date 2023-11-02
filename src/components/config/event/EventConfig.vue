<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { onMounted, reactive, ref } from 'vue'
import type { FormInst, PaginationInfo, PaginationProps } from 'naive-ui'
import {
  NButton,
  NDataTable,
  NForm,
  NFormItem,
  NInput,
  NSelect,
  NSpin
} from 'naive-ui'
import { useConfigStore } from '@/stores/config'
import { storeToRefs } from 'pinia'
import { allColumns, configStatus } from '@/utils/constant/config/event/eventConfig'
import { getEventConfigList } from '@/api/eventConfiguration'
import { map } from 'lodash/fp'
import { initialFormValue } from '@/utils/constant/config/event/eventConfig'
import EventConfigDrawer from '@/components/drawer/EventConfigDrawer.vue'

const mapWithIndex = map.convert({ cap: false })

const configStore = useConfigStore()
const { eventConfigTypeList } = storeToRefs(configStore)
const { getAllEventConfigType } = configStore

const formRef: Ref<FormInst | null> = ref(null)
const tableLoading: Ref<boolean> = ref(false)
const dataRef = ref([])
const initialValue = ref(initialFormValue)
const drawerShow = ref(false)
const drawerInfo = ref({
  title: '',
  btnText: ''
})

// 保存搜索表单的值
const searchFormValue = ref({
  createByName: undefined,
  configType: undefined,
  runStatus: undefined,
  createBy: undefined
})

// 最后一次点击查询按钮后保存的值，避免在搜索表单修改后不点击查询按钮进行换页等操作
const lastSearchValue = ref({
  createByName: undefined,
  configType: undefined,
  runStatus: undefined,
  createBy: undefined
})

const paginationReactive: PaginationProps = reactive({
  page: 1,
  // pageCount: 1,
  pageSize: 50,
  // pageSizes: [10, 20, 50, 100],
  itemCount: 2,
  // showSizePicker: true,
  showQuickJumper: true,
  suffix ({ itemCount }: PaginationInfo): VNodeChild {
    return `共${itemCount}条`
  }
})

const reloadTableData = async (page: number) => {
  if (!tableLoading.value) {
    tableLoading.value = true
    paginationReactive.page = page
    try {
      const { rows, total } = await getEventConfigList({
        ...lastSearchValue.value,
        pageNum: page,
        pageSize: paginationReactive.pageSize!
      })
      dataRef.value = mapWithIndex((item: any, index: number) => ({
        ...item,
        numbers: index + (page - 1) * paginationReactive.pageSize! + 1
      }))(rows)
      paginationReactive.itemCount = total
    } catch (e) {
      //
    }
    tableLoading.value = false
  }
}

const handleSearch = async (e: MouseEvent) => {
  e.preventDefault()
  const { createByName, configType, runStatus, createBy } = searchFormValue.value
  lastSearchValue.value = {
    createByName,
    configType,
    runStatus,
    createBy,
  }
  await reloadTableData(1)
}

const handlePageChange = async (currentPage: number): Promise<void> => {
  await reloadTableData(currentPage)
}

const handleOpenCreate = () => {
  drawerInfo.value.title = '创建配置'
  drawerInfo.value.btnText = '创建'
  initialValue.value = initialFormValue
  drawerShow.value = true
}

const updateDrawerShow = (bool: boolean): void => {
  drawerShow.value = bool
}

const resetValue = () => {
  drawerInfo.value.title = ''
  drawerInfo.value.btnText = ''
  initialValue.value = initialFormValue
}

onMounted(async () => {
  try {
    tableLoading.value = true
    await getAllEventConfigType()
    tableLoading.value = false
    await reloadTableData(1)
  } catch (e) {
    tableLoading.value = false
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
          v-model:value="searchFormValue.createByName"
          clearable
        />
      </n-form-item>
      <n-form-item label="类型筛选">
        <n-select
          v-model:value="searchFormValue.configType"
          :options="eventConfigTypeList"
          placeholder="请选择"
          clearable
          style="width: 180px;"
        />
      </n-form-item>
      <n-form-item label="配置状态">
        <n-select
          v-model:value="searchFormValue.runStatus"
          :options="configStatus"
          placeholder="请选择"
          clearable
          style="width: 180px;"
        />
      </n-form-item>
      <n-form-item label="创建人" label-width="60">
        <n-input
          v-model:value="searchFormValue.createBy"
          clearable
        />
      </n-form-item>
      <n-form-item>
        <n-button
          type="success"
          @click="handleSearch"
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
    </n-form>
    <n-data-table
      ref="table"
      class="table"
      size="small"
      :scroll-x="1600"
      :columns="allColumns"
      :data="dataRef"
      :pagination="paginationReactive"
      :row-key="(rowData) => rowData.id"
      max-height="calc(100vh - 295px)"
      :single-line="false"
      remote
      border
      @update:page="handlePageChange"
    />
    <event-config-drawer
      :drawerInfo="drawerInfo"
      :drawerShow="drawerShow"
      :initialValue="initialValue"
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