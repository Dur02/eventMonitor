<script setup lang="ts">
import {
  type Ref,
  ref, onBeforeMount,
} from 'vue'

import {
  type FormProps, type InputProps, type CheckboxProps, type FormRules, type FormInst, type FormValidationError,
  NForm, NFormItem, NInput, NIcon, NCheckbox, NButton,
} from 'naive-ui'

import { Person, LockOpen } from '@vicons/ionicons5'
import Cookies from 'js-cookie'
import { encode, decode } from 'js-base64'

type FormThemeOverrides = NonNullable<FormProps['themeOverrides']>
type InputThemeOverrides = NonNullable<InputProps['themeOverrides']>
type CheckBoxThemeOverrides = NonNullable<CheckboxProps['themeOverrides']>

interface ModelType {
  username: string | null
  password: string | null
  rememberMe: boolean
}

const model = ref<ModelType>({
  username: null,
  password: null,
  rememberMe: false
})

const formRef = ref<FormInst | null>(null)
const isBtnLoading: Ref<boolean> = ref(false)

const formThemeOverrides: FormThemeOverrides = {
  blankHeightMedium: '30px'
}

const inputThemeOverrides: InputThemeOverrides = {
  colorFocus: 'rgba(0, 0, 0, 0.1)',
  colorFocusError: 'rgba(0, 0, 0, 0.1)',
  textColor: 'rgba(255, 255, 255, 1)'
}

const checkBoxThemeOverrides: CheckBoxThemeOverrides = {
  textColor: 'rgba(255, 255, 255, 1)'
}

const rules: FormRules = {
  username: [
    { required: true, message: '请输入账号', trigger: ['input', 'blur'] }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: ['input', 'blur'] }
  ]
}

// 登录处理
const handleLogin = () => {
  isBtnLoading.value = true
  formRef.value?.validate((errors: Array<FormValidationError> | undefined) => {
    if (!errors) {
      // 验证成功进行登录
      try {
        const { username, password, rememberMe } = model.value
        // 登录请求
        if (rememberMe) {
          const encodeUserName = encode(username!)
          const encodePassword = encode(password!)
          const localForm = {
            un: encodeUserName,
            p: encodePassword
          }
          Cookies.set('unp', JSON.stringify(localForm))
        } else {
          Cookies.remove('unp')
        }
      } catch (e) {
        //
      }
    }
  })
  isBtnLoading.value = false
}

// 查找存储的数据
const queryLocalForm = (): void => {
  const localForm = Cookies.get('unp')
  if (localForm) {
    model.value.rememberMe = true
    try {
      const { un, p } = JSON.parse(localForm)
      model.value.username = decode(un)
      model.value.password = decode(p)
    } catch (error) {
      console.error('本地数据解析失败', error)
    }
  } else {
    model.value.rememberMe = false
  }
}

onBeforeMount(() => {
  queryLocalForm()
})
</script>

<template>
  <div class="form-container">
    <n-form
      ref="formRef"
      class="login-form"
      size="large"
      :model="model"
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
          v-model:value="model.username"
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
          v-model:value="model.password"
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
        :show-feedback="false"
      >
        <n-checkbox
          v-model:checked="model.rememberMe"
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
</template>

<style scoped lang="scss">
.form-container {
  position: absolute;
  left: 50%;
  top: 40%;
  transform: translate(-50%, -50%);
  width: 20%;
  min-width: 200px;
  max-width: 400px;

  .login-form {
    .form-input {
      background: rgba(0,0,0,.1);
    }
  }
}
</style>