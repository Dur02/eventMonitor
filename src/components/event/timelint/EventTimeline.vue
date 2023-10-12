<script setup lang="ts">
import type { Ref, ShallowRef } from 'vue'
import { ref, shallowRef, onMounted, onBeforeUnmount } from 'vue'
import type { EChartsType, ComposeOption } from 'echarts/core'
import * as echarts from 'echarts/core'
import type {
  GridComponentOption,
  ToolboxComponentOption,
  DataZoomComponentOption,
  TitleComponentOption
} from 'echarts/components'
import {
  GridComponent,
  ToolboxComponent,
  DataZoomComponent,
  TitleComponent
} from 'echarts/components'
import type { LineSeriesOption } from 'echarts/charts'
import { LineChart } from 'echarts/charts'
import { LabelLayout, UniversalTransition } from 'echarts/features'
import { SVGRenderer } from 'echarts/renderers'
import { NGi, NGrid, NRadio, NRadioGroup, NSpace } from 'naive-ui'

type ECOption = ComposeOption<
  | GridComponentOption
  | ToolboxComponentOption
  | DataZoomComponentOption
  | TitleComponentOption
  | LineSeriesOption
>

const echartsRef: Ref<HTMLElement | null> = ref(null)
const echartsLine: ShallowRef<EChartsType | null>= shallowRef(null)
const controller: AbortController = new AbortController();
const resizeObserver = new ResizeObserver(() => {
  const width = echartsRef.value?.offsetWidth
  echartsLine.value?.resize({ width, height: "auto" })
})
const value: Ref<string> = ref('day')
const songs = [
  {
    value: "year",
    label: "年"
  },
  {
    value: 'month',
    label: '月'
  },
  {
    value: 'week',
    label: '周'
  },
  {
    value: 'day',
    label: '日'
  }
]

onMounted(() => {
  echarts.use([
    GridComponent,
    ToolboxComponent,
    DataZoomComponent,
    TitleComponent,
    LineChart,
    LabelLayout,
    UniversalTransition,
    SVGRenderer
  ])

  const option: ECOption = {
    toolbox: {
      feature: {
        dataZoom: {
          yAxisIndex: 'none',
          title: {
            zoom: '区域缩放',
            back: '区域缩放还原'
          }
        },
        restore: {
          title: '还原'
        },
        saveAsImage: {
          title: '保存为图谱'
        },
        dataView: {
          title: '数据视图'
        }
      }
    },
    dataZoom: [
      {
        type: 'inside',
      },
      {
        type: 'slider',
        textStyle:{
          color:"#fff"
        }
      }
    ],
    xAxis: {
      type: 'category',
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        data: [150, 230, 224, 218, 135, 147, 260],
        type: 'line'
      }
    ]
  };

  echartsLine.value = echarts.init(echartsRef.value, null, { renderer: 'svg' })
  echartsLine.value.setOption(option)

  window.addEventListener('resize', () => {
    echartsLine.value?.resize()
  }, {
    signal: controller.signal
  })
  resizeObserver.observe(echartsRef.value!)
})

onBeforeUnmount(() => {
  controller.abort()
  resizeObserver.unobserve(echartsRef.value!)
  echartsLine.value?.dispose()
})
</script>

<template>
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
        v-model:value="value"
      >
        <n-space justify="end">
          <n-radio
            v-for="song in songs"
            :key="song.value"
            :value="song.value"
          >
            {{ song.label }}
          </n-radio>
        </n-space>
      </n-radio-group>
    </n-gi>
  </n-grid>
  <div class="echarts-line" ref="echartsRef" />
</template>

<style scoped lang="scss">
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

.echarts-line {
  width: 100%;
  height: 100%;
}
</style>