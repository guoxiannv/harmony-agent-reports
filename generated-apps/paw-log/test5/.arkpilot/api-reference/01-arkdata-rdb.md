# 01 — ArkData RDB (关系型数据库)

## relationalStore
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| RDB 模块入口，提供创建/打开/删除数据库等顶层函数 | `relationalStore` | `import { relationalStore } from '@kit.ArkData'` | 模块命名空间 | `const store: relationalStore.RdbStore \| undefined = undefined;` | `01_模块描述.md` |

## RdbStore
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 关系型数据库操作接口，提供 insert/update/delete/query/executeSql 等方法 | `RdbStore` (interface) | `import { relationalStore } from '@kit.ArkData'`（通过 `relationalStore.RdbStore` 引用） | 接口，包含 `insert`, `update`, `delete`, `query`, `querySql`, `executeSql`, `execute`, `beginTransaction`, `commit`, `rollBack` 等方法 | `await (store as relationalStore.RdbStore).insert("EMPLOYEE", valueBucket);` | `03_Interface (RdbStore).md` |

## ResultSet
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 查询返回的结果集，提供游标遍历和列数据读取能力 | `ResultSet` (interface) | `import { relationalStore } from '@kit.ArkData'` | 接口，包含 `goToNextRow()`, `getString(columnIndex)`, `getLong(columnIndex)`, `getDouble(columnIndex)`, `close()`, `rowCount`, `columnNames` 等 | `while (resultSet.goToNextRow()) { const name = resultSet.getString(resultSet.getColumnIndex("NAME")); }` | `04_Interface (ResultSet).md` |

## ValuesBucket
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 插入/更新数据的键值对集合 | `ValuesBucket` (type) | `import { ValueType, ValuesBucket } from '@kit.ArkData'` | `type ValuesBucket = Record<string, ValueType>`，其中 `ValueType = null \| number \| string \| boolean \| Uint8Array \| Asset \| Assets \| Float32Array \| bigint` | `const vb: relationalStore.ValuesBucket = { 'NAME': 'Lisa', 'AGE': 18, 'SALARY': 100.5, 'CODES': new Uint8Array([1,2,3]) };` | `10_Types.md` / `14_ohos.data.ValuesBucket (数据集).md` |

## RdbPredicates
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 定义数据库操作条件（WHERE 条件），支持链式调用 | `RdbPredicates` (class) | `import { relationalStore } from '@kit.ArkData'` | `constructor(name: string)`，方法如 `equalTo(field, value)`, `notEqualTo()`, `orderByAsc()`, `orderByDesc()`, `and()`, `or()` 等 | `let predicates = new relationalStore.RdbPredicates("EMPLOYEE"); predicates.equalTo("NAME", "Lisa");` | `08_Class (RdbPredicates).md` |

## relationalStore.getRdbStore
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开已有关系型数据库 | `relationalStore.getRdbStore` | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>`（另有 callback 重载和 `getRdbStoreSync` 同步版） | `const store = await relationalStore.getRdbStore(this.context, { name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 });` | `02_Functions.md` |

## relationalStore.executeSql
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 在 RdbStore 实例上执行任意 SQL（不含查询/事务） | `RdbStore.executeSql` | 通过 `RdbStore` 实例调用 | `executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>`（另有 callback 重载） | `await (store as relationalStore.RdbStore).executeSql("DELETE FROM test WHERE name = ?", ['zhangsan']);` | `03_Interface (RdbStore).md` |

## relationalStore.insert
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 向目标表插入一行数据 | `RdbStore.insert` | 通过 `RdbStore` 实例调用 | `insert(table: string, values: ValuesBucket): Promise<number>`（另有 callback 重载、conflict 重载、同步版） | `const rowId = await (store as relationalStore.RdbStore).insert("EMPLOYEE", valueBucket);` | `03_Interface (RdbStore).md` |

## relationalStore.update
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据谓词条件更新数据 | `RdbStore.update` | 通过 `RdbStore` 实例调用 | `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>`（另有 callback 重载、conflict 重载、同步版） | `await (store as relationalStore.RdbStore).update(valueBucket, predicates);` | `03_Interface (RdbStore).md` |

## relationalStore.delete
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据谓词条件删除数据 | `RdbStore.delete` | 通过 `RdbStore` 实例调用 | `delete(predicates: RdbPredicates): Promise<number>`（另有 callback 重载、同步版） | `await (store as relationalStore.RdbStore).delete(predicates);` | `03_Interface (RdbStore).md` |

## relationalStore.query
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据谓词条件查询数据 | `RdbStore.query` | 通过 `RdbStore` 实例调用 | `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>`（另有 callback 重载、同步版） | `const resultSet = await (store as relationalStore.RdbStore).query(predicates, ["ID", "NAME"]);` | `03_Interface (RdbStore).md` |

## relationalStore.querySql
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 执行 SQL 查询语句 | `RdbStore.querySql` | 通过 `RdbStore` 实例调用 | `querySql(sql: string, bindArgs?: Array<ValueType>): Promise<ResultSet>`（另有 callback 重载、同步版） | `const resultSet = await (store as relationalStore.RdbStore).querySql("SELECT * FROM EMPLOYEE WHERE NAME = ?", ['Lisa']);` | `03_Interface (RdbStore).md` |

## relationalStore.createRdbStore
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建关系型数据库（未找到独立 API） | `relationalStore.createRdbStore` | — | — | — | **缺失**：实际 API 名为 `relationalStore.getRdbStore`，无独立 `createRdbStore` 函数 |

## 模块说明

- **导入路径**：`import { relationalStore } from '@kit.ArkData'`
- **ValuesBucket 也可独立导入**：`import { ValueType, ValuesBucket } from '@kit.ArkData'`
- **API version**：首批接口从 API 9 开始支持，后续新增用上标标记（如 `10+`、`12+`、`24+`）
- **安全等级**：`StoreConfig` 必须指定 `securityLevel`（S1/S2/S3/S4），取值范围 `relationalStore.SecurityLevel`
- **数据限制**：单条数据不超过 2MB；单条字符串字段最大 8MB（超出截断）；大数据量建议不超过 5000 条查询结果
- **事务**：通过 `beginTransaction()` / `commit()` / `rollBack()` 管理
- **同步版**：API 12+ 提供 `insertSync`/`updateSync`/`deleteSync`/`querySync`/`querySqlSync`；API 24+ 提供 `getRdbStoreSync`
- **execute vs executeSql**：`execute` (API 12+) 返回 `Promise<ValueType>`，`executeSql` 返回 `Promise<void>`，两者均不支持查询/事务/ATTACH
