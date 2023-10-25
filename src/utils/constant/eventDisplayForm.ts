import type { CardProps, FormProps, FormRules, SelectGroupOption, SelectOption } from 'naive-ui'

type CardThemeOverrides = NonNullable<CardProps['themeOverrides']>
type FormThemeOverrides = NonNullable<FormProps['themeOverrides']>

export const cardThemeOverrides: CardThemeOverrides = {
  paddingMedium: '15px 20px'
}

export const formThemeOverrides: FormThemeOverrides = {
  blankHeightMedium: '10px'
}

export const initialFormValue = {
  date: null,
  dataSource: 'dataSource1',
  weight: 'weight1',
  statistics: 'statistics1',
  role: {
    role1: {
      country: [],
      organization: [],
      religion1: [],
      religion2: [],
      race: [],
      type1: [],
      type2: [],
      type3: [],
      geographicFeature: null,
      state: [],
      fullyGeographic: '',
      caseSensitive: true
    },
    role2: {
      country: [],
      organization: [],
      religion1: [],
      religion2: [],
      race: [],
      type1: [],
      type2: [],
      type3: [],
      geographicFeature: null,
      state: [],
      fullyGeographic: '',
      caseSensitive: true
    }
  },
  event: {
    type: {
      class: [],
      root: [],
      base: [],
      sub: []
    },
    place: {
      geographicFeature: null,
      state: [],
      fullyGeographic: [],
      caseSensitive: true
    },
    other: {
      sourceUrl: '',
      emotion: [],
      effect: [],
      isRoot: null
    }
  }
}

export const rules: FormRules = {
  date: {
    type: 'array',
    required: true,
    message: '请选择日期',
    trigger: ['change', 'blur']
  },
  dataSource: {
    required: true,
    message: '请选择数据源',
    trigger: ['input', 'blur']
  },
  weight: {
    required: true,
    message: '请选择权重依据',
    trigger: ['input', 'blur']
  },
  statistics: {
    required: true,
    message: '请选择统计依据',
    trigger: ['input', 'blur']
  }
}

export const rootOptions: Array<SelectOption | SelectGroupOption> = [
  {
    label: '是',
    value: 'true'
  },
  {
    label: '否',
    value: 'false'
  }
]