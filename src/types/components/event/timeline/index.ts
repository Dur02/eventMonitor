import type { ComposeOption } from 'echarts/core'
import type {
  DataZoomComponentOption,
  GridComponentOption,
  TitleComponentOption,
  ToolboxComponentOption,
  TooltipComponentOption,
  GeoComponentOption
} from 'echarts/components'
import type { LineSeriesOption, HeatmapSeriesOption } from 'echarts/charts'

export type LineECOption = ComposeOption<
  | GridComponentOption
  | ToolboxComponentOption
  | DataZoomComponentOption
  | TitleComponentOption
  | TooltipComponentOption
  | LineSeriesOption
>

export type HotECOption = ComposeOption<
  | GridComponentOption
  | ToolboxComponentOption
  | DataZoomComponentOption
  | TitleComponentOption
  | TooltipComponentOption
  | HeatmapSeriesOption
  | GeoComponentOption
>

export type timelineDataType = { key: string, value: number }