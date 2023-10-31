<script setup lang="ts">
import {
  NDrawer,
  NDrawerContent,
  NCard,
  NScrollbar,
  NRadio,
  NFormItemGi,
  NDatePicker,
  NSelect,
  NInputNumber, NSpace, NCheckbox, NButton, NRadioGroup, NFormItem, NTreeSelect, NIcon, NGi, NForm, NGrid, NInput
} from 'naive-ui'
import {
  cardDarkThemeOverrides,
  cardLightThemeOverrides,
  drawerDarkThemeOverrides,
  drawerLightThemeOverrides
} from '@/utils/constant/config/event/eventConfig'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia';
import { watch } from 'vue';
import { formThemeOverrides, rootOptions, rules } from '@/utils/constant/event/display/eventDisplayForm';
import { Calculator, Calendar, DocumentText, Folder, Grid, People, Save } from '@vicons/ionicons5';
import { IosApps } from '@vicons/ionicons4';

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)

const props = defineProps<{
  drawerInfo: {
    title: string,
    btnText: string
  },
  drawerShow: boolean
}>()

const emits = defineEmits(['DrawerClose'])

const handleDrawerClose = (value: boolean): void => {
  emits("DrawerClose", value)
}

watch(
  () => props.drawerInfo,
  () => {
    console.log(props.drawerInfo)
  }
)
</script>

<template>
  <n-drawer
    :show="drawerShow"
    to="#config-drawer-target"
    :height="500"
    placement="bottom"
    :trap-focus="false"
    :block-scroll="false"
    :show-mask="false"
    :mask-closable="false"
    :theme-overrides="isLight ? drawerLightThemeOverrides : drawerDarkThemeOverrides"
    @update:show="handleDrawerClose"
  >
    <n-drawer-content
      closable
      :native-scrollbar="true"
      :body-content-style="{
        overflow: 'hidden'
      }"
    >
      <template #header>
        {{ drawerInfo.title }}
      </template>
      <n-scrollbar
        class="scroll-box"
        :style="{
          maxHeight: '440px',
          border: '1px solid rgb(239, 239, 245)',
          borderRadius: '3px',
        }"
      >
        <n-card
          :bordered="false"
          :theme-overrides="isLight ? cardLightThemeOverrides : cardDarkThemeOverrides"
        >
          <p>{{ drawerInfo.btnText }}</p>
        </n-card>
      </n-scrollbar>
    </n-drawer-content>
  </n-drawer>
</template>

<style scoped lang="scss">

</style>