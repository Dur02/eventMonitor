<script setup lang="ts">
import type { Ref, ShallowRef } from 'vue'
import { ref, shallowRef, onMounted, watch } from 'vue'
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
import { NGi, NGrid, NRadio, NRadioGroup, NSpace, NSpin } from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import { getResultDataByConfigId } from '@/api/eventAnalyse'
import deepCopy from '@/utils/function/deepcopy'
import { flow, map } from 'lodash/fp';

const lineOptions = [
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

const footStore = useFooterStore()
const { selectedId, configType } = storeToRefs(footStore)

type ECOption = ComposeOption<
  | GridComponentOption
  | ToolboxComponentOption
  | DataZoomComponentOption
  | TitleComponentOption
  | LineSeriesOption
>

const echartsRef: Ref<HTMLElement | null> = ref(null)
const echartsLine: ShallowRef<EChartsType | null>= shallowRef(null)
const controller: AbortController = new AbortController()
const resizeObserver = new ResizeObserver(() => {
  const width = echartsRef.value?.offsetWidth
  echartsLine.value?.resize({ width, height: "auto" })
})
const loadingRef: Ref<boolean> = ref(false)
const allData = ref(null)
const lineOptionValue: Ref<string> = ref('day')
const lineXData = ref(null)
const lineYData = ref(null)

const getLineOption = (xData: Array<number>, yData: Array<string>): ECOption => ({
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
    data: xData
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: yData,
      type: 'line'
    }
  ]
})

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

  echartsLine.value = echarts.init(echartsRef.value, null, { renderer: 'svg' })

  window.addEventListener('resize', () => {
    echartsLine.value?.resize()
  }, {
    signal: controller.signal
  })
  resizeObserver.observe(echartsRef.value!)
})

const handleLineChecked = (value: string) => {
  lineOptionValue.value = value
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

const getDisplayData = () => {
  switch (lineOptionValue.value) {
    case 'day': {
      lineXData.value = flow(
        map(({ key }: { key: string }) => key)
      )(deepCopy(allData.value))
      lineYData.value = flow(
        map(({ value }: { value: number }) => value)
      )(deepCopy(allData.value))
      break
    }
    default: {
      break
    }
  }
}

watch(
  () => selectedId.value,
  async () => {
    if (selectedId.value && configType.value === 'event_timeline_viz') {
      await reloadTableData(1)
      getDisplayData()
      console.log(lineXData.value!)
      console.log(lineYData.value!)
      echartsLine.value?.setOption(getLineOption(lineXData.value!, lineYData.value!))
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
              v-for="song in lineOptions"
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
  </n-spin>
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
  height: 500px;
}
</style>