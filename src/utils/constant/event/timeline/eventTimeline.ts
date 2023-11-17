import type { HotECOption, LineECOption } from '@/types/components/event/timeline'

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
    left: '2%',
    right: '2%',
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

export const getHeatMapOptions = (xData: string[], yData: number[], data: Array<Array<number>>): HotECOption => ({
  backgroundColor: '#0e1529',
  tooltip: {
    show: true,
    formatter: function (params) {
      console.log(params)
      return `${params}`
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
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  geo: [{
    map:'world',
    zoom: 1,
    roam: true,
    show:false,
    id:'geo1',
    itemStyle:{
      areaColor:'rgb(0,0,0,0)'
    },
    height:'100%',
    width:'100%'
  }],
  grid: {
    left: '2%',
    right: '2%',
    bottom: '10%',
    top: '10%',
    containLabel: true
  },
  calculable: true,
  animation: false,
  xAxis: {
    type: 'category',
    axisTick:{
      interval:0
    },
    axisLine: {
      lineStyle: {
        color: '#F1F1F3'
      }
    },
    data: xData
  },
  yAxis: {
    type: 'category',
    axisLine: {
      lineStyle: {
        color: '#F1F1F3'
      }
    },
    data: yData
  },
  series: [
    {
      id:'test',
      name: "fs",
      type: 'heatmap',
      coordinateSystem: 'cartesian2d',
      data: data,
      // gridIndex:0,
      // gradientColors: ['blue', 'cyan', 'lime', 'yellow', 'red'],
      blurSize: 10,
      pointSize: 10,
      itemStyle: {
        color: 'rgb(0,0,0,0)'
      }
    },
  ]
})