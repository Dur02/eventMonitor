<script setup lang="ts">
import { ref } from 'vue'
import { NAvatar, NDropdown, NH2, NIcon, NLayoutHeader, NSpace, NText } from 'naive-ui'
import { LogOutOutline, Pencil, Person } from '@vicons/ionicons5'
import ChangePassword from '@/components/modal/ChangePassword.vue'
import renderIcon from '@/utils/function/renderIcon'

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

const updateShowModal = (bool: boolean): void => {
  showModal.value = bool
}

const handleSelect = (key: string | number): void => {
  switch (key) {
    case 'changePassword':
      // 打开修改密码Dialog
      showModal.value = true
      break
    default:
      // 退出登录
      break
  }
}
</script>

<template>
  <n-layout-header
    class="header-container"
    position="absolute"
    bordered
  >
    <N-h2 class="title" align-text style="">
      <NText>
        全球政治安全监测分析系统
      </NText>
    </N-h2>
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
.header-container {
  height: 50px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 7px 24px;

  .title {
    margin: 0;
    line-height: 50px;
    font-weight: bold;
  }
}
</style>