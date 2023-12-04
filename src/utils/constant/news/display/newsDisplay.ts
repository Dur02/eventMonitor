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
    title: 'cameoeventids',
    key: 'cameoeventids',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'counts',
    key: 'counts',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'date',
    key: 'date',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'locations',
    key: 'locations',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'numarts',
    key: 'numarts',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'organizations',
    key: 'organizations',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'persons',
    key: 'persons',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'sources',
    key: 'sources',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'sourceurls',
    key: 'sourceurls',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'themes',
    key: 'themes',
    ellipsis,
    align,
    ellipsisComponent
  },
  {
    title: 'tone',
    key: 'tone',
    ellipsis,
    align,
    ellipsisComponent,
    children: [
      {
        title: 'actRa',
        key: 'tone.actRa',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: 'avgEm',
        key: 'tone.avgEm',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: 'negEm',
        key: 'tone.negEm',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: 'polRa',
        key: 'tone.polRa',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: 'proEm',
        key: 'tone.proEm',
        ellipsis,
        align,
        ellipsisComponent
      },
      {
        title: 'propRa',
        key: 'tone.propRa',
        ellipsis,
        align,
        ellipsisComponent
      }
    ]
  }
]