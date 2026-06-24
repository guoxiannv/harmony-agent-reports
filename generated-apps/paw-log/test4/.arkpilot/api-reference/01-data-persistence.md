# 01 — Data Persistence (Preferences)

## @ohos.data.preferences
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 导入模块 | preferences | `import { preferences } from '@kit.ArkData'` | — | `import { preferences } from '@kit.ArkData';` | `07_ohos.data.preferences (用户首选项).md` |
| Key最大长度限制 | MAX_KEY_LENGTH | `@kit.ArkData` | `const MAX_KEY_LENGTH: number = 1024` | — | `07_ohos.data.preferences (用户首选项).md` |
| Value最大长度限制 | MAX_VALUE_LENGTH | `@kit.ArkData` | `const MAX_VALUE_LENGTH: number = 16777216` | — | `07_ohos.data.preferences (用户首选项).md` |

## preferences.getPreferences
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取Preferences实例(回调) | preferences.getPreferences | `@kit.ArkData` | `getPreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void` | `preferences.getPreferences(this.context, 'myStore', (err, val) => { ... })` | `07_ohos.data.preferences (用户首选项).md` |
| 获取Preferences实例(Promise) | preferences.getPreferences | `@kit.ArkData` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let sp = preferences.getPreferences(this.context, 'myStore');` | `07_ohos.data.preferences (用户首选项).md` |
| 获取Preferences实例(Options,回调) | preferences.getPreferences | `@kit.ArkData` | `getPreferences(context: Context, options: Options, callback: AsyncCallback<Preferences>): void` | `preferences.getPreferences(this.context, { name: 'myStore' }, callback)` | `07_ohos.data.preferences (用户首选项).md` |
| 获取Preferences实例(Options,Promise) | preferences.getPreferences | `@kit.ArkData` | `getPreferences(context: Context, options: Options): Promise<Preferences>` | `let sp = preferences.getPreferences(this.context, options);` | `07_ohos.data.preferences (用户首选项).md` |
| 获取Preferences实例(同步) | preferences.getPreferencesSync | `@kit.ArkData` | `getPreferencesSync(context: Context, options: Options): Preferences` | `dataPreferences = preferences.getPreferencesSync(this.context, options);` | `07_ohos.data.preferences (用户首选项).md` |

## preferences.deletePreferences
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 删除Preferences实例(回调) | preferences.deletePreferences | `@kit.ArkData` | `deletePreferences(context: Context, name: string, callback: AsyncCallback<void>): void` | `preferences.deletePreferences(this.context, 'myStore', callback)` | `07_ohos.data.preferences (用户首选项).md` |
| 删除Preferences实例(Promise) | preferences.deletePreferences | `@kit.ArkData` | `deletePreferences(context: Context, name: string): Promise<void>` | `let sp = preferences.deletePreferences(this.context, 'myStore');` | `07_ohos.data.preferences (用户首选项).md` |

## preferences.removePreferencesFromCache
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从缓存移除(回调) | preferences.removePreferencesFromCache | `@kit.ArkData` | `removePreferencesFromCache(context: Context, name: string, callback: AsyncCallback<void>): void` | `preferences.removePreferencesFromCache(this.context, 'myStore', callback)` | `07_ohos.data.preferences (用户首选项).md` |
| 从缓存移除(Promise) | preferences.removePreferencesFromCache | `@kit.ArkData` | `removePreferencesFromCache(context: Context, name: string): Promise<void>` | `let sp = preferences.removePreferencesFromCache(this.context, 'myStore');` | `07_ohos.data.preferences (用户首选项).md` |

## preferences.StorageType (enum)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 存储模式枚举 | preferences.StorageType | `@kit.ArkData` | `enum StorageType { XML = 0, GSKV = 1 }` | `let xmlType = preferences.StorageType.XML;` | `07_ohos.data.preferences (用户首选项).md` |
| 检查存储模式支持 | preferences.isStorageTypeSupported | `@kit.ArkData` | `isStorageTypeSupported(type: StorageType): boolean` | `let supported = preferences.isStorageTypeSupported(xmlType);` | `07_ohos.data.preferences (用户首选项).md` |

## preferences.Options
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Preferences配置选项 | preferences.Options | `@kit.ArkData` | `{ name: string, dataGroupId?: string\|null, storageType?: StorageType\|null }` | `let options: preferences.Options = { name: 'myStore' };` | `07_ohos.data.preferences (用户首选项).md` |

## preferences.Preferences (实例方法)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 读取值(回调) | Preferences.get | `@kit.ArkData` | `get(key: string, defValue: ValueType, callback: AsyncCallback<ValueType>): void` | `dataPreferences.get('startup', 'default', (err, val) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 读取值(Promise) | Preferences.get | `@kit.ArkData` | `get(key: string, defValue: ValueType): Promise<ValueType>` | `let data = dataPreferences.get('startup', 'default');` | `07_ohos.data.preferences (用户首选项).md` |
| 读取值(同步) | Preferences.getSync | `@kit.ArkData` | `getSync(key: string, defValue: ValueType): ValueType` | `let value = dataPreferences.getSync('startup', 'default');` | `07_ohos.data.preferences (用户首选项).md` |
| 获取所有键值(回调) | Preferences.getAll | `@kit.ArkData` | `getAll(callback: AsyncCallback<Object>): void` | `dataPreferences.getAll((err, value) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 获取所有键值(Promise) | Preferences.getAll | `@kit.ArkData` | `getAll(): Promise<Object>` | `let allData = dataPreferences.getAll();` | `07_ohos.data.preferences (用户首选项).md` |
| 获取所有键值(同步) | Preferences.getAllSync | `@kit.ArkData` | `getAllSync(): Object` | `let value = dataPreferences.getAllSync();` | `07_ohos.data.preferences (用户首选项).md` |
| 写入数据(回调) | Preferences.put | `@kit.ArkData` | `put(key: string, value: ValueType, callback: AsyncCallback<void>): void` | `dataPreferences.put('startup', 'auto', callback)` | `07_ohos.data.preferences (用户首选项).md` |
| 写入数据(Promise) | Preferences.put | `@kit.ArkData` | `put(key: string, value: ValueType): Promise<void>` | `let p = dataPreferences.put('startup', 'auto');` | `07_ohos.data.preferences (用户首选项).md` |
| 写入数据(同步) | Preferences.putSync | `@kit.ArkData` | `putSync(key: string, value: ValueType): void` | `dataPreferences.putSync('startup', 'auto');` | `07_ohos.data.preferences (用户首选项).md` |
| 检查Key(回调) | Preferences.has | `@kit.ArkData` | `has(key: string, callback: AsyncCallback<boolean>): void` | `dataPreferences.has('startup', (err, val) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 检查Key(Promise) | Preferences.has | `@kit.ArkData` | `has(key: string): Promise<boolean>` | `let isSet = dataPreferences.has('startup');` | `07_ohos.data.preferences (用户首选项).md` |
| 检查Key(同步) | Preferences.hasSync | `@kit.ArkData` | `hasSync(key: string): boolean` | `let isExist = dataPreferences.hasSync('startup');` | `07_ohos.data.preferences (用户首选项).md` |
| 删除Key(回调) | Preferences.delete | `@kit.ArkData` | `delete(key: string, callback: AsyncCallback<void>): void` | `dataPreferences.delete('startup', callback)` | `07_ohos.data.preferences (用户首选项).md` |
| 删除Key(Promise) | Preferences.delete | `@kit.ArkData` | `delete(key: string): Promise<void>` | `let p = dataPreferences.delete('startup');` | `07_ohos.data.preferences (用户首选项).md` |
| 删除Key(同步) | Preferences.deleteSync | `@kit.ArkData` | `deleteSync(key: string): void` | `dataPreferences.deleteSync('startup');` | `07_ohos.data.preferences (用户首选项).md` |
| 持久化落盘(回调) | Preferences.flush | `@kit.ArkData` | `flush(callback: AsyncCallback<void>): void` | `dataPreferences.flush(callback)` | `07_ohos.data.preferences (用户首选项).md` |
| 持久化落盘(Promise) | Preferences.flush | `@kit.ArkData` | `flush(): Promise<void>` | `dataPreferences.flush().then(() => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 持久化落盘(同步) | Preferences.flushSync | `@kit.ArkData` | `flushSync(): void` | `dataPreferences.flushSync();` | `07_ohos.data.preferences (用户首选项).md` |
| 清除所有数据(回调) | Preferences.clear | `@kit.ArkData` | `clear(callback: AsyncCallback<void>): void` | `dataPreferences.clear(callback)` | `07_ohos.data.preferences (用户首选项).md` |
| 清除所有数据(Promise) | Preferences.clear | `@kit.ArkData` | `clear(): Promise<void>` | `dataPreferences.clear().then(() => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 清除所有数据(同步) | Preferences.clearSync | `@kit.ArkData` | `clearSync(): void` | `dataPreferences.clearSync();` | `07_ohos.data.preferences (用户首选项).md` |
| 订阅数据变更 | Preferences.on | `@kit.ArkData` | `on(type: 'change', callback: Callback<string>): void` | `dataPreferences.on('change', (key) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 订阅多进程变更 | Preferences.on | `@kit.ArkData` | `on(type: 'multiProcessChange', callback: Callback<string>): void` | `dataPreferences.on('multiProcessChange', (key) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 精确订阅Key变更 | Preferences.on | `@kit.ArkData` | `on(type: 'dataChange', keys: string[], callback: Callback<Record<string, ValueType>>): void` | `dataPreferences.on('dataChange', ['name'], (data) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 取消订阅变更 | Preferences.off | `@kit.ArkData` | `off(type: 'change', callback?: Callback<string>): void` | `dataPreferences.off('change', observer);` | `07_ohos.data.preferences (用户首选项).md` |

## ValueType
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 支持的值类型 | preferences.ValueType | `@kit.ArkData` | `type ValueType = number \| string \| boolean \| Array<number> \| Array<string> \| Array<boolean> \| Uint8Array \| object \| bigint` | — | `07_ohos.data.preferences (用户首选项).md` |

## Module Notes

- **Import path**: `import { preferences } from '@kit.ArkData'` (modern Kit-style). The legacy `@ohos.data.preferences` path still works but `@kit.ArkData` is recommended.
- **Single-process only**: Preferences does NOT support concurrent inter-process access. File corruption may occur with multi-process use.
- **XML vs GSKV**: Default is XML mode (requires explicit `flush()` to persist). GSKV mode (API 18+) persists operations to disk in real-time. Check platform support with `isStorageTypeSupported()` before using GSKV.
- **Caching**: First `getPreferences` call reads from disk and caches. Subsequent calls return the cached instance. Call `removePreferencesFromCache` to force re-read from disk.
- **Key constraints**: Key max 1024 bytes, name (Options.name) max 255 bytes, value max 16 MB.
- **Error code scope**: 401 (parameter error), 15500000 (inner error), plus 801/15501001/15501002 for Options-based APIs.
