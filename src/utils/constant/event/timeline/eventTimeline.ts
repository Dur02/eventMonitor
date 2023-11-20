import type { HotECOption, LineECOption } from '@/types/components/event/timeline'
import { max, map } from 'lodash/fp'

export const lineOptions = [
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

export const getLineOption = (xData: string[], yData: number[]): LineECOption => ({
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
    }
  ],
  tooltip: {
    trigger: 'axis',
  },
  grid: {
    left: '5%',
    right: '5%',
    bottom: '10%',
    top: '10%',
    containLabel: true
  },
  xAxis: {
    type: 'category',
    data: xData
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: '事件数',
      smooth: true,
      data: yData,
      type: 'line'
    }
  ]
})

export const heatMapOptions = [
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

export const getHeatMapOptions = (xData: string[], yData: string[], data: Array<Array<string| number>>): HotECOption => ({
  tooltip: {
    show: true,
    formatter: (params) => `${params.value[1]}-${params.value[0]}: ${params.value[2]}`
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  dataZoom: [
    {
      type: 'inside',
      xAxisIndex: [0]
    },
    {
      type: 'slider',
      xAxisIndex: [0]
    },
    {
      type: 'inside',
      yAxisIndex: [0]
    },
    {
      type: 'slider',
      yAxisIndex: [0]
    }
  ],
  grid: {
    left: '5%',
    right: '5%',
    bottom: '10%',
    top: '10%',
    containLabel: true
  },
  animation: false,
  xAxis: {
    type: 'category',
    data: xData
  },
  yAxis: {
    type: 'category',
    data: yData
  },
  visualMap: {
    show: false,
    type: 'continuous',
    min: 0,
    max: max(map((item) => item[2])(data)),
    calculable: true,
    realtime: false,
    inRange: {
      color: ['blue', 'cyan', 'lime', 'yellow', 'red']
    }
  },
  series: [
    {
      type: 'heatmap',
      data: data,
      emphasis: {
        itemStyle: {
          borderColor: '#333',
          borderWidth: 1
        }
      },
      blurSize: 10,
      pointSize: 10,
      progressive: 1000,
      animation: false
    }
  ]
})