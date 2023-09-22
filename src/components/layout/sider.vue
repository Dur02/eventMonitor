<script setup lang="ts">
import {
  type Ref,
  onBeforeMount, ref
} from 'vue'

import {
  type MenuOption,
  NLayoutSider, NMenu
} from 'naive-ui'

import {
  NavigateCircle
} from '@vicons/ionicons5'

import {
  type RouteLocationNormalizedLoaded, type Router,
  useRoute, useRouter
} from 'vue-router'

import renderIcon from '@/utils/function/renderIcon'

const route: RouteLocationNormalizedLoaded = useRoute()
const router: Router = useRouter()

const selectedMenu: Ref<string> = ref('')
const isCollapse: Ref<boolean> = ref(false)

const menuOptions: MenuOption[] = [
  {
    label: '回家',
    key: 'home',
    icon: renderIcon(NavigateCircle),
    children: [
      {
        label: '测试',
        key: 'test1',
      },
      {
        label: '测试2',
        key: 'test2'
      }
    ]
  },
]

const handleSelectedChange = (key: string, item: MenuOption): void => {
  router.push({ name: `${key}` })
}

onBeforeMount((): void => {
  selectedMenu.value = route.meta.key as string
})
</script>

<template>
  <n-layout-sider
    class="sider-bar"
    :native-scrollbar="false"
    collapse-mode="width"
    :collapsed-width="64"
    :collapsed="isCollapse"
    @collapse="isCollapse = true"
    @expand="isCollapse = false"
    :width="240"
    show-trigger="bar"
    inverted
    bordered
  >
    <h3 v-show="!isCollapse">
      测试系统名字
    </h3>
    <n-menu
      v-model:value="selectedMenu"
      inverted
      :root-indent="18"
      :collapsed-width="64"
      :collapsed-icon-size="22"
      :options="menuOptions"
      @update:value="handleSelectedChange"
    />
  </n-layout-sider>
</template>

<style scoped lang="scss">
.sider-bar {
  h3 {
    text-align: center;
    margin: 10px 0;
  }
}
</style>