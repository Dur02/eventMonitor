import type { VNode } from 'vue'
import type { SelectOption } from 'naive-ui'
import { h } from 'vue'
import { NTooltip } from 'naive-ui'

export const renderOption = ({ node, option }: { node: VNode; option: SelectOption }) => h(NTooltip, null, {
    trigger: () => node,
    default: () => option.label
})