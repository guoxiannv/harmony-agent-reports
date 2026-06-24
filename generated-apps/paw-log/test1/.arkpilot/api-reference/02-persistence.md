# 02 -- Data Persistence (数据持久化)

## @ohos.data.preferences (用户首选项/Preferences)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 轻量级键值对持久化（KV存储，value可为数字/字符串/布尔等） | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string): Promise\<Preferences\>` | `let sp = preferences.getPreferences(this.context, 'myStore'); sp.then((obj) => { ... })` | `07_ohos.data.preferences (用户首选项).md` |
| 获取/设置键对应的值 | Preferences.get | `preferences` 实例方法 | `get(key: string, defValue: ValueType): Promise\<ValueType\>` | `dataPreferences.get('startup', 'default').then(...)` | 同上 |
| 写入键值对 | Preferences.put | `preferences` 实例方法 | `put(key: string, value: ValueType): Promise\<void\>` | `dataPreferences.put('startup', 'auto').then(...)` | 同上 |
| 持久化写入到文件（XML模式必调） | Preferences.flush | `preferences` 实例方法 | `flush(): Promise\<void\>` | `dataPreferences.flush().then(...)` | 同上 |
| 判断键是否存在 | Preferences.has | `preferences` 实例方法 | `has(key: string): Promise\<boolean\>` | `dataPreferences.has('startup').then(...)` | 同上 |
| 删除指定键值对 | Preferences.delete | `preferences` 实例方法 | `delete(key: string): Promise\<void\>` | `dataPreferences.delete('startup').then(...)` | 同上 |
| 删除整个Preferences实例及其持久化文件 | preferences.deletePreferences | `import { preferences } from '@kit.ArkData'` | `deletePreferences(context: Context, name: string): Promise\<void\>` | `preferences.deletePreferences(context, 'myStore').then(...)` | 同上 |
| 订阅数据变更（flush后触发） | Preferences.on('change') | `preferences` 实例方法 | `on(type: 'change', callback: Callback\<string\>): void` | `dataPreferences.on('change', (key) => { ... })` | 同上 |

## @ohos.data.relationalStore (关系型数据库/RDB)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 关系型数据库（基于SQLite），提供完整CRUD及SQL执行能力 | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig): Promise\<RdbStore\>` | `relationalStore.getRdbStore(this.context, {name:"RdbTest.db", securityLevel:S3}).then(...)` | `02_Functions.md` |
| 插入一行数据 | RdbStore.insert | `relationalStore` 实例方法 | `insert(table: string, values: ValuesBucket): Promise\<number\>` | `store.insert("EMPLOYEE", valueBucket).then((rowId) => {...})` | `03_Interface (RdbStore).md` |
| 更新数据 | RdbStore.update | `relationalStore` 实例方法 | `update(values: ValuesBucket, predicates: RdbPredicates): Promise\<number\>` | `store.update(valueBucket, predicates).then(...)` | 同上 |
| 删除数据 | RdbStore.delete | `relationalStore` 实例方法 | `delete(predicates: RdbPredicates): Promise\<number\>` | `store.delete(predicates).then(...)` | 同上 |
| 按谓词查询 | RdbStore.query | `relationalStore` 实例方法 | `query(predicates: RdbPredicates, columns?: Array\<string\>): Promise\<ResultSet\>` | `store.query(predicates).then((rs) => {...})` | 同上 |
| 执行原始SQL查询 | RdbStore.querySql | `relationalStore` 实例方法 | `querySql(sql: string, bindArgs?: Array\<ValueType\>): Promise\<ResultSet\>` | `store.querySql("SELECT * FROM EMPLOYEE").then(...)` | 同上 |
| 执行SQL（建表/DDL） | RdbStore.executeSql | `relationalStore` 实例方法 | `executeSql(sql: string, bindArgs?: Array\<ValueType\>): Promise\<void\>` | `store.executeSql("CREATE TABLE IF NOT EXISTS EMPLOYEE (...)").then(...)` | 同上 |

## RdbStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| RDB数据库管理接口（CRUD + SQL + 事务） | RdbStore interface | `relationalStore.RdbStore` | `interface RdbStore { insert, update, delete, query, querySql, executeSql, ... }` | 见上方各方法示例 | `03_Interface (RdbStore).md` |
| 数据库版本 | RdbStore.version | 实例属性 | `version: number` | `store.version = 3; console.info(store.version)` | 同上 |
| 事务：begin/commit/rollback | RdbStore事务方法 | 实例方法 | `beginTransaction(): void` / `commit(): void` / `rollBack(): void` | `store.beginTransaction(); store.commit();` | 同上 |

## ValueType

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Preferences数据字段允许类型 | ValueType | `import { preferences } from '@kit.ArkData'`（模块内类型） | `type ValueType = number \| string \| boolean \| Array\<number\> \| Array\<string\> \| Array\<boolean\> \| Uint8Array \| object \| bigint` | `let val: preferences.ValueType = 'hello'` | `07_ohos.data.preferences (用户首选项).md` |
| RDB数据字段允许类型（含Asset支持） | ValueType | `import { relationalStore } from '@kit.ArkData'`（模块内类型） | `type ValueType = null \| number \| string \| boolean \| Uint8Array \| Asset \| Assets \| Float32Array \| bigint` | `let val: relationalStore.ValueType = 'hello'` | `09_ohos.data.relationalStore/10_Types.md` |

## ValuesBucket

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| RDB插入数据用的键值对集合 | ValuesBucket | `relationalStore.ValuesBucket` | `type ValuesBucket = Record\<string, ValueType\>` （ValueType为RDB版本） | `const vb: relationalStore.ValuesBucket = { NAME: 'Lisa', AGE: 18 }` | `09_ohos.data.relationalStore/10_Types.md` |
| DataShare/通用数据集合（API10+） | ValuesBucket | `import { ValuesBucket } from '@kit.ArkData'` | `type ValuesBucket = Record\<string, ValueType \| Uint8Array \| null\>` （ValueType为number\|string\|boolean） | `import { ValuesBucket } from '@kit.ArkData'` | `14_ohos.data.ValuesBucket (数据集).md` |

## ResultSet

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 查询返回的结果集接口 | ResultSet interface | `relationalStore.ResultSet` | `interface ResultSet { columnNames, columnCount, rowCount, rowIndex, goTo, goToRow, goToNextRow, getString, getLong, getDouble, getBlob, close, ... }` | `let rs = await store.querySql("SELECT * FROM T"); rs.goToFirstRow(); let name = rs.getString(1);` | `04_Interface (ResultSet).md` |
| 结果集导航至首行 | ResultSet.goToFirstRow | 实例方法 | `goToFirstRow(): boolean` | `if (rs.goToFirstRow()) { ... }` | 同上 |
| 结果集导航至下一行 | ResultSet.goToNextRow | 实例方法 | `goToNextRow(): boolean` | `while (rs.goToNextRow()) { ... }` | 同上 |
| 获取列数据（通用） | ResultSet.getValue | 实例方法 | `getValue(columnIndex: number): ValueType` | `let v = rs.getValue(0)` | 同上 |
| 获取字符串列数据 | ResultSet.getString | 实例方法 | `getString(columnIndex: number): string` | `let name = rs.getString(colIndex)` | 同上 |
| 关闭结果集 | ResultSet.close | 实例方法 | `close(): void` | `rs.close()` | 同上 |

## 模块要点

- **Preferences** 不支持进程并发安全，有文件损坏和数据丢失风险，不适合多进程场景。Key最大1024字节，Value最大16MB。API version 9起支持。
- **RDB** 基于SQLite，单条数据建议不超过2MB。大数据量查询建议控制在5000条以内或在TaskPool中执行。API version 9起支持。
- **ValueType** 在不同模块下的定义范围不同：preferences模块不含`null`但含`object|bigint`；relationalStore模块含`null|Asset|Assets|Float32Array|bigint`。使用时需注意上下文类型归属。
- **ValuesBucket** 有多个重叠定义（relationalStore.Types / @ohos.data.ValuesBucket / commonType），以relationalStore命名空间下的为准。
- **导入路径统一**使用`@kit.ArkData` Kit化导入，如`import { preferences, relationalStore, ValuesBucket } from '@kit.ArkData'`。
