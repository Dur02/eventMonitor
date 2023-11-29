<script setup lang="ts">
import type { Ref } from 'vue'
import { onBeforeUnmount, onMounted, ref } from 'vue'

let timer: ReturnType<typeof setInterval>
const clockText: Ref<string> = ref('')

onMounted(() => {
  clearInterval(timer)
  if (!timer) {
    timer = setInterval(() => {
      const date = new Date()
      const Y = date.getFullYear() + '-';
      const M = (date.getMonth() + 1  < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-'
      const D = date.getDate() + ' '
      const h = date.getHours() + ':'
      const m = date.getMinutes() + ':'
      const s = date.getSeconds() < 10 ? '0' + (date.getSeconds()) : date.getSeconds()
      clockText.value = Y + M + D + h + m + s
    }, 1000)
  }
})

onBeforeUnmount(() => {
  clearInterval(timer)
  timer = null
})
</script>

<template>
  {{ clockText }}
</template>

<style scoped lang="scss">

</style>