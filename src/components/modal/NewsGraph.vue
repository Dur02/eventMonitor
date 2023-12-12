<script setup lang="ts">
import type { DataTableColumns, SelectGroupOption, SelectOption } from 'naive-ui'
import { NButton, NDataTable, NIcon, NModal, NPopselect, NSpace } from 'naive-ui'
import type { Ref } from 'vue'
import { ref } from 'vue'
import { graphDisplayColumns } from '@/utils/constant/news/display/newsDisplay'
import { filter, includes, map } from 'lodash/fp'
import { List } from '@vicons/ionicons5';

defineProps<{
  showModal: boolean,
  graph: never[]
}>()

const emits = defineEmits(['modalClose', 'afterModalClose'])

const columnsRef: Ref<DataTableColumns<any>> = ref(graphDisplayColumns)
const selectedColumn: Ref<string[]> = ref(map(({ key }) => key)(graphDisplayColumns))

const getSelectOption = (): Array<SelectOption | SelectGroupOption> => map(({ title, key }) => ({ label: title, value: key }))(graphDisplayColumns)

const handleSelect = (selectedArray: Array<string>) => {
  if (selectedArray.length !== 0) {
    selectedColumn.value = selectedArray
    columnsRef.value = filter(({ key }) => includes(key)(selectedArray))(graphDisplayColumns)
  }
}

const handleModalClose = (value: boolean): void => {
  emits("modalClose", value)
}

const afterModalClose = () => {
  emits("afterModalClose")
  selectedColumn.value = map(({ key }) => key)(graphDisplayColumns)
  columnsRef.value = graphDisplayColumns
}
</script>

<template>
  <n-modal
    :show="showModal"
    size="small"
    preset="card"
    style="width: 80%;height: 1000px;"
    display-directive="if"
    @update:show="handleModalClose"
    @after-leave="afterModalClose"
  >
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
        :scroll-x="2000"
        size="small"
        :single-line="false"
        ref="table"
        :columns="columnsRef"
        :data="graph"
        :pagination="false"
        :row-key="(rowData: any) => rowData.sourceurls"
        max-height="850"
      />
    </n-space>
  </n-modal>
</template>

<style scoped lang="scss">

</style>