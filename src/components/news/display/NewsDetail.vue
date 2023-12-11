<script setup lang="ts">
import { NA, NEllipsis, NSpace, NText, NSpin, NEmpty, NButton, NButtonGroup } from 'naive-ui'
import type { Ref } from 'vue'
import { onMounted, ref } from 'vue'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia'
import { getNewsDetail } from '@/api/news'
import { split } from 'lodash/fp'
import { useRouter } from 'vue-router'

const props = defineProps<{
  i18nValue: string,
  urlHash: string
}>()

const router = useRouter()

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)

const loadingRef: Ref<boolean> = ref(false)
const newsDetailData: Ref<any> = ref(null)
const i18n: Ref<'ZhCN' | 'EN'> = ref('ZhCN')

const openNewWindow = (link: string) => {
  if (link) {
    window.open(link, '_blank')
  }
}

onMounted(async () => {
  if (!loadingRef.value) {
    loadingRef.value = true
    try {
      const {
        data: {
          resultData
        }
      } = await getNewsDetail(props.urlHash)
      const splitArr = split('/')(resultData.url)
      if (splitArr[2]) {
        newsDetailData.value = {
          ...resultData,
          site: splitArr[0] + '//' + splitArr[2]
        }
      } else {
        newsDetailData.value = {
          ...resultData,
          site: ''
        }
      }
    } catch (e) {
      newsDetailData.value = null
    }
    i18n.value = props.i18nValue === 'EN' ? 'EN' : 'ZhCN'
    loadingRef.value = false
  }
})
</script>

<template>
  <n-spin :show="loadingRef">
    <n-space
      v-if="newsDetailData !== null"
      vertical
    >
      <n-space justify="end">
        <n-button-group
          class="i18n-btn"
          size="small"
        >
          <n-button
            :type="i18n === 'ZhCN' ? 'primary' : 'default'"
            @click="() => {
              i18n = 'ZhCN'
              router.replace({ path: `/news/detail/${urlHash}/ZhCN` })
            }"
          >
            中文
          </n-button>
          <n-button
            :type="i18n === 'EN' ? 'primary' : 'default'"
            @click="() => {
              i18n = 'EN'
              router.replace({ path: `/news/detail/${urlHash}/EN` })
            }"
          >
            英文
          </n-button>
        </n-button-group>
      </n-space>
      <h2
        class="news-title"
      >
        {{ i18n === 'ZhCN' ? newsDetailData.titleZh: newsDetailData.title }}
      </h2>
      <n-space justify="space-between">
        <n-text>
          <n-ellipsis style="max-width: 700px;">
            <span>作者：</span>
            <n-a
              v-for="(item, index) in newsDetailData.author"
              class="author-name"
              :key="item.name"
              @click="openNewWindow(item.link)"
            >
              {{ item.name }}{{ index < newsDetailData.author.length - 1 ? ',' : '' }}
            </n-a>
          </n-ellipsis>
        </n-text>
        <n-text>
          采集时间：{{ newsDetailData.crawlTime }}
        </n-text>
      </n-space>
      <n-space justify="space-between"  >
        <n-text>
          网站：{{ newsDetailData.site }}
        </n-text>
        <n-text>
          发布时间：{{ newsDetailData.pubtime }}
        </n-text>
      </n-space>
      <n-text>
        <n-ellipsis :line-clamp="1">
          <span>对应url：</span>
          <n-a
            @click="openNewWindow(newsDetailData.url)"
          >
            {{ newsDetailData.url }}
          </n-a>
        </n-ellipsis>
      </n-text>
      <n-text
        :style="{
          textIndent: i18n === 'ZhCN' ? '2em' : '0'
        }"
      >
        {{ i18n === 'ZhCN' ? newsDetailData.contentZh: newsDetailData.content }}
      </n-text>
      <n-text>
        图片URL地址集合：
        <n-space vertical>
          <n-a
            v-for="item in newsDetailData.media"
            class="author-name"
            :key="item.mediaUrl"
            @click="openNewWindow(item.mediaUrl)"
          >
            {{ item.mediaUrl }}
          </n-a>
        </n-space>
      </n-text>
    </n-space>
    <n-empty
      v-else
      size="large"
      description="无数据"
      style="margin-top: 50px;"
    />
  </n-spin>
</template>

<style scoped lang="scss">
.news-title {
  text-align: center;
  margin: 0;
}

.author-name {
  padding: 0 3px;

  &:first-of-type {
    padding: 0 3px 0 0;
  }

  &:last-of-type {
    padding: 0 0 0 3px;
  }
}
</style>