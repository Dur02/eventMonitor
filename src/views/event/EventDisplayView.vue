<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { ref, reactive, onMounted, watch, h, nextTick } from 'vue'
import type {
  PaginationProps,
  DataTableInst,
  DataTableColumns,
  PaginationInfo,
} from 'naive-ui'
import { NDataTable } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { getDisplayData } from '@/api/display'
import { storeToRefs } from 'pinia';
// import { storeToRefs } from 'pinia';

interface rowDataType {
  column1: number,
  column2: number,
  column3: string
}

const columns: DataTableColumns<rowDataType> = [
  {
    title: 'column1',
    key: 'column1',
  },
  {
    title: 'column2',
    key: 'column2',
  },
  {
    title: 'Column3',
    key: 'column3'
  }
]

const footStore = useFooterStore()
const { selectedBtn, currentRoute } = storeToRefs(footStore)

const table: Ref<DataTableInst | null> = ref(null)
const dataRef: Ref<rowDataType[]> = ref([])
const loadingRef: Ref<boolean> = ref(false)
const columnsRef: Ref<DataTableColumns<rowDataType>> = ref(columns)
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

const handlePageChange = (currentPage: number) => {
  if (!loadingRef.value) {
    paginationReactive.page = currentPage
    const { data, total } = getDisplayData(currentPage, paginationReactive.pageSize!, selectedBtn.value)
    dataRef.value = data
    paginationReactive.itemCount = total
    loadingRef.value = false
  }
}

onMounted(() => {
  if (!loadingRef.value && selectedBtn.value !== '') {
    loadingRef.value = true
    const { data, total } = getDisplayData(paginationReactive.page!, paginationReactive.pageSize!, selectedBtn.value)
    dataRef.value = data
    paginationReactive.itemCount = total
    loadingRef.value = false
  }
})

watch(
  () => selectedBtn.value,
  () => {
    if (currentRoute.value === 'eventDisplay') {
      if (!loadingRef.value) {
        loadingRef.value = true
        paginationReactive.page = 1
        const { data, total } = getDisplayData(1, paginationReactive.pageSize!, selectedBtn.value)
        dataRef.value = data
        paginationReactive.itemCount = total
        loadingRef.value = false
        table.value!.scrollTo({ top: 0 })
      }
    }
  }
)
</script>

<template>
  <n-data-table
    remote
    ref="table"
    :columns="columnsRef"
    :data="dataRef"
    :loading="loadingRef"
    :pagination="paginationReactive"
    :row-key="(rowData: rowDataType) => rowData.column1"
    max-height="calc(100vh - 250px)"
    @update:page="handlePageChange"
  />
</template>

<style scoped lang="scss">

</style>