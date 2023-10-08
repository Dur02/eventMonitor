<script setup lang="ts">
import { NLayout } from 'naive-ui'
import CustomSider from '@/components/layout/Sider.vue'
import CustomHeader from '@/components/layout/Header.vue'
import CustomContent from '@/components/layout/Content.vue'
import CustomFooter from '@/components/layout/Footer.vue'
</script>

<template>
  <div
    class="layout-container"
  >
    <n-layout
      position="absolute"
      has-sider
      embedded
    >
      <custom-sider />
      <n-layout>
        <custom-header />
        <custom-content />
        <custom-footer />
      </n-layout>
    </n-layout>
  </div>
</template>

<style scoped lang="scss">
.layout-container {
  width: 100%;
  height: 100vh;
  position: relative;
}
</style>