<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { ref, reactive, onMounted } from 'vue'
import type {
  PaginationProps,
  DataTableColumns,
  DataTableBaseColumn,
  DataTableSortState,
  DataTableFilterState,
  PaginationInfo,
} from 'naive-ui'
import { NDataTable } from 'naive-ui'
import type { FilterOptionValue, SortOrder } from 'naive-ui/es/data-table/src/interface'

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

const dataRef: Ref<rowData[]> = ref([])
const loadingRef: Ref<boolean> = ref(true)
const columnsRef: Ref<DataTableColumns<rowData>> = ref(columns)
const column1Reactive: DataTableBaseColumn<rowData> = reactive(column1)
const column2Reactive: DataTableBaseColumn<rowData> = reactive(column2)
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

const mockTableData: rowData[] = Array.apply(null, { length: 987 }).map((_: unknown, index: number): rowData => {
  return {
    column1: index,
    column2: (index % 2) + 1,
    column3: 'a' + index
  }
})

function query (page: number, pageSize: number = 10, order: SortOrder, filterValues: FilterOptionValue[] = []): Promise<queryResultType> {
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
      1000
    )
  })
}

const rowKey = (rowData: rowData) => {
  return rowData.column1
}

const handleSorterChange = (sorter: DataTableSortState | null) => {
  if (!sorter || sorter.columnKey === 'column1') {
    if (!loadingRef.value) {
      loadingRef.value = true
      query(
        paginationReactive.page as number,
        paginationReactive.pageSize,
        !sorter ? false : sorter.order,
        column2Reactive.filterOptionValues as FilterOptionValue[]
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

const handleFiltersChange = (filters: DataTableFilterState) => {
  if (!loadingRef.value) {
    loadingRef.value = true
    const filterValues = filters.column2
    query(
      <number> paginationReactive.page,
      paginationReactive.pageSize,
      column1Reactive.sortOrder as SortOrder,
      filterValues as FilterOptionValue[]
    ).then((data: queryResultType) => {
      column2Reactive.filterOptionValues = filterValues as FilterOptionValue[]
      dataRef.value = data.data
      paginationReactive.pageCount = data.pageCount
      paginationReactive.itemCount = data.total
      loadingRef.value = false
    })
  }
}

const handlePageChange = (currentPage: number) => {
  if (!loadingRef.value) {
    loadingRef.value = true
    query(
      currentPage,
      paginationReactive.pageSize,
      column1Reactive.sortOrder as SortOrder,
      column2Reactive.filterOptionValues as FilterOptionValue[]
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
    paginationReactive.page as number,
    paginationReactive.pageSize,
    column1Reactive.sortOrder as SortOrder,
    column2Reactive.filterOptionValues as FilterOptionValue[]
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
    style="height: calc(100vh - 110px);"
    flex-height
    virtual-scroll
  />
</template>

<style scoped lang="scss">

</style>