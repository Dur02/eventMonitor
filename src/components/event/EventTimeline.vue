<script setup lang="ts">
import type { Ref, ShallowRef } from 'vue'
import { ref, shallowRef, onMounted, onBeforeUnmount } from 'vue'
import type { EChartsType, ComposeOption } from 'echarts/core'
import * as echarts from 'echarts/core'
import type { GridComponentOption } from 'echarts/components'
import { GridComponent  } from 'echarts/components'
import type { LineSeriesOption } from 'echarts/charts'
import { LineChart } from 'echarts/charts'
import { LabelLayout, UniversalTransition } from 'echarts/features'
import { SVGRenderer } from 'echarts/renderers'

type ECOption = ComposeOption<
  | GridComponentOption
  | LineSeriesOption
>

const echartsRef: Ref<HTMLElement | null> = ref(null)
const echartsLine: ShallowRef<EChartsType | null>= shallowRef(null)
const controller: AbortController = new AbortController();

onMounted(() => {
  echarts.use([
    GridComponent,
    LineChart,
    LabelLayout,
    UniversalTransition,
    SVGRenderer
  ])

  const option: ECOption = {
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
})

onBeforeUnmount(() => {
  controller.abort()
  echartsLine.value?.dispose()
})
</script>

<template>
  <div class="echarts-line" ref="echartsRef" />
</template>

<style scoped lang="scss">
.echarts-line {
  width: 100%;
  height: 100%;
}
</style>