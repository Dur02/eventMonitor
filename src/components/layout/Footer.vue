<script setup lang="ts">
import { NButton, NIcon, NLayoutFooter, NScrollbar } from 'naive-ui'
import { ArrowBackSharp, ArrowForward, CaretDownCircle, CaretUpCircle } from '@vicons/ionicons5'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useRoute } from 'vue-router'
import type { Ref } from 'vue'
import { ref, watch } from 'vue'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import CommonForm from '@/components/layout/CommonForm.vue'
import { getFooterBtn, getSearchInitial } from '@/api/footer'
import { getEventConfigList } from '@/api/codeDict';

const route: RouteLocationNormalizedLoaded = useRoute()
const footerStore = useFooterStore()
const { selectedBtn } = storeToRefs(footerStore)
const { setSelectedBtn, setInitialData } = footerStore

const footerBtn: Ref<any[]> = ref([])
const currentPage: Ref<number> = ref(1)
const footerForm: any = ref(null)
const scrollContainer: any = ref(null)
const scrollWrapper: Ref<HTMLElement | null> = ref(null)
const footerExpand: Ref<boolean> = ref(false)

const handleScroll = (e: WheelEvent) => {
  const eventDelta = -e.deltaY
  scrollContainer.value!.scrollBy({ left: eventDelta < 0 ? 100 : -100 })
}

const changeSelectedTab = (name: string) => {
  if (selectedBtn.value !== name) {
    setSelectedBtn(name)
    const res = getSearchInitial(name)
    setInitialData(res)
    if (footerForm.value?.restoreValidation) {
      footerForm.value?.restoreValidation()
    }
  }
}

const changeExpand = () => {
  footerExpand.value = !footerExpand.value
  if (!footerExpand.value) {
    if (footerForm.value?.restoreValidation) {
      footerForm.value?.restoreValidation()
    }
  }
}

const changePage = (isNext: boolean): void => {
  switch (isNext) {
    case true: {
      footerBtn.value = getFooterBtn('number')
      setSelectedBtn(footerBtn.value[0]?.name)
      const initialRes = getSearchInitial(footerBtn.value[0]?.name)
      setInitialData(initialRes)
      break
    }
    default: {
      footerBtn.value = getFooterBtn('letter')
      setSelectedBtn(footerBtn.value[0]?.name)
      const initialRes = getSearchInitial(footerBtn.value[0]?.name)
      setInitialData(initialRes)
      break
    }
  }
}

const handleSearchNow = () => {
  setSelectedBtn('')
  if (footerForm.value?.restoreValidation) {
    footerForm.value?.restoreValidation()
  }
  footerExpand.value = true
}

const reload = async () => {
  // const res = await getEventConfigList({ pageSize: 10, pageNum: 1 })
  // console.log(res)
  footerBtn.value = getFooterBtn(route.meta.type as string)
  setSelectedBtn(footerBtn.value[0]?.name)
  const initialRes = getSearchInitial(footerBtn.value[0]?.name)
  setInitialData(initialRes)
}

watch(
  () => route.name,
  async () => {
    await reload()
  },
  {
    immediate: true
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
        class="fixed-btn"
        type="warning"
        size="small"
        @click="() => changePage(false)"
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
        style="margin: 0 10px;"
        trigger="none"
        @wheel.native.prevent="handleScroll"
        x-scrollable
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
        class="fixed-btn"
        type="warning"
        size="small"
        @click="() => changePage(true)"
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
  height: 52px;
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
    height: 41px;

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
      width: 500px;
      margin: 0 10px;
      overflow: hidden;

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