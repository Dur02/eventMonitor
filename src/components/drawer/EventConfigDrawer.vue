<script setup lang="ts">
import type { Ref } from 'vue'
import { ref } from 'vue'
import type { FormValidationError } from 'naive-ui'
import {
  NDrawer,
  NDrawerContent,
  NCard,
  NScrollbar,
  NButton
} from 'naive-ui'
import {
  cardDarkThemeOverrides,
  cardLightThemeOverrides,
  drawerDarkThemeOverrides,
  drawerLightThemeOverrides
} from '@/utils/constant/config/event/eventConfig'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia'
import EventConfigSetting from '@/components/form/EventConfigSetting.vue'
import EventConfigForm from '@/components/form/EventConfigForm.vue'
import type { eventConfigSettingInitialValueType, eventConfigFormInitialValueType } from '@/types/components/config/event'
import { addEventConfig } from '@/api/eventConfiguration'
import { flow, filter, find, join, propEq, compact, includes, map, flatten } from 'lodash/fp'
import deepCopy from '@/utils/function/deepcopy'
import { useConstantStore } from '@/stores/constant'
import { useEventConfigStore } from '@/stores/eventConfig';

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)
const constantStore = useConstantStore()
const { geoCountryCodeList } = storeToRefs(constantStore)
const eventConfigStore = useEventConfigStore()
const { paginationReactive } = storeToRefs(eventConfigStore)
const { reloadTableData } = eventConfigStore

defineProps<{
  drawerTitle: string,
  drawerShow: boolean,
  settingInitialValue: eventConfigSettingInitialValueType,
  formInitialValue: eventConfigFormInitialValueType
  formDisabled: boolean
}>()

const emits = defineEmits(['DrawerClose', 'AfterLeave'])

const configSetting: any = ref(null)
const configForm: any = ref(null)
const configType: Ref<string[]> = ref([])

const handleTypesChange = (selectedConfigType: string[]) => {
  configType.value = selectedConfigType
}

const handleDrawerClose = (value: boolean): void => {
  emits("DrawerClose", value)
}

const handleResetValue = (): void => {
  emits('AfterLeave')
}

const handleCreate = () => {

  console.log(configForm.value?.formValue)

  configSetting.value?.formRef.validate((settingErrors: Array<FormValidationError>) => {
    configForm.value?.formRef.validate(async (formError: Array<FormValidationError>) => {
      if (!settingErrors && !formError) {
        const joinArray = (target: Array<number | string>): number | string => {
          return join(',')(target)
        }

        const getGeoCountryCode = (target: string[]) => flow(
          filter((item) => find(propEq('key', item))(deepCopy(geoCountryCodeList.value))),
          join(',')
        )(deepCopy(target))

        const getGeoAdmCode = (target: string[]) => flow(
          map((item: any) => item.children),
          flatten,
          compact,
          filter(({ key }) => includes(key)(deepCopy(target))),
          map((item) => item.key),
          join(',')
        )(deepCopy(geoCountryCodeList.value))

        const getDateString = (timestamp: number) => {
          const date = new Date(timestamp)

          const year = date.getFullYear();
          const month = ('0' + (date.getMonth() + 1)).slice(-2);
          const day = ('0' + date.getDate()).slice(-2);

          return (year + month + day);
        }

        try {
          await addEventConfig({
            ...configSetting.value.formValue,
            ...configForm.value.formValue,
            configType: joinArray(configSetting.value.formValue.configType),
            actiongeoCountrycode  : getGeoCountryCode(configForm.value.formValue.actiongeoCountrycodeAndAdm1code),
            actiongeoAdm1code: getGeoAdmCode(configForm.value.formValue.actiongeoCountrycodeAndAdm1code),
            actiongeoType: joinArray(configForm.value.formValue.actiongeoType),
            actor1countrycode: joinArray(configForm.value.formValue.actor1countrycode),
            actor1ethniccode: joinArray(configForm.value.formValue.actor1ethniccode),
            actor1geoCountrycode: getGeoCountryCode(configForm.value.formValue.actor1geoCountrycodeAndAdm1code),
            actor1geoAdm1code: getGeoAdmCode(configForm.value.formValue.actor1geoCountrycodeAndAdm1code),
            actor1geoType: joinArray(configForm.value.formValue.actor1geoType),
            actor1knowngroupcode: joinArray(configForm.value.formValue.actor1knowngroupcode),
            actor1religion1code: joinArray(configForm.value.formValue.actor1religion1code),
            actor1religion2code: joinArray(configForm.value.formValue.actor1religion2code),
            actor1type1code: joinArray(configForm.value.formValue.actor1type1code),
            actor1type2code: joinArray(configForm.value.formValue.actor1type2code),
            actor1type3code: joinArray(configForm.value.formValue.actor1type3code),
            actor2countrycode: joinArray(configForm.value.formValue.actor2countrycode),
            actor2ethniccode: joinArray(configForm.value.formValue.actor2ethniccode),
            actor2geoCountrycode: getGeoCountryCode(configForm.value.formValue.actor2geoCountrycodeAndAdm1code),
            actor2geoAdm1code: getGeoAdmCode(configForm.value.formValue.actor2geoCountrycodeAndAdm1code),
            actor2geoType: joinArray(configForm.value.formValue.actor2geoType),
            actor2knowngroupcode: joinArray(configForm.value.formValue.actor2knowngroupcode),
            actor2religion1code: joinArray(configForm.value.formValue.actor2religion1code),
            actor2religion2code: joinArray(configForm.value.formValue.actor2religion2code),
            actor2type1code: joinArray(configForm.value.formValue.actor2type1code),
            actor2type2code: joinArray(configForm.value.formValue.actor2type2code),
            actor2type3code: joinArray(configForm.value.formValue.actor2type3code),
            eventbasecode: joinArray(configForm.value.formValue.eventbasecode),
            eventcode: joinArray(configForm.value.formValue.eventcode),
            eventrootcode: joinArray(configForm.value.formValue.eventrootcode),
            quadclass: joinArray(configForm.value.formValue.quadclass),
            beginSqldate: getDateString(configForm.value.formValue.sqldate[0]),
            endSqldate: getDateString(configForm.value.formValue.sqldate[1]),
            beginAvgtone: configForm.value.formValue.avgtone[0] || null,
            endAvgtone: configForm.value.formValue.avgtone[1] || null,
            beginGoldsteinscale: configForm.value.formValue.goldsteinscale[0] || null,
            endGoldsteinscale: configForm.value.formValue.goldsteinscale[1] || null,
          })
          await reloadTableData(paginationReactive.value.page!)
        } catch (e) {
          //
        }
      }
    })
  })
}

const handleUpdate = () => {

}
</script>

<template>
  <n-drawer
    :show="drawerShow"
    to="#config-drawer-target"
    :height="500"
    placement="bottom"
    :trap-focus="false"
    :block-scroll="false"
    :show-mask="false"
    :mask-closable="false"
    :theme-overrides="isLight ? drawerLightThemeOverrides : drawerDarkThemeOverrides"
    @update:show="handleDrawerClose"
    @after-leave="handleResetValue"
  >
    <n-drawer-content
      :native-scrollbar="true"
      :body-content-style="{
        overflow: 'hidden'
      }"
      closable
    >
      <template #header>
        {{ drawerTitle }}
      </template>
      <n-scrollbar
        class="scroll-box"
        :style="{
          maxHeight: '440px',
          border: 'var(--n-header-border-bottom)',
          borderRadius: '3px',
        }"
      >
        <n-card
          :bordered="false"
          :theme-overrides="isLight ? cardLightThemeOverrides : cardDarkThemeOverrides"
        >
          <event-config-setting
            ref="configSetting"
            :initialValue="settingInitialValue"
            @selectConfigType="handleTypesChange"
          />
          <event-config-form
            ref="configForm"
            :initialValue="formInitialValue"
            :configType="configType"
            :formDisabled="formDisabled"
          />
          <div
            v-if="drawerTitle === '创建配置'"
            style="text-align: center;"
          >
            <n-button
              type="info"
              @click="handleCreate"
            >
              创建
            </n-button>
          </div>
          <div
            v-if="drawerTitle === '修改配置'"
            style="text-align: center;"
          >
            <n-button
              type="info"
              @click="handleUpdate"
            >
              更新
            </n-button>
          </div>
        </n-card>
      </n-scrollbar>
    </n-drawer-content>
  </n-drawer>
</template>

<style scoped lang="scss">

</style>