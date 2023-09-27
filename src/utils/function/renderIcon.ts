import type { Component } from 'vue'
import { h } from 'vue'
import { NIcon } from 'naive-ui'

export default (icon: Component) => {
  return () => {
    return h(NIcon, null, {
      default: () => h(icon)
    })
  }
}