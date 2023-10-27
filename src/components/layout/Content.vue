<script setup lang="ts">
import { NLayoutContent } from 'naive-ui'
import { RouterView, useRoute } from 'vue-router'
import { ref, watch } from 'vue';

const bottom = ref('0px')
const route = useRoute()

watch(
  () => route.name,
  () => {
    bottom.value = route.meta.hasFooter as boolean ? '50px' : '0px'
  },
  {
    immediate: true
  }
)
</script>

<template>
  <n-layout-content
    class="layout-content"
    position="absolute"
    :native-scrollbar="false"
    content-style="padding: 15px 24px;"
    embedded
  >
    <router-view/>
  </n-layout-content>
</template>

<style scoped lang="scss">
.layout-content {
  top: 40px;
  bottom: v-bind(bottom);
}
</style>