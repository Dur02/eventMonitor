<script setup lang="ts">
import type { Ref, VNodeChild } from 'vue'
import { onMounted, reactive, ref } from 'vue'
import { searchNews } from '@/api/news'
import type { PaginationInfo, PaginationProps } from 'naive-ui'
import { NSpace, NCard, NEllipsis, NButton, NA, NSkeleton } from 'naive-ui'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia'

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)

const loadingRef: Ref<boolean> = ref(false)
const paginationReactive: PaginationProps = reactive({
  page: 1,
  // pageCount: 1,
  pageSize: 30,
  // pageSizes: [10, 20, 50, 100],
  itemCount: 0,
  // showSizePicker: true,
  showQuickJumper: true,
  suffix ({ itemCount }: PaginationInfo): VNodeChild {
    return `共${itemCount}条`
  }
})
const data: Ref<any[]> = ref([])

const reloadTableData = async (page: number) => {
  if (!loadingRef.value) {
    loadingRef.value = true
    paginationReactive.page = page
    try {
      const {
        data: {
          resultData: {
            rows,
            total
          }
        }
      } = await searchNews({ pageNum: page, pageSize: paginationReactive.pageSize })
      data.value = rows
      paginationReactive.itemCount = total
    } catch (e) {
      //
    }
    loadingRef.value = false
  }
}

onMounted(async () => {
  await reloadTableData(1)
})
</script>

<template>
  <n-space vertical :size="[0, 20]">
    <n-card
      v-for="(item, index) in data"
      class="new-card"
    >
      <n-space vertical :size="[0, 20]">
        <n-skeleton v-if="loadingRef" width="60%" height="40px" text />
        <n-ellipsis v-else :line-clamp="1" :tooltip="false">
          <h2 class="news-title">{{ index + 1 }}: {{ item.title }}</h2>
        </n-ellipsis>
        <n-skeleton v-if="loadingRef" width="50%" height="20px" text />
        <n-space v-else :size="[20, 10]">
          <div>
            网站：
            <n-a
              v-if="item.site"
              :href="item.site"
              target="_blank"
            >
              {{ item.site }}
            </n-a>
            <n-a v-else>暂无</n-a>
          </div>
          <div>发布时间：{{ item.pubtime }}</div>
        </n-space>
        <n-skeleton v-if="loadingRef" height="20px" :repeat="2" text />
        <n-ellipsis v-else :line-clamp="2" :tooltip="false">
          <p>{{ item.content }}</p>
        </n-ellipsis>
        <n-skeleton v-if="loadingRef" width="84px" height="34px" style="float: right" />
        <n-button v-else type="info" style="float: right">
          阅读详情
        </n-button>
      </n-space>
    </n-card>
  </n-space>
</template>

<style scoped lang="scss">
.new-card {

  p, h2 {
    margin: 0;
  }

  .news-title {
    color: v-bind("isLight ? '#2080f0' : '#70c0e8'");
  }
}
</style>