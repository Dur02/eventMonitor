import type { RouteRecordRaw } from 'vue-router'
import renderIcon from '@/utils/function/renderIcon'
import { NavigateCircle, NotificationsSharp, Settings } from '@vicons/ionicons5'
import EventFooterSlot from '@/components/event/footerSlot/EventFooterSlot.vue'
import { eventInstantQuery, getEventConfigListByConfigName } from '@/api/eventAnalyse'

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
          type: 'event_show_viz',
          footerForm: EventFooterSlot,
          requestFunc: getEventConfigListByConfigName,
          instantQuery: eventInstantQuery
        },
        component: () => import('../views/event/display/EventDisplayView.vue')
      },
      {
        path: 'timeline',
        name: 'eventTimeline',
        meta: {
          breadcrumb: '事件时间线',
          hasFooter: true,
          type: 'event_timeline_viz',
          footerForm: EventFooterSlot,
          requestFunc: getEventConfigListByConfigName,
          instantQuery: eventInstantQuery
        },
        component: () => import('../views/event/timeline/EventTimelineView.vue')
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
          hasFooter: false
        },
        component: () => import('../views/graph/display/GraphDisplayView.vue')
      },
      {
        path: 'timeline',
        name: 'graphTimeline',
        meta: {
          breadcrumb: '图谱时间线',
          hasFooter: false
        },
        component: () => import('../views/graph/timeline/GraphTimelineView.vue')
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
    redirect: { name: 'eventConfigure' },
    component: () => import('../views/layout/LayoutView.vue'),
    children: [
      {
        path: 'event',
        name: 'eventConfigure',
        meta: {
          breadcrumb: '事件配置',
          hasFooter: false,
        },
        component: () => import('../views/config/event/EventConfigView.vue')
      },
      {
        path: 'graph',
        name: 'graphConfigure',
        meta: {
          breadcrumb: '图谱配置',
          hasFooter: false,
        },
        component: () => import('../views/config/graph/GraphConfigView.vue')
      },
    ]
  }
] as RouteRecordRaw[]