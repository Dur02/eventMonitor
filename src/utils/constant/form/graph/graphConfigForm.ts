import type { graphConfigFormInitialValueType } from '@/types/components/form/graph'
import { joinArray } from '@/utils/function/arrayToString'
import { getMaxValue, getMinValue } from '@/utils/function/getLimit'

export const graphConfigFormInitialValue: graphConfigFormInitialValueType = {
  sqldate: null,
  weightBasis: 1,
  statisticsBasis: 2,
  counts: '',
  countsIsBig: 1,
  themes: '',
  themesIsBig: 1,
  locations: '',
  locationsIsBig: 1,
  persons: '',
  personsIsBig: 1,
  organizations: '',
  organizationsIsBig: 1,
  websiteRegion: null,
  websiteUrl: '',
  cameoeventids: '',
  cameoeventidsIsAnd: 1,
  avgEmMin: null,
  avgEmMax: null,
  proEmMin: null,
  proEmMax: null,
  negEmMin: null,
  negEmMax: null,
  polRaMin: null,
  polRaMax: null,
  actRaMin: null,
  actRaMax: null,
  propRaMin: null,
  propRaMax: null
}

export const getGraphConfigFormValue = (configForm: any) => ({
  ...configForm,
  websiteRegion: configForm.websiteRegion ? joinArray(configForm.websiteRegion) : null,
  avgEmMin: getMinValue(configForm.avgEmMin, configForm.avgEmMax),
  avgEmMax: getMaxValue(configForm.avgEmMin, configForm.avgEmMax),
  proEmMin: getMinValue(configForm.proEmMin, configForm.proEmMax),
  proEmMax: getMaxValue(configForm.proEmMin, configForm.proEmMax),
  negEmMin: getMinValue(configForm.negEmMin, configForm.negEmMax),
  negEmMax: getMaxValue(configForm.negEmMin, configForm.negEmMax),
  polRaMin: getMinValue(configForm.polRaMin, configForm.polRaMax),
  polRaMax: getMaxValue(configForm.polRaMin, configForm.polRaMax),
  actRaMin: getMinValue(configForm.actRaMin, configForm.actRaMax),
  actRaMax: getMaxValue(configForm.actRaMin, configForm.actRaMax),
  propRaMin: getMinValue(configForm.propRaMin, configForm.propRaMax),
  propRaMax: getMaxValue(configForm.propRaMin, configForm.propRaMax),
})