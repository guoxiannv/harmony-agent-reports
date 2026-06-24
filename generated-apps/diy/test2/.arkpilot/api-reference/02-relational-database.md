# 02 — Relational Database (RDB)

## relationalStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开关系型数据库（Promise） | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `relationalStore.getRdbStore(this.context, STORE_CONFIG).then((rdbStore) => { store = rdbStore; })` | `02_Functions.md` |
| 创建或打开关系型数据库（Callback） | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig, callback: AsyncCallback<RdbStore>): void` | `relationalStore.getRdbStore(context, STORE_CONFIG, (err, rdbStore) => { })` | `02_Functions.md` |
| 同步创建或打开关系型数据库（24+） | relationalStore.getRdbStoreSync | `import { relationalStore } from '@kit.ArkData'` | `getRdbStoreSync(context: Context, config: StoreConfig): RdbStore` | `store = relationalStore.getRdbStoreSync(this.context, STORE_CONFIG)` | `02_Functions.md` |
| 删除数据库文件（Promise） | relationalStore.deleteRdbStore | `import { relationalStore } from '@kit.ArkData'` | `deleteRdbStore(context: Context, name: string): Promise<void>` | `relationalStore.deleteRdbStore(this.context, "RdbTest.db").then(() => {})` | `02_Functions.md` |
| 按配置删除数据库（10+） | relationalStore.deleteRdbStore | `import { relationalStore } from '@kit.ArkData'` | `deleteRdbStore(context: Context, config: StoreConfig): Promise<void>` | `relationalStore.deleteRdbStore(context, STORE_CONFIG).then(() => {})` | `02_Functions.md` |

## RdbStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 插入一行数据（Promise） | rdbStore.insert | `import { relationalStore } from '@kit.ArkData'` | `insert(table: string, values: ValuesBucket): Promise<number>` | `store.insert("EMPLOYEE", valueBucket).then((rowId) => {})` | `03_Interface (RdbStore).md` |
| 批量插入数据 | rdbStore.batchInsert | `import { relationalStore } from '@kit.ArkData'` | `batchInsert(table: string, values: Array<ValuesBucket>, callback: AsyncCallback<number>): void` | `store.batchInsert("EMPLOYEE", valueBuckets, (err, count) => {})` | `03_Interface (RdbStore).md` |
| 更新数据 | rdbStore.update | `import { relationalStore } from '@kit.ArkData'` | `update(values: ValuesBucket, predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.update(valueBucket, predicates, (err, rows) => {})` | `03_Interface (RdbStore).md` |
| 按谓词查询（Promise） | rdbStore.query | `import { relationalStore } from '@kit.ArkData'` | `query(predicates: RdbPredicates): Promise<ResultSet>` | `let resultSet = await store.query(predicates)` | `03_Interface (RdbStore).md` |
| 执行原生SQL查询 | rdbStore.querySql | `import { relationalStore } from '@kit.ArkData'` | `querySql(sql: string, bindArgs?: Array<ValueType>): Promise<ResultSet>` | `let resultSet = await store.querySql("SELECT * FROM EMPLOYEE")` | `03_Interface (RdbStore).md` |
| 执行非查询SQL | rdbStore.executeSql | `import { relationalStore } from '@kit.ArkData'` | `executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>` | `await store.executeSql("CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL)")` | `03_Interface (RdbStore).md` |
| 执行通用SQL（12+, 推荐） | rdbStore.execute | `import { relationalStore } from '@kit.ArkData'` | `execute(sql: string, bindArgs?: Array<ValueType>): Promise<Array<ResultSet>>` | `let resultSets = await store.execute("SELECT * FROM EMPLOYEE WHERE AGE > ?", [18])` | `03_Interface (RdbStore).md` |
| 删除数据 | rdbStore.delete | `import { relationalStore } from '@kit.ArkData'` | `delete(predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.delete(predicates, (err, rows) => {})` | `03_Interface (RdbStore).md` |
| 获取/设置数据库版本 | rdbStore.version | `import { relationalStore } from '@kit.ArkData'` | `version: number` | `store.version = 3; let v = store.version` | `03_Interface (RdbStore).md` |

## ResultSet

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 移动到第一行 | resultSet.goToFirstRow | `import { relationalStore } from '@kit.ArkData'` | `goToFirstRow(): boolean` | `resultSet.goToFirstRow()` | `04_Interface (ResultSet).md` |
| 移动到下一行 | resultSet.goToNextRow | `import { relationalStore } from '@kit.ArkData'` | `goToNextRow(): boolean` | `while (resultSet.goToNextRow()) { … }` | `04_Interface (ResultSet).md` |
| 获取字符串字段值 | resultSet.getString | `import { relationalStore } from '@kit.ArkData'` | `getString(columnIndex: number): string` | `let name = resultSet.getString(resultSet.getColumnIndex("NAME"))` | `04_Interface (ResultSet).md` |
| 获取长整型字段值 | resultSet.getLong | `import { relationalStore } from '@kit.ArkData'` | `getLong(columnIndex: number): number` | `let age = resultSet.getLong(resultSet.getColumnIndex("AGE"))` | `04_Interface (ResultSet).md` |
| 获取浮点型字段值 | resultSet.getDouble | `import { relationalStore } from '@kit.ArkData'` | `getDouble(columnIndex: number): number` | `let salary = resultSet.getDouble(resultSet.getColumnIndex("SALARY"))` | `04_Interface (ResultSet).md` |
| 获取BLOB字段值 | resultSet.getBlob | `import { relationalStore } from '@kit.ArkData'` | `getBlob(columnIndex: number): Uint8Array` | `let codes = resultSet.getBlob(resultSet.getColumnIndex("CODES"))` | `04_Interface (ResultSet).md` |
| 获取通用字段值（12+） | resultSet.getValue | `import { relationalStore } from '@kit.ArkData'` | `getValue(columnIndex: number): ValueType \| Uint8Array \| Asset \| Assets` | `let val = resultSet.getValue(0)` | `04_Interface (ResultSet).md` |
| 关闭结果集 | resultSet.close | `import { relationalStore } from '@kit.ArkData'` | `close(): void` | `resultSet.close()` | `04_Interface (ResultSet).md` |
| 属性：列总数 | resultSet.columnCount | `import { relationalStore } from '@kit.ArkData'` | `columnCount: number` | `let count = resultSet.columnCount` | `04_Interface (ResultSet).md` |
| 属性：行总数 | resultSet.rowCount | `import { relationalStore } from '@kit.ArkData'` | `rowCount: number` | `let rows = resultSet.rowCount` | `04_Interface (ResultSet).md` |
| 属性：是否已关闭 | resultSet.isClosed | `import { relationalStore } from '@kit.ArkData'` | `isClosed: boolean` | `if (!resultSet.isClosed) { resultSet.close() }` | `04_Interface (ResultSet).md` |

## ValuesBucket

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数据库值类型 | ValueType | `import { ValueType, ValuesBucket } from '@kit.ArkData'` | `type ValueType = number \| string \| boolean` | `let v: ValueType = "hello"` | `14_ohos.data.ValuesBucket (数据集).md` |
| 数据集键值对类型 | ValuesBucket | `import { ValueType, ValuesBucket } from '@kit.ArkData'` | `type ValuesBucket = Record<string, ValueType \| Uint8Array \| null>` | `const bucket: ValuesBucket = { NAME: "Lisa", AGE: 18 }` | `14_ohos.data.ValuesBucket (数据集).md` |

## 模块说明

- 本模块首批接口从 API version 9 开始支持，导入方式为 `import { relationalStore } from '@kit.ArkData'`。
- 支持 `StoreConfig` 配置数据库名称、安全等级（`SecurityLevel` S1-S3）、加密（`encrypt`）、向量数据库（`vector`）。
- 建议单条数据不超过 2MB，单次查询不超过 5000 条，大查询放在 TaskPool 中执行。
- `ResultSet` 实例不会实时刷新，数据库数据变化后需重新查询获取最新数据。
- `ValuesBucket` 本身不是多线程安全的，多线程操作需加锁保护。
- 从 API 12 起推荐使用 `execute()` 替代 `executeSql()`，`query()` 替代 `querySql()`。
