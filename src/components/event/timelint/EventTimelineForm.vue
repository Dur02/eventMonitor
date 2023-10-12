<script setup lang="ts">
import { onMounted, nextTick } from 'vue'

const props = defineProps({
  selectedBtn: String
})

onMounted(() => {
  nextTick(() => {
    // console.log(props.selectedBtn)
  })
})
</script>

<template>
  <p>{{ selectedBtn }}</p>
</template>

<style scoped lang="scss">
.form-container {
  width: 100%;
  height: 500px;
}
</style>