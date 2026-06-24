# 02 -- RDB 关系型数据库持久化

## relationalStore / @ohos.data.relationalStore
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 关系型数据库模块入口 | relationalStore | `import { relationalStore } from '@kit.ArkData'` | 模块命名空间 | `relationalStore.getRdbStore(context, config)` | 01_模块描述.md |
| 创建或打开RDB | getRdbStore | `relationalStore` | `getRdbStore(context: Context, config: StoreConfig, callback: AsyncCallback<RdbStore>): void` | `relationalStore.getRdbStore(context, STORE_CONFIG).then(store => { ... })` | 02_Functions.md |
| 删除数据库 | deleteRdbStore | `relationalStore` | `deleteRdbStore(context: Context, name: string): Promise<void>` | `relationalStore.deleteRdbStore(context, "RdbTest.db")` | 02_Functions.md |

## RdbStore
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 插入单行数据 | insert | `RdbStore` | `insert(table: string, values: ValuesBucket, callback: AsyncCallback<number>): void` | `store.insert("EMPLOYEE", { NAME: 'Lisa' }, (err, rowId) => {})` | 03_Interface (RdbStore).md |
| 插入数据（指定冲突解决） | insert | `RdbStore` | `insert(table: string, values: ValuesBucket, conflict: ConflictResolution, callback: AsyncCallback<number>): void` | `store.insert("EMPLOYEE", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, callback)` | 03_Interface (RdbStore).md |
| 更新数据 | update | `RdbStore` | `update(values: ValuesBucket, predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.update(values, predicates, callback)` | 03_Interface (RdbStore).md |
| 删除数据 | delete | `RdbStore` | `delete(predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.delete(predicates, callback)` | 03_Interface (RdbStore).md |
| 查询数据 | query | `RdbStore` | `query(predicates: RdbPredicates, columns?: Array<string>, callback: AsyncCallback<ResultSet>): void` | `store.query(predicates, ["ID", "NAME"], callback)` | 03_Interface (RdbStore).md |
| 执行SQL语句 | executeSql | `RdbStore` | `executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>` | `store.executeSql("DELETE FROM test WHERE name = ?", ['zhangsan'])` | 03_Interface (RdbStore).md |
| 带参数执行SQL | execute | `RdbStore` | `execute(sql: string, args?: Array<ValueType>): Promise<ValueType>` | `store.execute("DELETE FROM test WHERE name = ?", ['zhangsan'])` | 03_Interface (RdbStore).md |
| 查询SQL | querySql | `RdbStore` | `querySql(sql: string, bindArgs?: Array<ValueType>, callback: AsyncCallback<ResultSet>): void` | `store.querySql("SELECT * FROM EMPLOYEE", callback)` | 03_Interface (RdbStore).md |
| 开启事务 | beginTransaction | `RdbStore` | `beginTransaction(): void` | `store.beginTransaction()` | 03_Interface (RdbStore).md |
| 提交事务 | commit | `RdbStore` | `commit(): void` | `store.commit()` | 03_Interface (RdbStore).md |
| 回滚事务 | rollBack | `RdbStore` | `rollBack(): void` | `store.rollBack()` | 03_Interface (RdbStore).md |

## StoreConfig
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数据库配置接口 | StoreConfig | `relationalStore` | `{ name: string, securityLevel: SecurityLevel, encrypt?: boolean, ... }` | `{ name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 }` | 07_Interfaces (其他).md |

## ValuesBucket
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数据键值对集合 | ValuesBucket | `import { ValuesBucket } from '@kit.ArkData'` | `type ValuesBucket = Record<string, ValueType>` | `{ 'NAME': 'Lisa', 'AGE': 18 }` | 14_ohos.data.ValuesBucket (数据集).md |
| RDB内ValueType | ValueType | `relationalStore` | `type ValueType = null \| number \| string \| boolean \| Uint8Array \| Asset \| Assets \| Float32Array \| bigint` | 含大数据类型 | 10_Types.md |
| 通用ValueType | ValueType | `import { ValueType } from '@kit.ArkData'` | `type ValueType = number \| string \| boolean` | 数据共享场景 | 14_ohos.data.ValuesBucket (数据集).md |

## ResultSet
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 查询结果集 | ResultSet | `relationalStore.ResultSet` | 属性: columnNames, columnCount, rowCount, rowIndex, isAtFirstRow, isAtLastRow, isEnded, isStarted, isClosed | `resultSet.goToNextRow(); const name = resultSet.getString(0)` | 04_Interface (ResultSet).md |
| 移动结果集指针 | goToNextRow | `ResultSet` | `goToNextRow(): boolean` | `while (resultSet.goToNextRow()) { ... }` | 04_Interface (ResultSet).md |
| 获取字符串值 | getString | `ResultSet` | `getString(columnIndex: number): string` | `resultSet.getString(resultSet.getColumnIndex("NAME"))` | 04_Interface (ResultSet).md |
| 获取整数值 | getLong | `ResultSet` | `getLong(columnIndex: number): number` | `resultSet.getLong(0)` | 04_Interface (ResultSet).md |
| 获取浮点值 | getDouble | `ResultSet` | `getDouble(columnIndex: number): number` | `resultSet.getDouble(resultSet.getColumnIndex("SALARY"))` | 04_Interface (ResultSet).md |
| 获取通用值 | getValue | `ResultSet` | `getValue(columnIndex: number): ValueType` | `resultSet.getValue(colIndex)` | 04_Interface (ResultSet).md |
| 获取二进制值 | getBlob | `ResultSet` | `getBlob(columnIndex: number): Uint8Array` | `resultSet.getBlob(resultSet.getColumnIndex("CODES"))` | 04_Interface (ResultSet).md |
| 关闭结果集 | close | `ResultSet` | `close(): void` | `resultSet.close()` | 04_Interface (ResultSet).md |

## dataSharePredicates
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通用查询谓词 | DataSharePredicates | `import { dataSharePredicates } from '@kit.ArkData'` | `class DataSharePredicates { equalTo(field: string, value: ValueType): DataSharePredicates; ... }` | `new dataSharePredicates.DataSharePredicates().equalTo("NAME", "Rose")` | 04_ohos.data.dataSharePredicates (数据共享谓词).md |
| 等于条件 | equalTo | `DataSharePredicates` | `equalTo(field: string, value: ValueType): DataSharePredicates` | `predicates.equalTo("NAME", "Rose")` | 同上 |
| 排序（升序） | orderByAsc | `DataSharePredicates` | `orderByAsc(field: string): DataSharePredicates` | `predicates.orderByAsc("AGE")` | 同上 |
| 排序（降序） | orderByDesc | `DataSharePredicates` | `orderByDesc(field: string): DataSharePredicates` | `predicates.orderByDesc("AGE")` | 同上 |
| 分页 | limit | `DataSharePredicates` | `limit(total: number, offset: number): DataSharePredicates` | `predicates.limit(10, 3)` | 同上 |
| 包含 | in | `DataSharePredicates` | `in(field: string, value: Array<ValueType>): DataSharePredicates` | `predicates.in("AGE", [18, 20])` | 同上 |
| 模糊匹配 | like | `DataSharePredicates` | `like(field: string, value: string): DataSharePredicates` | `predicates.like("NAME", "%os%")` | 同上 |
| 区间匹配 | between | `DataSharePredicates` | `between(field: string, low: ValueType, high: ValueType): DataSharePredicates` | `predicates.between("AGE", 10, 50)` | 同上 |
| 大于 | greaterThan | `DataSharePredicates` | `greaterThan(field: string, value: ValueType): DataSharePredicates` | `predicates.greaterThan("AGE", 10)` | 同上 |
| AND组合 | and | `DataSharePredicates` | `and(): DataSharePredicates` | `predicates.equalTo("NAME","lisi").and().equalTo("SALARY",200.5)` | 同上 |

## preferences / @ohos.data.preferences
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 用户首选项模块入口 | preferences | `import { preferences } from '@kit.ArkData'` | 模块命名空间 | `preferences.getPreferences(this.context, 'myStore')` | 07_ohos.data.preferences (用户首选项).md |
| 获取Preferences实例 | getPreferences | `preferences` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `preferences.getPreferences(context, 'myStore').then(pref => {})` | 同上 |
| 写入键值 | put | `Preferences` | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto')` | 同上 |
| 读取键值 | get | `Preferences` | `get(key: string, defValue: ValueType): Promise<ValueType>` | `dataPreferences.get('startup', 'default')` | 同上 |
| 同步读取 | getSync | `Preferences` | `getSync(key: string, defValue: ValueType): ValueType` | `dataPreferences.getSync('startup', 'default')` | 同上 |
| 删除键值 | delete | `Preferences` | `delete(key: string): Promise<void>` | `dataPreferences.delete('startup')` | 同上 |
| 检查键存在 | has | `Preferences` | `has(key: string): Promise<boolean>` | `dataPreferences.has('startup')` | 同上 |
| 刷新落盘 | flush | `Preferences` | `flush(): Promise<void>` | `dataPreferences.flush()` | 同上 |
| 清理所有数据 | clear | `Preferences` | `clear(): Promise<void>` | `dataPreferences.clear()` | 同上 |
| 删除Preferences文件 | deletePreferences | `preferences` | `deletePreferences(context: Context, name: string): Promise<void>` | `preferences.deletePreferences(context, 'myStore')` | 同上 |

## 模块说明

- `relationalStore` 基于SQLite，首批接口从API 9开始支持。单条数据不超过2MB，单次查询不超过5000条。推荐在TaskPool中执行大数据量查询。
- RDB 中 `ValuesBucket` 的 `ValueType`（含 `Uint8Array | Asset | Assets | Float32Array | bigint`）比 `@ohos.data.ValuesBucket` 中的 `ValueType`（仅 `number | string | boolean`）范围更宽。
- `dataSharePredicates.DataSharePredicates` 是通用谓词层，`relationalStore.RdbPredicates` 是RDB专属谓词层，功能近似但 `RdbPredicates` 更丰富（如 `orderByAsc` 等命名带后缀）。
- `preferences` 首批API 9，适合轻量级键值存储（不超过16MB/value）。DataShare模块下的 `ValueType` 不含 `Uint8Array`, `Asset` 等类型。
