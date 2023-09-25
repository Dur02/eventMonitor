<script setup lang="ts">
import {
  type Ref,
  ref, reactive, onMounted
} from 'vue'
import {
  type PaginationProps, type DataTableColumns, type DataTableBaseColumn,
  NDataTable
} from 'naive-ui'
// import { type TableBaseColumn } from 'naive-ui/es/data-table/src/interface';

interface rowData {
  column1: number,
  column2: number,
  column3: string
}

interface queryResultType {
  pageCount: number,
  data: rowData[],
  total: number
}

const column1: DataTableBaseColumn<rowData> = {
  title: 'column1',
  key: 'column1',
  sorter: true,
  sortOrder: false
}

const column2: DataTableBaseColumn<rowData> = {
  title: 'column2',
  key: 'column2',
  filter: true,
  filterOptionValues: [],
  filterOptions: [
    {
      label: 'Value1',
      value: 1
    },
    {
      label: 'Value2',
      value: 2
    }
  ]
}

const columns: DataTableColumns<rowData> = [
  column1,
  column2,
  {
    title: 'Column3',
    key: 'column3'
  }
]

const dataRef = ref([])
const loadingRef = ref(true)
const columnsRef: Ref<DataTableColumns<rowData>> = ref(columns)
const column1Reactive: DataTableBaseColumn<rowData> = reactive(column1)
const column2Reactive: DataTableBaseColumn<rowData> = reactive(column2)
const paginationReactive: false | PaginationProps = reactive({
  page: 1,
  pageCount: 1,
  pageSize: 50,
  prefix ({ itemCount }) {
    return `Total is ${itemCount}.`
  }
})

const mockTableData: rowData[] = Array.apply(
  null,
  { length: 987 }).map((_: unknown, index: number): rowData => {
    return {
      column1: index,
      column2: (index % 2) + 1,
      column3: 'a' + index
    }
  }
)

function query (page: number, pageSize: number = 10, order: string | boolean = 'ascend', filterValues: number[] = []) {
  return new Promise((resolve) => {
    const copiedData = mockTableData.map((v) => v)
    const orderedData = order === 'descend' ? copiedData.reverse() : copiedData
    const filteredData = filterValues.length
      ? orderedData.filter((row) => filterValues.includes(row.column2))
      : orderedData
    const pagedData = filteredData.slice((page - 1) * pageSize, page * pageSize)
    const total = filteredData.length
    const pageCount = Math.ceil(filteredData.length / pageSize)
    setTimeout(
      () =>
        resolve({
          pageCount,
          data: pagedData,
          total
        }),
      1500
    )
  })
}

const rowKey = (rowData) => {
  return rowData.column1
}

const handleSorterChange = (sorter) => {
  if (!sorter || sorter.columnKey === 'column1') {
    if (!loadingRef.value) {
      loadingRef.value = true
      query(
        paginationReactive.page,
        paginationReactive.pageSize,
        !sorter ? false : sorter.order,
        column2Reactive.filterOptionValues as number[]
      ).then((data: queryResultType) => {
        column1Reactive.sortOrder = !sorter ? false : sorter.order
        dataRef.value = data.data
        paginationReactive.pageCount = data.pageCount
        paginationReactive.itemCount = data.total
        loadingRef.value = false
      })
    }
  }
}

const handleFiltersChange = (filters) => {
  if (!loadingRef.value) {
    loadingRef.value = true
    const filterValues = filters.column2 || []
    query(
      paginationReactive.page,
      paginationReactive.pageSize,
      column1Reactive.sortOrder,
      filterValues as number[]
    ).then((data: queryResultType) => {
      column2Reactive.filterOptionValues = filterValues
      dataRef.value = data.data
      paginationReactive.pageCount = data.pageCount
      paginationReactive.itemCount = data.total
      loadingRef.value = false
    })
  }
}

const handlePageChange = (currentPage) => {
  if (!loadingRef.value) {
    loadingRef.value = true
    query(
      currentPage,
      paginationReactive.pageSize,
      column1Reactive.sortOrder,
      column2Reactive.filterOptionValues as number[]
    ).then((data: queryResultType) => {
      dataRef.value = data.data
      paginationReactive.page = currentPage
      paginationReactive.pageCount = data.pageCount
      paginationReactive.itemCount = data.total
      loadingRef.value = false
    })
  }
}

onMounted(() => {
  query(
    paginationReactive.page,
    paginationReactive.pageSize,
    column1Reactive.sortOrder,
    column2Reactive.filterOptionValues as number[]
  ).then((data: queryResultType) => {
    dataRef.value = data.data
    paginationReactive.pageCount = data.pageCount
    paginationReactive.itemCount = data.total
    loadingRef.value = false
  })
})
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
    @update:sorter="handleSorterChange"
    @update:filters="handleFiltersChange"
    @update:page="handlePageChange"
  />
</template>

<style scoped lang="scss">

</style>