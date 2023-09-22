import { createRouter, createWebHistory } from 'vue-router';
import { createDiscreteApi } from 'naive-ui';
// https://www.naiveui.com/zh-CN/os-theme/components/discrete 脱离上下文使用API
const { loadingBar } = createDiscreteApi(['loadingBar']);
const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            redirect: '/login'
        },
        {
            path: '/login',
            name: 'login',
            component: () => import('../views/LoginView.vue')
        },
        {
            path: '/home',
            redirect: { name: 'test1' },
            component: () => import('../views/LayoutView.vue'),
            children: [
                {
                    path: 'test1',
                    name: 'test1',
                    meta: {
                        key: 'test1',
                        name: ['回家', '测试1']
                    },
                    component: () => import('../views/Test1.vue')
                },
                {
                    path: 'test2',
                    name: 'test2',
                    meta: {
                        key: 'test2',
                        name: ['回家', '测试2']
                    },
                    component: () => import('../views/Test2.vue')
                },
            ]
        },
        {
            path: '/:pathMatch(.*)',
            component: () => import('../components/error/404.vue')
        }
    ]
});
router.beforeEach((to, form) => {
    loadingBar.start();
    return true;
});
router.afterEach((to, form) => {
    loadingBar.finish();
});
export default router;
//# sourceMappingURL=index.js.map