<script setup lang="ts">
import { NButton, NLayoutFooter } from 'naive-ui'
import type { Ref } from 'vue'
import { ref } from 'vue'

const footerExpand: Ref<boolean> = ref(false)

const changeExpand = () => {

}
</script>

<template>
  <n-layout-footer
    class="layout-footer"
    :class="footerExpand ? 'expand' : ''"
    position="absolute"
    bordered
  >
    <div class="footer-bar">
      <n-button
        type="info"
        size="small"
        @click="changeExpand"
      >
        全库搜索
      </n-button>
    </div>
  </n-layout-footer>
</template>

<style scoped lang="scss">
.layout-footer {
  height: 52px;
  padding: 10px 24px;
  z-index: 3;
  transition: height .3s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);
  -moz-transition: height .3s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Firefox 4 */
  -webkit-transition: height .3s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Safari and Chrome */
  -o-transition: height .3s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Opera */

  &.expand {
    height: 500px;
  }

  .footer-bar {
    display: flex;
    justify-content: space-between;
    align-items: start;
    height: 41px;
  }
}
</style>