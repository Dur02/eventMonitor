<script setup lang="ts">
import { NLayout } from 'naive-ui'
import CustomHeader from '@/components/layout/Header.vue'
import CustomSider from '@/components/layout/Sider.vue'
import CustomSecondaryHeader from '@/components/layout/SecondaryHeader.vue'
import CustomContent from '@/components/layout/Content.vue'
import CustomFooter from '@/components/layout/Footer.vue'
import { ref, watch } from 'vue'
import { useRoute } from 'vue-router'

const hasFooter = ref(false)
const route = useRoute()

watch(
  () => route.name,
  () => {
    hasFooter.value = route.meta.hasFooter as boolean
  },
  {
    immediate: true
  }
)
</script>

<template>
  <div
    class="layout-container"
  >
    <n-layout
      position="absolute"
    >
      <custom-header />
      <n-layout
        position="absolute"
        has-sider
        style="top: 50px;"
      >
        <custom-sider/>
        <n-layout>
          <custom-secondary-header />
          <custom-content />
          <custom-footer v-if="hasFooter" />
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