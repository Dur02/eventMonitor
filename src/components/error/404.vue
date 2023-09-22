<script setup lang="ts">
import { useRouter } from 'vue-router'
import { NResult, NButton } from 'naive-ui'

const router = useRouter()

const backToHome = () => {
  router.push({ path: '/home' })
}
</script>

<template>
  <n-result
    status="404"
    title="404 资源不存在"
    description="生活总归带点荒谬"
    size="huge"
    style="height: 100vh;display: flex; flex-direction: column;justify-content: center;"
  >
    <template #footer>
      <n-button
        @click="backToHome"
      >
        找点乐子吧
      </n-button>
    </template>
  </n-result>
</template>

<style scoped lang="scss">

</style>