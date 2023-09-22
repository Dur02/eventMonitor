<script setup lang="ts">
import {
  NLayout,
  NLayoutFooter
} from 'naive-ui'
import CustomSider from '@/components/layout/sider.vue'
import CustomHeader from '@/components/layout/header.vue'
import CustomContent from '@/components/layout/content.vue'

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
<!--        <n-layout-footer-->
<!--          position="absolute"-->
<!--          bordered-->
<!--        >-->
<!--          成府路-->
<!--        </n-layout-footer>-->
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