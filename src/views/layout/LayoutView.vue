<script setup lang="ts">
import { NLayout } from 'naive-ui'
import CustomHeader from '@/components/layout/Header.vue'
import CustomSider from '@/components/layout/Sider.vue'
import CustomSecondaryHeader from '@/components/layout/SecondaryHeader.vue'
import CustomContent from '@/components/layout/Content.vue'
import CustomNormalFooter from '@/components/layout/Footer.vue'
import CustomRepositoryFooter from '@/components/layout/RepositoryFooter.vue'
import { useRoute } from 'vue-router'

const route = useRoute()
</script>

<template>
  <div
    class="layout-container"
  >
    <n-layout
      position="absolute"
    >
      <CustomHeader />
      <n-layout
        position="absolute"
        has-sider
        style="top: 70px;"
      >
        <CustomSider/>
        <n-layout>
          <CustomSecondaryHeader />
          <CustomContent />
          <CustomNormalFooter v-if="route.meta.footerType === 'normal'" />
          <CustomRepositoryFooter v-if="route.meta.footerType === 'repository'" />
        </n-layout>
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