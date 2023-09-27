<script setup lang="ts">
import EventTimelineDisplay from '@/components/event/EventTimelineDisplay.vue'
</script>

<template>
  <div class="display-container">
    <event-timeline-display />
  </div>
</template>

<style scoped lang="scss">
.display-container {
  width: 100%;
  height: 400px;
}
</style>