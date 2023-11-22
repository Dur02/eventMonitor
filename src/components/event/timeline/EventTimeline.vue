<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, onMounted, watch, computed } from 'vue'
import type { EChartsType } from 'echarts/core'
import * as echarts from 'echarts/core'
import {
  GridComponent,
  ToolboxComponent,
  DataZoomComponent,
  TitleComponent,
  TooltipComponent,
  VisualMapComponent,
  GeoComponent
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

// @ts-ignore
const mapWithIndex = map.convert({ cap: false })

const footStore = useFooterStore()
const { selectedId, configType } = storeToRefs(footStore)

const loadingRef: Ref<boolean> = ref(false)
let allData: timelineDataType[] | null = null

let echartsLine: EChartsType | null = null
let lineXDataDay: string[] | null = null
let lineYDataDay: number[] | null = null
let lineXDataWeek: string[] | null = null
let lineYDataWeek: number[] | null = null
let lineXDataMonth: string[] | null = null
let lineYDataMonth: number[] | null = null
let lineXDataYear: string[] | null = null
let lineYDataYear: number[] | null = null
const echartsLineRef: Ref<HTMLElement | null> = ref(null)
const lineOptionValue: Ref<string> = ref('day')

let echartsHeatMap: EChartsType | null = null
let heatMapXDataDay: string[] | null = null
let heatMapYDataDay: string[] | null = null
let heatMapDataDay: (string| number)[][] | null = null
let heatMapXDataWeek: string[] | null = null
let heatMapYDataWeek: string[] | null = null
let heatMapDataWeek: (string| number)[][] | null = null
let heatMapXDataMonth: string[] | null = null
let heatMapYDataMonth: string[] | null = null
let heatMapDataMonth: (string| number)[][] | null = null
const echartsHeatMapRef: Ref<HTMLElement | null> = ref(null)
const heatMapOptionValue: Ref<string> = ref('day')

const controller: AbortController = new AbortController()
const lineResizeObserver = new ResizeObserver(() => {
  const lineWidth = echartsLineRef.value?.offsetWidth
  echartsLine?.resize({ width: lineWidth, height: "auto" })
})
const heatMapResizeObserver = new ResizeObserver(() => {
  const heatMapWidth = echartsHeatMapRef.value?.offsetWidth
  echartsHeatMap?.resize({ width: heatMapWidth, height: "auto" })
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
      )(map(({ value }: { value: number }) => value)(allData))
      return sum
    })
  )(uniq(a))
}

const initLineData = () => {
  lineXDataDay = flow(
    map(({ key }: { key: string }) => key)
  )(allData)
  lineYDataDay = flow(
    map(({ value }: { value: number }) => value)
  )(allData)

  const a = map(({ key }: { key: string }) => getWeek.value(key))(allData)
  lineXDataWeek = uniq(a)
  lineYDataWeek = getYLineData(a)

  const b = map(({ key }: { key: string }) => `${getYear(key)}${getMonth(key)}`)(allData)
  lineXDataMonth = uniq(b)
  lineYDataMonth = getYLineData(b)

  const c = map(({ key }: { key: string }) => `${getYear(key)}`)(allData)
  lineXDataYear = uniq(c)
  lineYDataYear = getYLineData(c)
}

const setLineOption = (value: string) => {
  switch (value) {
    case 'day': {
      echartsLine?.setOption(getLineOption(lineXDataDay!, lineYDataDay!))
      break
    }
    case 'week': {
      echartsLine?.setOption(getLineOption(lineXDataWeek!, lineYDataWeek!))
      break
    }
    case 'month': {
      echartsLine?.setOption(getLineOption(lineXDataMonth!, lineYDataMonth!))
      break
    }
    default: {
      echartsLine?.setOption(getLineOption(lineXDataYear!, lineYDataYear!))
      break
    }
  }
}

const handleLineChecked = (value: string) => {
  lineOptionValue.value = value
  echartsLine?.clear()
  setLineOption(value)
}

const initHeatMapData = () => {
  heatMapXDataDay = flow(
    map(({ key }) => join('')(slice(4, 8)(key))),
    uniq
  )(allData)
  heatMapYDataDay = flow(
    map(({ key }) => getYear(key)),
    uniq
  )(allData)
  heatMapDataDay = flow(
    map(({ key, value }) => [
      join('')(slice(4, 8)(key)),
      getYear(key),
      value
    ]),
  )(allData)

  const a = map(({ key }: { key: string }) => getWeek.value(key))(allData)
  const weekData = getYLineData(a)
  heatMapXDataWeek = flow(
    uniq,
    map((item: string) => join('')(slice(4, 6)(item))),
    uniq,
  )(a)
  heatMapYDataWeek = flow(
    uniq,
    map((item: string) => join('')(slice(0, 4)(item))),
    uniq
  )(a)
  heatMapDataWeek = flow(
    mapWithIndex((item: string, index: number) => [
      join('')(drop(4)(item)),
      join('')(dropRight(2)(item)),
      weekData[index]
    ])
  )(uniq(a))

  const b = map(({ key }: { key: string }) => `${getYear(key)}${getMonth(key)}`)(allData)
  const monthData = getYLineData(b)
  heatMapXDataMonth = flow(
    uniq,
    map((item: string) => join('')(slice(4, 6)(item))),
    uniq,
  )(b)
  heatMapYDataMonth = flow(
    uniq,
    map((item: string) => join('')(slice(0, 4)(item))),
    uniq
  )(b)
  heatMapDataMonth = flow(
    mapWithIndex((item: string, index: number) => [
      join('')(drop(4)(item)),
      join('')(dropRight(2)(item)),
      monthData[index]
    ])
  )(uniq(b))
}

const setHeatMapOption = (value: string) => {
  switch (value) {
    case 'day': {
      echartsHeatMap?.setOption(getHeatMapOptions(heatMapXDataDay!, heatMapYDataDay!, heatMapDataDay!))
      break
    }
    case 'week': {
      echartsHeatMap?.setOption(getHeatMapOptions(heatMapXDataWeek!, heatMapYDataWeek!, heatMapDataWeek!))
      break
    }
    default: {
      echartsHeatMap?.setOption(getHeatMapOptions(heatMapXDataMonth!, heatMapYDataMonth!, heatMapDataMonth!))
      break
    }
  }
}

const handleHeatMapChecked = (value: string) => {
  heatMapOptionValue.value = value
  echartsHeatMap?.clear()
  setHeatMapOption(value)
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
      allData = resultData
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
    VisualMapComponent,
    GeoComponent,
    LineChart,
    HeatmapChart,
    LabelLayout,
    UniversalTransition,
    SVGRenderer,
  ])

  echartsLine = echarts.init(echartsLineRef.value, null, { renderer: 'svg' })
  echartsHeatMap = echarts.init(echartsHeatMapRef.value, null, { renderer: 'svg' })

  window.addEventListener('resize', () => {
    echartsLine?.resize()
    echartsHeatMap?.resize()
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
      initLineData()
      echartsLine?.clear()
      setLineOption(lineOptionValue.value)
      initHeatMapData()
      echartsHeatMap?.clear()
      setHeatMapOption(heatMapOptionValue.value)
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
        allData = res.data.resultData
        initLineData()
        echartsLine?.clear()
        setLineOption(lineOptionValue.value)
        initHeatMapData()
        echartsHeatMap?.clear()
        setHeatMapOption(heatMapOptionValue.value)
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