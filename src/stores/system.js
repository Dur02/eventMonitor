import { ref } from 'vue';
import { defineStore } from 'pinia';
export const useSystemStore = defineStore('system', () => {
    const isLogin = ref(false);
    function setIsLogin(param) {
        isLogin.value = param;
    }
    return {
        isLogin,
        setIsLogin
    };
}, {
    persist: {
        storage: sessionStorage
    }
});
//# sourceMappingURL=system.js.map