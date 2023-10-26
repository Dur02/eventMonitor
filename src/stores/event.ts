import type { Ref } from 'vue'
import { ref } from 'vue'
import { defineStore } from 'pinia'
import type { SelectOption, TreeSelectOption  } from 'naive-ui'
import { getAllEventCodeList as getAllEventCodeListApi } from '@/api/event'
import { map } from 'lodash/fp';

export const useEventStore = defineStore('event', () => {
  const actorCountryCodeList: Ref<SelectOption[]> = ref([])
  const actorTypeCode: Ref<SelectOption[]> = ref([])
  const baseCodeList: Ref<SelectOption[]> = ref([])
  const ethnicCode: Ref<SelectOption[]>  = ref([])
  const eventCodeList: Ref<SelectOption[]>  = ref([])
  const geoCountryCodeList: Ref<TreeSelectOption[]> = ref([])
  const knownGroupCode: Ref<SelectOption[]>  = ref([])
  const quadClass: Ref<SelectOption[]>   = ref([])
  const religionCode: Ref<SelectOption[]>  = ref([])
  const rootCodeList: Ref<SelectOption[]> = ref([])

  const getAllEventCodeList = async () => {
    if (actorTypeCode.value.length === 0) {
      const { data } = await getAllEventCodeListApi()

      actorCountryCodeList.value = map(({ countryChineseName, countryName, countryCode }) => ({
        label: `${countryChineseName}(${countryName})`,
        value: countryCode
      }))(data.actorCountryCodeList)

      actorTypeCode.value = map(({ typeNameZh, typeNameEn, typeCode }) => ({
        label: `${typeNameZh}(${typeNameEn})`,
        value: typeCode
      }))(data.actorTypeCode)

      baseCodeList.value = map(({ eventNameZh, eventNameEn, eventCode, eventRootCode }) => ({
        label: `${eventNameZh}(${eventNameEn})`,
        value: eventCode,
        eventRootCode
      }))(data.baseCodeList)

      ethnicCode.value = map(({ chname, label, code }) => ({
        label: `${chname}(${label})`,
        value: code
      }))(data.ethnicCode)

      eventCodeList.value = map(({ eventNameZh, eventNameEn, eventCode, eventBaseCode }) => ({
        label: `${eventNameZh}(${eventNameEn})`,
        value: eventCode,
        eventBaseCode
      }))(data.eventCodeList)

      geoCountryCodeList.value = map(({ countryChineseName, countryName, countryCode }) => ({
        label: `${countryChineseName}(${countryName})`,
        key: countryCode,
        isLeaf: false
      }))(data.geoCountryCodeList)

      knownGroupCode.value = map(({ chname, label, code }) => ({
        label: `${chname}(${label})`,
        value: code,
      }))(data.knownGroupCode)

      quadClass.value = map(({ quadNameZh, quadNameEn, quadCode }) => ({
        label: `${quadNameZh}(${quadNameEn})`,
        value: quadCode,
      }))(data.quadClass)

      religionCode.value = map(({ chname, label, code }) => ({
        label: `${chname}(${label})`,
        value: code,
      }))(data.religionCode)

      rootCodeList.value = map(({ eventNameZh, eventNameEn, eventCode, eventQuadClass }) => ({
        label: `${eventNameZh}(${eventNameEn})`,
        value: eventCode,
        eventQuadClass
      }))(data.rootCodeList)
    }
    return Promise.resolve()
  }

  return {
    actorCountryCodeList,
    actorTypeCode,
    baseCodeList,
    ethnicCode,
    eventCodeList,
    geoCountryCodeList,
    knownGroupCode,
    quadClass,
    religionCode,
    rootCodeList,
    getAllEventCodeList
  }
})