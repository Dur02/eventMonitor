import { createApp } from 'vue'
import pinia from '@/stores/pinia'
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
import './assets/base.scss'
import App from './App.vue'
import router from './router'
import './permission'

const app = createApp(App)
pinia.use(piniaPluginPersistedstate)

app.use(pinia)
app.use(router)
app.mount('#app')
