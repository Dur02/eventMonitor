export declare function createLocalStorage(options?: {
    expire?: number | null;
}): {
    set: <T = any>(key: string, data: T) => void;
    get: (key: string) => any;
    remove: (key: string) => void;
    clear: () => void;
};
export declare const ls: {
    set: <T = any>(key: string, data: T) => void;
    get: (key: string) => any;
    remove: (key: string) => void;
    clear: () => void;
};
export declare const ss: {
    set: <T = any>(key: string, data: T) => void;
    get: (key: string) => any;
    remove: (key: string) => void;
    clear: () => void;
};
