<script setup lang="ts">
import { NButton, NIcon, NLayoutFooter, NScrollbar, useMessage } from 'naive-ui'
import { ArrowBackSharp, ArrowForward, CaretDownCircle, CaretUpCircle } from '@vicons/ionicons5'
import type { RouteLocationNormalizedLoaded } from 'vue-router'
import { useRoute } from 'vue-router'
import type { Ref } from 'vue'
import { ref, watch } from 'vue'
import { useSystemStore } from '@/stores/system'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import { layoutFooterLightThemeOverrides, layoutFooterDarkThemeOverrides } from '@/utils/constant/layout/footer'
import CommonForm from '@/components/layout/CommonForm.vue'

const message = useMessage()

const route: RouteLocationNormalizedLoaded = useRoute()

const footerStore = useFooterStore()
const { isSearchNow, paginationReactive, selectedId, configList, footerExpand } = storeToRefs(footerStore)
const { getConfigList, setSelectedId, setIsSearchNow, setFooterExpand } = footerStore
const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)

const footerForm: any = ref(null)
const scrollContainer: any = ref(null)
const scrollWrapper: Ref<HTMLElement | null> = ref(null)

const handleScroll = (e: WheelEvent) => {
  const eventDelta = -e.deltaY
  scrollContainer.value!.scrollBy({ left: eventDelta < 0 ? 100 : -100 })
}

const changeSelectedTab = (id: number) => {
  setIsSearchNow(false)
  if (selectedId.value !== id) {
    setSelectedId(id)
    if (footerForm.value?.restoreValidation) {
      footerForm.value?.restoreValidation()
    }
  }
}

const changeExpand = () => {
  setFooterExpand(!footerExpand.value)
  if (!footerExpand.value) {
    if (footerForm.value?.restoreValidation) {
      footerForm.value?.restoreValidation()
    }
  }
}

const changePage = (isNext: boolean): void => {
  switch (isNext) {
    case true: {
      reloadConfigList(paginationReactive.value.page! + 1, paginationReactive.value.pageSize!)
      break
    }
    default: {
      reloadConfigList(paginationReactive.value.page! - 1, paginationReactive.value.pageSize!)
      break
    }
  }
}

const handleSearchNow = () => {
  setIsSearchNow(true)
  if (footerForm.value?.restoreValidation) {
    footerForm.value?.restoreValidation()
  }
  setFooterExpand(true)
}

const reloadConfigList = async (page: number, pageSize: number) => {
  if (route.meta.requestFunc && route.meta.type && route.meta.instantQuery) {
    try {
      await getConfigList(
        route.meta.requestFunc as Function,
        route.meta.type as string,
        route.meta.instantQuery as Function,
        page,
        pageSize
      )
    } catch (e) {
      //
    }
  }
}

watch(
  () => route.name,
  async () => {
    await reloadConfigList(1, paginationReactive.value.pageSize!)
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
    :theme-overrides="isLight ? layoutFooterLightThemeOverrides : layoutFooterDarkThemeOverrides"
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
        v-if="paginationReactive.itemCount! > paginationReactive.pageSize!"
        class="fixed-btn"
        :disabled="paginationReactive.page! === 1"
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
            v-for="item in configList"
            :type="selectedId === item.id && !isSearchNow ? 'primary': 'tertiary'"
            :key="item.id"
            size="small"
            @click="() => changeSelectedTab(item.id)"
          >
            {{ item.configName }}
          </n-button>
        </div>
      </n-scrollbar>
      <n-button
        v-if="paginationReactive.itemCount! > paginationReactive.pageSize!"
        class="fixed-btn"
        :disabled="paginationReactive.page! + 1 > Math.ceil(paginationReactive.itemCount! / paginationReactive.pageSize!)"
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
  transition: height .2s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);
  -moz-transition: height .2s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Firefox 4 */
  -webkit-transition: height .2s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Safari and Chrome */
  -o-transition: height .2s, box-shadow .3s var(--n-bezier), background-color .3s var(--n-bezier), color .3s var(--n-bezier);  /* Opera */

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