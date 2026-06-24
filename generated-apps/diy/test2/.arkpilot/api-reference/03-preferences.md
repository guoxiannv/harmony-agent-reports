# 03 — Preferences (KV Storage)

## @ohos.data.preferences

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 模块导入 | `preferences` | `import { preferences } from '@kit.ArkData'` | — | `import { preferences } from '@kit.ArkData';` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| 获取 Preferences 实例(callback) | `preferences.getPreferences` | `@kit.ArkData` | `getPreferences(context: Context, name: string, callback: AsyncCallback\<Preferences\>): void` | `preferences.getPreferences(this.context, 'myStore', (err, val) => { ... })` | same |
| 获取 Preferences 实例(Promise) | `preferences.getPreferences` | `@kit.ArkData` | `getPreferences(context: Context, name: string): Promise\<Preferences\>` | `let sp = preferences.getPreferences(this.context, 'myStore');` | same |
| 获取 Preferences 实例(Options+callback) 10+ | `preferences.getPreferences` | `@kit.ArkData` | `getPreferences(context: Context, options: Options, callback: AsyncCallback\<Preferences\>): void` | `preferences.getPreferences(context, { name: 'myStore' }, callback)` | same |
| 获取 Preferences 实例(Options+Promise) 10+ | `preferences.getPreferences` | `@kit.ArkData` | `getPreferences(context: Context, options: Options): Promise\<Preferences\>` | `let sp = preferences.getPreferences(context, { name: 'myStore' });` | same |
| 同步获取 Preferences 实例 10+ | `preferences.getPreferencesSync` | `@kit.ArkData` | `getPreferencesSync(context: Context, options: Options): Preferences` | `let prefs = preferences.getPreferencesSync(this.context, { name: 'myStore' });` | same |
| 删除 Preferences 实例+文件(callback) | `preferences.deletePreferences` | `@kit.ArkData` | `deletePreferences(context: Context, name: string, callback: AsyncCallback\<void\>): void` | `preferences.deletePreferences(context, 'myStore', (err) => { ... })` | same |
| 删除 Preferences 实例+文件(Promise) | `preferences.deletePreferences` | `@kit.ArkData` | `deletePreferences(context: Context, name: string): Promise\<void\>` | `let sp = preferences.deletePreferences(context, 'myStore');` | same |
| 删除 Preferences 实例+文件(Options) 10+ | `preferences.deletePreferences` | `@kit.ArkData` | `deletePreferences(context: Context, options: Options, callback: AsyncCallback\<void\>): void` / `deletePreferences(context: Context, options: Options): Promise\<void\>` | `preferences.deletePreferences(context, { name: 'myStore' })` | same |
| 从缓存移除 Preferences 实例(callback) | `preferences.removePreferencesFromCache` | `@kit.ArkData` | `removePreferencesFromCache(context: Context, name: string, callback: AsyncCallback\<void\>): void` | `preferences.removePreferencesFromCache(context, 'myStore', callback)` | same |
| 从缓存移除 Preferences 实例(Promise) | `preferences.removePreferencesFromCache` | `@kit.ArkData` | `removePreferencesFromCache(context: Context, name: string): Promise\<void\>` | `let sp = preferences.removePreferencesFromCache(context, 'myStore');` | same |
| 从缓存移除(Options) 10+ | `preferences.removePreferencesFromCache` | `@kit.ArkData` | `removePreferencesFromCache(context: Context, options: Options, callback: AsyncCallback\<void\>): void` / `removePreferencesFromCache(context: Context, options: Options): Promise\<void\>` | `preferences.removePreferencesFromCache(context, { name: 'myStore' })` | same |
| 同步从缓存移除 10+ | `preferences.removePreferencesFromCacheSync` | `@kit.ArkData` | `removePreferencesFromCacheSync(context: Context, name: string): void` / `removePreferencesFromCacheSync(context: Context, options: Options): void` | `preferences.removePreferencesFromCacheSync(context, 'myStore');` | same |
| 检查存储模式是否支持 18+ | `preferences.isStorageTypeSupported` | `@kit.ArkData` | `isStorageTypeSupported(type: StorageType): boolean` | `let supported = preferences.isStorageTypeSupported(preferences.StorageType.GSKV);` | same |
| 存储模式枚举 18+ | `preferences.StorageType` | `@kit.ArkData` | `XML = 0 / GSKV = 1` | `preferences.StorageType.GSKV` | same |
| Options 接口 10+ | `preferences.Options` | `@kit.ArkData` | `{ name: string, dataGroupId?: string\|null, storageType?: StorageType\|null }` | `let opts: preferences.Options = { name: 'myStore', storageType: StorageType.GSKV };` | same |
| 常量: 最大 Key 长度 | `preferences.MAX_KEY_LENGTH` | `@kit.ArkData` | `number = 1024` | `let max = preferences.MAX_KEY_LENGTH;` | same |
| 常量: 最大 Value 长度 | `preferences.MAX_VALUE_LENGTH` | `@kit.ArkData` | `number = 16MB` | `let max = preferences.MAX_VALUE_LENGTH;` | same |
| ValueType 类型 | `preferences.ValueType` | `@kit.ArkData` | `type ValueType = number \| string \| boolean \| Array\<number\> \| Array\<string\> \| Array\<boolean\> \| Uint8Array \| object \| bigint` | — | same |

### Preferences 实例方法

| 用途 | API | 签名 | 用法示例 |
|------|-----|------|----------|
| 获取值(callback/Promise) | `prefs.get` | `get(key: string, defValue: ValueType, callback)` / `get(key: string, defValue: ValueType): Promise` | `dataPreferences.get('startup', 'default').then(val => ...)` |
| 同步获取值 10+ | `prefs.getSync` | `getSync(key: string, defValue: ValueType): ValueType` | `let val = dataPreferences.getSync('startup', 'default');` |
| 获取所有键值(callback/Promise) | `prefs.getAll` | `getAll(callback)` / `getAll(): Promise` | `dataPreferences.getAll().then(obj => ...)` |
| 同步获取所有键值 10+ | `prefs.getAllSync` | `getAllSync(): Object` | `let all = dataPreferences.getAllSync();` |
| 写入值(callback/Promise) | `prefs.put` | `put(key: string, value: ValueType, callback)` / `put(key: string, value: ValueType): Promise` | `dataPreferences.put('startup', 'auto')` |
| 同步写入值 10+ | `prefs.putSync` | `putSync(key: string, value: ValueType): void` | `dataPreferences.putSync('startup', 'auto');` |
| 检查 Key 是否存在(callback/Promise) | `prefs.has` | `has(key: string, callback)` / `has(key: string): Promise` | `dataPreferences.has('startup').then(exist => ...)` |
| 同步检查 Key 10+ | `prefs.hasSync` | `hasSync(key: string): boolean` | `let exist = dataPreferences.hasSync('startup');` |
| 删除指定 Key(callback/Promise) | `prefs.delete` | `delete(key: string, callback)` / `delete(key: string): Promise` | `dataPreferences.delete('startup')` |
| 同步删除 Key 10+ | `prefs.deleteSync` | `deleteSync(key: string): void` | `dataPreferences.deleteSync('startup');` |
| 持久化到文件(callback/Promise) | `prefs.flush` | `flush(callback)` / `flush(): Promise` | `dataPreferences.flush().then(() => ...)` |
| 同步持久化到文件 14+ | `prefs.flushSync` | `flushSync(): void` | `dataPreferences.flushSync();` |
| 清除所有数据(callback/Promise) | `prefs.clear` | `clear(callback)` / `clear(): Promise` | `dataPreferences.clear().then(() => ...)` |
| 同步清除所有数据 10+ | `prefs.clearSync` | `clearSync(): void` | `dataPreferences.clearSync();` |
| 订阅全部数据变更 | `prefs.on('change')` | `on(type: 'change', callback: Callback\<string\>): void` | `dataPreferences.on('change', (key) => console.info(key + ' changed'));` |
| 订阅多进程数据变更 10+ | `prefs.on('multiProcessChange')` | `on(type: 'multiProcessChange', callback: Callback\<string\>): void` | 同上, type=`'multiProcessChange'` |
| 精确订阅指定 Key 变更 12+ | `prefs.on('dataChange')` | `on(type: 'dataChange', keys: string[], callback: Callback\<Record\<string, ValueType\>\>): void` | `dataPreferences.on('dataChange', ['name'], (data) => ...)` |
| 取消订阅 | `prefs.off` | `off(type, callback?)` | `dataPreferences.off('change', observer);` |

## Module Notes

- API version 9 起支持。导入路径 `@kit.ArkData`。
- **进程安全**: Preferences 无法保证进程并发安全，不支持在多进程场景下使用（有文件损坏和数据丢失风险）。
- **存储模式**: API 18+ 支持 `StorageType.XML`（默认，需手动 flush）和 `StorageType.GSKV`（实时落盘，无需 flush）。建议创建前先调用 `isStorageTypeSupported` 检查平台支持。
- **缓存机制**: 首次 `getPreferences` 后实例被缓存，再次调用直接返回缓存实例。`removePreferencesFromCache` 可清除缓存以重新从持久化文件读取。
- **Key 限制**: 最大 1024 字节，名称不能包含 `/` 或以 `/` 结尾，长度 ≤255 字节。
- **Value 限制**: 最大 16 MB。
- **dataGroupId**: 仅 Stage 模型下可用，支持跨应用/跨进程共享，需向应用市场申请。
- 同步接口 (`*Sync`) 从 API 10+ 开始支持。
