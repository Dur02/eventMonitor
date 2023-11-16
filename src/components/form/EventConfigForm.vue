<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, onMounted, watch } from 'vue'
import type { FormInst, SelectOption, SelectGroupOption, TreeSelectOption } from 'naive-ui'
import {
  NForm,
  NFormItem,
  NFormItemGi,
  NInput,
  NInputNumber,
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
import { Calendar, Grid, Calculator, People, DocumentText } from '@vicons/ionicons5'
import { IosApps } from '@vicons/ionicons4'
// import { formThemeOverrides } from '@/utils/themeOverrides/common'
import { rootOptions, eventConfigFormRules } from '@/utils/constant/form/eventConfigForm'
import { useConstantStore } from '@/stores/constant'
import { storeToRefs } from 'pinia'
import { getRegionCodeList } from '@/api/eventCodeDict'
import { filter, includes, map } from 'lodash/fp'
import deepCopy from '@/utils/function/deepcopy'
import type { eventConfigFormInitialValueType } from '@/types/components/config/event'
import { renderOption } from '@/utils/function/renderOption'
import { formatTimeStamp } from '@/utils/function/date'

const props = defineProps<{
  initialValue: eventConfigFormInitialValueType,
  configType: string[] | null,
  formDisabled: boolean
}>()

const eventStore = useConstantStore()
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

const formValue: Ref<eventConfigFormInitialValueType> = ref(deepCopy(props.initialValue) as eventConfigFormInitialValueType)
// const displayDate: Ref<string[]> = ref([])
const formRef: Ref<FormInst | null> = ref(null)
const rootOption: Ref<Array<SelectOption | SelectGroupOption>> = ref([])
const baseOption: Ref<Array<SelectOption | SelectGroupOption>> = ref([])
const subOption: Ref<Array<SelectOption | SelectGroupOption>> = ref([])

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
  formValue.value.eventrootcode = []
  formValue.value.eventbasecode = []
  formValue.value.eventcode= []
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
  formValue.value.eventbasecode = []
  formValue.value.eventcode = []
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
  formValue.value.eventcode = []
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

defineExpose({
  formRef,
  formValue
})

onMounted(async () => {
  await getAllEventCodeList()
  rootOption.value = rootCodeList.value
})

watch(
  () => props.initialValue,
  () => {
    formRef.value?.restoreValidation()
    formValue.value = deepCopy(props.initialValue)
    if (!formValue.value.sqldate) {
      const end = new Date()
      const start = new Date()
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
      formValue.value.sqldate = [start.getTime(), end.getTime()]
    }
    // displayDate.value = [formatTimeStamp(formValue.value.sqldate[0]), formatTimeStamp(formValue.value.sqldate[1])]
  },
  {
    immediate: true
  }
)
</script>

<template>
  <n-form
    ref="formRef"
    class="form"
    :disabled="formDisabled"
    :rules="eventConfigFormRules"
    :model="formValue"
    size="medium"
    label-placement="left"
    label-align="left"
    label-width="80"
    :show-require-mark="false"
  >
    <p style="margin: 0 0 5px 110px;">当前数据库时间范围: 1971-01-01 至 {{ formatTimeStamp(new Date().getTime()) }}</p>
    <n-form-item
      path="sqldate"
      label-style="font-weight: 600;"
      label-width="110"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <calendar />
          </n-icon>
          <span>日期属性</span>
        </div>
      </template>
      <n-date-picker
        v-model:value="formValue.sqldate"
        type="daterange"
        :actions="null"
        :is-date-disabled="(ts: number) => ts > Date.now()"
        update-value-on-close
        clearable
      />
    </n-form-item>
    <n-form-item
      path="dataSource"
      label-style="font-weight: 600;"
      label-width="110"
    >
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
<!--    v-if="!includes('event_show_viz')(configType)"-->
    <n-form-item
      path="weightBasis"
      label-style="font-weight: 600;"
      label-width="110"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <ios-apps />
          </n-icon>
          <span>权重依据</span>
        </div>
      </template>
      <n-radio-group v-model:value="formValue.weightBasis">
        <n-space>
          <n-radio :value="4">
            事件数
          </n-radio>
          <n-radio :value="1">
            提及数
          </n-radio>
          <n-radio :value="2">
            文章数
          </n-radio>
          <n-radio :value="3">
            信源数
          </n-radio>
        </n-space>
      </n-radio-group>
    </n-form-item>
<!--    v-if="intersection(configType, ['event_timeline_viz', 'event_timeline_type_viz', 'event_timeline_geo_viz', 'event_tone_scale_viz']).length !== 0"-->
    <n-form-item
      path="statisticsBasis"
      label-style="font-weight: 600;"
      label-width="110"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <calculator />
          </n-icon>
          <span>统计依据</span>
        </div>
      </template>
      <n-radio-group v-model:value="formValue.statisticsBasis">
        <n-space>
          <n-radio :value="2">
            数量
          </n-radio>
          <n-radio :value="1">
            比重
          </n-radio>
        </n-space>
      </n-radio-group>
    </n-form-item>
<!--    v-if="!includes('event_country_monitor')(configType)"-->
<!--    v-if="intersection(configType, ['event_country_monitor']).length === 0"-->
    <n-form-item
      :show-feedback="false"
      label-style="font-weight: 600;"
      label-width="110"
    >
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
          <n-grid
            cols="2 600:3 800:4"
            :x-gap="15"
            item-responsive
            responsive="self"
          >
            <n-form-item-gi
              span="1"
              label="国家(地区)"
            >
              <n-select
                v-model:value="formValue.actor1countrycode"
                :options="actorCountryCodeList"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="组织"
            >
              <n-select
                v-model:value="formValue.actor1knowngroupcode"
                :options="knownGroupCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="宗教1"
            >
              <n-select
                v-model:value="formValue.actor1religion1code"
                :options="religionCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="宗教2"
            >
              <n-select
                v-model:value="formValue.actor1religion2code"
                :options="religionCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="种族"
            >
              <n-select
                v-model:value="formValue.actor1ethniccode"
                :options="ethnicCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="种类1"
            >
              <n-select
                v-model:value="formValue.actor1type1code"
                :options="actorTypeCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="种类2"
            >
              <n-select
                v-model:value="formValue.actor1type2code"
                :options="actorTypeCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="种类3"
            >
              <n-select
                v-model:value="formValue.actor1type3code"
                :options="actorTypeCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-gi
              span="4"
              style="margin-left: 80px;"
            >
              <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
            </n-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="3"
              label="角色全称"
            >
              <n-input
                v-model:value="formValue.actor1name"
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
            >
              <n-checkbox
                :checked="formValue.actor1nameIsBig === 0"
                @update:checked="(checked) => {
                  checked ? formValue.actor1nameIsBig = 0 : formValue.actor1nameIsBig = 1
                }"
              >
                区分大小写
              </n-checkbox>
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="2"
              label="地理类型"
            >
              <n-select
                v-model:value="formValue.actor1geoType"
                :options="geoTypeList"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="2"
              label="国家/州省"
            >
              <n-tree-select
                v-model:value="formValue.actor1geoCountrycodeAndAdm1code"
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
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-gi
              span="4"
              style="margin-left: 80px;"
            >
              <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
            </n-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="3"
              label="地理全称"
            >
              <n-input v-model:value="formValue.actor1geoFullname" />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
            >
              <n-checkbox
                :checked="formValue.actor1geoFullnameIsBig === 0"
                @update:checked="(checked) => {
                  checked ? formValue.actor1geoFullnameIsBig = 0 : formValue.actor1geoFullnameIsBig = 1
                }"
              >
                区分大小写
              </n-checkbox>
            </n-form-item-gi>
          </n-grid>
        </n-form-item-gi>
<!--        v-if="!includes('event_country_monitor')(configType)"-->
        <n-form-item-gi
          :span="24"
          label="角色2"
          label-width="60"
          label-style="font-weight: 600;"
          :show-feedback="false"
        >
          <n-grid
            cols="2 600:3 800:4"
            :x-gap="15"
            item-responsive
            responsive="self"
          >
            <n-form-item-gi
              span="1"
              label="国家(地区)"
            >
              <n-select
                v-model:value="formValue.actor2countrycode"
                :options="actorCountryCodeList"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="组织"
            >
              <n-select
                v-model:value="formValue.actor2knowngroupcode"
                :options="knownGroupCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="宗教1"
            >
              <n-select
                v-model:value="formValue.actor2religion1code"
                :options="religionCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="宗教2"
            >
              <n-select
                v-model:value="formValue.actor2religion2code"
                :options="religionCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="种族"
            >
              <n-select
                v-model:value="formValue.actor2ethniccode"
                :options="ethnicCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="种类1"
            >
              <n-select
                v-model:value="formValue.actor2type1code"
                :options="actorTypeCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="种类2"
            >
              <n-select
                v-model:value="formValue.actor2type2code"
                :options="actorTypeCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
              label="种类3"
            >
              <n-select
                v-model:value="formValue.actor2type3code"
                :options="actorTypeCode"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-gi
              span="4"
              style="margin-left: 80px;"
            >
              <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
            </n-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="3"
              label="角色全称"
            >
              <n-input v-model:value="formValue.actor2name" />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
            >
              <n-checkbox
                :checked="formValue.actor2nameIsBig === 0"
                @update:checked="(checked) => {
                  checked ? formValue.actor2nameIsBig = 0 : formValue.actor2nameIsBig = 1
                }"
              >
                区分大小写
              </n-checkbox>
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="2"
              label="地理类型"
            >
              <n-select
                v-model:value="formValue.actor2geoType"
                :options="geoTypeList"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="2"
              label="国家/州省"
            >
              <n-tree-select
                v-model:value="formValue.actor2geoCountrycodeAndAdm1code"
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
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-gi
              span="4"
              style="margin-left: 80px;"
            >
              <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
            </n-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="3"
              label="地理全称"
            >
              <n-input v-model:value="formValue.actor2geoFullname" />
            </n-form-item-gi>
<!--            v-if="!includes('event_country_relation_viz')(configType)"-->
            <n-form-item-gi
              span="1"
            >
              <n-checkbox
                :checked="formValue.actor2geoFullnameIsBig === 0"
                @update:checked="(checked) => {
                  checked ? formValue.actor2geoFullnameIsBig = 0 : formValue.actor2geoFullnameIsBig = 1
                }"
              >
                区分大小写
              </n-checkbox>
            </n-form-item-gi>
          </n-grid>
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
<!--    v-if="intersection(configType, ['event_country_monitor', 'event_country_relation_viz']).length === 0"-->
    <n-form-item
      :show-feedback="false"
      label-style="font-weight: 600;"
      label-width="110"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <document-text />
          </n-icon>
          <span>事件属性</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          :span="24"
          label="类型"
          label-width="60"
          label-style="font-weight: 600;"
          :show-feedback="false"
        >
          <n-grid
            cols="2 600:3 800:4"
            :x-gap="15"
            item-responsive
            responsive="self"
          >
            <n-form-item-gi span="1" label="大类">
              <n-select
                v-model:value="formValue.quadclass"
                :options="quadClass"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
                @update:value="handleClassUpdate"
              />
            </n-form-item-gi>
            <n-form-item-gi span="1" label="根类">
              <n-select
                v-model:value="formValue.eventrootcode"
                :options="rootOption"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
                @update:value="handleRootUpdate"
              />
            </n-form-item-gi>
            <n-form-item-gi span="1" label="基类">
              <n-select
                v-model:value="formValue.eventbasecode"
                :options="baseOption"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
                @update:value="handleBaseUpdate"
              />
            </n-form-item-gi>
            <n-form-item-gi span="1" label="子类">
              <n-select
                v-model:value="formValue.eventcode"
                :options="subOption"
                :render-option="renderOption"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
          </n-grid>
        </n-form-item-gi>
        <n-form-item-gi
          :span="24"
          label="发生地"
          label-width="60"
          label-style="font-weight: 600;"
          :show-feedback="false"
        >
          <n-grid
            cols="2 600:3 800:4"
            :x-gap="15"
            item-responsive
            responsive="self"
          >
            <n-form-item-gi span="2" label="地理类型">
              <n-select
                v-model:value="formValue.actiongeoType"
                :options="geoTypeList"
                multiple
                max-tag-count="responsive"
                filterable
                clearable
              />
            </n-form-item-gi>
            <n-form-item-gi span="2" label="国家/州省">
              <n-tree-select
                v-model:value="formValue.actiongeoCountrycodeAndAdm1code"
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
            <n-gi span="4" style="margin-left: 80px;">
              <p style="margin: 5px 0">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用()表示一个主题优先级,例如(A && B && !D)||C</p>
            </n-gi>
            <n-form-item-gi span="3" label="地理全称">
              <n-input v-model:value="formValue.actiongeoFullname" />
            </n-form-item-gi>
            <n-form-item-gi span="1">
              <n-checkbox
                :checked="formValue.actiongeoFullnameIsBig === 0"
                @update:checked="(checked) => {
                  checked ? formValue.actiongeoFullnameIsBig = 0 : formValue.actiongeoFullnameIsBig = 1
                }"
              >
                区分大小写
              </n-checkbox>
            </n-form-item-gi>
          </n-grid>
        </n-form-item-gi>
        <n-form-item-gi
          :span="24"
          label="其他"
          label-width="60"
          label-style="font-weight: 600;"
          :show-feedback="false"
        >
          <n-grid
            cols="2 600:3 800:4"
            :x-gap="15"
            item-responsive
            responsive="self"
          >
            <n-form-item-gi span="1" label="源url">
              <n-input v-model:value="formValue.sourceUrl" />
            </n-form-item-gi>
            <n-form-item-gi span="1" label="情感值">
              <n-input-number
                v-model:value="formValue.beginAvgtone"
                :show-button="false"
                :precision="0"
                :min="-100"
                :max="100"
                style="padding-right: 5px;"
              />
              至
              <n-input-number
                v-model:value="formValue.endAvgtone"
                :show-button="false"
                :precision="0"
                :min="-100"
                :max="100"
                style="padding-left: 5px;"
              />
            </n-form-item-gi>
            <n-form-item-gi span="1" label="影响度">
              <n-input-number
                v-model:value="formValue.beginGoldsteinscale"
                :show-button="false"
                :precision="0"
                :min="-10"
                :max="10"
                style="padding-right: 5px;"
              />
              至
              <n-input-number
                v-model:value="formValue.endGoldsteinscale"
                :show-button="false"
                :precision="0"
                :min="-10"
                :max="10"
                style="padding-left: 5px;"
              />
            </n-form-item-gi>
            <n-form-item-gi span="1" label="是否根类">
              <n-select
                v-model:value="formValue.isrootevent"
                :options="rootOptions"
              />
            </n-form-item-gi>
          </n-grid>
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <n-form-item
      :show-feedback="false"
      label-style="font-weight: 600;"
      label-width="110"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <document-text />
          </n-icon>
          <span>权重值</span>
        </div>
      </template>
      <n-grid
        cols="2 600:3 800:4"
        x-gap="15"
      >
        <n-form-item-gi span="1" label="事件数" label-width="60">
          <n-input-number
            v-model:value="formValue.nummentionsMin"
            :show-button="false"
            :precision="0"
            :min="0"
            style="padding-right: 5px;"
          />
          至
          <n-input-number
            v-model:value="formValue.nummentionsMax"
            :show-button="false"
            :precision="0"
            :min="0"
            style="padding-left: 5px;"
          />
        </n-form-item-gi>
        <n-form-item-gi span="1" label="文章数" label-width="60">
          <n-input-number
            v-model:value="formValue.numarticlesMin"
            :show-button="false"
            :precision="0"
            :min="0"
            style="padding-right: 5px;"
          />
          至
          <n-input-number
            v-model:value="formValue.numarticlesMax"
            :show-button="false"
            :precision="0"
            :min="0"
            style="padding-left: 5px;"
          />
        </n-form-item-gi>
        <n-form-item-gi span="1" label="信源数" label-width="60">
          <n-input-number
            v-model:value="formValue.numsourcesMin"
            :show-button="false"
            :precision="0"
            :min="0"
            style="padding-right: 5px;"
          />
          至
          <n-input-number
            v-model:value="formValue.numsourcesMax"
            :show-button="false"
            :precision="0"
            :min="0"
            style="padding-left: 5px;"
          />
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
  </n-form>
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
}
</style>