<script setup lang="ts">
import { onMounted, nextTick } from 'vue'

const props = defineProps({
  selectedBtn: String
})

onMounted(() => {
  console.log('456')
})
</script>

<template>
  <p>{{ selectedBtn }}</p>
</template>

<style scoped lang="scss">
.form-container {
  width: 100%;
  height: 400px;
}
</style>