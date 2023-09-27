import type { RouteRecordRaw } from 'vue-router'
import renderIcon from '@/utils/function/renderIcon'
import { NavigateCircle, NotificationsSharp } from '@vicons/ionicons5'

export default [
  {
    path: '/event',
    name: 'event',
    meta: {
      breadcrumb: '事件库分析',
      icon:  renderIcon(NotificationsSharp)
    },
    redirect: { name: 'eventDisplay' },
    component: () => import('../views/LayoutView.vue'),
    children: [
      {
        path: 'display',
        name: 'eventDisplay',
        meta: {
          breadcrumb: '事件展示'
        },
        component: () => import('../views/event/display.vue')
      },
      {
        path: 'timeline',
        name: 'eventTimeline',
        meta: {
          breadcrumb: '事件时间线'
        },
        component: () => import('../views/event/timeline.vue')
      },
    ]
  },
  {
    path: '/graph',
    name: 'graph',
    meta: {
      breadcrumb: '图谱库分析',
      icon: renderIcon(NavigateCircle),
    },
    redirect: { name: 'graphDisplay' },
    component: () => import('../views/LayoutView.vue'),
    children: [
      {
        path: 'display',
        name: 'graphDisplay',
        meta: {
          breadcrumb: '图谱展示'
        },
        component: () => import('../views/graph/display.vue')
      },
      {
        path: 'timeline',
        name: 'graphTimeline',
        meta: {
          breadcrumb: '图谱时间线'
        },
        component: () => import('../views/graph/timeline.vue')
      },
    ]
  }
] as RouteRecordRaw[]