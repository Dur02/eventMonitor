<script setup lang="ts">
import type { Ref } from 'vue'
import { onMounted, ref, watch } from 'vue'
import type { FormInst, SelectOption, SelectGroupOption, TreeSelectOption } from 'naive-ui'
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
  NCheckbox,
  NTreeSelect
} from 'naive-ui'
import { Calendar, Grid, Calculator, People, DocumentText, Save, Folder } from '@vicons/ionicons5'
import { IosApps } from '@vicons/ionicons4'
import { useRoute } from 'vue-router'
import { useFooterStore } from '@/stores/footer'
import { useEventStore } from '@/stores/event'
import { storeToRefs } from 'pinia'
import deepCopy from '@/utils/function/deepcopy'
import {
  cardThemeOverrides,
  formThemeOverrides,
  initialFormValue,
  rules,
  rootOptions
} from '@/utils/constant/event/display/eventDisplayForm'
import { getRegionCodeList } from '@/api/codeDict'
import { map, includes, filter } from 'lodash/fp'

const footerStore = useFooterStore()
const { selectedBtn, initialData } = storeToRefs(footerStore)

const eventStore = useEventStore()
const {
  actorCountryCodeList,
  actorTypeCode,
  baseCodeList,
  ethnicCode,
  eventCodeList,
  geoCountryCodeList,
  geoTypeList,
  knownGroupCode,
  quadClass,
  religionCode,
  rootCodeList
} = storeToRefs(eventStore)
const { getAllEventCodeList } = eventStore

const route = useRoute()

const disabled = ref(false)
const formValue: Ref<any | null> = ref(null)
const formRef: Ref<FormInst | null> = ref(null)
const rootOption: Ref<Array<SelectOption | SelectGroupOption>> = ref([])
const baseOption: Ref<Array<SelectOption | SelectGroupOption>> = ref([])
const subOption: Ref<Array<SelectOption | SelectGroupOption>> = ref([])

// const renderOption = ({ node, option }: { node: VNode; option: SelectOption }) => {
//   return h(NTooltip, null, {
//     trigger: () => node,
//     default: () => option.label
//   })
// }

const handleRegionLoad = (option: TreeSelectOption): Promise<void> => {
  return new Promise<void>(async (resolve, reject) => {
    try {
      const { data } = await getRegionCodeList({ countryCode: option.key as string })
      option.children = map(({ regionCode, regionNameZh, regionName }) => ({
        label: `${regionNameZh}(${regionName})`,
        key: regionCode,
        isLeaf: true
      }))(data)
      resolve()
    } catch (e) {
      reject()
    }
  })
}

const handleClassUpdate = (value: number[]) => {
  formValue.value.event.type.root = ''
  formValue.value.event.type.base = ''
  formValue.value.event.type.sub = ''
  switch (value.length) {
    case 0: {
      rootOption.value = rootCodeList.value
      baseOption.value = []
      subOption.value = []
      break
    }
    default: {
      rootOption.value = filter((item: any) => includes(item.eventQuadClass as number)(value))(deepCopy(rootCodeList.value))
      baseOption.value = []
      subOption.value = []
      break
    }
  }
}

const handleRootUpdate = async (value: string[]) => {
  formValue.value.event.type.base = ''
  formValue.value.event.type.sub = ''
  switch (value.length) {
    case 0: {
      baseOption.value = []
      subOption.value = []
      break
    }
    default: {
      baseOption.value = filter((item: any) => includes(item.eventRootCode as string)(value))(deepCopy(baseCodeList.value))
      subOption.value = []
      break
    }
  }
}

const handleBaseUpdate = async (value: string[]) => {
  formValue.value.event.type.sub = ''
  switch (value.length) {
    case 0: {
      subOption.value = []
      break
    }
    default: {
      subOption.value = filter((item: any) => includes(item.eventBaseCode as string)(value))(deepCopy(eventCodeList.value))
      break
    }
  }
}

const handleValidateClick =  (e: MouseEvent) => {
  e.preventDefault()
  console.log(formValue.value)
  // const test = {
  //   country: flow(
  //     filter((item) => find(propEq('key', item))(deepcopy(geoCountryCodeList.value))),
  //     join(',')
  //   )(deepcopy(formValue.value.role.role1.state)),
  //   state: flow(
  //     map((item: any) => item.children),
  //     flatten,
  //     compact,
  //     filter(({ key }) => includes(key)(deepcopy(formValue.value.role.role1.state))),
  //     map((item) => item.key),
  //     join(',')
  //   )(deepcopy(geoCountryCodeList.value))
  // }
  // console.log(test)
  formRef.value?.validate((errors) => {
    if (!errors) {

    }
  })
}

onMounted(async () => {
  await getAllEventCodeList()
  rootOption.value = rootCodeList.value
})

watch(
  () => selectedBtn.value,
  () => {
    switch (Boolean(selectedBtn.value)) {
      case true:
        disabled.value = true
        formValue.value = deepCopy(initialData.value)
        break
      default:
        disabled.value = false
        formValue.value = deepCopy(initialFormValue)
        const end = new Date()
        const start = new Date()
        start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
        formValue.value.date = [start, end]
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
    :style="{
      maxHeight: '440px',
      border: '1px solid var(--n-border-color)',
      borderRadius: '3px',
    }"
  >
    <n-card
      :bordered="false"
      :theme-overrides="cardThemeOverrides"
    >
      <n-form
        ref="formRef"
        class="form"
        :disabled="disabled"
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
        <n-form-item path="date" label-style="font-weight: 600;">
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
        <n-form-item path="dataSource" label-style="font-weight: 600;">
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
        <n-form-item
          v-if="route.name !== 'eventDisplay'"
          path="weight"
          label-style="font-weight: 600;"
        >
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
        <n-form-item
          v-if="route.name !== 'eventDisplay'"
          path="statistics"
          label-style="font-weight: 600;"
        >
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
        <n-form-item :show-feedback="false" label-style="font-weight: 600;">
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <people />
              </n-icon>
              <span>角色属性</span>
            </div>
          </template>
          <n-grid :cols="24">
            <n-form-item-gi
              :span="24"
              label="角色1"
              label-width="60"
              label-style="font-weight: 600;"
              :show-feedback="false"
            >
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="国家(地区)" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.country"
                    :options="actorCountryCodeList"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="组织" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.organization"
                    :options="knownGroupCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="宗教1" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.religion1"
                    :options="religionCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="宗教2" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.religion2"
                    :options="religionCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种族" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.race"
                    :options="ethnicCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类1" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.type1"
                    :options="actorTypeCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类2" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.type2"
                    :options="actorTypeCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类3" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.type3"
                    :options="actorTypeCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-gi span="24 m:18" style="margin-left: 80px;">
                  <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
                </n-gi>
                <n-form-item-gi span="18" label="角色全称" label-width="80">
                  <n-input v-model:value="formValue.event.place.fullyGeographic" />
                </n-form-item-gi>
                <n-form-item-gi span="6">
                  <n-checkbox v-model:checked="formValue.role.role1.caseSensitive">
                    区分大小写
                  </n-checkbox>
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="地理类型" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role1.geographicFeature"
                    :options="geoTypeList"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="国家/州省" label-width="80">
                  <n-tree-select
                    v-model:value="formValue.role.role1.state"
                    :options="geoCountryCodeList"
                    multiple
                    max-tag-count="responsive"
                    check-strategy="all"
                    :on-load="handleRegionLoad"
                    show-path
                    checkable
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-gi span="24 m:18" style="margin-left: 80px;">
                  <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
                </n-gi>
                <n-form-item-gi span="18" label="地理全称" label-width="80">
                  <n-input v-model:value="formValue.role.role1.fullyGeographic" />
                </n-form-item-gi>
                <n-form-item-gi span="6">
                  <n-checkbox v-model:checked="formValue.role.role1.caseSensitive">
                    区分大小写
                  </n-checkbox>
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
            <n-form-item-gi
              :span="24"
              label="角色2"
              label-width="60"
              label-style="font-weight: 600;"
              :show-feedback="false"
            >
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="国家(地区)" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.country"
                    :options="actorCountryCodeList"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="组织" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.organization"
                    :options="knownGroupCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="宗教1" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.religion1"
                    :options="religionCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="宗教2" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.religion2"
                    :options="religionCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种族" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.race"
                    :options="ethnicCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类1" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.type1"
                    :options="actorTypeCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类2" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.type2"
                    :options="actorTypeCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="种类3" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.type3"
                    :options="actorTypeCode"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-gi span="24 m:18" style="margin-left: 80px;">
                  <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
                </n-gi>
                <n-form-item-gi span="18" label="角色全称" label-width="80">
                  <n-input v-model:value="formValue.event.place.fullyGeographic" />
                </n-form-item-gi>
                <n-form-item-gi span="6">
                  <n-checkbox v-model:checked="formValue.role.role2.caseSensitive">
                    区分大小写
                  </n-checkbox>
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="地理类型" label-width="80">
                  <n-select
                    v-model:value="formValue.role.role2.geographicFeature"
                    :options="geoTypeList"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="国家/州省" label-width="80">
                  <n-tree-select
                    v-model:value="formValue.role.role2.state"
                    :options="geoCountryCodeList"
                    multiple
                    max-tag-count="responsive"
                    check-strategy="all"
                    :on-load="handleRegionLoad"
                    show-path
                    checkable
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-gi span="24 m:18" style="margin-left: 80px;">
                  <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
                </n-gi>
                <n-form-item-gi span="18" label="地理全称" label-width="80">
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
        <n-form-item :show-feedback="false" label-style="font-weight: 600;">
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <document-text />
              </n-icon>
              <span>事件属性</span>
            </div>
          </template>
          <n-grid :cols="24">
            <n-form-item-gi :span="24" label="类型" label-width="60" label-style="font-weight: 600;" :show-feedback="false">
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="大类" label-width="80">
                  <n-select
                    v-model:value="formValue.event.type.class"
                    :options="quadClass"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                    @update:value="handleClassUpdate"
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="根类" label-width="80">
                  <n-select
                    v-model:value="formValue.event.type.root"
                    :options="rootOption"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                    @update:value="handleRootUpdate"
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="基类" label-width="80">
                  <n-select
                    v-model:value="formValue.event.type.base"
                    :options="baseOption"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                    @update:value="handleBaseUpdate"
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="子类" label-width="80">
                  <n-select
                    v-model:value="formValue.event.type.sub"
                    :options="subOption"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
            <n-form-item-gi :span="24" label="发生地" label-width="60" label-style="font-weight: 600;" :show-feedback="false">
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="地理类型" label-width="80">
                  <n-select
                    v-model:value="formValue.event.place.geographicFeature"
                    :options="geoTypeList"
                    multiple
                    max-tag-count="responsive"
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="国家/州省" label-width="80">
                  <n-tree-select
                    v-model:value="formValue.event.place.state"
                    :options="geoCountryCodeList"
                    multiple
                    max-tag-count="responsive"
                    check-strategy="all"
                    :on-load="handleRegionLoad"
                    show-path
                    checkable
                    filterable
                    clearable
                  />
                </n-form-item-gi>
                <n-gi span="24 m:18" style="margin-left: 80px;">
                  <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
                </n-gi>
                <n-form-item-gi span="18" label="地理全称" label-width="80">
                  <n-input v-model:value="formValue.event.place.fullyGeographic" />
                </n-form-item-gi>
                <n-form-item-gi span="6">
                  <n-checkbox v-model:checked="formValue.event.place.caseSensitive">
                    区分大小写
                  </n-checkbox>
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
            <n-form-item-gi :span="24" label="其他" label-width="60" label-style="font-weight: 600;" :show-feedback="false">
              <n-grid :cols="24" :x-gap="15" item-responsive responsive="screen">
                <n-form-item-gi span="24 m:6" label="源url" label-width="80">
                  <n-input v-model:value="formValue.event.other.sourceUrl" />
                </n-form-item-gi>
                <n-form-item-gi span="24 m:6" label="情感值" label-width="80">
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
                <n-form-item-gi span="24 m:6" label="影响度" label-width="80">
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
                <n-form-item-gi span="24 m:6" label="是否根类" label-width="80">
                  <n-select v-model:value="formValue.event.other.isRoot" :options="rootOptions" />
                </n-form-item-gi>
              </n-grid>
            </n-form-item-gi>
          </n-grid>
        </n-form-item>
        <n-form-item
          v-if="!selectedBtn"
          label-style="font-weight: 600;"
        >
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <save />
              </n-icon>
              <span>是否保存</span>
            </div>
          </template>
          <n-radio-group v-model:value="formValue.dataSource">
            <n-space>
              <n-radio :value="true">
                是
              </n-radio>
              <n-radio :value="false">
                否
              </n-radio>
            </n-space>
          </n-radio-group>
        </n-form-item>
        <n-form-item
          v-if="!selectedBtn"
          label-style="font-weight: 600;"
        >
          <template #label>
            <div class="icon-label">
              <n-icon class="icon" size="20">
                <folder />
              </n-icon>
              <span>配置名称</span>
            </div>
          </template>
          <n-input v-model:value="formValue.event.place.fullyGeographic" style="max-width: 300px;" />
        </n-form-item>
        <n-form-item
          class="btn-container"
          :show-feedback="false"
          v-if="!selectedBtn"
        >
          <n-space class="space-box">
            <n-button type="info" @click="handleValidateClick">
              提交
            </n-button>
          </n-space>
        </n-form-item>
      </n-form>
    </n-card>
  </n-scrollbar>
</template>

<style scoped lang="scss">
.form {
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