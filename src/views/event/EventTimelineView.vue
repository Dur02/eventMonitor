<script setup lang="ts">
import EventTimeline from '@/components/event/timeline/EventTimeline.vue'
</script>

<template>
  <div class="charts-container">
    <event-timeline />
  </div>
</template>

<style scoped lang="scss">
.charts-container {
  width: 100%;
  height: 400px;
}
</style>