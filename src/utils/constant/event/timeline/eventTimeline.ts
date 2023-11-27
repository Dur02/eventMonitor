import type { HotECOption, LineECOption, ScatterECOption } from '@/types/components/event/timeline'
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
      // dataView: {
      //   title: '数据视图'
      // }
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
    formatter: (params: any) => {
      if (params?.value) {
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
  // dataZoom: [
  //   {
  //     type: 'inside',
  //     xAxisIndex: [0]
  //   },
  //   {
  //     type: 'slider',
  //     xAxisIndex: [0]
  //   },
  //   {
  //     type: 'inside',
  //     yAxisIndex: [0]
  //   },
  //   {
  //     type: 'slider',
  //     yAxisIndex: [0]
  //   }
  // ],
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
  visualMap: [
    {
      show: false,
      type: 'piecewise',
      calculable: false,
      min: 0,
      max: max(map((item: number[]): number => item[2])(data))
    }
  ],
  geo: {
    map: 'world',
    zoom: 1,
    roam: false,
    show: false,
    id: 'geo1',
    itemStyle: {
      areaColor: 'rgba(0, 0, 0, 0)'
    },
    height: '100%',
    width: '100%'
  },
  series: [
    {
      id: 'test',
      name: "fs",
      type: 'heatmap',
      coordinateSystem: 'cartesian2d',
      data: data,
      emphasis: {
        itemStyle: {
          borderColor: '#333',
          borderWidth: 1,
        }
      },
      itemStyle: {
        color: 'rgba(0, 0, 0, 0)',
        opacity: 0
      },
      progressive: 2000
    }
  ]
})

export const getNewHeatMapOption = (data: number[][]): HotECOption => ({
  visualMap: [
    {
      inRange: {
        color: ['blue', 'cyan', 'lime', 'yellow', 'red']
      },
      // pieces: [
      //   // { value: 0, color: '#f5f7f9' },
      //   { gt: 0, lte: 100, color: 'blue' },
      //   { gt: 100, lte: 1000, color: 'cyan' },
      //   { gt: 1000, lte: 10000, color: 'lime' },
      //   { gt: 10000, lte: 100000, color: 'yellow' },
      //   { gt: 100000, color: 'red' },
      // ]
    }
  ],
  dataZoom:[
    {
      // type: 'inside',
      xAxisIndex: [0],
      filterMode: 'empty'
    },
    {
      // type: 'inside',
      yAxisIndex: [0],
      filterMode: 'empty'
    },
    {
      id: 'dataZoomX',
      type: 'slider',
      xAxisIndex: [0],
      filterMode: 'empty'
    },
    {
      id: 'dataZoomY',
      type: 'slider',
      yAxisIndex: [0],
      filterMode: 'empty'
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
      pointSize: 8,
      progressive: 2000
    },
  ],
})

export const getScatterOption = (xData, yData, data): ScatterECOption => ({
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
      // dataView: {
      //   title: '数据视图'
      // }
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
  tooltip: {
    position: 'top',
    formatter: (params: any) => {
      if (params?.value) {
        return yData[params.value[1]] + '-' + xData[params.value[0]]+ ':' + params.value[2]
      }
      return ''
    }
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
    type: 'category',
    data: yData
  },
  color: [
    {
      type: 'radial',
      x: 0.5,
      y: 0.5,
      r: 0.5,
      colorStops: [{
        offset: 0, color: 'yellow' // 0% 处的颜色
      }, {
        offset: 1, color: 'green' // 100% 处的颜色
      }],
      global: false // 缺省为 false
    }
  ],
  series: [
    {
      name: 'Punch Card',
      type: 'scatter',
      symbol: 'circle',
      symbolSize: 20,
      // symbolSize: (params) => {
      //   if (params[2] === 0) return 0
      //   return 20
      // },
      data: data,
      itemStyle: {
        color: (params) => {
          if (params.data[2] === 0) return 'rgba(0, 0, 0, 0)'
          return {
            type: 'radial',
            x: 0.5,
            y: 0.5,
            r: 0.5,
            colorStops: [
              {
                offset: 0, color: '#fcf16e' // 0% 处的颜色
              },
              {
                offset: .5, color: '#afdd22' // 0% 处的颜色
              },
              {
                offset: 1, color: '#3eede7' // 100% 处的颜色
              }
            ],
            global: false // 缺省为 false
          }
        }
      },
      progressive: 2000
    }
  ]
})