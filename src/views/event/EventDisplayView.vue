<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { ref, reactive, onMounted, watch, toValue } from 'vue'
import type {
  PaginationProps,
  DataTableInst,
  DataTableColumns,
  PaginationInfo,
  SelectOption,
  SelectGroupOption
} from 'naive-ui'
import { NDataTable, NButton, NSpace, NIcon, NPopselect } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { getDisplayData } from '@/api/display'
import { storeToRefs } from 'pinia';
import { List } from '@vicons/ionicons5'
import { map, filter, includes } from 'lodash/fp'
import { useRoute } from 'vue-router'

interface rowDataType {
  column1: number,
  column2: number,
  column3: string
}

const allColumns: DataTableColumns<rowDataType> = [
  {
    title: '测试1',
    key: 'column1',
  },
  {
    title: '测试2',
    key: 'column2',
  },
  {
    title: '测试3',
    key: 'column3'
  }
]

const route = useRoute()
const footStore = useFooterStore()
const { selectedBtn, initialData } = storeToRefs(footStore)

const table: Ref<DataTableInst | null> = ref(null)
const columnsRef: Ref<DataTableColumns<rowDataType>> = ref(allColumns)
const selectedColumn: Ref<string[]> = ref(map(({ key }) => key)(allColumns))
const dataRef: Ref<rowDataType[]> = ref([])
const loadingRef: Ref<boolean> = ref(false)
const paginationReactive: PaginationProps = reactive({
  page: 1,
  // pageCount: 1,
  pageSize: 50,
  // pageSizes: [10, 20, 50, 100],
  itemCount: 0,
  // showSizePicker: true,
  showQuickJumper: true,
  suffix ({ itemCount }: PaginationInfo): VNodeChild {
    return `共${itemCount}条`
  }
})

const getSelectOption = (): Array<SelectOption | SelectGroupOption> => map(({ title, key }) => ({ label: title, value: key }))(allColumns)

const handlePageChange = (currentPage: number): void => {
  if (!loadingRef.value) {
    loadingRef.value = true
    paginationReactive.page = currentPage
    const { data, total } = getDisplayData(paginationReactive.page!, paginationReactive.pageSize!, selectedBtn.value, initialData.value)
    dataRef.value = data
    paginationReactive.itemCount = total
    loadingRef.value = false
  }
}

const handleSelect = (selectedArray: Array<string>) => {
  if (selectedArray.length !== 0) {
    selectedColumn.value = selectedArray
    columnsRef.value = filter(({ key }) => includes(key)(selectedArray))(allColumns)
  }
}

watch(
  () => initialData.value,
  () => {
    if (Object.keys(initialData.value).length !== 0 && selectedBtn.value && route.name === 'eventDisplay') {
      if (!loadingRef.value) {
        loadingRef.value = true
        paginationReactive.page = 1
        const { data, total } = getDisplayData(1, paginationReactive.pageSize!, selectedBtn.value, initialData.value)
        dataRef.value = data
        paginationReactive.itemCount = total
        loadingRef.value = false
      }
    }
  },
  {
    immediate: true
  }
)
</script>

<template>
  <div>
    <n-space justify="space-between" align="end" vertical>
      <n-popselect
        :value="selectedColumn"
        :options="getSelectOption()"
        multiple
        @update:value="handleSelect"
      >
        <n-button
          type="success"
          size="small"
          color="#6f6d85"
          circle
        >
          <template #icon>
            <n-icon>
              <list />
            </n-icon>
          </template>
        </n-button>
      </n-popselect>
      <n-data-table
        remote
        ref="table"
        :columns="columnsRef"
        :data="dataRef"
        :loading="loadingRef"
        :pagination="paginationReactive"
        :row-key="(rowData: rowDataType) => rowData.column1"
        max-height="calc(100vh - 280px)"
        @update:page="handlePageChange"
      />
    </n-space>
  </div>
</template>

<style scoped lang="scss">

</style>