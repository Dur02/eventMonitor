import type { Ref } from 'vue'
import { ref } from 'vue'
import { defineStore } from 'pinia'
import type { SelectOption, TreeSelectOption  } from 'naive-ui'
import { getAllCodeList } from '@/api/eventMonitor'
import { map } from 'lodash/fp';

export const useEventStore = defineStore('event', () => {
  const actorCountryCodeList: Ref<SelectOption[]> = ref([])
  const actorTypeCode: Ref<SelectOption[]> = ref([])
  const ethnicCode: Ref<SelectOption[]>  = ref([])
  const geoCountryCodeList: Ref<TreeSelectOption[]> = ref([])
  const knownGroupCode: Ref<SelectOption[]>  = ref([])
  const quadClass: Ref<SelectOption[]>   = ref([])
  const religionCode: Ref<SelectOption[]>  = ref([])

  const getAllEventCodeList = async () => {
    if (actorTypeCode.value.length === 0) {
      const { data } = await getAllCodeList()

      actorCountryCodeList.value = map(({ countryChineseName, countryName, countryCode }) => ({
        label: `${countryChineseName}(${countryName})`,
        value: `${countryCode}`
      }))(data.actorCountryCodeList)

      actorTypeCode.value = map(({ typeNameZh, typeNameEn, typeCode }) => ({
        label: `${typeNameZh}(${typeNameEn})`,
        value: `${typeCode}`
      }))(data.actorCountryCodeList)

      ethnicCode.value = map(({ chname, label, code }) => ({
        label: `${chname}(${label})`,
        value: `${code}`
      }))(data.ethnicCode)

      geoCountryCodeList.value = map(({ countryChineseName, countryName, countryCode }) => ({
        label: `${countryChineseName}(${countryName})`,
        key: `${countryCode}`,
        isLeaf: false
      }))(data.geoCountryCodeList)

      knownGroupCode.value = map(({ chname, label, code }) => ({
        label: `${chname}(${label})`,
        value: `${code}`,
      }))(data.knownGroupCode)

      quadClass.value = map(({ quadNameZh, quadNameEn, quadCode }) => ({
        label: `${quadNameZh}(${quadNameEn})`,
        value: quadCode,
      }))(data.quadClass)

      religionCode.value = map(({ chname, label, code }) => ({
        label: `${chname}(${label})`,
        value: `${code}`,
      }))(data.religionCode)
    }
    return Promise.resolve()
  }

  return {
    actorCountryCodeList,
    actorTypeCode,
    ethnicCode,
    geoCountryCodeList,
    knownGroupCode,
    quadClass,
    religionCode,
    getAllEventCodeList
  }
})