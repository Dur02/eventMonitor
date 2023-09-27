<script setup lang="ts">
import { NBreadcrumb, NBreadcrumbItem } from 'naive-ui'
import type { RouteLocationMatched, RouteLocationNormalizedLoaded } from 'vue-router'
import { useRoute } from 'vue-router'
import type { Ref } from 'vue'
import { ref, watch, onMounted } from 'vue'
import { flow, map } from 'lodash/fp'

const route: RouteLocationNormalizedLoaded = useRoute()

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
  <n-breadcrumb>
    <n-breadcrumb-item
      v-for="item in nameArray"
      :key="item"
      :clickable="false"
    >
      {{ item }}
    </n-breadcrumb-item>
  </n-breadcrumb>
</template>

<style scoped lang="scss">

</style>