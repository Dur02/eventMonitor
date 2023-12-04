<script setup lang="ts">
import { ref } from 'vue'
import { NAvatar, NDropdown, NH2, NIcon, NLayoutHeader, NSpace, NText } from 'naive-ui'
import { Person } from '@vicons/ionicons5'
import ChangePassword from '@/components/modal/ChangePassword.vue'
import router from '@/router'
import { useUserStore } from '@/stores/user'
import { options } from '@/utils/constant/layout/header'
import { storeToRefs } from 'pinia'
import Clock from '@/components/layout/Clock.vue'

const userStore = useUserStore()
const { nickname } = storeToRefs(userStore)
const { logout } = userStore

const showModal = ref<boolean>(false)

const updateShowModal = (bool: boolean): void => {
  showModal.value = bool
}

const handleSelect = async (key: string | number): Promise<void> => {
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
    <n-space vertical align="end" :size="[14, 0]">
      <Clock />
      <n-space
        align="center"
        class="avatar-container"
      >
        {{ nickname }}
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
    </n-space>
  </n-layout-header>
  <ChangePassword
    :showModal="showModal"
    @ModalClose="updateShowModal"
  />
</template>

<style scoped lang="scss">
.header-container {
  height: 70px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 7px 24px;
  background: url("@/assets/image/flag.png") no-repeat;
  background-size: auto 70px;

  .title {
    margin: 0 0 0 100px;
    height: 100%;
    font-size: 2.5em;
    font-weight: 1000;
  }

  .avatar-container {
    position: relative;
    top: 2px;
  }
}
</style>