<script setup lang="ts">
import { NButton, NLayoutFooter, NIcon, NScrollbar } from 'naive-ui'
import { CaretUpCircle, CaretDownCircle, ArrowForward, ArrowBackSharp } from '@vicons/ionicons5'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useRoute } from 'vue-router'
import type { Ref } from 'vue'
import { onMounted, ref, watch } from 'vue'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import CommonForm from '@/components/layout/CommonForm.vue'

const route: RouteLocationNormalizedLoaded = useRoute()
const footerStore = useFooterStore()
const { footerBtn, selectedBtn } = storeToRefs(footerStore)
const { setFooterBtn, setSelectedBtn, setCurrentRoute } = footerStore

const scrollContainer: any = ref(null)
const footerExpand: Ref<boolean> = ref(false)

// const btnArray1 = [
//   {
//     name: 'A关系'
//   },
//   {
//     name: 'B关系'
//   },
//   {
//     name: 'c关系'
//   },
//   {
//     name: 'd关系'
//   },
//   {
//     name: 'e关系'
//   },
//   {
//     name: 'f关系'
//   },
//   {
//     name: 'g关系'
//   },
//   {
//     name: 'h关系'
//   },
//   {
//     name: 'i关系'
//   },
//   {
//     name: 'j关系'
//   },
//   {
//     name: 'k关系'
//   },
//   {
//     name: 'l关系'
//   },
//   {
//     name: 'm关系'
//   },
//   {
//     name: 'n关系'
//   },
//   {
//     name: 'o关系'
//   },
//   {
//     name: 'p关系'
//   },
//   {
//     name: 'q关系'
//   },
//   {
//     name: 'r关系'
//   },
//   {
//     name: 's关系'
//   },
//   {
//     name: 't关系'
//   },
//   {
//     name: 'u关系'
//   },
//   {
//     name: 'v关系'
//   },
//   {
//     name: 'w关系'
//   },
//   {
//     name: 'x关系'
//   },
//   {
//     name: 'y关系'
//   },
//   {
//     name: 'z关系'
//   },
// ]

// const btnArray2 = [
//   {
//     name: '1关系'
//   },
//   {
//     name: '2关系'
//   },
//   {
//     name: '3关系'
//   },
//   {
//     name: '4关系'
//   },
//   {
//     name: '5关系'
//   },
//   {
//     name: '6关系'
//   },
//   {
//     name: '7关系'
//   },
//   {
//     name: '8关系'
//   },
//   {
//     name: '9关系'
//   },
//   {
//     name: '10关系'
//   },
//   {
//     name: '11关系'
//   },
//   {
//     name: '12关系'
//   },
//   {
//     name: '13关系'
//   },
//   {
//     name: '14关系'
//   },
//   {
//     name: '15关系'
//   },
//   {
//     name: '16关系'
//   },
//   {
//     name: '17关系'
//   },
//   {
//     name: '18关系'
//   },
//   {
//     name: '19关系'
//   },
//   {
//     name: '20关系'
//   },
//   {
//     name: '21关系'
//   },
//   {
//     name: '22关系'
//   },
//   {
//     name: '23关系'
//   },
//   {
//     name: '24关系'
//   },
//   {
//     name: '25关系'
//   },
//   {
//     name: '26关系'
//   },
// ]

// const getFooterBtn = () => {
//   switch (route.name) {
//     case 'eventDisplay':
//       return btnArray1
//     case 'eventTimeline':
//       return btnArray2
//     default:
//       return []
//   }
// }

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
        scrollContainer.value!.scrollBy({ left: containerWidth })
        break
      case false:
        scrollContainer.value!.scrollBy({ left: -containerWidth })
        break
      default:
        break
    }
  }
}

const changeSelectedTab = (name: string) => {
  setSelectedBtn(name)
}

const changeExpand = () => {
  footerExpand.value = !footerExpand.value
}

const refreshBtn = () => {
  if (route.meta?.requestBtn) {
    // 模拟footer进行按钮组数据请求
    const res = (route.meta.requestBtn as Function)()
    setFooterBtn(res)
    setSelectedBtn(footerBtn.value[0]?.name)
    setCurrentRoute(route.name as string)
  } else {
    setFooterBtn([])
    setSelectedBtn('')
    setCurrentRoute('')
  }
}

onMounted(async () => {
  refreshBtn()
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
        v-if="footerBtn.length !== 0"
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
      <n-scrollbar
        class="scroll-container"
        ref="scrollContainer"
        x-scrollable
        style="margin: 0 10px;"
        @wheel.native.prevent="(e) => handleScroll(e, undefined)"
      >
        <div class="scroll-wrapper">
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
        v-if="footerBtn.length !== 0"
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
        @click="changeExpand"
      >
        即时查询
      </n-button>
    </div>
    <common-form>
      <component
        :is="route.meta.footerForm"
        :selectedBtn="selectedBtn"
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