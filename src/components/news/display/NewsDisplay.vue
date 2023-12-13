<script setup lang="ts">
import type { Ref } from 'vue'
import { nextTick, reactive, ref, watch } from 'vue'
import { searchNews } from '@/api/news'
import type { PaginationProps, ScrollbarInst } from 'naive-ui'
import {
  NSpace,
  NCard,
  NEllipsis,
  NScrollbar,
  NEmpty,
  NText,
  NPagination,
  NButtonGroup,
  NButton,
  NForm,
  NFormItem,
  NInput,
  NDatePicker,
  NSelect,
  NSkeleton,
  NH2
} from 'naive-ui'
import { storeToRefs } from 'pinia'
import { flow, map, split, find, propEq } from 'lodash/fp'
import { useFooterStore } from '@/stores/footer'
import { isExactOptions, orderByOptions, typeOptions } from '@/utils/constant/news/display/newsDisplay'
import deepCopy from '@/utils/function/deepcopy'
import { formatTimeStamp } from '@/utils/function/date'
import { intersection } from 'lodash'
import NewsEvent from '@/components/modal/NewsEvent.vue'
import type { eventDisplayRowsType } from '@/types/components/event/display'
import NewsGraph from '@/components/modal/NewsGraph.vue'
import { useRouter, useRoute } from 'vue-router'
import { useNewsStore } from '@/stores/news'

// @ts-ignore
const mapWithIndex = map.convert({ cap: false })

const router = useRouter()
const route = useRoute()

const footStore = useFooterStore()
const { selectedId, configType, configList } = storeToRefs(footStore)

const newsStore = useNewsStore()
const { searchValue, lastSearchValue, paginationReactive } = storeToRefs(newsStore)
const { updateSearchValue, updateLastSearchValue, updatePaginationReactive, globalSearch } = newsStore

footStore.$onAction(({ name, after }) => {
  if (name === 'instantQuery') {
    after(async (res) => {
      if (route.meta.footerType === 'normal' && res.configType === 'event_news_show_viz') {
        currentEvent.value = res
        await reloadTableData(1)
      }
    })
  }
})

newsStore.$onAction(({ name, after }) => {
  if (name === 'globalSearch') {
    after(async (res) => {
      if (route.meta.footerType === 'repository') {
        setNewData(paginationReactive.value.page!, paginationReactive.value.itemCount!, res)
      }
    })
  }
})

const newLoadingRef: Ref<boolean> = ref(false)
const i18nValue: Ref<'ZhCN' | 'EN'> = ref('ZhCN')
const searchLoadingRef: Ref<boolean> = ref(false)
const newsEventDisplay: Ref<boolean> = ref(false)
const newsEventData: Ref<never[]> = ref([])
const newsGraphDisplay: Ref<boolean> = ref(false)
const newsGraphData: Ref<never[]> = ref([])
const scrollbarRef: Ref<ScrollbarInst | null> = ref(null)

const currentEvent = ref({})
const data: Ref<any[]> = ref([])

const handleSearch = async () => {
  if (!searchLoadingRef.value) {
    searchLoadingRef.value = true
    updateLastSearchValue(deepCopy(searchValue.value))
    if (route.meta.footerType === 'normal') {
      currentEvent.value = {
        ...find(propEq('id', selectedId.value))(configList.value)
      }
      await reloadTableData(1)
    }
    if (route.meta.footerType === 'repository') {
      await globalSearch()
    }
    searchLoadingRef.value = false
  }
}

const handleDateChange = (value: [number, number] | null) => {
  if (intersection(value, deepCopy(searchValue.value.publicTime)).length !== 2 && value !== deepCopy(searchValue.value.publicTime) ) {
    updateSearchValue({
      ...deepCopy(searchValue.value),
      publicTime: value
    })
    handleSearch()
  }
}

const handleInputClear = () => {
  nextTick(async () => await handleSearch())
}

const setNewData = (page: number, total: number, rows: any[]) => {
  data.value = flow(
    mapWithIndex((item: any, index: number) => {
      const splitArr = split('/')(item.url)
      if (splitArr[2]) {
        return {
          ...item,
          numbers: index + (page - 1) * paginationReactive.value.pageSize! + 1,
          site: splitArr[0] + '//' + splitArr[2]
        }
      } else {
        return {
          ...item,
          numbers: index + (page - 1) * paginationReactive.value.pageSize! + 1,
          site: ''
        }
      }
    })
  )(rows)
  updatePaginationReactive('itemCount', total)
}

const reloadTableData = async (page: number) => {
  if (!newLoadingRef.value) {
    newLoadingRef.value = true
    updatePaginationReactive('page', page)
    try {
      const {
        data: {
          resultData: {
            rows,
            total
          }
        }
      } = await searchNews({
        pageNum: page,
        pageSize: paginationReactive.value.pageSize,
        ...lastSearchValue.value,
        beginPubtime: lastSearchValue.value.publicTime ? formatTimeStamp(lastSearchValue.value.publicTime[0]) : null,
        endPubtime: lastSearchValue.value.publicTime ? formatTimeStamp(lastSearchValue.value.publicTime[1]) : null,
        event: currentEvent.value
      })
      setNewData(page, total, rows)
      scrollbarRef.value?.scrollTo({ top: 0 })
    } catch (e) {
      //
    }
    newLoadingRef.value = false
  }
}

const handleTitleClick = (urlHash: string) => {
  let routeData = router.resolve({
    path: `/news/detail/${urlHash}/${i18nValue.value}`
  })
  window.open(routeData.href, '_blank')
}

const handleEventClick = (event: never[]) => {
  if (event.length !== 0) {
    newsEventDisplay.value = true
    newsEventData.value = mapWithIndex((item: eventDisplayRowsType, index: number) => ({
      ...item,
      numbers: index + 1
    }))(event)
  }
}

const handleEventClose = (bool: boolean): void => {
  newsEventDisplay.value = bool
}

const afterEventClose = () => {
  newsEventData.value = []
}

const handleGraphClick = (graph: never[]) => {
  if (graph.length !== 0) {
    newsGraphDisplay.value = true
    newsGraphData.value = mapWithIndex((item: any, index: number) => ({
      ...item,
      numbers: index + 1
    }))(graph)
  }
}

const handleGraphClose = (bool: boolean): void => {
  newsGraphDisplay.value = bool
}

const afterGraphClose = () => {
  newsGraphData.value = []
}

const handlePageChange = async (value: number) => {
  updatePaginationReactive('page', value)
  if (route.meta.footerType === 'normal') {
    await reloadTableData(paginationReactive.value.page!)
  }
  if (route.meta.footerType === 'repository') {
    await globalSearch()
  }
}

const handlePageSizeChange = async (value: number) => {
  updatePaginationReactive('pageSize', value)
  const maxPage = Math.ceil(paginationReactive.value.itemCount! / value)
  if (paginationReactive.value.page! > maxPage) {
    updatePaginationReactive('page', maxPage)
  }
  if (route.meta.footerType === 'normal') {
    await reloadTableData(paginationReactive.value.page!)
  }
  if (route.meta.footerType === 'repository') {
    await globalSearch()
  }
}

watch(
  () => selectedId.value,
  async () => {
    if (route.meta.footerType === 'normal' && selectedId.value && configType.value === 'event_news_show_viz') {
      currentEvent.value = {
        ...find(propEq('id', selectedId.value))(configList.value)
      }
      await reloadTableData(1)
    }
  },
  {
    immediate: true
  }
)

watch(
  () => route.name,
  async () => {
    newLoadingRef.value = false
    searchLoadingRef.value = false
    updateSearchValue({
      publicTime: null,
      orderBy: 'DESC',
      type: 2,
      isExact: 1,
      queryContent: ''
    })
    updateLastSearchValue({
      publicTime: null,
      orderBy: 'DESC',
      type: 2,
      isExact: 1,
      queryContent: ''
    })
    scrollbarRef.value?.scrollTo({ top: 0 })
    updatePaginationReactive('page', 1)
    updatePaginationReactive('itemCount', 0)
    currentEvent.value = {}
    i18nValue.value = 'ZhCN'
    data.value = []
    if (route.meta.footerType === 'repository') {
      await globalSearch()
    }
  },
  {
    immediate: true
  }
)
</script>

<template>
  <n-space justify="space-between">
    <n-form
      inline
      :label-width="68"
      :model="searchValue"
      size="small"
      label-placement="left"
      :show-feedback="false"
    >
      <n-form-item label="发布时间">
        <n-date-picker
          :value="searchValue.publicTime"
          type="daterange"
          :actions="null"
          :is-date-disabled="(ts: number) => ts > Date.now()"
          update-value-on-close
          clearable
          style="width: 250px;"
          @update:value="handleDateChange"
        />
      </n-form-item>
      <n-form-item label="排序" :label-width="45">
        <n-select
          v-model:value="searchValue.orderBy"
          :options="orderByOptions"
          style="width: 75px;"
          @update:value="handleSearch"
        />
      </n-form-item>
      <n-form-item label="搜索范围">
        <n-select
          v-model:value="searchValue.type"
          :options="typeOptions"
          style="width: 120px;"
          @update:value="handleSearch"
        />
      </n-form-item>
      <n-form-item :show-label="false">
        <n-select
          v-model:value="searchValue.isExact"
          :options="isExactOptions"
          style="width: 100px;"
          @update:value="handleSearch"
        />
      </n-form-item>
      <n-form-item :show-label="false">
        <n-input
          v-model:value="searchValue.queryContent"
          placeholder="关键词搜索"
          clearable
          @keyup.enter.prevent="handleSearch"
          @clear="handleInputClear"
        />
      </n-form-item>
      <n-form-item>
        <n-button
          type="primary"
          :loading="searchLoadingRef"
          @click="handleSearch"
        >
          查询
        </n-button>
      </n-form-item>
    </n-form>
    <n-button-group
      class="i18n-btn"
      size="small"
    >
      <n-button
        :type="i18nValue === 'ZhCN' ? 'primary' : 'default'"
        @click="i18nValue = 'ZhCN'"
      >
        中文
      </n-button>
      <n-button
        :type="i18nValue === 'EN' ? 'primary' : 'default'"
        @click="i18nValue = 'EN'"
      >
        英文
      </n-button>
    </n-button-group>
  </n-space>
  <n-scrollbar
    ref="scrollbarRef"
    style="max-height: calc(100vh - 274px);"
  >
    <n-space v-if="data.length !== 0" vertical :size="[0, 10]">
      <n-card
        v-for="item in data"
        :key="item.urlHash"
        class="news-card"
      >
        <n-space vertical :size="[0, 10]">
          <n-skeleton
            v-if="newLoadingRef"
            width="60%"
            height="40px"
            text
          />
          <n-ellipsis
            v-else
            :line-clamp="1"
            :tooltip="false"
          >
            <n-h2
              class="news-title"
              @click="() => handleTitleClick(item.urlHash)"
              v-html="`${item.numbers}: ${i18nValue === 'ZhCN' ? item.titleZh : item.title}`"
            />
          </n-ellipsis>
          <n-skeleton
            v-if="newLoadingRef"
            width="50%"
            height="20px"
            text
          />
          <n-space
            v-else
            :size="[20, 10]"
          >
            <div>
              网站：
              <span v-if="item.site">{{ item.site }}</span>
              <span v-else>暂无</span>
            </div>
            <div>发布时间：{{ item.pubtime }}</div>
            <div>
              事件：
              <n-text
                type="info"
                strong
                underline
                class="bolder-text"
                :class="{ 'clickable-text': item.event.length }"
                @click="() => handleEventClick(item.event)"
              >
                {{ item.event.length }}
              </n-text>
            </div>
            <div>
              图谱：
              <n-text
                type="info"
                strong
                underline
                class="bolder-text"
                :class="{ 'clickable-text': item.gkg.length }"
                @click="() => handleGraphClick(item.gkg)"
              >
                {{ item.gkg.length }}
              </n-text>
            </div>
          </n-space>
          <n-skeleton
            v-if="newLoadingRef"
            height="20px"
            :repeat="2"
            text
          />
          <n-ellipsis
            v-else
            :line-clamp="2"
            :tooltip="false"
            :style="{
              textIndent: i18nValue === 'ZhCN' ? '2em' : '0'
            }"
            v-html="`<p>${i18nValue === 'ZhCN' ? item.contentZh : item.content}</p>`"
          />
        </n-space>
      </n-card>
    </n-space>
    <n-empty
      v-else
      size="large"
      description="无数据"
      style="margin-top: 50px;"
    />
  </n-scrollbar>
  <n-pagination
    v-if="data.length !== 0"
    class="pagination"
    v-model:page="paginationReactive.page"
    v-model:page-size="paginationReactive.pageSize"
    :item-count="paginationReactive.itemCount"
    :page-sizes="[10, 20, 50, 100]"
    show-quick-jumper
    show-size-picker
    @update:page="handlePageChange"
    @update:page-size="handlePageSizeChange"
  >
    <template #suffix="{ itemCount }">
      共{{ itemCount }}条
    </template>
  </n-pagination>
  <NewsEvent
    :show-modal="newsEventDisplay"
    :event="newsEventData"
    @modalClose="handleEventClose"
    @afterModalClose="afterEventClose"
  />
  <NewsGraph
    :show-modal="newsGraphDisplay"
    :graph="newsGraphData"
    @modalClose="handleGraphClose"
    @afterModalClose="afterGraphClose"
  />
</template>

<style scoped lang="scss">
.i18n-btn {
  margin-bottom: 10px;
}

.news-card {

  p, h2 {
    margin: 0;
  }

  .news-title {
    cursor: pointer;
  }

  .bolder-text {
    font-weight: 800;
  }

  .clickable-text {
    cursor: pointer;
  }
}

.pagination {
  justify-content: flex-end;
  margin-top: 10px;
}
</style>