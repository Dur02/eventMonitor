<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { nextTick, reactive, ref, watch } from 'vue'
import { searchNews } from '@/api/news'
import type { PaginationInfo, PaginationProps, ScrollbarInst } from 'naive-ui'
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
  NSkeleton
} from 'naive-ui'
import { storeToRefs } from 'pinia'
import { flow, map, split } from 'lodash/fp'
import { useFooterStore } from '@/stores/footer'
import type { NewsSearchValueType } from '@/types/components/news/display'
import { isExactOptions, orderByOptions, typeOptions } from '@/utils/constant/news/display/newsDisplay'
import deepCopy from '@/utils/function/deepcopy'
import { formatTimeStamp } from '@/utils/function/date';
import { intersection } from 'lodash';

// @ts-ignore
const mapWithIndex = map.convert({ cap: false })

const footStore = useFooterStore()
const { selectedId, configType } = storeToRefs(footStore)

const newLoadingRef: Ref<boolean> = ref(false)
const i18nValue: Ref<'ZhCN' | 'EN'> = ref('ZhCN')
const searchLoadingRef: Ref<boolean> = ref(false)
const searchValue: Ref<NewsSearchValueType> = ref({
  publicTime: null,
  orderBy: 'DESC',
  type: 2,
  isExact: 1,
  queryContent: ''
})
const lastSearchValue: Ref<NewsSearchValueType> = ref({
  publicTime: null,
  orderBy: 'DESC',
  type: 2,
  isExact: 1,
  queryContent: ''
})
const scrollbarRef: Ref<ScrollbarInst | null> = ref(null)
const paginationReactive: PaginationProps = reactive({
  page: 1,
  pageSize: 30,
  itemCount: 0,
  showQuickJumper: true,
  suffix ({ itemCount }: PaginationInfo): VNodeChild {
    return `共${itemCount}条`
  }
})
const data: Ref<any[]> = ref([])

const handleSearch = async () => {
  if (!searchLoadingRef.value) {
    searchLoadingRef.value = true
    lastSearchValue.value = deepCopy(searchValue.value)
    await reloadTableData(1)
    searchLoadingRef.value = false
  }
}

const handleDateChange = (value: [number, number] | null) => {
  if (intersection(value, deepCopy(searchValue.value.publicTime)).length !== 2 ) {
    searchValue.value.publicTime = value
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
          numbers: index + (page - 1) * paginationReactive.pageSize! + 1,
          site: splitArr[0] + '//' + splitArr[2]
        }
      } else {
        return {
          ...item,
          numbers: index + (page - 1) * paginationReactive.pageSize! + 1,
          site: ''
        }
      }
    })
  )(rows)
  paginationReactive.itemCount = total
}

const reloadTableData = async (page: number) => {
  if (!newLoadingRef.value) {
    newLoadingRef.value = true
    paginationReactive.page = page
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
        pageSize: paginationReactive.pageSize,
        ...lastSearchValue.value,
        beginPubtime: lastSearchValue.value.publicTime ? formatTimeStamp(lastSearchValue.value.publicTime[0]) : null,
        endPubtime: lastSearchValue.value.publicTime ? formatTimeStamp(lastSearchValue.value.publicTime[1]) : null,
      })
      setNewData(page, total, rows)
    } catch (e) {
      //
    }
    newLoadingRef.value = false
  }
}

const handleTitleClick = () => {
  console.log('title')
}

const handleEventClick = () => {
  console.log('event')
}

const handleGraphClick = () => {
  console.log('graph')
}

watch(
  () => selectedId.value,
  async () => {
    if (selectedId.value && configType.value === 'event_news_show_viz') {
      await reloadTableData(1)
      scrollbarRef.value?.scrollTo({ top: 0 })
    }
  },
  {
    immediate: true
  }
)

footStore.$onAction(({ name, after }) => {
  if (name === 'instantQuery') {
    after((res) => {
      if (!newLoadingRef.value && res.data.resultData) {
        newLoadingRef.value = true
        const {
          data: {
            resultData: {
              rows,
              total
            }
          }
        } = res
        setNewData(1, total, rows)
        scrollbarRef.value?.scrollTo({ top: 0 })
        newLoadingRef.value = false
      }
    })
  }
})
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
    style="max-height: calc(100vh - 258px);"
  >
    <n-space v-if="data.length !== 0" vertical :size="[0, 10]">
      <n-card
        v-for="item in data"
        class="news-card"
      >
        <n-space vertical :size="[0, 20]">
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
            <h2
              class="news-title"
              @click="handleTitleClick"
            >
              {{ item.numbers }}: {{ i18nValue === 'ZhCN' ? item.titleZh : item.title }}
            </h2>
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
                @click="handleEventClick"
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
                @click="handleGraphClick"
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
          >
            <p>{{ i18nValue === 'ZhCN' ? item.contentZh : item.content }}</p>
          </n-ellipsis>
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
    :item-count="paginationReactive.itemCount"
    show-quick-jumper
    @update:page="reloadTableData"
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
  float: right;
  margin-top: 10px;
}
</style>