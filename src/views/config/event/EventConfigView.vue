<script setup lang="ts">
import CommonConfig from '@/components/config/common/ComonConfig.vue'
import { useConstantStore } from '@/stores/constant'
import { storeToRefs } from 'pinia'
import { useEventConfigStore } from '@/stores/eventConfig'
import { onMounted, onBeforeUnmount } from 'vue'
import EventConfigDrawer from '@/components/drawer/EventConfigDrawer.vue'
import { eventConfigFormInitialValue } from '@/utils/constant/form/event/eventConfigForm'
import { allCommonColumns } from '@/utils/constant/config/common/commonConfig'

const constantStore = useConstantStore()
const { eventConfigTypeList } = storeToRefs(constantStore)
const { getAllEventConfigType } = constantStore
const eventConfigStore = useEventConfigStore()
const {
  setConfigPage,
  setTableLoading,
  reloadTableData,
  resetAll
} = eventConfigStore

onMounted(async () => {
  try {
    setConfigPage('event')
    setTableLoading(true)
    await getAllEventConfigType()
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
    :configTypeList="eventConfigTypeList"
    :configStore="eventConfigStore"
    :configDrawer="EventConfigDrawer"
    :formInitialValue="eventConfigFormInitialValue"
    :allColumns="allCommonColumns"
  />
</template>

<style scoped lang="scss">

</style>