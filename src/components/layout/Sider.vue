<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, onMounted, nextTick } from 'vue'
import type { MenuInst, MenuOption } from 'naive-ui'
import { NLayoutSider, NMenu } from 'naive-ui'
import type { RouteLocationNormalizedLoaded, Router, RouteRecordRaw } from 'vue-router'
import { useRoute, useRouter } from 'vue-router'
import menuRoutes from '@/router/menuRoutes'
import { useSystemStore } from '@/stores/system'
import { map } from 'lodash/fp'
import { storeToRefs } from 'pinia';

interface routeType {
  key: string,
  label: string | null,
  icon: Function | null,
  children: routeType[] | undefined
}

const systemStore = useSystemStore()
const { isCollapse } = storeToRefs(systemStore)

const route: RouteLocationNormalizedLoaded = useRoute()
const router: Router = useRouter()

const menuInstRef: Ref<MenuInst | null> = ref(null)
const selectedMenu: Ref<string> = ref('')
const menuOptions: Ref<routeType[]> = ref([])

const handleSelectedChange = (key: string): void => {
  router.push({ name: `${key}` })
}

onMounted((): void => {
  const mapChildren = (param: RouteRecordRaw[]): routeType[] => {
    return map((item: RouteRecordRaw): routeType => ({
      key: item.name as string,
      label: item.meta ? item.meta.breadcrumb as string : null,
      icon: item.meta ? item.meta.icon as Function : null,
      children: item.children ? mapChildren(item.children) : undefined
    }))(param)
  }

  // 通过menuRoutes生成菜单栏
  menuOptions.value = mapChildren(menuRoutes)
  selectedMenu.value = route.name as string

  nextTick(() => {
    menuInstRef.value?.showOption(route.name as string)
  })
})
</script>

<template>
  <n-layout-sider
    class="sider-bar"
    :native-scrollbar="false"
    collapse-mode="width"
    :collapsed-width="64"
    :collapsed="isCollapse"
    :width="210"
    :show-trigger="false"
    bordered
  >
    <n-menu
      ref="menuInstRef"
      v-model:value="selectedMenu"
      :root-indent="18"
      :collapsed-width="64"
      :collapsed-icon-size="22"
      :options="menuOptions as MenuOption[]"
      @update:value="handleSelectedChange"
    />
  </n-layout-sider>
</template>

<style scoped lang="scss">
//.sider-bar {
//  h3 {
//    text-align: center;
//    margin: 10px 0;
//  }
//}
</style>