<script setup lang="ts">
import { ref } from 'vue'
import { NAvatar, NDropdown, NH2, NIcon, NLayoutHeader, NSpace, NText, NImage } from 'naive-ui'
import { Person } from '@vicons/ionicons5'
import ChangePassword from '@/components/modal/ChangePassword.vue'
import router from '@/router'
import { useUserStore } from '@/stores/user'
import { options } from '@/utils/constant/layout/header'

const userStore = useUserStore()
const { logout } = userStore

const showModal = ref<boolean>(false)

const updateShowModal = (bool: boolean): void => {
  showModal.value = bool
}

const handleSelect = async (key: string | number): void => {
  switch (key) {
    case 'changePassword':
      // 打开修改密码Dialog
      showModal.value = true
      break
    default:
      // 退出登录
      await logout()
      await router.replace('/login')
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
    <n-h2 class="title" align-text>
      <n-text>
        全球政治安全监测分析系统
      </n-text>
    </n-h2>
    <n-space
      align="center"
      class="avatar-container"
    >
      用户名
      <n-dropdown
        :options="options"
        @select="handleSelect"
      >
        <n-avatar
          :size="28"
          round
        >
          <n-icon
            :component="Person"
            :size="20"
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
  background: url("@/assets/image/flag.png") no-repeat;
  background-size: auto 70px;

  .title {
    margin: 0;
    height: 35px;
    font-weight: bold;
  }

  .avatar-container {
    position: relative;
    top: 2px;
  }
}
</style>