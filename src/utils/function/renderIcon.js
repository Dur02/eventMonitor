import { h } from 'vue';
import { NIcon } from 'naive-ui';
export default (icon) => {
    return () => {
        return h(NIcon, null, {
            default: () => h(icon)
        });
    };
};
//# sourceMappingURL=renderIcon.js.map