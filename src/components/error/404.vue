<script setup lang="ts">
import { useRouter } from 'vue-router'
import { NResult, NButton } from 'naive-ui'

const router = useRouter()

const backToHome = () => {
  router.push({ path: '/' })
}
</script>

<template>
  <n-result
    status="404"
    title="404 资源不存在"
    size="huge"
    style="height: 100vh;display: flex; flex-direction: column;justify-content: center;"
  >
    <template #footer>
      <n-button
        @click="backToHome"
      >
        返回首页
      </n-button>
    </template>
  </n-result>
</template>

<style scoped lang="scss">

</style>