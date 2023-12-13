<script setup lang="ts">
import type { FormInst } from 'naive-ui'
import {
  NForm,
  NFormItem,
  NFormItemGi,
  NInput,
  NCheckboxGroup,
  NDatePicker,
  NIcon,
  NRadioGroup,
  NRadio,
  NSpace,
  NGrid,
  NSelect,
  NCheckbox, NInputNumber
} from 'naive-ui'
import type { Ref } from 'vue'
import { ref, watch, computed } from 'vue'
import deepCopy from '@/utils/function/deepcopy'
import { formatTimeStamp } from '@/utils/function/date'
import type { graphConfigFormInitialValueType } from '@/types/components/form/graph'
import { Calculator, Calendar, Heart } from '@vicons/ionicons5'
import { IosApps } from '@vicons/ionicons4'
import { ObjectGroup } from '@vicons/fa'
import { CountertopsFilled, PersonSearchRound, ShareRound } from '@vicons/material'
import { Document, ApplicationWeb } from '@vicons/carbon'
import { Earth16Filled, Organization48Filled } from '@vicons/fluent'
import { useNewsStore } from '@/stores/news'
import { storeToRefs } from 'pinia'
import { useConstantStore } from '@/stores/constant'

const props = defineProps<{
  initialValue: graphConfigFormInitialValueType,
  configType: string[] | null,
  formDisabled: boolean,
  type?: 'normal' | 'news'
}>()

const newsStore = useNewsStore()
const { graphConfigFormValue } = storeToRefs(newsStore)

const constantStore = useConstantStore()
const { actorCountryCodeList } = storeToRefs(constantStore)

const getFormValueSource = computed(() => {
  return props.type === 'news' ? graphConfigFormValue.value : formValue.value
})

const formRef: Ref<FormInst | null> = ref(null)
const formValue: Ref<graphConfigFormInitialValueType> = ref(deepCopy(props.initialValue))

defineExpose({
  formRef,
  formValue
})

watch(
  () => props.initialValue,
  () => {
    formRef.value?.restoreValidation()
    formValue.value = deepCopy(props.initialValue)
    if (!formValue.value.sqldate && props.type !== 'news') {
      const end = new Date()
      const start = new Date()
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
      formValue.value.sqldate = [start.getTime(), end.getTime()]
    }
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
    :model="formValue"
    size="medium"
    label-placement="left"
    label-align="left"
    label-width="80"
    :show-require-mark="false"
  >
    <p style="margin: 0 0 5px 115px;">当前数据库时间范围: 1971-01-01 至 {{ formatTimeStamp(new Date().getTime()) }}</p>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <Calendar />
          </n-icon>
          <span>日期属性</span>
        </div>
      </template>
      <n-date-picker
        v-model:value="getFormValueSource.sqldate"
        type="daterange"
        :actions="null"
        :is-date-disabled="(ts: number) => ts > Date.now()"
        update-value-on-close
        clearable
      />
    </n-form-item>
    <n-form-item
      v-if="type !== 'news'"
      label-style="font-weight: 600;"
      label-width="115"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <IosApps />
          </n-icon>
          <span>权重依据</span>
        </div>
      </template>
      <n-radio-group v-model:value="getFormValueSource.weightBasis">
        <n-space>
          <n-radio :value="1">
            包含所选实体集的新闻报道数
          </n-radio>
          <n-radio :value="2">
            包含所选实体集的新闻报道数(NUMARTS)
          </n-radio>
        </n-space>
      </n-radio-group>
    </n-form-item>
    <n-form-item
      v-if="type !== 'news'"
      label-style="font-weight: 600;"
      label-width="115"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <Calculator />
          </n-icon>
          <span>统计依据</span>
        </div>
      </template>
      <n-radio-group v-model:value="getFormValueSource.statisticsBasis">
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
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <CountertopsFilled />
          </n-icon>
          <span>冲突集列表</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="20"
        >
          <n-input
            v-model:value="getFormValueSource.counts"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="3"
          offset="1"
        >
          <n-checkbox
            :checked="getFormValueSource.countsIsBig === 0"
            @update:checked="(checked) => {
              checked ? getFormValueSource.countsIsBig = 0 : getFormValueSource.countsIsBig = 1
            }"
          >
            区分大小写
          </n-checkbox>
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <Document />
          </n-icon>
          <span>主题列表</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="20"
        >
          <n-input
            v-model:value="getFormValueSource.themes"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="3"
          offset="1"
        >
          <n-checkbox
            :checked="getFormValueSource.themesIsBig === 0"
            @update:checked="(checked) => {
              checked ? getFormValueSource.themesIsBig = 0 : getFormValueSource.themesIsBig = 1
            }"
          >
            区分大小写
          </n-checkbox>
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <Earth16Filled />
          </n-icon>
          <span>地理列表</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="20"
        >
          <n-input
            v-model:value="getFormValueSource.locations"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="3"
          offset="1"
        >
          <n-checkbox
            :checked="getFormValueSource.locationsIsBig === 0"
            @update:checked="(checked) => {
              checked ? getFormValueSource.locationsIsBig = 0 : getFormValueSource.locationsIsBig = 1
            }"
          >
            区分大小写
          </n-checkbox>
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <PersonSearchRound />
          </n-icon>
          <span>人物列表</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="20"
        >
          <n-input
            v-model:value="getFormValueSource.persons"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="3"
          offset="1"
        >
          <n-checkbox
            :checked="getFormValueSource.personsIsBig === 0"
            @update:checked="(checked) => {
              checked ? getFormValueSource.personsIsBig = 0 : getFormValueSource.personsIsBig = 1
            }"
          >
            区分大小写
          </n-checkbox>
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <Organization48Filled />
          </n-icon>
          <span>组织列表</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="20"
        >
          <n-input
            v-model:value="getFormValueSource.organizations"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="3"
          offset="1"
        >
          <n-checkbox
            :checked="getFormValueSource.organizationsIsBig === 0"
            @update:checked="(checked) => {
              checked ? getFormValueSource.organizationsIsBig = 0 : getFormValueSource.organizationsIsBig = 1
            }"
          >
            区分大小写
          </n-checkbox>
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <ApplicationWeb />
          </n-icon>
          <span>网站地域</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="20"
        >
          <n-select
            v-model:value="getFormValueSource.websiteRegion"
            :options="actorCountryCodeList"
            max-tag-count="responsive"
            placement="bottom"
            multiple
            clearable
          />
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <ShareRound />
          </n-icon>
          <span>来源网站</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="20"
        >
          <n-input
            v-model:value="getFormValueSource.websiteUrl"
          />
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <Heart />
          </n-icon>
          <span>情感值</span>
        </div>
      </template>
      <n-grid
        :cols="6"
        :x-gap="15"
        item-responsive
        responsive="self"
      >
        <n-form-item-gi
          label="平均情感"
          label-width="110"
          span="3 800:2"
        >
          <n-input-number
            v-model:value="getFormValueSource.avgEmMin"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-right: 5px;"
            clearable
          />
          至
          <n-input-number
            v-model:value="getFormValueSource.avgEmMax"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-left: 5px;"
            clearable
          />
        </n-form-item-gi>
        <n-form-item-gi
          label="正向情感词比例"
          label-width="110"
          span="3 800:2"
        >
          <n-input-number
            v-model:value="getFormValueSource.proEmMin"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-right: 5px;"
            clearable
          />
          至
          <n-input-number
            v-model:value="getFormValueSource.proEmMax"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-left: 5px;"
            clearable
          />
        </n-form-item-gi>
        <n-form-item-gi
          label="负向情感词比例"
          label-width="110"
          span="3 800:2"
        >
          <n-input-number
            v-model:value="getFormValueSource.negEmMin"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-right: 5px;"
            clearable
          />
          至
          <n-input-number
            v-model:value="getFormValueSource.negEmMax"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-left: 5px;"
            clearable
          />
        </n-form-item-gi>
        <n-form-item-gi
          label="极性词比例"
          label-width="110"
          span="2 1100:1"
        >
          <n-input-number
            v-model:value="getFormValueSource.polRaMin"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-right: 5px;"
            clearable
          />
          至
          <n-input-number
            v-model:value="getFormValueSource.polRaMax"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-left: 5px;"
            clearable
          />
        </n-form-item-gi>
        <n-form-item-gi
          label="活动词比例"
          label-width="110"
          span="2 1100:1"
        >
          <n-input-number
            v-model:value="getFormValueSource.actRaMin"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-right: 5px;"
            clearable
          />
          至
          <n-input-number
            v-model:value="getFormValueSource.actRaMax"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-left: 5px;"
            clearable
          />
        </n-form-item-gi>
        <n-form-item-gi
          label="活动词比例"
          label-width="110"
          span="2 1100:1"
        >
          <n-input-number
            v-model:value="getFormValueSource.propRaMin"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-right: 5px;"
            clearable
          />
          至
          <n-input-number
            v-model:value="getFormValueSource.propRaMax"
            :show-button="false"
            :precision="0"
            :min="-100"
            :max="100"
            style="padding-left: 5px;"
            clearable
          />
        </n-form-item-gi>
      </n-grid>
    </n-form-item>
    <p style="margin: 0 0 5px 115px;">支持多个事件ID的精确查询,输入形式包括1.多个ID之间用","(英文)分割,如:256,257;2.两个ID之间用"-"分割,表示事件ID的范围</p>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
      :show-feedback="false"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <ObjectGroup />
          </n-icon>
          <span>ID集合</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="20"
        >
          <n-input
            v-model:value="getFormValueSource.cameoeventids"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="3"
          offset="1"
        >
          <n-radio-group v-model:value="getFormValueSource.cameoeventidsIsAnd">
            <n-space>
              <n-radio :value="0">
                或
              </n-radio>
              <n-radio :value="1">
                且
              </n-radio>
            </n-space>
          </n-radio-group>
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