<script setup lang="ts">
import {
  NLayoutHeader, NIcon, NAvatar, NSpace, NDropdown, NBreadcrumb, NBreadcrumbItem
} from 'naive-ui'

import {
  LogOutOutline, Pencil, Person,
} from '@vicons/ionicons5'

import renderIcon from '@/utils/function/renderIcon'
import CustomBreadCrumb from '@/components/layout/breadcrumb.vue'
import ChangePassword from '@/components/modal/changePassword.vue'
import { ref } from 'vue'

const showModal = ref<boolean>(false)

const options = [
  {
    label: '修改密码',
    key: 'changePassword',
    icon: renderIcon(Pencil)
  },
  {
    label: '退出登录',
    key: 'logout',
    icon: renderIcon(LogOutOutline)
  }
]

const handleSelect = (key: string | number): void => {
  switch (key) {
    case 'changePassword':
      // 打开修改密码Dialog
      showModal.value = true
      break
    default:
      // 推出登录
      break
  }
}

const updateShowModal = (bool: boolean): void => {
  showModal.value = bool
}
</script>

<template>
  <n-layout-header
    class="layout-header"
    position="absolute"
    bordered
  >
    <custom-bread-crumb />
    <n-space
      align="center"
    >
      用户名
      <n-dropdown
        :options="options"
        @select="handleSelect"
      >
        <n-avatar
          size="small"
          round
        >
          <n-icon
            :component="Person"
            size="20"
          />
        </n-avatar>
      </n-dropdown>
    </n-space>
  </n-layout-header>
  <change-password
    :showModal="showModal"
    @ModalClose="updateShowModal"
  />
</template>

<style scoped lang="scss">
.layout-header {
  height: 40px;
  padding: 7px 24px;
  display: flex;
  justify-content: space-between;
  align-items: baseline;
}
</style>