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
  NCheckbox
} from 'naive-ui'
import type { Ref } from 'vue'
import { onMounted, ref, watch } from 'vue'
import deepCopy from '@/utils/function/deepcopy'
import { formatTimeStamp } from '@/utils/function/date'
import type { graphConfigFormInitialValueType } from '@/types/components/form/graph'
import { Calculator, Calendar, Grid, Heart } from '@vicons/ionicons5'
import { IosApps } from '@vicons/ionicons4'
import { ObjectGroup } from '@vicons/fa'
import { CountertopsFilled, PersonSearchRound } from '@vicons/material'
import { Document, ApplicationWeb } from '@vicons/carbon'
import { Earth16Filled, Organization48Filled } from '@vicons/fluent'

const props = defineProps<{
  initialValue: graphConfigFormInitialValueType,
  configType: string[] | null,
  formDisabled: boolean
}>()

const formRef: Ref<FormInst | null> = ref(null)
const formValue: Ref<graphConfigFormInitialValueType> = ref(deepCopy(props.initialValue))

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
      path="sqldate"
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
      label-width="115"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <Grid />
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
      path="weightBasis"
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
      <n-radio-group v-model:value="formValue.weightBasis">
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
      path="statisticsBasis"
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
          <span>counts</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="16"
        >
          <n-input
            v-model:value="formValue.counts"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="4"
          offset="1"
        >
          <n-checkbox
            :checked="formValue.countsIsBig === 0"
            @update:checked="(checked) => {
              checked ? formValue.countsIsBig = 0 : formValue.countsIsBig = 1
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
          <span>主题</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="16"
        >
          <n-input
            v-model:value="formValue.themes"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="4"
          offset="1"
        >
          <n-checkbox
            :checked="formValue.themesIsBig === 0"
            @update:checked="(checked) => {
              checked ? formValue.themesIsBig = 0 : formValue.themesIsBig = 1
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
          <span>地理</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="16"
        >
          <n-input
            v-model:value="formValue.locations"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="4"
          offset="1"
        >
          <n-checkbox
            :checked="formValue.locationsIsBig === 0"
            @update:checked="(checked) => {
              checked ? formValue.locationsIsBig = 0 : formValue.locationsIsBig = 1
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
          <span>人物</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="16"
        >
          <n-input
            v-model:value="formValue.persons"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="4"
          offset="1"
        >
          <n-checkbox
            :checked="formValue.personsIsBig === 0"
            @update:checked="(checked) => {
              checked ? formValue.personsIsBig = 0 : formValue.personsIsBig = 1
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
          <span>组织</span>
        </div>
      </template>
      <n-grid :cols="24">
        <n-form-item-gi
          span="16"
        >
          <n-input
            v-model:value="formValue.organizations"
          />
        </n-form-item-gi>
        <n-form-item-gi
          span="4"
          offset="1"
        >
          <n-checkbox
            :checked="formValue.organizationsIsBig === 0"
            @update:checked="(checked) => {
              checked ? formValue.organizationsIsBig = 0 : formValue.organizationsIsBig = 1
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
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <ApplicationWeb />
          </n-icon>
          <span>网站地域</span>
        </div>
      </template>
      <n-select />
    </n-form-item>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <Heart />
          </n-icon>
          <span>情感值</span>
        </div>
      </template>
      <n-checkbox-group v-model:value="formValue.emo">
        <n-space item-style="display: flex;">
          <n-checkbox value="Beijing" label="平均情感" />
          <n-checkbox value="Shanghai" label="正情感词比例" />
          <n-checkbox value="Guangzhou" label="负情感词比例" />
          <n-checkbox value="Shenzen" label="极性词比例" />
          <n-checkbox value="Shenzen" label="活动词比例" />
          <n-checkbox value="Shenzen" label="代称比例" />
        </n-space>
      </n-checkbox-group>
    </n-form-item>
    <p style="margin: 0 0 5px 115px;">支持多个事件ID的精确查询,输入形式包括1.多个ID之间用","(英文)分割,如:256,257;2.两个ID之间用"-"分割,表示事件ID的范围</p>
    <n-form-item
      label-style="font-weight: 600;"
      label-width="115"
    >
      <template #label>
        <div class="icon-label">
          <n-icon class="icon" size="20">
            <ObjectGroup />
          </n-icon>
          <span>ID集合</span>
        </div>
      </template>
      <n-input
        v-model:value="formValue.cameoeventids"
      />
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