# 02 — Data Persistence (ArkData)

## @ohos.data.preferences (用户首选项)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取Preferences实例（Promise异步） | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let sp = preferences.getPreferences(this.context, 'myStore'); sp.then(...)` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md |
| 写入键值对 | preferences.Preferences.put | 同上 | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto').then(...)` | 同上 |
| 读取键值 | preferences.Preferences.get | 同上 | `get(key: string, defValue: ValueType): Promise<ValueType>` | `dataPreferences.get('startup', 'default').then(...)` | 同上 |
| 检查键是否存在 | preferences.Preferences.has | 同上 | `has(key: string): Promise<boolean>` | `dataPreferences.has('startup').then(...)` | 同上 |
| 删除键值对 | preferences.Preferences.delete | 同上 | `delete(key: string): Promise<void>` | `dataPreferences.delete('startup').then(...)` | 同上 |
| 落盘持久化 | preferences.Preferences.flush | 同上 | `flush(): Promise<void>` | `dataPreferences.flush().then(...)` | 同上 |
| 清除所有数据 | preferences.Preferences.clear | 同上 | `clear(): Promise<void>` | `dataPreferences.clear().then(...)` | 同上 |
| 删除Preferences实例及持久化文件 | preferences.deletePreferences | 同上 | `deletePreferences(context: Context, name: string): Promise<void>` | `preferences.deletePreferences(context, 'myStore').then(...)` | 同上 |
| 观察数据变更 | preferences.Preferences.on | 同上 | `on(type: 'change', callback: Callback<string>): void` | `dataPreferences.on('change', (key) => { ... })` | 同上 |

## @ohos.data.relationalStore (关系型数据库)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取RdbStore实例（Promise异步） | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `let store = await relationalStore.getRdbStore(context, { name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 })` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md |
| 插入数据行 | RdbStore.insert | 同上 | `insert(table: string, values: ValuesBucket, callback: AsyncCallback<number>): void` | `store.insert("EMPLOYEE", { NAME: 'Lisa', AGE: 18 }, callback)` | 同上目录/03_Interface (RdbStore).md |
| 查询数据 | RdbStore.query | 同上 | `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>` | `store.query(new RdbPredicates("EMPLOYEE").equalTo("NAME", "Lisa"))` | 同上 |
| 执行SQL语句 | RdbStore.executeSql | 同上 | `executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>` | `store.executeSql("CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL)")` | 同上 |
| 更新数据 | RdbStore.update | 同上 | `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>` | `store.update({ NAME: 'Rose' }, new RdbPredicates("EMPLOYEE").equalTo("NAME", "Lisa"))` | 同上 |
| 删除数据 | RdbStore.delete | 同上 | `delete(predicates: RdbPredicates): Promise<number>` | `store.delete(new RdbPredicates("EMPLOYEE").equalTo("NAME", "Lisa"))` | 同上 |

## @ohos.data.sendableRelationalStore (共享关系型数据库)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将非Sendable ValuesBucket转换为Sendable | sendableRelationalStore.toSendableValuesBucket | `import { sendableRelationalStore } from '@kit.ArkData'` | `toSendableValuesBucket(valuesBucket: NonSendableBucket): ValuesBucket` | `let sendableBucket = sendableRelationalStore.toSendableValuesBucket({ age: 18, name: "hangman" })` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/10_ohos.data.sendableRelationalStore (共享关系型数据库).md |
| 将Sendable ValuesBucket转换为非Sendable | sendableRelationalStore.fromSendableValuesBucket | 同上 | `fromSendableValuesBucket(valuesBucket: ValuesBucket): NonSendableBucket` | `let normalBucket = sendableRelationalStore.fromSendableValuesBucket(sendableBucket)` | 同上 |
| 将非Sendable Asset转换为Sendable | sendableRelationalStore.toSendableAsset | 同上 | `toSendableAsset(asset: NonSendableAsset): Asset` | `let sendableAsset = sendableRelationalStore.toSendableAsset(asset1)` | 同上 |
| 将Sendable Asset转换为非Sendable | sendableRelationalStore.fromSendableAsset | 同上 | `fromSendableAsset(asset: Asset): NonSendableAsset` | `let normalAsset = sendableRelationalStore.fromSendableAsset(sendableAsset)` | 同上 |
| 将Sendable数组转换为非Sendable | sendableRelationalStore.fromSendableValues | 同上 | `fromSendableValues(values: collections.Array<ValueType>): NonSendableValues` | `let values = sendableRelationalStore.fromSendableValues(array)` | 同上 |

## @ohos.data.ValuesBucket (数据集)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| ValuesBucket类型定义 | ValuesBucket | `import { ValueType, ValuesBucket } from '@kit.ArkData'` | `type ValuesBucket = Record<string, ValueType \| Uint8Array \| null>` | `const bucket: ValuesBucket = { 'NAME': 'Lisa', 'AGE': 18, 'SALARY': 100.5 }` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/14_ohos.data.ValuesBucket (数据集).md |
| ValueType类型定义 | ValueType | 同上 | `type ValueType = number \| string \| boolean` | 同ValuesBucket示例 | 同上 |

## @ohos.data.dataSharePredicates (数据共享谓词)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建谓词实例 | DataSharePredicates | `import { dataSharePredicates } from '@kit.ArkData'` | `new dataSharePredicates.DataSharePredicates()` | `let predicates = new dataSharePredicates.DataSharePredicates()` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/04_ohos.data.dataSharePredicates (数据共享谓词).md |
| 等于条件 | DataSharePredicates.equalTo | 同上 | `equalTo(field: string, value: ValueType): DataSharePredicates` | `predicates.equalTo("NAME", "Rose")` | 同上 |
| 与条件 | DataSharePredicates.and | 同上 | `and(): DataSharePredicates` | `predicates.equalTo("NAME","lisi").and().equalTo("SALARY",200.5)` | 同上 |
| 或条件 | DataSharePredicates.or | 同上 | `or(): DataSharePredicates` | `predicates.equalTo("NAME","lisi").or().equalTo("NAME","Rose")` | 同上 |
| LIKE模糊匹配 | DataSharePredicates.like | 同上 | `like(field: string, value: string): DataSharePredicates` | `predicates.like("NAME", "%os%")` | 同上 |
| BETWEEN范围 | DataSharePredicates.between | 同上 | `between(field: string, low: ValueType, high: ValueType): DataSharePredicates` | `predicates.between("AGE", 10, 50)` | 同上 |
| 升序排序 | DataSharePredicates.orderByAsc | 同上 | `orderByAsc(field: string): DataSharePredicates` | `predicates.orderByAsc("AGE")` | 同上 |
| 分页限制 | DataSharePredicates.limit | 同上 | `limit(total: number, offset: number): DataSharePredicates` | `predicates.equalTo("NAME","Rose").limit(10, 3)` | 同上 |

## Module Notes

- All five APIs belong to `@kit.ArkData` but have different import paths: `preferences` and `relationalStore` are separate namespaces under `@kit.ArkData`.
- `@ohos.data.ValuesBucket` defines the base `ValueType = number | string | boolean` for DataShare scenarios. The relationalStore namespace has its own richer `ValueType` including `Asset`, `Assets`, `Uint8Array`, `bigint` etc.
- `sendableRelationalStore` is API 12+ and enables cross-thread data passing with `taskpool`.
- `dataSharePredicates` requires relation/kv-store backend context; when used with RDB it maps to `RdbPredicates`.
- `preferences` does NOT guarantee process concurrency safety and has XML/GSKV storage modes (API 18+).
