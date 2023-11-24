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

export const getHeatMapOptions = (xData: string[], yData: string[], data: number[][]): HotECOption => ({
  tooltip: {
    show: true,
    formatter: function (params: any): string {
      if (params.value) {
        return yData[params.value[1]] + '-' + xData[params.value[0]]+ ':' + params.value[2]
      }
      return ''
    }
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  geo: [{
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
  }],
  grid: {
    show: true,
    top: '10%',
    bottom: '15%',
    left: '5%',
    right: '5%',
    borderColor: 'rgb(0,0,0,0)'
  },
  calculable: true,
  animation: false,
  xAxis: {
    type: 'category',
    data: xData
  },
  yAxis: {
    type: 'category',
    data: yData
  },
  visualMap: [
    {
      show: false,
      min: 0,
      max: max(map((item: number[]): number => item[2])(data)),
      top: 'bottom',
      seriesIndex: 1,
      calculable: true,
      inRange: {
        color: ['blue', 'cyan', 'lime', 'yellow', 'red'],
        opacity: [0, 0, 0, 0, 0]
      }
    }
  ],
  series: [
    {
      id: 'test',
      name: 'fs',
      type: 'heatmap',
      coordinateSystem: 'cartesian2d',
      data: data,
      itemStyle: {
        color: 'rgba(0, 0, 0, 0)'
      }
    },
  ]
})

export const getNewHeatMapOption = (data: number[][]): HotECOption => ({
  visualMap: [
    {
      show: false,
      min: 0,
      max: max(map((item: number[]): number => item[2])(data)),
      top: 'bottom',
      seriesIndex: 1,
      calculable: true,
      inRange: {
        color: ['blue', 'cyan', 'lime', 'yellow', 'red'],
        opacity: [0, 0, 0, 0, 0]
      }
    }
  ],
  dataZoom:[
    {
      type: 'inside',
      xAxisIndex: [0],
      filterMode: 'none'
    },
    {
      type: 'inside',
      yAxisIndex: [0],
      filterMode: 'none'
    },
    {
      id: 'dataZoomX',
      type: 'slider',
      xAxisIndex: [0],
      filterMode: 'none'
    },
    {
      id: 'dataZoomY',
      type: 'slider',
      yAxisIndex: [0],
      filterMode: 'none'
    }
  ],
  series: [
    {
      name: 'testheatmap',
      type: 'heatmap',
      id:'testheatmap',
      coordinateSystem: 'geo',
      geoIndex: 0,
      data: data,
      blurSize: 10,
      pointSize: 8
    },
  ],
})