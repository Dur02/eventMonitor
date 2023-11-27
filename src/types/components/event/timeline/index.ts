import type { ComposeOption } from 'echarts/core'
import type {
  DataZoomComponentOption,
  GridComponentOption,
  ToolboxComponentOption,
  TooltipComponentOption,
  VisualMapComponentOption,
  GeoComponentOption
} from 'echarts/components'
import type { LineSeriesOption, HeatmapSeriesOption, ScatterSeriesOption } from 'echarts/charts'

export type LineECOption = ComposeOption<
  | GridComponentOption
  | ToolboxComponentOption
  | DataZoomComponentOption
  | TooltipComponentOption
  | LineSeriesOption
>

export type HotECOption = ComposeOption<
  | GridComponentOption
  | ToolboxComponentOption
  | DataZoomComponentOption
  | VisualMapComponentOption
  | TooltipComponentOption
  | GeoComponentOption
  | HeatmapSeriesOption
>

export type ScatterECOption = ComposeOption<
  | DataZoomComponentOption
  | TooltipComponentOption
  | GridComponentOption
  | ToolboxComponentOption
  | ScatterSeriesOption
>

export type timelineDataType = { key: string, value: number }