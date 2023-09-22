import { type Ref } from 'vue';
export declare const useSystemStore: import("pinia").StoreDefinition<"system", import("pinia")._UnwrapAll<Pick<SystemType, "isLogin">>, Pick<SystemType, never>, Pick<SystemType, "setIsLogin">>;
interface SystemType {
    isLogin: Ref<boolean>;
    setIsLogin: (param: boolean) => void;
}
export {};
