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

export const getLineOption = (xData: string[], data: number[]): LineECOption => ({
  toolbox: {
    feature: {
      dataZoom: {
        yAxisIndex: 'none',
        title: {
          zoom: '区域缩放',
          back: '区域缩放还原'
        }
      },
      // restore: {
      //   title: '还原'
      // },
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
      data: data,
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

export const getHeatMapOptions = (xData: string[], yData: string[], data: number[][]): HotECOption => {
  console.log(xData)
  console.log(yData)
  console.log(data)

  return {
    tooltip: {
      show: true,
      formatter: (params: any) => {
        if (params?.value) {
          return `${params.value[1]}-${params.value[0]}: ${params.value[2]}`
        }
        return ''
      }
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
      type: 'piecewise',
      min: 0,
      max: max(map((item: number[]): number => item[2])(data)),
      pieces: [
        // { value: 0, color: '#f5f7f9' },
        { gt: 0, lte: 100, color: '#313695' },
        { gt: 100, lte: 1000, color: '#598dc0' },
        { gt: 1000, lte: 10000, color: '#177cb0' },
        { gt: 10000, lte: 100000, color: '#e34a33' },
        { gt: 100000, color: '#a50026' },
      ]
    },
    geo: {
      map: 'world',
      zoom: 1,
      roam: true,
      show: false,
      id: 'geo1',
      itemStyle: {
        areaColor: 'rgb(0,0,0,0)'
      },
      height: '100%',
      width: '100%'
    },
    series: [
      {
        id: 'test',
        name: "fs",
        type: 'heatmap',
        coordinateSystem: 'geo',
        geoIndex: 0,
        data: data,
        emphasis: {
          itemStyle: {
            borderColor: '#333',
            borderWidth: 1,
          }
        },
        blurSize: 10,
        pointSize: 10,
        progressive: 1000
      }
    ]
  }
}