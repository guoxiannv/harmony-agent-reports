# 01 — Data Persistence (数据持久化)

## @ohos.data.preferences (用户首选项)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开/创建 Preferences 实例(callback) | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void` | `preferences.getPreferences(this.context, 'myStore', (err, val) => { ... })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| 打开/创建 Preferences 实例(Promise) | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let sp = preferences.getPreferences(this.context, 'myStore');` | 同上 |
| 打开/创建 Preferences 实例(Options, callback) | preferences.getPreferences10+ | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, options: Options, callback: AsyncCallback<Preferences>): void` | `let options: preferences.Options = { name: 'myStore' }; preferences.getPreferences(context, options, cb)` | 同上 |
| 打开/创建 Preferences 实例(Options, Promise) | preferences.getPreferences10+ | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, options: Options): Promise<Preferences>` | `preferences.getPreferences(this.context, { name: 'myStore' })` | 同上 |
| 同步获取 Preferences 实例 | preferences.getPreferencesSync10+ | `import { preferences } from '@kit.ArkData'` | `getPreferencesSync(context: Context, options: Options): Preferences` | `dataPreferences = preferences.getPreferencesSync(this.context, { name: 'myStore' })` | 同上 |
| 删除 Preferences 实例及文件(callback) | preferences.deletePreferences | `import { preferences } from '@kit.ArkData'` | `deletePreferences(context: Context, name: string, callback: AsyncCallback<void>): void` | `preferences.deletePreferences(this.context, 'myStore', (err) => { ... })` | 同上 |
| 删除 Preferences 实例及文件(Promise) | preferences.deletePreferences | `import { preferences } from '@kit.ArkData'` | `deletePreferences(context: Context, name: string): Promise<void>` | `preferences.deletePreferences(this.context, 'myStore')` | 同上 |
| 从缓存移除 Preferences 实例(callback) | preferences.removePreferencesFromCache | `import { preferences } from '@kit.ArkData'` | `removePreferencesFromCache(context: Context, name: string, callback: AsyncCallback<void>): void` | `preferences.removePreferencesFromCache(context, 'myStore', cb)` | 同上 |
| 写数据(缓存) | Preferences.put | 通过实例调用 | `put(key: string, value: ValueType, callback: AsyncCallback<void>): void` | `dataPreferences.put('startup', 'auto', (err) => { ... })` | 同上 |
| 写数据(缓存, Promise) | Preferences.put | 通过实例调用 | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto')` | 同上 |
| 同步写数据 | Preferences.putSync10+ | 通过实例调用 | `putSync(key: string, value: ValueType): void` | `dataPreferences.putSync('startup', 'auto')` | 同上 |
| 读数据(callback) | Preferences.get | 通过实例调用 | `get(key: string, defValue: ValueType, callback: AsyncCallback<ValueType>): void` | `dataPreferences.get('startup', 'default', cb)` | 同上 |
| 读数据(Promise) | Preferences.get | 通过实例调用 | `get(key: string, defValue: ValueType): Promise<ValueType>` | `dataPreferences.get('startup', 'default')` | 同上 |
| 同步读数据 | Preferences.getSync10+ | 通过实例调用 | `getSync(key: string, defValue: ValueType): ValueType` | `dataPreferences.getSync('startup', 'default')` | 同上 |
| 检查 Key 是否存在 | Preferences.has/hasSync | 通过实例调用 | `has(key: string): Promise<boolean>` / `hasSync(key: string): boolean` | `dataPreferences.has('startup')` / `dataPreferences.hasSync('startup')` | 同上 |
| 删除 Key | Preferences.delete/deleteSync | 通过实例调用 | `delete(key: string): Promise<void>` / `deleteSync(key: string): void` | `dataPreferences.delete('startup')` / `dataPreferences.deleteSync('startup')` | 同上 |
| 落盘持久化(仅XML模式需调用) | Preferences.flush/flushSync | 通过实例调用 | `flush(): Promise<void>` / `flushSync(): void` | `dataPreferences.flush()` / `dataPreferences.flushSync()` | 同上 |
| 清除所有数据 | Preferences.clear/clearSync | 通过实例调用 | `clear(): Promise<void>` / `clearSync(): void` | `dataPreferences.clear()` / `dataPreferences.clearSync()` | 同上 |
| 订阅数据变更 | Preferences.on('change') | 通过实例调用 | `on(type: 'change', callback: Callback<string>): void` | `dataPreferences.on('change', (key) => { ... })` | 同上 |
| 取消订阅数据变更 | Preferences.off('change') | 通过实例调用 | `off(type: 'change', callback?: Callback<string>): void` | `dataPreferences.off('change', observer)` | 同上 |

## @ohos.data.relationalStore (关系型数据库)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建/打开关系型数据库(callback) | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig, callback: AsyncCallback<RdbStore>): void` | `relationalStore.getRdbStore(this.context, { name: "RdbTest.db", securityLevel: SecurityLevel.S3 }, (err, rdbStore) => { ... })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md` |
| 创建/打开关系型数据库(Promise) | relationalStore.getRdbStore | 同上 | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `relationalStore.getRdbStore(this.context, STORE_CONFIG).then(rdbStore => { ... })` | 同上 |
| 同步创建/打开关系型数据库 | relationalStore.getRdbStoreSync24+ | 同上 | `getRdbStoreSync(context: Context, config: StoreConfig): RdbStore` | `store = relationalStore.getRdbStoreSync(this.context, STORE_CONFIG)` | 同上 |
| 删除数据库(callback) | relationalStore.deleteRdbStore | 同上 | `deleteRdbStore(context: Context, name: string, callback: AsyncCallback<void>): void` | `relationalStore.deleteRdbStore(this.context, "RdbTest.db", (err) => { ... })` | 同上 |
| 删除数据库(Promise) | relationalStore.deleteRdbStore | 同上 | `deleteRdbStore(context: Context, name: string): Promise<void>` | `relationalStore.deleteRdbStore(this.context, "RdbTest.db")` | 同上 |
| 插入数据(callback) | RdbStore.insert | 获取RdbStore实例后调用 | `insert(table: string, values: ValuesBucket, callback: AsyncCallback<number>): void` | `store.insert("EMPLOYEE", { NAME: 'Lisa', AGE: 18 }, (err, rowId) => { ... })` | `03_Interface (RdbStore).md` |
| 插入数据(Promise) | RdbStore.insert | 同上 | `insert(table: string, values: ValuesBucket): Promise<number>` | `store.insert("EMPLOYEE", valueBucket).then(rowId => { ... })` | 同上 |
| 插入数据(冲突解决) | RdbStore.insert10+ | 同上 | `insert(table: string, values: ValuesBucket, conflict: ConflictResolution): Promise<number>` | `store.insert("EMPLOYEE", bucket, ConflictResolution.ON_CONFLICT_REPLACE)` | 同上 |
| 批量插入 | RdbStore.batchInsert | 同上 | `batchInsert(table: string, values: Array<ValuesBucket>): Promise<number>` | `store.batchInsert("EMPLOYEE", valueBuckets)` | 同上 |
| 更新数据 | RdbStore.update | 同上 | `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>` | `store.update(valueBucket, predicates)` | 同上 |
| 删除数据 | RdbStore.delete | 同上 | `delete(predicates: RdbPredicates): Promise<number>` | `store.delete(predicates)` | 同上 |
| 查询数据 | RdbStore.query | 同上 | `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>` | `store.query(predicates, ["NAME", "AGE"])` | 同上 |
| 执行 SQL 语句(含参数) | RdbStore.executeSql/execute | 同上 | `executeSql(sql: string): Promise<void>` / `execute(sql: string, bindArgs: Array<ValueType>): Promise<number>` | `store.executeSql(SQL_CREATE_TABLE)` / `store.execute(SQL, bindArgs)` | 同上 |
| 执行原生 SQL 查询 | RdbStore.querySql | 同上 | `querySql(sql: string, bindArgs?: Array<ValueType>): Promise<ResultSet>` | `store.querySql("SELECT * FROM EMPLOYEE WHERE AGE > ?", [20])` | 同上 |
| 获取数据库版本 | RdbStore.version | 属性 | `version: number` (读写) | `store.version = 3` / `console.info(store.version)` | 同上 |
| 判断平台是否支持向量数据库 | relationalStore.isVectorSupported18+ | `import { relationalStore } from '@kit.ArkData'` | `isVectorSupported(): boolean` | `let supported = relationalStore.isVectorSupported()` | `02_Functions.md` |

## 模块说明

- Preferences 基于 Key-Value 模型，适合轻量级配置存储。值类型为 `ValueType = number | string | boolean | Array<number> | Array<string> | Array<boolean> | Uint8Array | object | bigint`。从 API 18 起支持 XML（默认，需调 flush 落盘）和 GSKV（实时落盘）两种存储模式。
- relationalStore 基于 SQLite，提供完整的关系型数据库能力。单条数据建议不超过 2MB，单次查询不超过 5000 条。StoreConfig 必须指定 `name` 和 `securityLevel`（S1/S2/S3/S4）。`executeSql` 仅支持 DDL/DML（不支持查询、附加数据库和事务），查询应使用 `query`/`querySql`。
- Preferences **不支持多进程并发安全**。在多进程共享场景下，应使用 DataShare 或 RDB。
