<script setup lang="ts">
import {
  NLayout,
  NLayoutHeader,
  NLayoutContent,
  NLayoutFooter
} from 'naive-ui'
import Sider from '@/components/layout/sider.vue'

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
      <sider />
      <n-layout>
        <n-layout-header
          position="absolute"
          bordered
          style="height: 40px;"
        >
          颐和园路
        </n-layout-header>
        <n-layout-content
          position="absolute"
          :native-scrollbar="false"
          content-style="padding: 24px;"
          embedded
          style="top: 40px;"
        >
          <router-view/>
        </n-layout-content>
        <n-layout-footer
          position="absolute"
          bordered
        >
          成府路
        </n-layout-footer>
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