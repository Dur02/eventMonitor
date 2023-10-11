<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { ref, reactive, onMounted } from 'vue'
import type {
  PaginationProps,
  DataTableColumns,
  PaginationInfo,
} from 'naive-ui'
import { NDataTable } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { getDisplayData } from '@/api/display'
// import { storeToRefs } from 'pinia';

interface rowData {
  column1: number,
  column2: number,
  column3: string
}

const columns: DataTableColumns<rowData> = [
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
// const { selectedBtn, footerBtn } = storeToRefs(footStore)

const dataRef: Ref<rowData[]> = ref([])
const loadingRef: Ref<boolean> = ref(true)
const columnsRef: Ref<DataTableColumns<rowData>> = ref(columns)
const paginationReactive: PaginationProps = reactive({
  page: 1,
  pageCount: 1,
  pageSize: 50,
  showSizePicker: true,
  showQuickJumper: true,
  pageSizes: [10, 20, 50, 100],
  prefix ({ itemCount }: PaginationInfo): VNodeChild {
    return `共${itemCount}条数据`
  }
})

const rowKey = (rowData: rowData) => {
  return rowData.column1
}

const handlePageChange = (currentPage: number) => {
  console.log(currentPage)
}

onMounted(() => {
  const { data } = getDisplayData()
  dataRef.value = data
  loadingRef.value = false
})

footStore.$subscribe((mutation, state) => {
  console.log('-------------')
  console.log(mutation)
  console.log(state)
  console.log('+++++++++++++++++')
})

// footStore.$onAction(({ name, store, args, after, onError }) => {
//   after(() => {
//     if
//   })
// })
</script>

<template>

  <n-data-table
    remote
    ref="table"
    :columns="columnsRef"
    :data="dataRef"
    :loading="loadingRef"
    :pagination="paginationReactive"
    :row-key="rowKey"
    @update:page="handlePageChange"
    style="height: calc(100vh - 160px);"
    flex-height
  />
</template>

<style scoped lang="scss">

</style>