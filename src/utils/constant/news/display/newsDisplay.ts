import type { EllipsisProps } from 'naive-ui'

export const orderByOptions = [
  {
    label: "降序",
    value: 'DESC',
  },
  {
    label: "升序",
    value: 'ASC',
  }
]

export const typeOptions = [
  {
    label: "标题",
    value: 0,
  },
  {
    label: "内容",
    value: 1,
  },
  {
    label: "标题和内容",
    value: 2,
  }
]

export const isExactOptions = [
  {
    label: "精确查询",
    value: 1,
  },
  {
    label: "模糊查询",
    value: 0,
  }
]

const align = 'center'
const ellipsisComponent = 'performant-ellipsis'
const ellipsis: EllipsisProps = {
  tooltip: true,
  lineClamp: 1,
}

export const graphDisplayColumns: any =[
  {
    title: '序号',
    key: 'numbers',
    align,
  },
  {
    title: '事件ID集合',
    key: 'cameoeventids',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '日期',
    key: 'date',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '报道数',
    key: 'numarts',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '冲突集列表',
    key: 'counts',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '地理列表',
    key: 'locations',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '组织列表',
    key: 'organizations',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '人物列表',
    key: 'persons',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '主题列表',
    key: 'themes',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '情感值',
    key: 'tone',
    ellipsis,
    align,
    ellipsisComponent,
    children: [
      {
        title: '平均情感',
        key: 'tone.avgEm',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: '正向情感',
        key: 'tone.proEm',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: '负向情感',
        key: 'tone.negEm',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: '极性词比例',
        key: 'tone.polRa',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: '活动词比例',
        key: 'tone.actRa',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: '代称词比例',
        key: 'tone.propRa',
        ellipsis,
        align,
        ellipsisComponent
      }
    ]
  },
  {
    title: '来源',
    key: 'sources',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: '来源url',
    key: 'sourceurls',
    ellipsis,
    align,
    ellipsisComponent
  },
]