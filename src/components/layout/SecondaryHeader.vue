<script setup lang="ts">
import { NLayoutHeader, NSwitch, NIcon, NButton } from 'naive-ui'
import { Sunny, Moon } from '@vicons/ionicons5'
import CustomBreadCrumb from '@/components/layout/Breadcrumb.vue'
import { useSystemStore } from '@/stores/system'
import { ref } from 'vue';
import { storeToRefs } from 'pinia'

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)
const { setIsLight } = systemStore

const loading = ref(false)

const handleUpdateValue = (newValue: boolean) => {
  loading.value = true
  setIsLight(newValue)
  loading.value = false
}
</script>

<template>
  <n-layout-header
    class="layout-header"
    position="absolute"
    bordered
  >
    <custom-bread-crumb />
    <n-button text>
      <template #icon>
        <n-icon>
          <sunny v-show="isLight" @click="handleUpdateValue(false)" />
          <moon v-show="!isLight" @click="handleUpdateValue(true)" />
        </n-icon>
      </template>
    </n-button>
  </n-layout-header>
</template>

<style scoped lang="scss">
.layout-header {
  height: 40px;
  padding: 7px 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>