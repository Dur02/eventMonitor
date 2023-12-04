<script setup lang="ts">
import type { DataTableColumns, SelectGroupOption, SelectOption } from 'naive-ui'
import {
  NButton,
  NDataTable,
  NIcon,
  NModal,
  NPopselect,
  NSpace
} from 'naive-ui'
import type { eventDisplayRowsType } from '@/types/components/event/display'
import { List } from '@vicons/ionicons5'
import type { Ref } from 'vue'
import { ref } from 'vue'
import { eventDisplayColumns } from '@/utils/constant/event/display/eventDisplay'
import { filter, includes, map } from 'lodash/fp'
import { graphDisplayColumns } from '@/utils/constant/news/display/newsDisplay';

defineProps<{
  showModal: boolean,
  event: never[]
}>()

const emits = defineEmits(['modalClose', 'afterModalClose'])

const columnsRef: Ref<DataTableColumns<eventDisplayRowsType>> = ref(eventDisplayColumns)
const selectedColumn: Ref<string[]> = ref(map(({ key }) => key)(eventDisplayColumns))

const getSelectOption = (): Array<SelectOption | SelectGroupOption> => map(({ title, key }) => ({ label: title, value: key }))(eventDisplayColumns)

const handleSelect = (selectedArray: Array<string>) => {
  if (selectedArray.length !== 0) {
    selectedColumn.value = selectedArray
    columnsRef.value = filter(({ key }) => includes(key)(selectedArray))(eventDisplayColumns)
  }
}

const handleModalClose = (value: boolean): void => {
  emits("modalClose", value)
}

const afterModalClose = () => {
  emits("afterModalClose")
  selectedColumn.value = map(({ key }) => key)(eventDisplayColumns)
  columnsRef.value = eventDisplayColumns
}
</script>

<template>
  <n-modal
    :show="showModal"
    size="small"
    preset="card"
    style="max-width: 1000px;"
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
        :scroll-x="7000"
        size="small"
        :single-line="false"
        ref="table"
        :columns="columnsRef"
        :data="event"
        :pagination="false"
        :row-key="(rowData: eventDisplayRowsType) => rowData.globaleventid"
        max-height="500"
      />
    </n-space>
  </n-modal>
</template>

<style scoped lang="scss">

</style>