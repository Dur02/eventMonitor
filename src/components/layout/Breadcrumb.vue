<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, watch, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import type { RouteLocationMatched, RouteLocationNormalizedLoaded } from 'vue-router'
import { NBreadcrumb, NBreadcrumbItem, NIcon } from 'naive-ui'
import { ChevronForwardCircle, ChevronBackCircle } from '@vicons/ionicons5'
import { flow, map } from 'lodash/fp'
import { useSystemStore } from '@/stores/system';
import { storeToRefs } from 'pinia';

const route: RouteLocationNormalizedLoaded = useRoute()

const systemStore = useSystemStore()
const { isCollapse } = storeToRefs(systemStore)
const { setIsCollapse } = systemStore

const nameArray: Ref<string[]> = ref([])

onMounted(() => {
  nameArray.value = flow(
    map((item: RouteLocationMatched): string => item.meta.breadcrumb as string)
  )(route.matched)
})

watch(
  () => route.meta.breadcrumb,
  () => {
    nameArray.value = flow(
      map((item: RouteLocationMatched): string => item.meta.breadcrumb as string)
    )(route.matched)
  }
)
</script>

<template>
  <div style="display: flex;align-items: center;">
    <n-icon :size="20">
      <chevron-forward-circle v-if="isCollapse" @click="setIsCollapse(false)" />
      <chevron-back-circle v-else @click="setIsCollapse(true)" />
    </n-icon>
    <n-breadcrumb>
      <n-breadcrumb-item
        v-for="item in nameArray"
        :key="item"
        :clickable="false"
      >
        {{ item }}
      </n-breadcrumb-item>
    </n-breadcrumb>
  </div>
</template>

<style scoped lang="scss">

</style>