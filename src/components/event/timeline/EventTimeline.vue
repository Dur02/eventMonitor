<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, onMounted, watch, onBeforeUnmount } from 'vue'
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
import {
  flow,
  map,
  uniq,
  findIndex,
  findLastIndex,
  slice,
  join,
  drop,
  dropRight,
  includes
} from 'lodash/fp'
import { getWeek, getYear, getMonth } from '@/utils/function/date'
import {
  lineOptions,
  getLineOption,
  heatMapOptions,
  getHeatMapOptions,
  getNewHeatMapOption
} from '@/utils/constant/event/timeline/eventTimeline'
import type { timelineDataType } from '@/types/components/event/timeline'
import world from '@/utils/constant/echarts/world.json'

// @ts-ignore
const mapWithIndex = map.convert({ cap: false })

const footStore = useFooterStore()
const { selectedId, configType } = storeToRefs(footStore)

const loadingRef: Ref<boolean> = ref(false)
let allData: timelineDataType[] | null = null

let echartsLine: EChartsType | null = null
let lineXDataDay: string[] = []
let lineXDataWeek: string[] = []
let lineXDataMonth: string[] = []
let lineXDataYear: string[] = []
let lineDataDay: number[] = []
let lineDataWeek: number[] = []
let lineDataMonth: number[] = []
let lineDataYear: number[] = []
const echartsLineRef: Ref<HTMLElement | null> = ref(null)
const lineOptionValue: Ref<string> = ref('day')

// 获取日粒度的X轴数据
const getHeatMapXDataDay = () => {
  const temp = []
  for (let j = 1; j <= 12; j++) {
    let maxDay
    const Month31Day = [1, 3, 5, 7, 8, 10, 12]
    const Month30Day = [4, 6, 9, 11]
    if (includes(j)(Month31Day)) {
      maxDay = 31
    } else if (includes(j)(Month30Day)) {
      maxDay = 30
    } else {
      maxDay = 29
    }
    for (let i = 1; i <= maxDay; i++) {
      temp.push(`${j < 10 ? `0${j}`: j}-${i < 10 ? `0${i}` : i}`)
    }
  }
  return temp
}

let echartsHeatMap: EChartsType | null = null
let heatMapXDataDay: string[] = getHeatMapXDataDay()
const heatMapXDataWeek: string[] = [
  '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28',
  '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54'
]
const heatMapXDataMonth: string[] = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
let heatMapYData: string[] = []
let heatMapDataDay: number[][] = []
let heatMapDataWeek: number[][] = []
let heatMapDataMonth: number[][] = []
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

const getLineData = (a: string[]) => {
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
  lineDataDay = flow(
    map(({ value }: { value: number }) => value)
  )(allData)

  const a = map(({ key }: { key: string }) => getWeek(key))(allData)
  lineXDataWeek = uniq(a)
  lineDataWeek = getLineData(a)

  const b = map(({ key }: { key: string }) => `${getYear(key)}${getMonth(key)}`)(allData)
  lineXDataMonth = uniq(b)
  lineDataMonth = getLineData(b)

  const c = map(({ key }: { key: string }) => `${getYear(key)}`)(allData)
  lineXDataYear = uniq(c)
  lineDataYear = getLineData(c)
}

const setLineOption = (value: string) => {
  switch (value) {
    case 'day': {
      echartsLine?.setOption(getLineOption(lineXDataDay!, lineDataDay!))
      break
    }
    case 'week': {
      echartsLine?.setOption(getLineOption(lineXDataWeek!, lineDataWeek!))
      break
    }
    case 'month': {
      echartsLine?.setOption(getLineOption(lineXDataMonth!, lineDataMonth!))
      break
    }
    default: {
      echartsLine?.setOption(getLineOption(lineXDataYear!, lineDataYear!))
      break
    }
  }
}

const handleLineChecked = (value: string) => {
  lineOptionValue.value = value
  echartsLine?.clear()
  setLineOption(value)
}

const getHeatMapData = (a: string[]) => {
  const yLineData = getLineData(a)
  return flow(
    mapWithIndex((item: string, index: number) => [
      join('')(drop(4)(item)),
      join('')(dropRight(2)(item)),
      yLineData[index]
    ])
  )(uniq(a))
}

const initHeatMapData = () => {
  // 获取Y轴数据
  heatMapYData = flow(
    map(({ key }) => getYear(key)),
    uniq
  )(allData)

  //获取日粒度的表格数据
  heatMapDataDay = flow(
    map(({ key, value }) => [
      `${join('')(slice(4, 6)(key))}-${join('')(slice(6, 8)(key))}`,
      getYear(key),
      value,
    ]),
    map((item) => [
      findIndex((o) => o === item[0])(heatMapXDataDay),
      findIndex((o) => o === item[1])(heatMapYData),
      item[2]
    ])
  )(allData)
  echartsHeatMap?.setOption(getHeatMapOptions(heatMapXDataDay, heatMapYData, heatMapDataDay))
  const customData = convertData(heatMapDataDay,0, heatMapXDataDay.length, 0, heatMapYData.length)

  //获取周粒度的表格数据=
  heatMapDataWeek = flow(
    map(({ key }: { key: string }) => getWeek(key)),
    getHeatMapData,
    map((item: (string | number)[][]) => [
      findIndex((o) => o === item[0])(heatMapXDataWeek),
      findIndex((o) => o === item[1])(heatMapYData),
      item[2]
    ])
  )(allData)

  //获取月粒度的表格数据
  heatMapDataMonth = flow(
    map(({ key }: { key: string }) => `${getYear(key)}${getMonth(key)}`),
    getHeatMapData,
    map((item: (string | number)[][]) => [
      findIndex((o) => o === item[0])(heatMapXDataMonth),
      findIndex((o) => o === item[1])(heatMapYData),
      item[2]
    ])
  )(allData)
}

const convertToPx = (dataitem: number[]) => echartsHeatMap!.convertToPixel({
  seriesId: 'test'
}, dataitem)

const convertToGeo = (dataitem: number[]) => {
  const pointobj: any = echartsHeatMap!.convertFromPixel({
    geoId: 'geo1'
  }, convertToPx(dataitem))
  return [pointobj[0], pointobj[1]]
}

const convertData = (data: number[][], x_start: number, x_end: number, y_start: number, y_end: number) => {
  const convertedData = []
  //横坐标对应的索引值范围
  x_start = Math.ceil(x_start)
  x_end = Math.ceil(x_end)
  // //纵坐标对应的索引值范围
  y_start = Math.ceil(y_start)
  y_end = Math.ceil(y_end)

  for(let i = 0;i < data.length; i++){
    if (data[i][0] >= x_start && data[i][0] < x_end && data[i][1] >= y_start && data[i][1] < y_end) {
      const geoCoord = convertToGeo([data[i][0],data[i][1]])
      geoCoord.push(data[i][2])
      convertedData.push(geoCoord)
    }
  }
  return convertedData;
}

const setHeatMapOption = (value: string) => {
  switch (value) {
    case 'day': {
      echartsHeatMap?.setOption(getHeatMapOptions(heatMapXDataDay, heatMapYData, heatMapDataDay))
      const customData = convertData(heatMapDataDay,0, heatMapXDataDay.length, 0, heatMapYData.length)
      echartsHeatMap?.setOption(getNewHeatMapOption(customData))
      break
    }
    case 'week': {
      echartsHeatMap?.setOption(getHeatMapOptions(heatMapXDataWeek, heatMapYData, heatMapDataWeek))
      const customData = convertData(heatMapDataWeek,0, heatMapXDataWeek.length, 0, heatMapYData.length)
      echartsHeatMap?.setOption(getNewHeatMapOption(customData))
      break
    }
    default: {
      echartsHeatMap?.setOption(getHeatMapOptions(heatMapXDataMonth, heatMapYData, heatMapDataMonth))
      const customData = convertData(heatMapDataMonth,0, heatMapXDataMonth.length, 0, heatMapYData.length)
      echartsHeatMap?.setOption(getNewHeatMapOption(customData))
      break
    }
  }
}

const handleHeatMapChecked = (value: string) => {
  heatMapOptionValue.value = value
  echartsHeatMap?.clear()
  console.log(echartsHeatMap?.getOption())
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
  echarts.registerMap('world', JSON.stringify(world))

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

onBeforeUnmount(() => {
  echartsLine?.dispose()
  echartsHeatMap?.dispose()
  lineResizeObserver.unobserve(echartsLineRef.value!)
  heatMapResizeObserver.unobserve(echartsHeatMapRef.value!)
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
    height: 480px;
  }
}
</style>