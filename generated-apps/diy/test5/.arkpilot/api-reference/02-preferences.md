# 02 — Preferences 用户首选项（轻量设置）

## data.preferences
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 用户首选项模块，提供 Key-Value 键值型轻量数据持久化能力 | `preferences` | `import { preferences } from '@kit.ArkData'` | 模块级命名空间，包含 getPreferences / deletePreferences / removePreferencesFromCache / isStorageTypeSupported 等静态方法及 Preferences / Options / StorageType / ValueType 等类型 | `preferences.getPreferences(context, 'myStore')` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## getPreferences
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 Preferences 实例（通过 name），支持 callback / Promise 两种模式 | `preferences.getPreferences` | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void` / `getPreferences(context: Context, name: string): Promise<Preferences>` | `preferences.getPreferences(this.context, 'myStore', (err, val) => { dataPreferences = val; })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| 获取 Preferences 实例（通过 Options），支持 dataGroupId 和 storageType | `preferences.getPreferences` (10+) | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, options: Options, callback: AsyncCallback<Preferences>): void` / `getPreferences(context: Context, options: Options): Promise<Preferences>` | `let options: preferences.Options = { name: 'myStore' }; preferences.getPreferences(context, options).then(...)` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## Preferences.put
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将数据写入缓存的 Preferences 实例，需调用 flush 持久化 | `Preferences.put` | `import { preferences } from '@kit.ArkData'` | `put(key: string, value: ValueType, callback: AsyncCallback<void>): void` / `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto', (err) => { ... })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## Preferences.get
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从缓存的 Preferences 实例中获取键对应的值，若为 null 或非默认值类型则返回 defValue | `Preferences.get` | `import { preferences } from '@kit.ArkData'` | `get(key: string, defValue: ValueType, callback: AsyncCallback<ValueType>): void` / `get(key: string, defValue: ValueType): Promise<ValueType>` | `dataPreferences.get('startup', 'default').then((val) => { ... })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## Preferences.flush
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将缓存的 Preferences 实例数据异步持久化到用户首选项文件（仅在 XML 存储模式下需要） | `Preferences.flush` | `import { preferences } from '@kit.ArkData'` | `flush(callback: AsyncCallback<void>): void` / `flush(): Promise<void>` | `dataPreferences.flush((err) => { ... })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## Preferences.delete
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从缓存的 Preferences 实例中删除指定 key 的键值对，需调用 flush 持久化 | `Preferences.delete` | `import { preferences } from '@kit.ArkData'` | `delete(key: string, callback: AsyncCallback<void>): void` / `delete(key: string): Promise<void>` | `dataPreferences.delete('startup', (err) => { ... })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## Preferences.getAll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取缓存的 Preferences 实例中的所有键值数据 | `Preferences.getAll` | `import { preferences } from '@kit.ArkData'` | `getAll(callback: AsyncCallback<Object>): void` / `getAll(): Promise<Object>` | `dataPreferences.getAll().then((value) => { ... })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## Preferences.on
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 订阅数据变更（'change'），flush 后触发回调，通知变更的 key | `Preferences.on` | `import { preferences } from '@kit.ArkData'` | `on(type: 'change', callback: Callback<string>): void` | `dataPreferences.on('change', (key) => { console.info("Key " + key + " changed."); })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## Module Notes

- 导入方式: `import { preferences } from '@kit.ArkData'`
- 最低版本: API 9（首批接口），后续新增接口使用上角标标注起始版本
- 系统能力: `SystemCapability.DistributedDataManager.Preferences.Core`
- 元服务支持: 从 API version 11 开始
- 价值类型 (ValueType): `number | string | boolean | Array<number> | Array<string> | Array<boolean> | Uint8Array | object | bigint`
- MAX_KEY_LENGTH = 1024 字节，MAX_VALUE_LENGTH = 16MB
- 首选项无法保证进程并发安全，不支持在多进程场景下使用
- 默认存储模式为 XML（需要显式调用 flush 落盘），GSKV 模式实时落盘无需 flush，选择前应调用 `isStorageTypeSupported` 检查平台支持
- 实例获取后会被缓存，后续同名调用直接从缓存读取；`removePreferencesFromCache` / `deletePreferences` 后会清除缓存
