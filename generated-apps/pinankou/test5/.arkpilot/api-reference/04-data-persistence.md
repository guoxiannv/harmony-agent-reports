# 04 — 数据持久化 (Data Persistence)

## @ohos.data.preferences (用户首选项)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取Preferences实例（Promise） | preferences.getPreferences | import { preferences } from '@kit.ArkData' | getPreferences(context: Context, name: string): Promise\<Preferences> | `let sp = preferences.getPreferences(this.context, 'myStore');` | 07_ohos.data.preferences (用户首选项).md |
| 写入键值对（Promise） | preferences.Preferences.put | import { preferences } from '@kit.ArkData' | put(key: string, value: ValueType): Promise\<void> | `dataPreferences.put('startup', 'auto');` | 07_ohos.data.preferences (用户首选项).md |
| 读取键值对（Promise） | preferences.Preferences.get | import { preferences } from '@kit.ArkData' | get(key: string, defValue: ValueType): Promise\<ValueType> | `dataPreferences.get('startup', 'default');` | 07_ohos.data.preferences (用户首选项).md |
| 删除键值对（Promise） | preferences.Preferences.delete | import { preferences } from '@kit.ArkData' | delete(key: string): Promise\<void> | `dataPreferences.delete('startup');` | 07_ohos.data.preferences (用户首选项).md |
| 持久化刷盘（Promise） | preferences.Preferences.flush | import { preferences } from '@kit.ArkData' | flush(): Promise\<void> | `dataPreferences.flush();` | 07_ohos.data.preferences (用户首选项).md |
| 订阅全局数据变更 | preferences.Preferences.on('change') | import { preferences } from '@kit.ArkData' | on(type: 'change', callback: Callback\<string>): void | `dataPreferences.on('change', (key) => { ... });` | 07_ohos.data.preferences (用户首选项).md |
| 删除Preferences持久化文件（Promise） | preferences.deletePreferences | import { preferences } from '@kit.ArkData' | deletePreferences(context: Context, name: string): Promise\<void> | `preferences.deletePreferences(this.context, 'myStore');` | 07_ohos.data.preferences (用户首选项).md |

## @ohos.data.relationalStore (关系型数据库)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开RDB数据库（Promise） | relationalStore.getRdbStore | import { relationalStore } from '@kit.ArkData' | getRdbStore(context: Context, config: StoreConfig): Promise\<RdbStore> | `relationalStore.getRdbStore(context, STORE_CONFIG);` | 09_ohos.data.relationalStore/Functions.md |
| 删除RDB数据库文件（Promise） | relationalStore.deleteRdbStore | import { relationalStore } from '@kit.ArkData' | deleteRdbStore(context: Context, name: string): Promise\<void> | `relationalStore.deleteRdbStore(context, "RdbTest.db");` | 09_ohos.data.relationalStore/Functions.md |
| 插入数据（Promise） | RdbStore.insert | import { relationalStore } from '@kit.ArkData' | insert(table: string, values: ValuesBucket): Promise\<number> | `store.insert("EMPLOYEE", valueBucket);` | 09_ohos.data.relationalStore/Interface (RdbStore).md |
| 更新数据（Promise） | RdbStore.update | import { relationalStore } from '@kit.ArkData' | update(values: ValuesBucket, predicates: RdbPredicates): Promise\<number> | `store.update(valueBucket, predicates);` | 09_ohos.data.relationalStore/Interface (RdbStore).md |
| 删除数据（Promise） | RdbStore.delete | import { relationalStore } from '@kit.ArkData' | delete(predicates: RdbPredicates): Promise\<number> | `store.delete(predicates);` | 09_ohos.data.relationalStore/Interface (RdbStore).md |
| 按谓词查询（Promise） | RdbStore.query | import { relationalStore } from '@kit.ArkData' | query(predicates: RdbPredicates, columns?: Array\<string>): Promise\<ResultSet> | `store.query(predicates, ["ID","NAME"]);` | 09_ohos.data.relationalStore/Interface (RdbStore).md |
| 执行SQL查询（Promise） | RdbStore.querySql | import { relationalStore } from '@kit.ArkData' | querySql(sql: string, bindArgs?: Array\<ValueType>): Promise\<ResultSet> | `store.querySql("SELECT * FROM EMPLOYEE");` | 09_ohos.data.relationalStore/Interface (RdbStore).md |
| 执行SQL语句（Promise） | RdbStore.executeSql | import { relationalStore } from '@kit.ArkData' | executeSql(sql: string, bindArgs?: Array\<ValueType>): Promise\<void> | `store.executeSql(SQL_CREATE_TABLE);` | 09_ohos.data.relationalStore/Interface (RdbStore).md |
| 执行SQL并返回值（Promise, API 12+） | RdbStore.execute | import { relationalStore } from '@kit.ArkData' | execute(sql: string, args?: Array\<ValueType>): Promise\<ValueType> | `store.execute("PRAGMA integrity_check");` | 09_ohos.data.relationalStore/Interface (RdbStore).md |

## @ohos.data.ValuesBucket (数据集)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数据库字段值类型 | ValueType | import { ValueType, ValuesBucket } from '@kit.ArkData' | type ValueType = number \| string \| boolean | `const name: ValueType = "Alice";` | 14_ohos.data.ValuesBucket (数据集).md |
| 数据行类型 | ValuesBucket | import { ValueType, ValuesBucket } from '@kit.ArkData' | type ValuesBucket = Record\<string, ValueType \| Uint8Array \| null> | `const bucket: ValuesBucket = { NAME: 'Alice', AGE: 22 };` | 14_ohos.data.ValuesBucket (数据集).md |

## @ohos.data.dataSharePredicates (数据共享谓词)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建数据共享谓词 | DataSharePredicates | import { dataSharePredicates } from '@kit.ArkData' | new dataSharePredicates.DataSharePredicates(): DataSharePredicates | `let predicates = new dataSharePredicates.DataSharePredicates();` | 04_ohos.data.dataSharePredicates (数据共享谓词).md |
| 等于条件 | DataSharePredicates.equalTo | import { dataSharePredicates } from '@kit.ArkData' | equalTo(field: string, value: ValueType): DataSharePredicates | `predicates.equalTo("NAME", "Rose");` | 04_ohos.data.dataSharePredicates (数据共享谓词).md |
| 升序排序 | DataSharePredicates.orderByAsc | import { dataSharePredicates } from '@kit.ArkData' | orderByAsc(field: string): DataSharePredicates | `predicates.orderByAsc("AGE");` | 04_ohos.data.dataSharePredicates (数据共享谓词).md |
| 限制结果数和起始位置 | DataSharePredicates.limit | import { dataSharePredicates } from '@kit.ArkData' | limit(total: number, offset: number): DataSharePredicates | `predicates.equalTo("NAME","Rose").limit(10, 3);` | 04_ohos.data.dataSharePredicates (数据共享谓词).md |

## 模块说明

- `@ohos.data.preferences` 使用XML模式时，put/delete 操作需调用 `flush()` 刷盘才会写入持久化文件；GSKV模式实时落盘无需flush。`on('change')` 仅在执行flush后触发回调。
- `@ohos.data.relationalStore` RDBStore 的 executeSql 不支持分号分隔的多条语句、不支持查询和事务操作。对于 DDL/建表，推荐优先使用 API 12+ 的 `execute()` 方法。需注意共享内存限制 2MB，单条字符串字段最大 8MB。
- `DataSharePredicates` 是库外谓词（用于 DataShare），在 relationStore 内部使用时应当使用 `RdbPredicates`。`RdbPredicates` 提供与 DataSharePredicates 类似的 equalTo/orderByAsc/limit 链式调用方法，但属于 `@ohos.data.relationalStore` 模块。
