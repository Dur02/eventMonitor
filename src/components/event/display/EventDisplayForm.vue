<script setup lang="ts">
import type { Ref } from 'vue'
import { ref, watch } from 'vue'
import type { FormInst } from 'naive-ui'
import {
  NCard,
  NScrollbar
} from 'naive-ui'
import { useFooterStore } from '@/stores/footer'
import { storeToRefs } from 'pinia'
import deepCopy from '@/utils/function/deepcopy'
import {
  cardThemeOverrides,
  initialFormValue,
} from '@/utils/constant/event/display/eventDisplayForm'
import EventConfigForm from '@/components/form/EventConfigForm.vue'
import { eventConfigFormInitialValue } from '@/utils/constant/config/event/eventConfig'
import type { eventConfigFormInitialValueType } from '@/types/components/config/event'

const footerStore = useFooterStore()
const { selectedBtn, initialData } = storeToRefs(footerStore)

const disabled = ref(false)
const formValue: Ref<eventConfigFormInitialValueType> = ref(eventConfigFormInitialValue)
const configFormRef: Ref<any | null> = ref(null)

const handleValidateClick =  (e: MouseEvent) => {
  e.preventDefault()
}

// watch(
//   () => selectedBtn.value,
//   () => {
//     switch (Boolean(selectedBtn.value)) {
//       case true:
//         disabled.value = true
//         formValue.value = deepCopy(initialData.value)
//         break
//       default:
//         disabled.value = false
//         formValue.value = deepCopy(initialFormValue)
//         const end = new Date()
//         const start = new Date()
//         start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
//         formValue.value.date = [start, end]
//         break
//     }
//   },
//   {
//     immediate: true
//   }
// )

defineExpose({
  restoreValidation: () => {
    configFormRef.value?.formRef.restoreValidation()
  }
})
</script>

<template>
  <n-scrollbar
    :style="{
      maxHeight: '440px',
      border: '1px solid var(--n-border-color)',
      borderRadius: '3px',
    }"
  >
    <n-card
      :bordered="false"
      :theme-overrides="cardThemeOverrides"
    >
      <event-config-form
        ref="configFormRef"
        :initialValue="formValue"
        :configType="['event_show_viz']"
        :formDisabled="true"
      />
    </n-card>
  </n-scrollbar>
</template>

<style scoped lang="scss">
.form {
  .icon-label {
    display: flex;
    align-items: center;

    .icon {
      padding-right: 7px;
    }
  }

  .btn-container {
    .space-box {
      margin: 0 auto;
    }
  }
}
</style>