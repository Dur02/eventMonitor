<script setup lang="ts">
import type { Ref } from 'vue'
import { reactive, ref, shallowRef, toRaw, toRef, unref, watch } from 'vue'
import type { FormInst, FormProps, FormRules, CardProps, SelectOption, SelectGroupOption } from 'naive-ui'
import {
  NForm,
  NFormItem,
  NFormItemGi,
  NInput,
  NInputNumber,
  NButton,
  NCard,
  NScrollbar,
  NDatePicker,
  NIcon,
  NRadioGroup,
  NRadio,
  NSpace,
  NGrid,
  NGi,
  NSelect,
  NCheckbox
} from 'naive-ui'
import { Calendar, Grid, Calculator, People, DocumentText } from '@vicons/ionicons5'
import { IosApps } from '@vicons/ionicons4'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia';
import deepCopy from '@/utils/function/deepcopy'

type CardThemeOverrides = NonNullable<CardProps['themeOverrides']>
type FormThemeOverrides = NonNullable<FormProps['themeOverrides']>

const cardThemeOverrides: CardThemeOverrides = {
  paddingMedium: '15px 20px'
}

const formThemeOverrides: FormThemeOverrides = {
  blankHeightMedium: '10px'
}

const initialFormValue = {
  date: null,
  dataSource: 'dataSource1',
  weight: 'weight1',
  statistics: 'statistics1',
  role: {
    role1: {
      country: '即时查询',
      organization: '',
      religion1: '',
      religion2: '',
      race: '',
      type1: '',
      type2: '',
      type3: '',
      geographicFeature: null,
      state: '',
      fullyGeographic: '',
      caseSensitive: true
    },
    role2: {
      country: '',
      organization: '',
      religion1: '',
      religion2: '',
      race: '',
      type1: '',
      type2: '',
      type3: '',
      geographicFeature: null,
      state: '',
      fullyGeographic: '',
      caseSensitive: true
    }
  },
  event: {
    type: {
      class: '',
      root: '',
      base: '',
      sub: ''
    },
    place: {
      geographicFeature: null,
      state: '',
      fullyGeographic: '',
      caseSensitive: true
    },
    other: {
      sourceUrl: '',
      emotion: [],
      effect: [],
      isRoot: null
    }
  }
}

const rules: FormRules = {
  date: {
    type: 'array',
    required: true,
    message: '请选择日期',
    trigger: ['change', 'blur']
  },
  dataSource: {
    required: true,
    message: '请选择数据源',
    trigger: ['input', 'blur']
  },
  weight: {
    required: true,
    message: '请选择权重依据',
    trigger: ['input', 'blur']
  },
  statistics: {
    required: true,
    message: '请选择统计依据',
    trigger: ['input', 'blur']
  }
}

const geoOptions: Array<SelectOption | SelectGroupOption> = [
  {
    label: 'Drive My Car',
    value: 'geographicFeature1'
  },
  {
    label: 'Norwegian Wood',
    value: 'geographicFeature2'
  },
  {
    label: 'Nowhere Man',
    value: 'geographicFeature3'
  }
]

const rootOptions: Array<SelectOption | SelectGroupOption> = [
  {
    label: '是',
    value: 'true'
  },
  {
    label: '否',
    value: 'false'
  }
]

const footerStore = useFooterStore()
const { selectedBtn, initialData } = storeToRefs(footerStore)
const { setInitialData } = footerStore

const formValue: Ref<any | null> = ref(null)
const formRef: Ref<FormInst | null> = ref(null)

const handleValidateClick =  (e: MouseEvent) => {
  e.preventDefault()
  console.log(formValue.value === initialData.value)
  formRef.value?.validate((errors) => {
    if (!errors) {

    }
  })
}

watch(
  () => selectedBtn.value,
  () => {
    switch (Boolean(selectedBtn.value)) {
      case true:
        formValue.value = deepCopy(initialData.value)
        break
      default:
        formValue.value = deepCopy(initialFormValue)
        break
    }
  },
  {
    immediate: true
  }
)

defineExpose({
  restoreValidation: () => {
    formRef.value?.restoreValidation()
  }
})
</script>

<template>
  <n-scrollbar
    class="scroll-box"
    :style="{
      maxHeight: '440px',
      border: '1px solid var(--n-border-color)',
      borderRadius: '3px'
    }"
  >
    <n-card
      :bordered="false"
      :theme-overrides="cardThemeOverrides"
    >
      <n-form
        ref="formRef"
        class="database-form"
        :label-width="110"
        :model="formValue"
        :rules="rules"
        size="medium"
        label-placement="left"
        label-align="left"
        :theme-overrides="formThemeOverrides"
        :show-require-mark="false"
      >
        <p style="margin: 0 0 5px 110px;">当前数据库时间范围: 2011-01-04 至 2023-08-01</p>
        <n-form-item path="date">
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <calendar />
              </n-icon>
              <span>日期属性</span>
            </div>
          </template>
          <n-date-picker
            v-model:value="formValue.date"
            type="daterange"
            :actions="null"
            :is-date-disabled="(ts: number) => ts > Date.now()"
            update-value-on-close
            clearable
          />
        </n-form-item>
        <n-form-item path="dataSource">
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <grid />
              </n-icon>
              <span>数据源</span>
            </div>
          </template>
          <n-radio-group v-model:value="formValue.dataSource">
            <n-space>
              <n-radio value="dataSource1">
                数据源1
              </n-radio>
              <n-radio value="dataSource2">
                数据源2
              </n-radio>
              <n-radio value="dataSource3">
                数据源3
              </n-radio>
            </n-space>
          </n-radio-group>
        </n-form-item>
        <n-form-item path="weight">
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <ios-apps />
              </n-icon>
              <span>权重依据</span>
            </div>
          </template>
          <n-radio-group v-model:value="formValue.weight">
            <n-space>
              <n-radio value="weight1">
                事件数
              </n-radio>
              <n-radio value="weight2">
                文章数
              </n-radio>
              <n-radio value="weight3">
                信源数
              </n-radio>
              <n-radio value="weight4">
                事件数(去重)
              </n-radio>
            </n-space>
          </n-radio-group>
        </n-form-item>
        <n-form-item path="statistics">
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <calculator />
              </n-icon>
              <span>统计依据</span>
            </div>
          </template>
          <n-radio-group v-model:value="formValue.statistics">
            <n-space>
              <n-radio value="statistics1">
                比重
              </n-radio>
              <n-radio value="statistics2">
                数量
              </n-radio>
            </n-space>
          </n-radio-group>
        </n-form-item>
        <n-form-item :show-feedback="false">
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <people />
              </n-icon>
              <span>角色属性</span>
            </div>
          </template>
          <n-grid :cols="24">
            <n-form-item-gi :span="24" label="角色1" label-width="60" :show-feedback="false">
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="国家(地区)" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.country" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="组织" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.organization" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="宗教1" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.religion1" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="宗教2" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.religion2" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种族" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.race" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类1" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.type1" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类2" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.type2" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类3" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.type3" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="地理类型" label-width="80" label-align="center">
                  <n-select v-model:value="formValue.role.role1.geographicFeature" :options="geoOptions" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="国家/州省" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.state" />
                </n-form-item-gi>
                <n-gi span="24 m:18" style="margin-left: 80px;">
                  <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
                </n-gi>
                <n-form-item-gi span="18" label="地理全称" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role1.fullyGeographic" />
                </n-form-item-gi>
                <n-form-item-gi span="6">
                  <n-checkbox v-model:checked="formValue.role.role1.caseSensitive">
                    区分大小写
                  </n-checkbox>
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
            <n-form-item-gi :span="24" label="角色2" label-width="60" :show-feedback="false">
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="国家(地区)" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.country" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="组织" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.organization" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="宗教1" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.religion1" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="宗教2" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.religion2" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种族" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.race" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类1" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.type1" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类2" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.type2" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类3" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.type3" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="地理类型" label-width="80" label-align="center">
                  <n-select v-model:value="formValue.role.role2.geographicFeature" :options="geoOptions" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="国家/州省" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.state" />
                </n-form-item-gi>
                <n-gi span="24 m:18" style="margin-left: 80px;">
                  <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
                </n-gi>
                <n-form-item-gi span="18" label="地理全称" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.role.role2.fullyGeographic" />
                </n-form-item-gi>
                <n-form-item-gi span="6">
                  <n-checkbox v-model:checked="formValue.role.role2.caseSensitive">
                    区分大小写
                  </n-checkbox>
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
          </n-grid>
        </n-form-item>
        <n-form-item>
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <document-text />
              </n-icon>
              <span>事件属性</span>
            </div>
          </template>
          <n-grid :cols="24">
            <n-form-item-gi :span="24" label="类型" label-width="60" :show-feedback="false">
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="大类" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.event.type.class" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="根类" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.event.type.root" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="基类" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.event.type.base" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="子类" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.event.type.sub" />
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
            <n-form-item-gi :span="24" label="发生地" label-width="60" :show-feedback="false">
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="地理类型" label-width="80" label-align="center">
                  <n-select v-model:value="formValue.event.place.geographicFeature" :options="geoOptions" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="国家/州省" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.event.place.state" />
                </n-form-item-gi>
                <n-gi span="24 m:18" style="margin-left: 80px;">
                  <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
                </n-gi>
                <n-form-item-gi span="18" label="地理全称" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.event.place.fullyGeographic" />
                </n-form-item-gi>
                <n-form-item-gi span="6">
                  <n-checkbox v-model:checked="formValue.event.place.caseSensitive">
                    区分大小写
                  </n-checkbox>
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
            <n-form-item-gi :span="24" label="其他" label-width="60" :show-feedback="false">
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="源url" label-width="80" label-align="center">
                  <n-input v-model:value="formValue.event.other.sourceUrl" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="情感值" label-width="80" label-align="center">
                  <n-input-number
                    v-model:value="formValue.event.other.emotion[0]"
                    :show-button="false"
                    :precision="0"
                    :min="-100"
                    :max="100"
                    style="padding-right: 5px;"
                  />
                  至
                  <n-input-number
                    v-model:value="formValue.event.other.emotion[1]"
                    :show-button="false"
                    :precision="0"
                    :min="-100"
                    :max="100"
                    style="padding-left: 5px;"
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="影响度" label-width="80" label-align="center">
                  <n-input-number
                    v-model:value="formValue.event.other.effect[0]"
                    :show-button="false"
                    :precision="0"
                    :min="-10"
                    :max="10"
                    style="padding-right: 5px;"
                  />
                  至
                  <n-input-number
                    v-model:value="formValue.event.other.effect[1]"
                    :show-button="false"
                    :precision="0"
                    :min="-10"
                    :max="10"
                    style="padding-left: 5px;"
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="是否根类" label-width="80" label-align="center">
                  <n-select v-model:value="formValue.event.other.isRoot" :options="rootOptions" />
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
          </n-grid>
        </n-form-item>
        <n-form-item class="btn-container" :show-feedback="false">
          <n-space class="space-box">
            <n-button type="success" attr-type="button" @click="handleValidateClick">
              保存
            </n-button>
            <n-button type="info" attr-type="button" @click="handleValidateClick">
              提交
            </n-button>
          </n-space>
        </n-form-item>
      </n-form>
    </n-card>
  </n-scrollbar>
</template>

<style scoped lang="scss">
.database-form {
  .icon-label {
    display: flex;
    align-items: center;

    .icon {
      padding-right: 7px;
    }
  }

  .btn-container {
    .space-box {
      margin: 0 auto;
    }
  }
}
</style>