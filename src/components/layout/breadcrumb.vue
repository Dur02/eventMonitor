<script setup lang="ts">
import {
  NBreadcrumb, NBreadcrumbItem
} from 'naive-ui'

import {
  type RouteLocationNormalizedLoaded,
  useRoute
} from 'vue-router'

import {
  type Ref,
  onBeforeMount, ref, watch
} from 'vue'

const route: RouteLocationNormalizedLoaded = useRoute()

const nameArray: Ref<string[]> = ref([])

onBeforeMount(() => {
  nameArray.value = route.meta.name as string[]
})

watch(
  () => route.meta.name,
  (name) => {
    nameArray.value = name as string[]
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