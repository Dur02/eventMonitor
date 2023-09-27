<script setup lang="ts">
import { NLayoutContent } from 'naive-ui'
import { RouterView } from 'vue-router'

</script>

<template>
  <n-layout-content
    position="absolute"
    :native-scrollbar="false"
    content-style="padding: 10px 24px;"
    embedded
    style="top: 40px;"
  >
    <router-view/>
  </n-layout-content>
</template>

<style scoped lang="scss">

</style>