<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { ref, reactive, watch } from 'vue'
import type {
  PaginationProps,
  DataTableInst,
  DataTableColumns,
  SelectOption,
  SelectGroupOption
} from 'naive-ui'
import { NDataTable, NButton, NSpace, NIcon, NPopselect, NCard } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia';
import { List } from '@vicons/ionicons5'
import type { eventDisplayRowsType } from '@/types/components/event/display'
import { eventDisplayColumns } from '@/utils/constant/event/display/eventDisplay'
import { map, filter, includes, slice } from 'lodash/fp'
import { getResultDataByConfigId } from '@/api/eventAnalyse'
import deepCopy from '@/utils/function/deepcopy'

// @ts-ignore
const mapWithIndex = map.convert({ cap: false })

const footStore = useFooterStore()
const { selectedId, configType } = storeToRefs(footStore)

const table: Ref<DataTableInst | null> = ref(null)
const columnsRef: Ref<DataTableColumns<eventDisplayRowsType>> = ref(eventDisplayColumns)
const selectedColumn: Ref<string[]> = ref(map(({ key }) => key)(eventDisplayColumns))
const allData: Ref<eventDisplayRowsType[]> = ref([])
const dataRef: Ref<eventDisplayRowsType[]> = ref([])
const loadingRef: Ref<boolean> = ref(false)
const displayPageCount: Ref<number> = ref(0)
const paginationReactive: PaginationProps = reactive({
  page: 1,
  pageSize: 30,
  itemCount: 0,
  showQuickJumper: true,
  suffix (): VNodeChild {
    return `共${displayPageCount.value}条`
  }
})

const getSelectOption = (): Array<SelectOption | SelectGroupOption> => map(({ title, key }) => ({ label: title, value: key }))(eventDisplayColumns)

const handleSelect = (selectedArray: Array<string>) => {
  if (selectedArray.length !== 0) {
    selectedColumn.value = selectedArray
    columnsRef.value = filter(({ key }) => includes(key)(selectedArray))(eventDisplayColumns)
  }
}

const setData = (rows: any, page: number, total: number) => {
  allData.value = mapWithIndex((item: eventDisplayRowsType, index: number) => ({
    ...item,
    numbers: index + (page - 1) * paginationReactive.pageSize! + 1
  }))(rows)
  dataRef.value = slice(0, paginationReactive.pageSize!)(deepCopy(allData.value))
  paginationReactive.itemCount = (rows as Array<object>).length
  paginationReactive.page = page
  displayPageCount.value = total
}

const reloadTableData = async (page: number) => {
  if (!loadingRef.value) {
    loadingRef.value = true
    try {
      const {
        data: {
          resultData: {
            rows,
            total
          }
        }
      } = await getResultDataByConfigId({ configId: selectedId.value! })
      setData(rows, page, total)
    } catch (e) {
      //
    }
    loadingRef.value = false
  }
}

const handlePageChange = async (currentPage: number): Promise<void> => {
  dataRef.value = slice((currentPage - 1) * paginationReactive.pageSize!, currentPage * paginationReactive.pageSize!)(deepCopy(allData.value))
  paginationReactive.page = currentPage
}

watch(
  () => selectedId.value,
  async () => {
    if (selectedId.value && configType.value === 'event_show_viz') {
      await reloadTableData(1)
    }
  },
  {
    immediate: true
  }
)

footStore.$onAction(({ name, after }) => {
  if (name === 'instantQuery') {
    after((res) => {
      if (!loadingRef.value && res.data.resultData) {
        loadingRef.value = true
        const {
          data: {
            resultData: {
              rows,
              total
            }
          }
        } = res
        setData(rows, 1, total)
        loadingRef.value = false
      }
    })
  }
})
</script>

<template>
  <div>
    <n-space justify="space-between" align="end" vertical>
      <n-popselect
        scrollable
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
        border
        :scroll-x="7000"
        size="small"
        :single-line="false"
        ref="table"
        :columns="columnsRef"
        :data="dataRef"
        :loading="loadingRef"
        :pagination="paginationReactive"
        :row-key="(rowData: eventDisplayRowsType) => rowData.globaleventid"
        max-height="calc(100vh - 323px)"
        @update:page="handlePageChange"
      />
    </n-space>
  </div>
</template>

<style scoped lang="scss">

</style>