<script setup lang="ts">
import { NButton, NLayoutFooter, NIcon, NScrollbar } from 'naive-ui'
import { CaretUpCircle, CaretDownCircle, ArrowForward, ArrowBackSharp } from '@vicons/ionicons5'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useRoute } from 'vue-router'
import type { Ref } from 'vue'
import { onMounted, ref, watch, onBeforeUnmount } from 'vue'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import CommonForm from '@/components/layout/CommonForm.vue'

const route: RouteLocationNormalizedLoaded = useRoute()
const footerStore = useFooterStore()
const { footerBtn, selectedBtn } = storeToRefs(footerStore)
const { setFooterBtn, setSelectedBtn, setCurrentRoute } = footerStore

const footerForm: any = ref(null)
const scrollContainer: any = ref(null)
const scrollWrapper: Ref<HTMLElement | null> = ref(null)
const footerExpand: Ref<boolean> = ref(false)
const changePageVisible = ref(false)
const resizeObserver = new ResizeObserver(() => {
  const containerWidth = scrollContainer.value?.scrollbarInstRef.containerRef.clientWidth
  const contentWidth = scrollContainer.value?.scrollbarInstRef.contentRef.clientWidth

  changePageVisible.value = containerWidth < contentWidth;
})

/**
 * @description 若container是naive ui的滚动条，使用scrollBy的api进行滚动。如果container是div元素，设置scrollLeft进行滚动
 * @author Dur02
 * @date 2023/10/16
 **/
const handleScroll = (e: WheelEvent | undefined = undefined, isForward: boolean | undefined = undefined) => {
  if (e) {
    const eventDelta = -e.deltaY
    scrollContainer.value!.scrollBy({ left: eventDelta < 0 ? 100 : -100 })
  } else {
    const container = scrollContainer.value
    const containerWidth = container?.scrollbarInstRef.containerRef.offsetWidth
    // const currentScroll = container?.scrollbarInstRef.containerRef.scrollLeft

    switch (isForward) {
      case true:
        container!.scrollBy({ left: containerWidth })
        // container!.scrollLeft = container.clientWidth
        break
      case false:
        container!.scrollBy({ left: -containerWidth })
        // container!.scrollLeft = -container.clientWidth
        break
      default:
        break
    }
  }
}

const changeSelectedTab = (name: string) => {
  if (selectedBtn.value !== name) {
    setSelectedBtn(name)
    // 模拟点击按钮后请求对应的搜索表单初始值
    const res = (route.meta.requestInitial as Function)(name)
    footerForm.value?.setFormValue(res)
  }
}

const changeExpand = () => {
  footerExpand.value = !footerExpand.value
  if (!footerExpand.value) {
    footerForm.value?.restoreValidation()
  }
}

const handleSearchNow = () => {
  setSelectedBtn('')
  footerForm.value?.resetFormValue()
  footerExpand.value = true
}

const refreshBtn = () => {
  if (route.meta?.requestBtn && route.meta?.requestInitial) {
    // 模拟footer进行按钮组数据请求
    const btnRes = (route.meta.requestBtn as Function)()
    setFooterBtn(btnRes)
    setSelectedBtn(footerBtn.value[0]?.name)
    setCurrentRoute(route.name as string)
    const initialRes = (route.meta.requestInitial as Function)(footerBtn.value[0]?.name)
    footerForm.value?.setFormValue(initialRes)
  } else {
    setFooterBtn([])
    setSelectedBtn('')
    setCurrentRoute('')
    footerForm.value?.resetFormValue()
  }
}

onMounted(async () => {
  resizeObserver.observe(scrollWrapper.value!)
  refreshBtn()
})

onBeforeUnmount(() => {
  resizeObserver.unobserve(scrollWrapper.value!)
})

watch(
  () => route.name,
  () => {
    refreshBtn()
  }
)
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
        class="fixed-btn"
        type="info"
        size="small"
        @click="changeExpand"
      >
        <template #icon>
          <n-icon>
            <CaretUpCircle v-show="!footerExpand" />
            <CaretDownCircle v-show="footerExpand" />
          </n-icon>
        </template>
      </n-button>
      <n-button
        v-if="changePageVisible"
        class="fixed-btn"
        type="warning"
        size="small"
        @click="() => handleScroll(undefined, false)"
      >
        <template #icon>
          <n-icon>
            <ArrowBackSharp />
          </n-icon>
        </template>
      </n-button>
<!--      <div ref="scrollContainer" class="scroll-container" style="margin: 0 10px;overflow: hidden;">-->
<!--        -->
<!--      </div>-->
      <n-scrollbar
        class="scroll-container"
        ref="scrollContainer"
        x-scrollable
        style="margin: 0 10px;"
        @wheel.native.prevent="(e) => handleScroll(e, undefined)"
      >
        <div class="scroll-wrapper" ref="scrollWrapper">
          <n-button
            class="footer-btn"
            v-for="item in footerBtn"
            :key="item.name"
            :type="selectedBtn === item.name ? 'primary': 'tertiary'"
            size="small"
            @click="() => changeSelectedTab(item.name)"
          >
            {{ item.name }}
          </n-button>
        </div>
      </n-scrollbar>
      <n-button
        v-if="changePageVisible"
        class="fixed-btn"
        type="warning"
        size="small"
        @click="() => handleScroll(undefined, true)"
      >
        <template #icon>
          <n-icon>
            <ArrowForward />
          </n-icon>
        </template>
      </n-button>
      <n-button
        class="fixed-btn"
        type="info"
        size="small"
        @click="handleSearchNow"
      >
        即时查询
      </n-button>
    </div>
    <common-form>
      <component
        ref="footerForm"
        :is="route.meta.footerForm"
      />
    </common-form>
  </n-layout-footer>
</template>

<style scoped lang="scss">
.layout-footer {
  height: 50px;
  padding: 10px 24px;
  z-index: 3;
  transition: height 1s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);
  -moz-transition: height 1s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Firefox 4 */
  -webkit-transition: height 1s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Safari and Chrome */
  -o-transition: height 1s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Opera */

  &.expand {
    height: 500px;
  }

  .footer-bar {
    display: flex;
    justify-content: space-between;
    align-items: start;
    height: 40px;

    .fixed-btn {
      margin: 0 5px;

      &:first-of-type {
        margin-left: 0;
      }

      &:last-of-type {
        margin-right: 0;
      }
    }

    .scroll-container {
      .scroll-wrapper {
        white-space: nowrap;

        .footer-btn {
          margin: 0 5px;

          &:first-of-type {
            margin-left: 0;
          }

          &:last-of-type {
            margin-right: 0;
          }
        }
      }
    }
  }
}
</style>