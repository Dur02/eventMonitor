import type { Ref } from 'vue'
import { ref } from 'vue'
import { defineStore } from 'pinia'
import type { SelectOption, TreeSelectOption  } from 'naive-ui'
import { getAllEventCodeList as getAllEventCodeListApi } from '@/api/codeDict'
import { map } from 'lodash/fp';

export const useEventStore = defineStore('event', () => {
  const actorCountryCodeList: Ref<SelectOption[]> = ref([])
  const actorTypeCode: Ref<SelectOption[]> = ref([])
  const baseCodeList: Ref<SelectOption[]> = ref([])
  const ethnicCode: Ref<SelectOption[]>  = ref([])
  const eventCodeList: Ref<SelectOption[]>  = ref([])
  const geoCountryCodeList: Ref<TreeSelectOption[]> = ref([])
  const geoTypeList: Ref<SelectOption[]>  = ref([
    { label: '国家', value: '1', labelZh: '国家' },
    { label: '州省', value: '2,5', labelZh: '州省' },
    { label: '城市', value: '3,4', labelZh: '城市' }
  ])
  const knownGroupCode: Ref<SelectOption[]>  = ref([])
  const quadClass: Ref<SelectOption[]>   = ref([])
  const religionCode: Ref<SelectOption[]>  = ref([])
  const rootCodeList: Ref<SelectOption[]> = ref([])

  const getAllEventCodeList = async () => {
    if (actorTypeCode.value.length === 0) {
      try {
        const { data } = await getAllEventCodeListApi()

        actorCountryCodeList.value = map(({ countryChineseName, countryName, countryCode }) => ({
          label: `${countryChineseName}(${countryName})`,
          value: countryCode,
          labelZh: countryChineseName
        }))(data.actorCountryCodeList)

        actorTypeCode.value = map(({ typeNameZh, typeNameEn, typeCode }) => ({
          label: `${typeNameZh}(${typeNameEn})`,
          value: typeCode,
          labelZh: typeNameZh
        }))(data.actorTypeCode)

        baseCodeList.value = map(({ eventNameZh, eventNameEn, eventCode, eventRootCode }) => ({
          label: `${eventNameZh}(${eventNameEn})`,
          value: eventCode,
          labelZh: eventNameZh,
          eventRootCode
        }))(data.baseCodeList)

        ethnicCode.value = map(({ chname, label, code }) => ({
          label: `${chname}(${label})`,
          value: code,
          labelZh: chname,
        }))(data.ethnicCode)

        eventCodeList.value = map(({ eventNameZh, eventNameEn, eventCode, eventBaseCode }) => ({
          label: `${eventNameZh}(${eventNameEn})`,
          value: eventCode,
          labelZh: eventNameZh,
          eventBaseCode
        }))(data.eventCodeList)

        geoCountryCodeList.value = map(({ countryChineseName, countryName, countryCode }) => ({
          label: `${countryChineseName}(${countryName})`,
          key: countryCode,
          isLeaf: false,
          labelZh: countryChineseName
        }))(data.geoCountryCodeList)

        knownGroupCode.value = map(({ chname, label, code }) => ({
          label: `${chname}(${label})`,
          value: code,
          labelZh: chname
        }))(data.knownGroupCode)

        quadClass.value = map(({ quadNameZh, quadNameEn, quadCode }) => ({
          label: `${quadNameZh}(${quadNameEn})`,
          value: quadCode,
          labelZh: quadNameZh
        }))(data.quadClass)

        religionCode.value = map(({ chname, label, code }) => ({
          label: `${chname}(${label})`,
          value: code,
          labelZh: chname
        }))(data.religionCode)

        rootCodeList.value = map(({ eventNameZh, eventNameEn, eventCode, eventQuadClass }) => ({
          label: `${eventNameZh}(${eventNameEn})`,
          value: eventCode,
          labelZh: eventNameZh,
          eventQuadClass
        }))(data.rootCodeList)
      } catch (e) {
        //
      }
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
    geoTypeList,
    knownGroupCode,
    quadClass,
    religionCode,
    rootCodeList,
    getAllEventCodeList
  }
})