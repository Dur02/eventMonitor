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
  TooltipComponent
} from 'echarts/components'
import { LineChart } from 'echarts/charts'
import { LabelLayout, UniversalTransition } from 'echarts/features'
import { SVGRenderer } from 'echarts/renderers'
import { NGi, NGrid, NRadio, NRadioGroup, NSpace, NSpin, NCard } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import { getResultDataByConfigId } from '@/api/eventAnalyse'
import { flow, map, uniq, findIndex, findLastIndex, slice } from 'lodash/fp'
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
const heatMapYData: Ref<number[] | null> = ref(null)

const controller: AbortController = new AbortController()

const lineResizeObserver = new ResizeObserver(() => {
  const lineWidth = echartsLineRef.value?.offsetWidth
  echartsLine.value?.resize({ width: lineWidth, height: "auto" })
})
const heatMapResizeObserver = new ResizeObserver(() => {
  const heatMapWidth = echartsHeatMapRef.value?.offsetWidth
  echartsHeatMap.value?.resize({ width: heatMapWidth, height: "auto" })
})

const getLineData = () => {
  const getYLineData = (a: string[]) => {
    const startArray = map((item: any) => findIndex((o) => o === item)(a))(lineXData.value)
    const endArray = map((item: any) => findLastIndex((o) => o === item)(a))(lineXData.value)
    return flow(
      mapWithIndex((item: string, index: number) => {
        let sum = 0
        flow(
          slice(startArray[index], endArray[index] + 1),
          map((item: number) => sum += item)
        )(map(({ value }: { value: number }) => value)(allData.value))
        return sum
      })
    )(lineXData.value)
  }

  switch (lineOptionValue.value) {
    case 'day': {
      lineXData.value = flow(
        map(({ key }: { key: string }) => key)
      )(allData.value)
      lineYData.value = flow(
        map(({ value }: { value: number }) => value)
      )(allData.value)
      break
    }
    case 'week': {
      const a = map(({ key }: { key: string }) => getWeek(key))(allData.value)
      lineXData.value = uniq(a)
      lineYData.value = getYLineData(a)
      break
    }
    case 'month': {
      const a = map(({ key }: { key: string }) => `${getYear(key)}${getMonth(key)}`)(allData.value)
      lineXData.value = uniq(a)
      lineYData.value = getYLineData(a)
      break
    }
    default: {
      const a = map(({ key }: { key: string }) => `${getYear(key)}`)(allData.value)
      lineXData.value = uniq(a)
      lineYData.value = getYLineData(a)
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

const getHeatMapData = () => {

}

const handleHeatMapChecked = (value: string) => {
  heatMapOptionValue.value = value
  getHeatMapData()
  echartsHeatMap.value?.clear()
  echartsHeatMap.value?.setOption(getHeatMapOptions(heatMapXData.value!, heatMapYData.value!, []))
}

const reloadTableData = async (page: number) => {
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
    LineChart,
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
      await reloadTableData(1)
      getLineData()
      echartsLine.value?.clear()
      echartsLine.value?.setOption(getLineOption(lineXData.value!, lineYData.value!))
      getHeatMapData()
      echartsHeatMap.value?.clear()
      echartsLine.value?.setOption(getHeatMapOptions(heatMapXData.value!, heatMapYData.value!, []))
    }
  },
  {
    immediate: true
  }
)

footStore.$onAction(({ name, after }) => {
  if (name === 'instantQuery') {
    after((res) => {
      if (res.data.resultData) {
        console.log(res)
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
          <h3 class="charts-title">事件时间线展示</h3>
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

  .echarts-line .echarts-heatMap {
    width: 100%;
    height: 400px;
  }
}
</style>