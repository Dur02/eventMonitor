<script setup lang="ts">
import { NLayoutContent } from 'naive-ui'
import { RouterView } from 'vue-router'

</script>

<template>
  <n-layout-content
    class="layout-content"
    position="absolute"
    :native-scrollbar="false"
    content-style="padding: 7px 12px;"
    embedded
  >
    <router-view/>
  </n-layout-content>
</template>

<style scoped lang="scss">
.layout-content {
  top: 40px;
  bottom: 40px;
}
</style>