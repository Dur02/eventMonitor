<script setup lang="ts">
import { NButton, NLayoutFooter, NTabs, NTabPane, NScrollbar } from 'naive-ui'
import type { Ref } from 'vue'
import { onUpdated, ref } from 'vue'
import EventConfigForm from '@/components/form/event/EventConfigForm.vue'
import type { eventConfigFormInitialValueType } from '@/types/components/config/event'
import { eventConfigFormInitialValue } from '@/utils/constant/form/eventConfigForm'
import GraphConfigForm from '@/components/form/graph/GraphConfigForm.vue';

const footerExpand: Ref<boolean> = ref(false)
const configFormRef: Ref<any | null> = ref(null)
const eventConfigFormValue: Ref<eventConfigFormInitialValueType> = ref(eventConfigFormInitialValue)

const changeExpand = () => {
  footerExpand.value = !footerExpand.value
}
</script>

<template>
  <n-layout-footer
    class="layout-footer"
    :class="footerExpand ? 'expand' : ''"
    position="absolute"
    bordered
  >
    <div class="footer-bar">
      <n-button
        type="info"
        size="small"
        @click="changeExpand"
      >
        全库搜索
      </n-button>
    </div>
    <n-tabs
      class="form-tab"
      placement="left"
      size="medium"
      type="line"
    >
      <n-tab-pane
        name="event"
        tab="事件表单"
        display-directive="show:lazy"
      >
        <n-scrollbar style="max-height: 100%;">
          <event-config-form
            ref="configFormRef"
            :initialValue="eventConfigFormValue"
            :configType="['event_news_show_viz']"
            :formDisabled="false"
            style="padding: 5px 13px;"
          />
        </n-scrollbar>
      </n-tab-pane>
      <n-tab-pane
        name="gkg"
        tab="图谱表单"
        display-directive="show:lazy"
      >
        <n-scrollbar style="max-height: 100%;">
          <graph-config-form
            ref="configFormRef"
            :initialValue="{}"
            :configType="['event_news_show_viz']"
            :formDisabled="false"
            style="padding: 5px 13px;"
          />
        </n-scrollbar>
      </n-tab-pane>
    </n-tabs>
  </n-layout-footer>
</template>

<style scoped lang="scss">
.layout-footer {
  height: 52px;
  padding: 10px 24px;
  z-index: 3;
  transition: height .3s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);
  -moz-transition: height .3s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Firefox 4 */
  -webkit-transition: height .3s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Safari and Chrome */
  -o-transition: height .3s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Opera */

  &.expand {
    height: 500px;
  }

  .footer-bar {
    display: flex;
    justify-content: space-between;
    align-items: start;
    height: 41px;
  }

  .form-tab {
    height: calc(100% - 40px);
    border: 1px solid var(--n-border-color);
  }
}
</style>