<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, onMounted, } from 'vue'
import type { FormInst, FormValidationError } from 'naive-ui'
import { NForm, NFormItem, NInput, NIcon, NImage, NCheckbox, NButton, NConfigProvider, lightTheme } from 'naive-ui'
import { Person, LockOpen } from '@vicons/ionicons5'
import { encode, decode } from 'js-base64'
import Cookies from 'js-cookie'
import { getCode } from '@/api/user'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { checkBoxThemeOverrides, inputThemeOverrides, formThemeOverrides, rules } from '@/utils/constant/login/login'
import type { ModelType } from '@/types/components/login'

const userStore = useUserStore()
const { login } = userStore

const router = useRouter()

const formValue = ref<ModelType>({
  username: '',
  password: '',
  code: '',
  uuid: '',
  rememberMe: false
})
const codeUrl = ref('')
const formRef = ref<FormInst | null>(null)
const isBtnLoading: Ref<boolean> = ref(false)

// 登录处理
const handleLogin = () => {
  formRef.value?.validate(async (errors: Array<FormValidationError> | undefined) => {
    if (!errors) {
      // 验证成功进行登录
      isBtnLoading.value = true
      const { username, password, code, uuid, rememberMe } = formValue.value
      // 记住账密
      switch (rememberMe) {
        case true: {
          const encodeUserName = encode(username!)
          const encodePassword = encode(password!)
          const localForm = {
            un: encodeUserName,
            p: encodePassword
          }
          Cookies.set('unp', JSON.stringify(localForm), { expires: 7 })
          break
        }
        default: {
          Cookies.remove('unp')
        }
      }
      try {
        await login({ username, password, code, uuid })
        await router.push({ path: '/event' })
      } catch (e) {
        await getCodeImg()
      }
      isBtnLoading.value = false
    }
  })
  isBtnLoading.value = false
}

// 查找存储的数据
const queryLocalForm = (): void => {
  const localForm = Cookies.get('unp')
  if (localForm) {
    formValue.value.rememberMe = true
    try {
      const { un, p } = JSON.parse(localForm)
      formValue.value.username = decode(un)
      formValue.value.password = decode(p)
    } catch (error) {
      // console.error('本地数据解析失败', error)
    }
  } else {
    formValue.value.rememberMe = false
  }
}

const getCodeImg = async (): Promise<void> => {
  try {
    const {
      data: {
        img,
        uuid
      }
    } = await getCode()
    codeUrl.value = 'data:image/gif;base64,' + img
    formValue.value.uuid = uuid
  } catch (e) {
    //
  }
}

onMounted(() => {
  getCodeImg()
  queryLocalForm()
})
</script>

<template>
  <!--  登录页设置自身的主题变量，避免被全局主题变量改变样式-->
  <n-config-provider :theme="lightTheme">
    <div class="form-container">
      <n-form
        ref="formRef"
        class="login-form"
        size="large"
        :model="formValue"
        :rules="rules"
        :show-label="false"
        :theme-overrides="formThemeOverrides"
      >
        <n-form-item
          path="username"
        >
          <n-input
            class="form-input"
            placeholder="请输入账号"
            v-model:value="formValue.username"
            @keydown.enter.prevent
            :theme-overrides="inputThemeOverrides"
          >
            <template #prefix>
              <n-icon
                :component="Person"
              />
            </template>
          </n-input>
        </n-form-item>
        <n-form-item
          path="password"
        >
          <n-input
            class="form-input"
            placeholder="请输入密码"
            v-model:value="formValue.password"
            type="password"
            @keydown.enter.prevent
            :theme-overrides="inputThemeOverrides"
          >
            <template #prefix>
              <n-icon
                :component="LockOpen"
              />
            </template>
          </n-input>
        </n-form-item>
        <n-form-item
          path="code"
        >
          <n-input
            class="form-input form-code-input"
            placeholder="请输入验证码"
            v-model:value="formValue.code"
            @keydown.enter.prevent="handleLogin"
            :theme-overrides="inputThemeOverrides"
          >
            <template #prefix>
              <n-icon
                :component="LockOpen"
              />
            </template>
          </n-input>
          <n-image
            class="form-code"
            height="40"
            :src="codeUrl"
            preview-disabled
            @click="getCodeImg"
          />
        </n-form-item>
        <n-form-item
          :show-feedback="false"
        >
          <n-checkbox
            v-model:checked="formValue.rememberMe"
            :theme-overrides="checkBoxThemeOverrides"
          >
            记住我
          </n-checkbox>
        </n-form-item>
        <n-form-item>
          <n-button
            type="info"
            style="width: 100%;margin-top: 10px;"
            :loading="isBtnLoading"
            @click.prevent="handleLogin"
          >
            登录
          </n-button>
        </n-form-item>
      </n-form>
    </div>
  </n-config-provider>
</template>

<style scoped lang="scss">
.form-container {
  position: absolute;
  left: 50%;
  top: 40%;
  transform: translate(-50%, -50%);
  width: 20%;
  min-width: 300px;
  max-width: 400px;

  .login-form {
    .form-input {
      background: rgba(0,0,0,.1);
    }

    .form-code-input {
      margin-right: 10px;
    }

    .form-code {
      border-radius: 5px;
    }
  }
}
</style>