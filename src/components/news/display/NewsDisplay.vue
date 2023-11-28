<script setup lang="ts">
import { onMounted } from 'vue'
import { searchNews } from '@/api/news'

onMounted(async () => {
  const res = await searchNews({ pageNum: 1, pageSize: 30 })
  console.log(res)
})
</script>

<template>
  <p>新闻展示</p>
</template>

<style scoped lang="scss">

</style>