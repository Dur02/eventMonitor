<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { onMounted, reactive, ref } from 'vue'
import type { FormInst, PaginationInfo, PaginationProps } from 'naive-ui'
import { NButton, NDataTable, NForm, NFormItem, NInput, NSelect, NSpin, NDrawer, NDrawerContent } from 'naive-ui'
import { useConfigStore } from '@/stores/config'
import { storeToRefs } from 'pinia'
import { configStatus } from '@/utils/constant/eventConfig'
import { getEventConfigList } from '@/api/config'
import { join, map } from 'lodash/fp'

const mapWithIndex = map.convert({ cap: false })

const configStore = useConfigStore()
const { eventConfigTypeList } = storeToRefs(configStore)
const { getAllEventConfigType } = configStore

const formRef: Ref<FormInst | null> = ref(null)
const tableLoading: Ref<boolean> = ref(false)
const dataRef = ref([])
const isDrawerShow = ref(false)

// 保存搜索表单的值
const formValue = ref({
  configName: '',
  configType: [],
  runStatus: [],
  createBy: ''
})

// 最后一次点击查询按钮后保存的值，避免在搜索表单修改后不点击查询按钮进行换页等操作
const searchValue = ref({
  configName: '',
  configType: '',
  runStatus: '',
  createBy: ''
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
        ...searchValue.value,
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
  const { configName, configType, runStatus, createBy } = formValue.value
  searchValue.value = {
    configName: configName,
    configType: join(',')(configType),
    runStatus: join(',')(runStatus),
    createBy,
  }
  await reloadTableData(1)
}

const handlePageChange = async (currentPage: number): Promise<void> => {
  await reloadTableData(currentPage)
}

onMounted(async () => {
  tableLoading.value = true
  try {
    await getAllEventConfigType()
    await reloadTableData(1)
  } catch (e) {
    //
  }
  tableLoading.value = false
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
          v-model:value="formValue.configName"
          clearable
        />
      </n-form-item>
      <n-form-item label="类型筛选">
        <n-select
          v-model:value="formValue.configType"
          :options="eventConfigTypeList"
          multiple
          max-tag-count="responsive"
          clearable
          style="width: 180px;"
        />
      </n-form-item>
      <n-form-item label="配置状态">
        <n-select
          v-model:value="formValue.runStatus"
          :options="configStatus"
          multiple
          max-tag-count="responsive"
          clearable
          style="width: 180px;"
        />
      </n-form-item>
      <n-form-item label="创建人" label-width="60">
        <n-input
          v-model:value="formValue.createBy"
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
          size="small"
          type="info"
        >
          新增配置
        </n-button>
      </n-form-item>
    </n-form>
    <n-data-table
      ref="table"
      class="table"
      size="small"
      :columns="[]"
      :data="dataRef"
      :pagination="paginationReactive"
      max-height="calc(100vh - 295px)"
      :single-line="false"
      remote
      border
      @update:page="handlePageChange"
    />
    <n-button @click="isDrawerShow = !isDrawerShow">
      左
    </n-button>
    <n-drawer
      v-model:show="isDrawerShow"
      :width="200"
      :height="200"
      placement="bottom"
      :trap-focus="false"
      :block-scroll="false"
      to="#config-drawer-target"
      :show-mask="false"
      :mask-closable="false"
    >
      <n-drawer-content title="斯通纳">
        《斯通纳》是美国作家约翰·威廉姆斯在 1965 年出版的小说。
      </n-drawer-content>
    </n-drawer>
  </n-spin>
</template>

<style scoped lang="scss">
.table {
  margin-top: 10px;
}
</style>