<script setup lang="ts">
import CommonConfig from '@/components/config/common/ComonConfig.vue'
import { useConstantStore } from '@/stores/constant'
import { storeToRefs } from 'pinia'
import { useEventConfigStore } from '@/stores/eventConfig'
import { onMounted, onBeforeUnmount } from 'vue'
import EventConfigDrawer from '@/components/drawer/EventConfigDrawer.vue'
import { eventConfigFormInitialValue } from '@/utils/constant/form/event/eventConfigForm'
import { allCommonColumns } from '@/utils/constant/config/event/eventConfig'

const constantStore = useConstantStore()
const { graphConfigTypeList } = storeToRefs(constantStore)
const { getAllGraphConfigType } = constantStore
const eventConfigStore = useEventConfigStore()
const {
  setTableLoading,
  reloadTableData,
  resetAll
} = eventConfigStore

onMounted(async () => {
  try {
    setTableLoading(true)
    await getAllGraphConfigType()
    setTableLoading(false)
    await reloadTableData(1)
  } catch (e) {
    setTableLoading(false)
  }
})

onBeforeUnmount(() => {
  resetAll()
})
</script>

<template>
  <CommonConfig
    :configTypeList="graphConfigTypeList"
    :configStore="eventConfigStore"
    :configDrawer="EventConfigDrawer"
    :formInitialValue="eventConfigFormInitialValue"
    :allColumns="allCommonColumns"
  />
</template>

<style scoped lang="scss">

</style>