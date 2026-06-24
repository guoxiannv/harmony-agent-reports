# 02 — ArkData Preferences (轻量偏好存储)

## preferences (模块)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取Preferences实例（string name，callback回调） | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string, callback: AsyncCallback\<Preferences\>): void` | `preferences.getPreferences(this.context, 'myStore', (err, val) => { dataPreferences = val; })` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md |
| 获取Preferences实例（string name，Promise回调） | preferences.getPreferences | 同上 | `getPreferences(context: Context, name: string): Promise\<Preferences\>` | `let sp = preferences.getPreferences(this.context, 'myStore'); sp.then(...)` | 同上 |
| 获取Preferences实例（Options参数，callback回调）10+ | preferences.getPreferences | 同上 | `getPreferences(context: Context, options: Options, callback: AsyncCallback\<Preferences\>): void` | `let opt: preferences.Options = { name: 'myStore' }; preferences.getPreferences(ctx, opt, callback)` | 同上 |
| 获取Preferences实例（Options参数，Promise回调）10+ | preferences.getPreferences | 同上 | `getPreferences(context: Context, options: Options): Promise\<Preferences\>` | `let sp = preferences.getPreferences(ctx, { name: 'myStore' });` | 同上 |
| 获取Preferences实例（同步）10+ | preferences.getPreferencesSync | 同上 | `getPreferencesSync(context: Context, options: Options): Preferences` | `dataPrefs = preferences.getPreferencesSync(ctx, { name: 'myStore' })` | 同上 |
| 删除缓存及持久化Preferences实例（string name，callback回调） | preferences.deletePreferences | `import { preferences } from '@kit.ArkData'` | `deletePreferences(context: Context, name: string, callback: AsyncCallback\<void\>): void` | `preferences.deletePreferences(ctx, 'myStore', (err) => { ... })` | 同上 |
| 删除缓存及持久化Preferences实例（string name，Promise回调） | preferences.deletePreferences | 同上 | `deletePreferences(context: Context, name: string): Promise\<void\>` | `let sp = preferences.deletePreferences(ctx, 'myStore'); sp.then(...)` | 同上 |
| 删除缓存及持久化Preferences实例（Options参数，callback回调）10+ | preferences.deletePreferences | 同上 | `deletePreferences(context: Context, options: Options, callback: AsyncCallback\<void\>): void` | `preferences.deletePreferences(ctx, { name: 'myStore' }, callback)` | 同上 |
| 删除缓存及持久化Preferences实例（Options参数，Promise回调）10+ | preferences.deletePreferences | 同上 | `deletePreferences(context: Context, options: Options): Promise\<void\>` | `preferences.deletePreferences(ctx, { name: 'myStore' }).then(...)` | 同上 |

## Preferences.put
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 写入键值对到缓存（callback回调） | Preferences.put | `import { preferences } from '@kit.ArkData'` | `put(key: string, value: ValueType, callback: AsyncCallback\<void\>): void` | `dataPrefs.put('startup', 'auto', (err) => { ... })` | 同上 |
| 写入键值对到缓存（Promise回调） | Preferences.put | 同上 | `put(key: string, value: ValueType): Promise\<void\>` | `let p = dataPrefs.put('startup', 'auto'); p.then(...)` | 同上 |
| 写入键值对到缓存（同步）10+ | Preferences.putSync | 同上 | `putSync(key: string, value: ValueType): void` | `dataPrefs.putSync('startup', 'auto');` | 同上 |

## Preferences.get
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取键对应的值（callback回调） | Preferences.get | `import { preferences } from '@kit.ArkData'` | `get(key: string, defValue: ValueType, callback: AsyncCallback\<ValueType\>): void` | `dataPrefs.get('startup', 'default', (err, val) => { ... })` | 同上 |
| 获取键对应的值（Promise回调） | Preferences.get | 同上 | `get(key: string, defValue: ValueType): Promise\<ValueType\>` | `let d = dataPrefs.get('startup', 'default'); d.then(...)` | 同上 |
| 获取键对应的值（同步）10+ | Preferences.getSync | 同上 | `getSync(key: string, defValue: ValueType): ValueType` | `let v: preferences.ValueType = dataPrefs.getSync('startup', 'default');` | 同上 |

## Preferences.delete
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 删除指定键值对（callback回调） | Preferences.delete | `import { preferences } from '@kit.ArkData'` | `delete(key: string, callback: AsyncCallback\<void\>): void` | `dataPrefs.delete('startup', (err) => { ... })` | 同上 |
| 删除指定键值对（Promise回调） | Preferences.delete | 同上 | `delete(key: string): Promise\<void\>` | `let p = dataPrefs.delete('startup'); p.then(...)` | 同上 |
| 删除指定键值对（同步）10+ | Preferences.deleteSync | 同上 | `deleteSync(key: string): void` | `dataPrefs.deleteSync('startup');` | 同上 |

## Preferences.flush
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将缓存数据持久化到文件（callback回调） | Preferences.flush | `import { preferences } from '@kit.ArkData'` | `flush(callback: AsyncCallback\<void\>): void` | `dataPrefs.flush((err) => { ... })` | 同上 |
| 将缓存数据持久化到文件（Promise回调） | Preferences.flush | 同上 | `flush(): Promise\<void\>` | `let p = dataPrefs.flush(); p.then(...)` | 同上 |
| 将缓存数据持久化到文件（同步）14+ | Preferences.flushSync | 同上 | `flushSync(): void` | `dataPrefs.flushSync();` | 同上 |

## Preferences.on
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 订阅所有Key的数据变更 | Preferences.on | `import { preferences } from '@kit.ArkData'` | `on(type: 'change', callback: Callback\<string\>): void` | `dataPrefs.on('change', (key) => { console.info(key + ' changed.') })` | 同上 |
| 订阅多进程数据变更10+ | Preferences.on | 同上 | `on(type: 'multiProcessChange', callback: Callback\<string\>): void` | `dataPrefs.on('multiProcessChange', observer)` | 同上 |
| 精确订阅指定Key的数据变更12+ | Preferences.on | 同上 | `on(type: 'dataChange', keys: Array\<string\>, callback: Callback\<Record\<string, ValueType\>\>): void` | `dataPrefs.on('dataChange', ['name','age'], (data) => { ... })` | 同上 |

## 模块说明

- 导入路径统一为 `import { preferences } from '@kit.ArkData'`，模块从 API version 9 开始支持。
- 首选项无法保证进程并发安全，不支持在多进程场景下使用。
- `ValueType` 定义：`number | string | boolean | Array<number> | Array<string> | Array<boolean> | Uint8Array | object | bigint`
- 常量：`MAX_KEY_LENGTH` (1024字节), `MAX_VALUE_LENGTH` (16MB)
- `flush()` 仅在 XML 存储模式下需要手动调用；GSKV 模式下数据实时落盘。
- `Options` 支持 `name`（必填）、`dataGroupId`（可选，Stage模型）、`storageType`（可选，18+，XML/GSKV）。
- 变更事件在 `flush()` 调用后触发；`removePreferencesFromCache` / `deletePreferences` 后会主动取消订阅。
