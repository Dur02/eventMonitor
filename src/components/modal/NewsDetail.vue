<script setup lang="ts">
import { NModal, NSpace, NText, NA, NEllipsis, NScrollbar } from 'naive-ui'
import { useSystemStore } from '@/stores/system'
import { storeToRefs } from 'pinia';

defineProps<{
  showModal: boolean,
  detail: any
}>()

const emits = defineEmits(['modalClose', 'afterModalClose'])

const systemStore = useSystemStore()
const { isLight } = storeToRefs(systemStore)

const openNewWindow = (link: string) => {
  console.log('14122')
  if (link) {
    window.open(link, '_blank')
  }
}

const handleModalClose = (value: boolean): void => {
  emits("modalClose", value)
}

const afterModalClose = (): void => {
  emits("afterModalClose")
}
</script>

<template>
  <n-modal
    class="news-modal"
    :show="showModal"
    size="small"
    preset="card"
    style="max-width: 1000px;max-height: 1000px;"
    display-directive="if"
    @update:show="handleModalClose"
    @after-leave="afterModalClose"
  >
    <n-space
      vertical
    >
      <h2
        class="news-title"
      >
        {{ detail.title }}
      </h2>
      <n-space justify="space-between">
        <n-text>
          <n-ellipsis style="max-width: 700px;">
            作者：
            <n-a
              v-for="(item, index) in detail.author"
              class="author-name"
              :key="item.name"
              @click="openNewWindow(item.link)"
            >
              {{ item.name }}{{ index < detail.author.length - 1 ? ',' : '' }}
            </n-a>
          </n-ellipsis>
        </n-text>
        <n-text>
          采集时间：{{ detail.crawlTime }}
        </n-text>
      </n-space>
      <n-space justify="space-between"  >
        <n-text>
          网站：{{ detail.site }}
        </n-text>
        <n-text>
          发布时间：{{ detail.pubtime }}
        </n-text>
      </n-space>
      <n-text>
        <n-ellipsis :line-clamp="1">
          对应url：
          <n-a
            @click="openNewWindow(detail.url)"
          >
            {{ detail.url }}
          </n-a>
        </n-ellipsis>
      </n-text>
      <n-scrollbar
        trigger="none"
        id="scrollbar"
        :style="{
          width: '95%',
          margin: '0 auto',
          maxHeight: '500px',
          border: `1px solid ${isLight ? 'rgb(239, 239, 245)' : 'rgba(255, 255, 255, 0.09)'}`,
          borderRadius: '3px',
          padding: '15px'
        }"
      >
        <n-text>
          {{ detail.content }}
        </n-text>
      </n-scrollbar>
      <n-text>
        图片URL地址集合：
        <n-space vertical>
          <n-a
            v-for="item in detail.media"
            class="author-name"
            :key="item.mediaUrl"
            @click="openNewWindow(item.mediaUrl)"
          >
            {{ item.mediaUrl }}
          </n-a>
        </n-space>
      </n-text>
    </n-space>
  </n-modal>
</template>

<style scoped lang="scss">
.news-modal {
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
}
</style>