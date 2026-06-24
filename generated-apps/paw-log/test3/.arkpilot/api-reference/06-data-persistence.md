# 06 -- 数据持久化 (Data Persistence)

## @ohos.data.relationalStore
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开关系型数据库（Promise） | relationalStore.getRdbStore | import { relationalStore } from '@kit.ArkData' | getRdbStore(context: Context, config: StoreConfig): Promise\<RdbStore\> | const store = await relationalStore.getRdbStore(context, { name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 }); | 02_Functions.md |
| 插入一行数据 | relationalStore.RdbStore.insert | import { relationalStore } from '@kit.ArkData' | insert(table: string, values: ValuesBucket, callback: AsyncCallback\<number\>): void | store.insert("EMPLOYEE", { NAME: "Lisa", AGE: 18 }, (err, rowId) => {}); | 03_Interface (RdbStore).md |
| 根据谓词查询（Promise） | relationalStore.RdbStore.query | import { relationalStore } from '@kit.ArkData' | query(predicates: RdbPredicates, columns?: Array\<string\>): Promise\<ResultSet\> | const resultSet = await store.query(predicates, ["ID", "NAME"]); | 03_Interface (RdbStore).md |
| 根据谓词更新数据（callback） | relationalStore.RdbStore.update | import { relationalStore } from '@kit.ArkData' | update(values: ValuesBucket, predicates: RdbPredicates, callback: AsyncCallback\<number\>): void | store.update({ NAME: "Rose" }, predicates, (err, rows) => {}); | 03_Interface (RdbStore).md |
| 根据谓词删除数据（callback） | relationalStore.RdbStore.delete | import { relationalStore } from '@kit.ArkData' | delete(predicates: RdbPredicates, callback: AsyncCallback\<number\>): void | store.delete(predicates, (err, rows) => {}); | 03_Interface (RdbStore).md |
| 执行SQL语句（Promise） | relationalStore.RdbStore.executeSql | import { relationalStore } from '@kit.ArkData' | executeSql(sql: string, bindArgs?: Array\<ValueType\>): Promise\<void\> | await store.executeSql("DELETE FROM test WHERE name = ?", ["zhangsan"]); | 03_Interface (RdbStore).md |
| 关系数据库配置接口 | StoreConfig | import { relationalStore } from '@kit.ArkData' | { name: string, securityLevel: SecurityLevel, encrypt?: boolean, dataGroupId?: string, customDir?: string, rootDir?: string, autoCleanDirtyData?: boolean } | const config: relationalStore.StoreConfig = { name: "test.db", securityLevel: relationalStore.SecurityLevel.S3 }; | 07_Interfaces (其他).md |
| 查询结果集接口 | ResultSet | import { relationalStore } from '@kit.ArkData' | 属性：columnNames, columnCount, rowCount, rowIndex, isAtFirstRow, isAtLastRow, isEnded, isStarted, isClosed | resultSet.goToNextRow(); const name = resultSet.getString(resultSet.getColumnIndex("NAME")); | 04_Interface (ResultSet).md |
| 删除数据库文件（Promise） | relationalStore.deleteRdbStore | import { relationalStore } from '@kit.ArkData' | deleteRdbStore(context: Context, name: string): Promise\<void\> | await relationalStore.deleteRdbStore(context, "RdbTest.db"); | 02_Functions.md |

## @ohos.data.preferences
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取Preferences实例（Promise） | preferences.getPreferences | import { preferences } from '@kit.ArkData' | getPreferences(context: Context, name: string): Promise\<Preferences\> | const prefs = await preferences.getPreferences(context, 'myStore'); | 07_ohos.data.preferences (用户首选项).md |
| 写入键值对 | preferences.Preferences.put | import { preferences } from '@kit.ArkData' | put(key: string, value: ValueType): Promise\<void\> | await dataPreferences.put('startup', 'auto'); | 07_ohos.data.preferences (用户首选项).md |
| 读取键对应的值 | preferences.Preferences.get | import { preferences } from '@kit.ArkData' | get(key: string, defValue: ValueType): Promise\<ValueType\> | const val = await dataPreferences.get('startup', 'default'); | 07_ohos.data.preferences (用户首选项).md |
| 删除指定键值对 | preferences.Preferences.delete | import { preferences } from '@kit.ArkData' | delete(key: string): Promise\<void\> | await dataPreferences.delete('startup'); | 07_ohos.data.preferences (用户首选项).md |
| 从缓存和磁盘删除Preferences实例（Promise） | preferences.deletePreferences | import { preferences } from '@kit.ArkData' | deletePreferences(context: Context, name: string): Promise\<void\> | await preferences.deletePreferences(context, 'myStore'); | 07_ohos.data.preferences (用户首选项).md |

## dataSharePredicates
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建数据共享谓词，用于查询/更新/删除筛选条件 | dataSharePredicates.DataSharePredicates | import { dataSharePredicates } from '@kit.ArkData' | 类，提供 equalTo(field, value): DataSharePredicates, and(), or(), greaterThan(), lessThan() 等方法 | let predicates = new dataSharePredicates.DataSharePredicates(); predicates.equalTo("NAME", "Rose"); | 04_ohos.data.dataSharePredicates (数据共享谓词).md |

## ValuesBucket
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 键值对数据集，用于数据库插入/更新操作 | ValuesBucket | import { ValuesBucket } from '@kit.ArkData' | type ValuesBucket = Record\<string, ValueType \| Uint8Array \| null\> | const bucket: ValuesBucket = { 'NAME': 'Lisa', 'AGE': 18 }; | 14_ohos.data.ValuesBucket (数据集).md |

## 模块备注

- 关系型数据库（relationalStore）基于 SQLite，API version 9 起支持，推荐使用 Stage 模型。导入统一使用 `import { relationalStore } from '@kit.ArkData'`。
- 单条数据建议不超过 2MB（共享内存限制），字符串字段最大 8MB，超出截断。批量查询建议不超过 5000 条，耗时操作建议在 TaskPool 中执行。
- 用户首选项（preferences）是轻量级 KV 存储，API version 9 起支持。Value 最大 16MB，Key 最大 1024 字节。不保证进程并发安全，不可在多进程场景下使用。导入统一使用 `import { preferences } from '@kit.ArkData'`。
- dataSharePredicates 用于 DataShare 查询筛选条件，API version 10 起支持。
- ValuesBucket 是 Record<string, ValueType | Uint8Array | null> 类型，用于关系型数据库的插入和更新操作。注意在 RdbStore 上下文中 ValuesBucket 的定义还包括 Asset/Assets/Float32Array/bigint 等扩展类型。
- 以下API已在api_list中列出但内容合并到上述条目中：`relationalStore.RdbStore` 为实例接口容器（包含 insert/query/update/delete/executeSql），`@ohos.data.relationalStore` 和 `@ohos.data.preferences` 为模块导入路径。
