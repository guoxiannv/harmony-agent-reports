# 01 — RelationalStore 关系型数据持久化

## data.relationalStore (模块)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 关系型数据库模块，基于SQLite提供本地数据库管理（增删改查及原始SQL执行） | `relationalStore` | `import { relationalStore } from '@kit.ArkData';` | 模块命名空间，包含所有RDB类型和函数 | `relationalStore.getRdbStore(...)` | `01_模块描述.md` |

## relationalStore.getRdbStore
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开关系型数据库，支持callback/Promise/sync三种模式 | `relationalStore.getRdbStore` | `@kit.ArkData` | `getRdbStore(context: Context, config: StoreConfig, callback: AsyncCallback<RdbStore>): void`; `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>`; `getRdbStoreSync24+(context: Context, config: StoreConfig): RdbStore` | `relationalStore.getRdbStore(this.context, { name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 }).then(rdb => { store = rdb; })` | `02_Functions.md` |

## RdbStore.insert
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 向目标表插入一行数据，返回行ID | `RdbStore.insert` | `@kit.ArkData` | `insert(table: string, values: ValuesBucket, callback: AsyncCallback<number>): void`; `insert(table: string, values: ValuesBucket): Promise<number>`; 另有支持`ConflictResolution`的重载 | `store.insert("EMPLOYEE", { NAME: "Lisa", AGE: 18, SALARY: 100.5 }, (err, rowId) => { ... })` | `03_Interface (RdbStore).md` |

## RdbStore.update
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据RdbPredicates条件更新数据，返回受影响行数 | `RdbStore.update` | `@kit.ArkData` | `update(values: ValuesBucket, predicates: RdbPredicates, callback: AsyncCallback<number>): void`; `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>`; 支持`ConflictResolution`重载 | `let predicates = new relationalStore.RdbPredicates("EMPLOYEE"); predicates.equalTo("NAME", "Lisa"); store.update(valueBucket, predicates, (err, rows) => { ... })` | `03_Interface (RdbStore).md` |

## RdbStore.delete
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据RdbPredicates条件删除数据，返回受影响行数 | `RdbStore.delete` | `@kit.ArkData` | `delete(predicates: RdbPredicates, callback: AsyncCallback<number>): void`; `delete(predicates: RdbPredicates): Promise<number>`; `deleteSync12+(predicates: RdbPredicates): number` | `let predicates = new relationalStore.RdbPredicates("EMPLOYEE"); predicates.equalTo("NAME", "Lisa"); store.delete(predicates, (err, rows) => { ... })` | `03_Interface (RdbStore).md` |

## RdbStore.query
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据RdbPredicates条件查询数据，返回ResultSet | `RdbStore.query` | `@kit.ArkData` | `query(predicates: RdbPredicates, columns?: Array<string>, callback: AsyncCallback<ResultSet>): void`; `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>`; `querySync12+(predicates: RdbPredicates, columns?: Array<string>): ResultSet` | `store.query(predicates, ["ID", "NAME"]).then(resultSet => { while (resultSet.goToNextRow()) { ... } resultSet.close(); })` | `03_Interface (RdbStore).md` |

## RdbStore.querySql
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 执行原始SQL查询，支持参数绑定，返回ResultSet | `RdbStore.querySql` | `@kit.ArkData` | `querySql(sql: string, bindArgs?: Array<ValueType>, callback: AsyncCallback<ResultSet>): void`; `querySql(sql: string, bindArgs?: Array<ValueType>): Promise<ResultSet>`; `querySqlSync12+(sql: string, bindArgs?: Array<ValueType>): ResultSet` | `store.querySql("SELECT * FROM EMPLOYEE WHERE NAME = ?", ['sanguo']).then(resultSet => { ... })` | `03_Interface (RdbStore).md` |

## RdbStore.executeSql
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 执行非查询SQL（INSERT/UPDATE/DELETE/CREATE等），不支持查询、事务、ATTACH | `RdbStore.executeSql` | `@kit.ArkData` | `executeSql(sql: string, bindArgs?: Array<ValueType>, callback: AsyncCallback<void>): void`; `executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>` | `store.executeSql("DELETE FROM test WHERE name = ?", ['zhangsan']).then(() => { ... })` | `03_Interface (RdbStore).md` |

## ValuesBucket
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 键值对类型，表示要插入/更新的数据行 | `ValuesBucket` | `@kit.ArkData` | `type ValuesBucket = Record<string, ValueType>` | `const bucket: relationalStore.ValuesBucket = { NAME: "Lisa", AGE: 18, SALARY: 100.5 };` | `10_Types.md` |

## ResultSet
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数据库查询结果集游标，提供行/列遍历和数据读取方法 | `ResultSet` | `@kit.ArkData` | `interface ResultSet { columnNames: Array<string>; columnCount: number; rowCount: number; goToNextRow(): boolean; getString(columnIndex: number): string; getLong(columnIndex: number): number; getDouble(columnIndex: number): number; getBlob(columnIndex: number): Uint8Array; close(): void; ... }` | `while (resultSet.goToNextRow()) { const name = resultSet.getString(resultSet.getColumnIndex("NAME")); } resultSet.close();` | `04_Interface (ResultSet).md` |

## ValueType
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 允许的数据字段类型联合 | `ValueType` | `@kit.ArkData` | `type ValueType = null \| number \| string \| boolean \| Uint8Array \| Asset \| Assets \| Float32Array \| bigint` | 用于ValuesBucket的值类型定义 | `10_Types.md` |

## 模块说明

- 导入路径：`import { relationalStore } from '@kit.ArkData';`
- 首批API version 9，后续新增接口以角标标记起始版本。
- 单条数据建议不超过2MB（共享内存限制），单条字符串字段最大8MB，超出截断。
- 大数据量查询建议不超过5000条，或在TaskPool中执行以避免卡死。
- `getRdbStore`支持多线程并发操作；`StoreConfig`必须指定`name`和`securityLevel`。
- `ResultSet`不会实时刷新；使用后必须调用`close()`释放资源，否则可能导致FD泄漏和内存泄漏。
- `executeSql`不支持执行查询、事务（BEGIN/COMMIT/ROLLBACK）及ATTACH操作，不支持分号分隔的多条语句。
- `ValuesBucket`在`@ohos.data.relationalStore`中定义为`Record<string, ValueType>`；单独的`@ohos.data.ValuesBucket`模块中定义为`Record<string, ValueType | Uint8Array | null>`，注意区别。
