<script setup lang="ts">
import type { Ref, ShallowRef } from 'vue'
import { ref, shallowRef, onMounted, watch } from 'vue'
import type { EChartsType } from 'echarts/core'
import * as echarts from 'echarts/core'
import {
  GridComponent,
  ToolboxComponent,
  DataZoomComponent,
  TitleComponent,
  TooltipComponent,
  GeoComponent,
  VisualMapComponent
} from 'echarts/components'
import { LineChart, HeatmapChart } from 'echarts/charts'
import { LabelLayout, UniversalTransition } from 'echarts/features'
import { SVGRenderer } from 'echarts/renderers'
import { NGi, NGrid, NRadio, NRadioGroup, NSpace, NSpin, NCard } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import { getResultDataByConfigId } from '@/api/eventAnalyse'
import { flow, map, uniq, findIndex, findLastIndex, slice, join, drop, dropRight } from 'lodash/fp'
import { getWeek, getYear, getMonth } from '@/utils/function/date'
import {
  lineOptions,
  getLineOption,
  heatMapOptions,
  getHeatMapOptions
} from '@/utils/constant/event/timeline/eventTimeline'
import type { timelineDataType } from '@/types/components/event/timeline'
import deepCopy from '@/utils/function/deepcopy';
import { eventDisplayRowsType } from '@/types/components/event/display';

// @ts-ignore
const mapWithIndex = map.convert({ cap: false })

const footStore = useFooterStore()
const { selectedId, configType } = storeToRefs(footStore)

const loadingRef: Ref<boolean> = ref(false)
const allData: Ref<timelineDataType[] | null> = ref(null)

const echartsLineRef: Ref<HTMLElement | null> = ref(null)
const echartsLine: ShallowRef<EChartsType | null>= shallowRef(null)
const lineOptionValue: Ref<string> = ref('day')
const lineXData: Ref<string[] | null> = ref(null)
const lineYData: Ref<number[] | null> = ref(null)

const echartsHeatMapRef: Ref<HTMLElement | null> = ref(null)
const echartsHeatMap: ShallowRef<EChartsType | null>= shallowRef(null)
const heatMapOptionValue: Ref<string> = ref('day')
const heatMapXData: Ref<string[] | null> = ref(null)
const heatMapYData: Ref<string[] | null> = ref(null)
const heatMapData: Ref<Array<Array<string| number>> | null> = ref(null)

const controller: AbortController = new AbortController()
const lineResizeObserver = new ResizeObserver(() => {
  const lineWidth = echartsLineRef.value?.offsetWidth
  echartsLine.value?.resize({ width: lineWidth, height: "auto" })
})
const heatMapResizeObserver = new ResizeObserver(() => {
  const heatMapWidth = echartsHeatMapRef.value?.offsetWidth
  echartsHeatMap.value?.resize({ width: heatMapWidth, height: "auto" })
})

const getYLineData = (a: string[]) => {
  const startArray = map((item: any) => findIndex((o) => o === item)(a))(uniq(a))
  const endArray = map((item: any) => findLastIndex((o) => o === item)(a))(uniq(a))

  return flow(
    mapWithIndex((item: string, index: number) => {
      let sum = 0
      flow(
        slice(startArray[index], endArray[index] + 1),
        map((item: number) => sum += item)
      )(map(({ value }: { value: number }) => value)(allData.value))
      return sum
    })
  )(uniq(a))
}

const getLineData = () => {
  switch (lineOptionValue.value) {
    case 'day': {
      lineXData.value = flow(
        map(({ key }: { key: string }) => key)
      )(allData.value)
      lineYData.value = flow(
        map(({ value }: { value: number }) => value)
      )(allData.value)
      console.log(lineXData.value)
      console.log(lineYData.value)
      break
    }
    case 'week': {
      const a = map(({ key }: { key: string }) => getWeek(key))(allData.value)
      lineXData.value = uniq(a)
      lineYData.value = getYLineData(a)
      console.log(lineXData.value)
      console.log(lineYData.value)
      break
    }
    case 'month': {
      const a = map(({ key }: { key: string }) => `${getYear(key)}${getMonth(key)}`)(allData.value)
      lineXData.value = uniq(a)
      lineYData.value = getYLineData(a)
      console.log(lineXData.value)
      console.log(lineYData.value)
      break
    }
    default: {
      const a = map(({ key }: { key: string }) => `${getYear(key)}`)(allData.value)
      lineXData.value = uniq(a)
      lineYData.value = getYLineData(a)
      console.log(lineXData.value)
      console.log(lineYData.value)
      break
    }
  }
}

const handleLineChecked = (value: string) => {
  lineOptionValue.value = value
  getLineData()
  echartsLine.value?.clear()
  echartsLine.value?.setOption(getLineOption(lineXData.value!, lineYData.value!))
}

const getAllHeatMapData = (a: string[]) => {
  const weekData = getYLineData(a)
  heatMapXData.value = flow(
    uniq,
    map((item) => join('')(slice(4, 6)(item))),
    uniq,
  )(a)
  heatMapYData.value = flow(
    uniq,
    map((item) => join('')(slice(0, 4)(item))),
    uniq
  )(a)
  heatMapData.value = flow(
    mapWithIndex((item, index) => [
      join('')(drop(4)(item)),
      join('')(dropRight(2)(item)),
      weekData[index]
    ])
  )(uniq(a))
}

const getHeatMapData = () => {
  switch (heatMapOptionValue.value) {
    case 'day': {
      heatMapXData.value = flow(
        map(({ key }) => join('')(slice(4, 8)(key))),
        uniq
      )(allData.value)
      heatMapYData.value = flow(
        map(({ key }) => getYear(key)),
        uniq
      )(allData.value)
      heatMapData.value = flow(
        map(({ key, value }) => [
          join('')(slice(4, 8)(key)),
          getYear(key),
          value
        ]),
      )(allData.value)
      console.log(heatMapXData.value)
      console.log(heatMapYData.value)
      console.log(heatMapData.value)
      break
    }
    case 'week': {
      const a = map(({ key }: { key: string }) => getWeek(key))(allData.value)
      getAllHeatMapData(a)
      console.log(heatMapXData.value)
      console.log(heatMapYData.value)
      console.log(heatMapData.value)
      break
    }
    default: {
      const a = map(({ key }: { key: string }) => `${getYear(key)}${getMonth(key)}`)(allData.value)
      getAllHeatMapData(a)
      console.log(heatMapXData.value)
      console.log(heatMapYData.value)
      console.log(heatMapData.value)
      break
    }
  }
}

const handleHeatMapChecked = (value: string) => {
  heatMapOptionValue.value = value
  getHeatMapData()
  echartsHeatMap.value?.clear()
  echartsHeatMap.value?.setOption(getHeatMapOptions(heatMapXData.value!, heatMapYData.value!, heatMapData.value!))
}

const reloadTableData = async () => {
  if (!loadingRef.value) {
    loadingRef.value = true
    try {
      const {
        data: {
          resultData
        }
      } = await getResultDataByConfigId({ configId: selectedId.value! })
      allData.value = resultData
    } catch (e) {
      //
    }
    loadingRef.value = false
  }
}

onMounted(() => {
  echarts.use([
    GridComponent,
    ToolboxComponent,
    DataZoomComponent,
    TitleComponent,
    TooltipComponent,
    GeoComponent,
    VisualMapComponent,
    LineChart,
    HeatmapChart,
    LabelLayout,
    UniversalTransition,
    SVGRenderer
  ])

  echartsLine.value = echarts.init(echartsLineRef.value, null, { renderer: 'svg' })
  echartsHeatMap.value = echarts.init(echartsHeatMapRef.value, null, { renderer: 'svg' })

  window.addEventListener('resize', () => {
    echartsLine.value?.resize()
    echartsHeatMap.value?.resize()
  }, {
    signal: controller.signal
  })
  lineResizeObserver.observe(echartsLineRef.value!)
  heatMapResizeObserver.observe(echartsHeatMapRef.value!)
})

watch(
  () => selectedId.value,
  async () => {
    if (selectedId.value && configType.value === 'event_timeline_viz') {
      await reloadTableData()
      getLineData()
      echartsLine.value?.clear()
      echartsLine.value?.setOption(getLineOption(lineXData.value!, lineYData.value!))
      getHeatMapData()
      echartsHeatMap.value?.clear()
      echartsHeatMap.value?.setOption(getHeatMapOptions(heatMapXData.value!, heatMapYData.value!, heatMapData.value!))
    }
  },
  {
    immediate: true
  }
)

footStore.$onAction(({ name, after }) => {
  if (name === 'instantQuery') {
    after((res) => {
      if (!loadingRef.value && res.data.resultData) {
        loadingRef.value = true
        allData.value = res.data.resultData
        getLineData()
        echartsLine.value?.clear()
        echartsLine.value?.setOption(getLineOption(lineXData.value!, lineYData.value!))
        getHeatMapData()
        echartsHeatMap.value?.clear()
        echartsHeatMap.value?.setOption(getHeatMapOptions(heatMapXData.value!, heatMapYData.value!, heatMapData.value!))
        loadingRef.value = false
      }
    })
  }
})
</script>

<template>
  <n-spin :show="loadingRef">
    <n-card class="chart-container">
      <n-grid
        class="header-container"
        x-gap="12"
        :cols="3"
      >
        <n-gi :offset="1">
          <h3 class="charts-title">事件时间线展示</h3>
        </n-gi>
        <n-gi>
          <n-radio-group
            class="charts-radio"
            v-model:value="lineOptionValue"
            @update:value="handleLineChecked"
          >
            <n-space justify="end">
              <n-radio
                v-for="item in lineOptions"
                :key="item.value"
                :value="item.value"
              >
                {{ item.label }}
              </n-radio>
            </n-space>
          </n-radio-group>
        </n-gi>
      </n-grid>
      <div class="echarts-line" ref="echartsLineRef" />
    </n-card>
    <n-card class="chart-container">
      <n-grid
        class="header-container"
        x-gap="12"
        :cols="3"
      >
        <n-gi :offset="1">
          <h3 class="charts-title">事件时间线分析</h3>
        </n-gi>
        <n-gi>
          <n-radio-group
            class="charts-radio"
            v-model:value="heatMapOptionValue"
            @update:value="handleHeatMapChecked"
          >
            <n-space justify="end">
              <n-radio
                v-for="item in heatMapOptions"
                :key="item.value"
                :value="item.value"
              >
                {{ item.label }}
              </n-radio>
            </n-space>
          </n-radio-group>
        </n-gi>
      </n-grid>
      <div class="echarts-heatMap" ref="echartsHeatMapRef" />
    </n-card>
  </n-spin>
</template>

<style scoped lang="scss">
.chart-container {
  //background: v-bind("isLight ? '#fff' : '#000'");
  transition: background .3s;
  padding: 10px;

  &:last-of-type {
    margin-top: 10px;
  }

  .header-container {
    text-align: center;

    .charts-title {
      margin: 0;
    }

    .charts-radio {
      width: 100%;
      text-align: right;
    }
  }

  .echarts-line, .echarts-heatMap {
    width: 100%;
    height: 500px;
  }
}
</style>