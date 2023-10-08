<script setup lang="ts">
import { NButton, NLayoutFooter, NIcon, NSpace } from 'naive-ui'
import { CaretUpCircleOutline } from '@vicons/ionicons5'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useRoute } from 'vue-router'
import { onMounted } from 'vue'

const route: RouteLocationNormalizedLoaded = useRoute()
const btnArray = [
  {
    name: 'Alpha关系'
  },
  {
    name: 'Beta关系'
  }
]

const changeData = (name: string) => {
  console.log(name)
}

onMounted(() => {
  console.log(route)
})
</script>

<template>
  <n-layout-footer
    class="layout-footer"
    position="absolute"
    bordered
  >
    <div>
      <n-space size="small">
        <n-button
          type="primary"
          size="tiny"
        >
          <template #icon>
            <n-icon>
              <CaretUpCircleOutline />
            </n-icon>
          </template>
        </n-button>
        <n-button
          v-for="item in btnArray"
          type="primary"
          size="tiny"
          @click="() => changeData(item.name)"
        >
          {{ item.name }}
        </n-button>
      </n-space>
    </div>
    <n-button
      type="primary"
      size="tiny"
    >
      即时查询
    </n-button>
  </n-layout-footer>
</template>

<style scoped lang="scss">
.layout-footer {
  height: 40px;
  padding: 7px 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>