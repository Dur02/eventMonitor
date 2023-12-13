<script setup lang="ts">
import { NA, NEllipsis, NSpace, NText, NSpin, NEmpty, NButton, NButtonGroup, NImage, NDivider } from 'naive-ui'
import type { Ref } from 'vue'
import { onMounted, ref } from 'vue'
import { getNewsDetail } from '@/api/news'
import { split } from 'lodash/fp'
import { useRouter } from 'vue-router'

const props = defineProps<{
  i18nValue: string,
  urlHash: string
}>()

const router = useRouter()

const loadingRef: Ref<boolean> = ref(false)
const newsDetailData: Ref<any> = ref(null)
const i18n: Ref<'ZhCN' | 'EN'> = ref('ZhCN')

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
          site: splitArr[0] + '//' + splitArr[2],
          contentZh: split('\n')(resultData.contentZh),
          content: split('\n')(resultData.content),
        }
      } else {
        newsDetailData.value = {
          ...resultData,
          site: '',
          contentZh: split('\n')(resultData.contentZh),
          content: split('\n')(resultData.content),
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
  <n-spin class="new-container" :show="loadingRef">
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
      <h1
        class="news-title"
      >
        {{ i18n === 'ZhCN' ? newsDetailData.titleZh: newsDetailData.title }}
      </h1>
      <n-space class="news_source" justify="space-between">
        <n-text>
          <n-ellipsis style="max-width: 700px;">
            <span>作者：</span>
            <n-a
              v-for="(item, index) in newsDetailData.author"
              class="content-text"
              :key="item.name"
            >
              {{ item.name }}{{ index < newsDetailData.author.length - 1 ? ',' : '' }}
            </n-a>
            <!--            定制tooltip长度，避免长度过长-->
            <template #tooltip>
              <div style="max-width: 700px;">
                <span>作者：</span>
                <n-a
                  v-for="(item, index) in newsDetailData.author"
                  class="content-text"
                  :key="item.name"
                >
                  {{ item.name }}{{ index < newsDetailData.author.length - 1 ? ',' : '' }}
                </n-a>
              </div>
            </template>
          </n-ellipsis>
        </n-text>
        <n-text>
          采集时间：{{ newsDetailData.crawlTime }}
        </n-text>
      </n-space>
      <n-space class="news_source"  justify="space-between">
        <n-text>
          网站：
          <n-a>
            {{ newsDetailData.site }}
          </n-a>
        </n-text>
        <n-text>
          发布时间：{{ newsDetailData.pubtime }}
        </n-text>
      </n-space>
      <div style="margin-bottom: 20px;">
        <n-text class="news_source" >
          <n-ellipsis :line-clamp="1">
            <span>来源地址：</span>
            <n-a>
              {{ newsDetailData.url }}
            </n-a>
          </n-ellipsis>
        </n-text>
        <hr />
      </div>
      <n-space vertical :size="[0, 20]" style="margin-bottom: 20px;">
        <pre
          v-for="item in i18n === 'ZhCN' ? newsDetailData.contentZh : newsDetailData.content"
          :style="{
            textIndent: i18n === 'ZhCN' ? '2em' : '0',
          }"
          style="word-break: break-all;margin: 0;white-space: pre-line;"
        >
          {{ item }}
        </pre>
      </n-space>
      <n-space vertical justify="space-between" align="center">
        <n-image
          v-for="item in newsDetailData.media"
          :key="item.mediaUrl"
          lazy
          :show-toolbar="false"
          width="1000"
          :src="item.image"
          alt="加载失败"
        />
      </n-space>
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
.new-container {
  width: 80%;
  margin: 0 auto;
  font-size: 16px;

  .news-title {
    text-align: center;
    margin: 0 0 20px 0;
  }

  .news_source {
    font-size: 14px;
  }

  .content-text {
    padding: 0 3px;

    &:first-of-type {
      padding: 0 3px 0 0;
    }

    &:last-of-type {
      padding: 0 0 0 3px;
    }
  }
}
</style>