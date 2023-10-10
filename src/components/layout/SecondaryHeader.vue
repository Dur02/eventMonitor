<script setup lang="ts">
import { NLayoutHeader, NSwitch } from 'naive-ui'
import CustomBreadCrumb from '@/components/layout/Breadcrumb.vue'
import { useThemeStore } from '@/stores/theme'
import { ref } from 'vue';
import { storeToRefs } from 'pinia'

const themeStore = useThemeStore()
const { isLight } = storeToRefs(themeStore)
const { setIsLight } = themeStore

const loading = ref(false)

const handleUpdateValue = (a: boolean) => {
  loading.value = true
  setIsLight(a)
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
    <n-switch
      :loading="loading"
      v-model:value="isLight"
      @update:value="handleUpdateValue"
    >
      <template #checked>
        亮色主题
      </template>
      <template #unchecked>
        暗色主题
      </template>
    </n-switch>
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