import type { RouteRecordRaw } from 'vue-router'
import renderIcon from '@/utils/function/renderIcon'
import { NavigateCircle, NotificationsSharp, Settings } from '@vicons/ionicons5'
import EventDisplayForm from '@/components/event/display/EventDisplayForm.vue'
import EventTimelineForm from '@/components/event/timeline/EventTimelineForm.vue'

export default [
  {
    path: '/event',
    name: 'event',
    meta: {
      breadcrumb: '事件库分析',
      icon: renderIcon(NotificationsSharp),
    },
    redirect: { name: 'eventDisplay' },
    component: () => import('../views/layout/LayoutView.vue'),
    children: [
      {
        path: 'display',
        name: 'eventDisplay',
        meta: {
          breadcrumb: '事件展示',
          hasFooter: true,
          type: 'letter',
          footerForm: EventDisplayForm
        },
        component: () => import('../views/event/EventDisplayView.vue')
      },
      {
        path: 'timeline',
        name: 'eventTimeline',
        meta: {
          breadcrumb: '事件时间线',
          hasFooter: true,
          type: 'number',
          footerForm: EventTimelineForm
        },
        component: () => import('../views/event/EventTimelineView.vue')
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
    component: () => import('../views/layout/LayoutView.vue'),
    children: [
      {
        path: 'display',
        name: 'graphDisplay',
        meta: {
          breadcrumb: '图谱展示',
          hasFooter: true,
        },
        component: () => import('../views/graph/GraphDisplayView.vue')
      },
      {
        path: 'timeline',
        name: 'graphTimeline',
        meta: {
          breadcrumb: '图谱时间线',
          hasFooter: true,
        },
        component: () => import('../views/graph/GraphTimelineView.vue')
      },
    ]
  },
  {
    path: '/configure',
    name: 'configure',
    meta: {
      breadcrumb: '配置管理',
      icon: renderIcon(Settings),
    },
    redirect: { name: 'graphDisplay' },
    component: () => import('../views/layout/LayoutView.vue'),
    children: [
      {
        path: 'event',
        name: 'eventConfigure',
        meta: {
          breadcrumb: '事件配置',
          hasFooter: true,
        },
        component: () => import('../views/graph/GraphDisplayView.vue')
      },
      {
        path: 'timeline',
        name: 'timelineConfigure',
        meta: {
          breadcrumb: '图谱配置',
          hasFooter: true,
        },
        component: () => import('../views/graph/GraphTimelineView.vue')
      },
    ]
  }
] as RouteRecordRaw[]