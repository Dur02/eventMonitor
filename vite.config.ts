import { UserConfig, ConfigEnv, loadEnv, defineConfig } from 'vite'
import createPlugins from './plugins'
import path from 'path'

// https://vitejs.dev/config/
export default defineConfig(({ mode, command }: ConfigEnv): UserConfig => {
  const env = loadEnv(mode, process.cwd());
  return {
    // 默认情况下vite都会把应用部署到“/”根路径上，可以使用此配置选项设置子路径。
    base: env.VITE_APP_CONTEXT_PATH,
    resolve: {
      alias: {
        '~': path.resolve(__dirname, './'),
        '@': path.resolve(__dirname, './src'),
        // 'vue-i18n': 'vue-i18n/dist/vue-i18n.cjs.js'
      },
      extensions: ['.mjs', '.js', '.ts', '.jsx', '.tsx', '.json', '.vue']
    },
    plugins: createPlugins(env, command === 'build'),
    server: {
      host: '0.0.0.0',
      port: Number(env.VITE_APP_PORT),
      open: true,
      proxy: {
        [env.VITE_APP_BASE_API]: {
          target: 'http://219.130.114.4:19998/',
          changeOrigin: true,
          rewrite: (path) => path.replace(new RegExp('^' + env.VITE_APP_BASE_API), '')
        }
      }
    },
    css: {
      preprocessorOptions: {
        scss: {
          javascriptEnabled: true
        }
      },
      postcss: {
        plugins: [
          {
            postcssPlugin: 'internal:charset-removal',
            AtRule: {
              charset: (atRule) => {
                if (atRule.name === 'charset') {
                  atRule.remove();
                }
              }
            }
          }
        ]
      }
    },
    // 预编译
    optimizeDeps: {
      include: [
        'vue',
        'vue-router',
        'pinia',
        'axios'
        // '@vueuse/core',
        // 'path-to-regexp',
        // 'echarts',
        // '@wangeditor/editor',
        // '@wangeditor/editor-for-vue',
        // 'vue-i18n',
        // '@vueup/vue-quill',
        // '@iconify/iconify',
      ]
    }
  }
})
