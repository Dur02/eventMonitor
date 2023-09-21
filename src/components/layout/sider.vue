<script setup lang="ts">
import {
  type Ref,
  h, Component, onBeforeMount, ref
} from 'vue'

import {
  type MenuOption,
  NIcon, NLayoutSider, NMenu
} from 'naive-ui'

import {
  LogOutOutline as HomeIcon
} from '@vicons/ionicons5'

import {
  type RouteLocationNormalizedLoaded, type Router,
  useRoute, useRouter
} from 'vue-router'

const route: RouteLocationNormalizedLoaded = useRoute()
const router: Router = useRouter()
const selectedMenu: Ref<string> = ref('')

function renderIcon (icon: Component) {
  return () => h(NIcon, null, { default: () => h(icon) })
}

const menuOptions: MenuOption[] = [
  {
    label: 'Home',
    key: 'home',
    icon: renderIcon(HomeIcon),
    children: [
      {
        label: '测试',
        key: 'test1'
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
    :native-scrollbar="false"
    collapse-mode="width"
    :collapsed-width="64"
    :width="240"
    show-trigger="bar"
    inverted
    bordered
  >
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

</style>