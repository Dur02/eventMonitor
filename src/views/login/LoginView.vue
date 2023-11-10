<script setup lang="ts">
import Login from "../../components/login/Login.vue";
</script>

<template>
  <div class="page-container">
    <Login/>
  </div>
</template>

<style scoped lang="scss">
.page-container {
  width: 100%;
  min-height: 100vh;
  background: #2d3a4b;
  overflow: hidden;
  background: url('@/assets/image/login_bg.png') no-repeat;
  background-size: cover;
}
</style>