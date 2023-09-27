<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, onMounted, nextTick } from 'vue'
import type { MenuInst, MenuOption } from 'naive-ui'
import { NLayoutSider, NMenu } from 'naive-ui'
import type { RouteLocationNormalizedLoaded, Router, RouteRecordRaw } from 'vue-router'
import { useRoute, useRouter } from 'vue-router'
import menuRoutes from '@/router/menuRoutes'
import { flow, map } from 'lodash/fp'

interface routeType {
  key: string,
  label: string,
  icon: Function | null,
  children: routeType[] | null
}

const route: RouteLocationNormalizedLoaded = useRoute()
const router: Router = useRouter()

const menuInstRef: Ref<MenuInst | null> = ref(null)
const selectedMenu: Ref<string> = ref('')
const isCollapse: Ref<boolean> = ref(false)
const menuOptions: Ref<MenuOption[]> = ref([])

const handleSelectedChange = (key: string): void => {
  router.push({ name: `${key}` })
}

onMounted((): void => {
  const mapChildren = (param: RouteRecordRaw[]): routeType[] => {
    return map((item: RouteRecordRaw): routeType => ({
      key: item.name as string,
      label: item.meta.breadcrumb as string,
      icon: item.meta.icon ? item.meta.icon as Function : null,
      children: item.children ? mapChildren(item.children) : null
    }))(param)
  }

  /**
    * @description 通过menuRoutes生成菜单栏
    * @author Dur02
    * @date 2023/9/27
  **/
  menuOptions.value = flow(
    map((item: RouteRecordRaw): routeType => ({
      key: item.name as string,
      label: item.meta.breadcrumb as string,
      icon: item.meta.icon ? item.meta.icon as Function : null,
      children: item.children ? mapChildren(item.children) : null
    }))
  )(menuRoutes)

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
      ref="menuInstRef"
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