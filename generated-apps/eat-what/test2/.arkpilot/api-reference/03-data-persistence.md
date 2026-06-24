# 03 -- Data Persistence

## @ohos.data.preferences

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 Preferences 实例（Promise） | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let sp = preferences.getPreferences(context, 'myStore');` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| 获取 Preferences 实例（同步） | preferences.getPreferencesSync | `import { preferences } from '@kit.ArkData'` | `getPreferencesSync(context: Context, options: Options): Preferences` | `dataPreferences = preferences.getPreferencesSync(context, options);` | 同上 |
| 删除 Preferences 实例及文件（Promise） | preferences.deletePreferences | `import { preferences } from '@kit.ArkData'` | `deletePreferences(context: Context, name: string): Promise<void>` | `let sp = preferences.deletePreferences(context, 'myStore');` | 同上 |
| 缓存中移除 Preferences（Promise） | preferences.removePreferencesFromCache | `import { preferences } from '@kit.ArkData'` | `removePreferencesFromCache(context: Context, name: string): Promise<void>` | `let sp = preferences.removePreferencesFromCache(context, 'myStore');` | 同上 |
| 读取键值（Promise） | Preferences.get | `import { preferences } from '@kit.ArkData'` | `get(key: string, defValue: ValueType): Promise<ValueType>` | `let data = dataPreferences.get('startup', 'default');` | 同上 |
| 写入键值（Promise） | Preferences.put | `import { preferences } from '@kit.ArkData'` | `put(key: string, value: ValueType): Promise<void>` | `let p = dataPreferences.put('startup', 'auto');` | 同上 |
| 检查键是否存在（Promise） | Preferences.has | `import { preferences } from '@kit.ArkData'` | `has(key: string): Promise<boolean>` | `let isSet = dataPreferences.has('startup');` | 同上 |
| 删除指定键（Promise） | Preferences.delete | `import { preferences } from '@kit.ArkData'` | `delete(key: string): Promise<void>` | `let p = dataPreferences.delete('startup');` | 同上 |
| 持久化刷入磁盘（Promise） | Preferences.flush | `import { preferences } from '@kit.ArkData'` | `flush(): Promise<void>` | `let result = dataPreferences.flush();` | 同上 |
| 清空所有数据（Promise） | Preferences.clear | `import { preferences } from '@kit.ArkData'` | `clear(): Promise<void>` | `let p = dataPreferences.clear();` | 同上 |
| 获取所有键值（Promise） | Preferences.getAll | `import { preferences } from '@kit.ArkData'` | `getAll(): Promise<Object>` | `let allData = dataPreferences.getAll();` | 同上 |
| 订阅数据变更 | Preferences.on('change') | `import { preferences } from '@kit.ArkData'` | `on(type: 'change', callback: Callback<string>): void` | `dataPreferences.on('change', observer);` | 同上 |
| 取消订阅 | Preferences.off('change') | `import { preferences } from '@kit.ArkData'` | `off(type: 'change', callback?: Callback<string>): void` | `dataPreferences.off('change', observer);` | 同上 |

## @ohos.data.sendablePreferences

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 Sendable Preferences 实例（Promise） | sendablePreferences.getPreferences | `import { sendablePreferences } from '@kit.ArkData'` | `getPreferences(context: Context, options: Options): Promise<Preferences>` | `let promise = sendablePreferences.getPreferences(this.context, options);` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/08_ohos.data.sendablePreferences (共享用户首选项).md` |
| 获取 Sendable Preferences 实例（同步） | sendablePreferences.getPreferencesSync | `import { sendablePreferences } from '@kit.ArkData'` | `getPreferencesSync(context: Context, options: Options): Preferences` | `preferences = sendablePreferences.getPreferencesSync(this.context, options);` | 同上 |
| 删除 Sendable Preferences 实例及文件 | sendablePreferences.deletePreferences | `import { sendablePreferences } from '@kit.ArkData'` | `deletePreferences(context: Context, options: Options): Promise<void>` | `let promise = sendablePreferences.deletePreferences(this.context, options);` | 同上 |
| 读取键值（Promise） | Preferences.get | `import { sendablePreferences } from '@kit.ArkData'` | `get(key: string, defValue: lang.ISendable): Promise<lang.ISendable>` | `let promise = preferences.get('startup', 'default');` | 同上 |
| 写入键值（Promise） | Preferences.put | `import { sendablePreferences } from '@kit.ArkData'` | `put(key: string, value: lang.ISendable): Promise<void>` | `let promise = preferences.put('startup', 'auto');` | 同上 |
| 检查键是否存在（Promise） | Preferences.has | `import { sendablePreferences } from '@kit.ArkData'` | `has(key: string): Promise<boolean>` | `let promise = preferences.has('startup');` | 同上 |
| 删除指定键（Promise） | Preferences.delete | `import { sendablePreferences } from '@kit.ArkData'` | `delete(key: string): Promise<void>` | `let promise = preferences.delete('startup');` | 同上 |
| 持久化刷入磁盘 | Preferences.flush | `import { sendablePreferences } from '@kit.ArkData'` | `flush(): Promise<void>` | `let promise = preferences.flush();` | 同上 |
| 清空所有数据 | Preferences.clear | `import { sendablePreferences } from '@kit.ArkData'` | `clear(): Promise<void>` | `let promise = preferences.clear();` | 同上 |

## @ohos.data.relationalStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建/打开关系型数据库（Promise） | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `let store = await relationalStore.getRdbStore(this.context, STORE_CONFIG);` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md` |
| 创建/打开关系型数据库（同步） | relationalStore.getRdbStoreSync | `import { relationalStore } from '@kit.ArkData'` | `getRdbStoreSync(context: Context, config: StoreConfig): RdbStore` | `store = relationalStore.getRdbStoreSync(this.context, STORE_CONFIG);` | 同上 |
| 删除数据库（Promise） | relationalStore.deleteRdbStore | `import { relationalStore } from '@kit.ArkData'` | `deleteRdbStore(context: Context, name: string): Promise<void>` | `relationalStore.deleteRdbStore(context, "RdbTest.db");` | 同上 |
| 插入数据 | RdbStore.insert | `import { relationalStore } from '@kit.ArkData'` | `insert(table: string, values: ValuesBucket, callback: AsyncCallback<number>): void` | `store.insert("EMPLOYEE", valueBucket1, (err, rowId) => {...});` | `03_Interface (RdbStore).md` |
| 查询数据 | RdbStore.query | `import { relationalStore } from '@kit.ArkData'` | `query(predicates: RdbPredicates, columns: Array<string>, callback: AsyncCallback<ResultSet>): void` | `store.query(predicates, columns, (err, resultSet) => {...});` | `03_Interface (RdbStore).md` |
| 更新数据 | RdbStore.update | `import { relationalStore } from '@kit.ArkData'` | `update(values: ValuesBucket, predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.update(valueBucket, predicates, (err, rows) => {...});` | `03_Interface (RdbStore).md` |
| 删除数据 | RdbStore.delete | `import { relationalStore } from '@kit.ArkData'` | `delete(predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.delete(predicates, (err, rows) => {...});` | `03_Interface (RdbStore).md` |
| 执行 SQL | RdbStore.executeSql | `import { relationalStore } from '@kit.ArkData'` | `executeSql(sql: string, bindArgs?: Array<ValueType>, callback?: AsyncCallback<void>): void` | `store.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (...)', null);` | `03_Interface (RdbStore).md` |
| 执行 SQL（推荐，API 12+） | RdbStore.execute | `import { relationalStore } from '@kit.ArkData'` | `execute(sql: string, bindArgs?: Array<ValueType>, callback?: AsyncCallback<number>): void` | `store.execute(SQL_CREATE_TABLE);` | `03_Interface (RdbStore).md` |
| 创建事务对象 | RdbStore.createTransaction | `import { relationalStore } from '@kit.ArkData'` | `createTransaction(transactionType?: TransactionType): Promise<Transaction>` | `let tx = await store.createTransaction();` | `03_Interface (RdbStore).md`, `06_Interface (Transaction).md` |

## Module Notes

- **@ohos.data.preferences**: API 9+; Key-Value 轻量级持久化；value 支持 number/string/boolean/Array/Uint8Array/object/bigint；Key 最大 1024 字节，Value 最大 16MB；不支持进程并发；`flush()` 只在 XML 存储模式下需要调用（GSKV 模式实时落盘）；从 API 12 起支持 `dataGroupId` 跨进程共享。
- **@ohos.data.sendablePreferences**: API 12+；与 `@ohos.data.preferences` 功能类似，但 Preferences 继承自 `ISendable`，可在 ArkTS 并发实例间（主线程、TaskPool、Worker）以引用传递方式共享；仅支持 Promise 风格和同步风格（无 callback 重载）；Stage 模型专属。
- **@ohos.data.relationalStore**: API 9+；基于 SQLite 的关系型数据库；单条数据建议不超过 2MB；字符串字段最大 8MB；大数据量查询建议使用 TaskPool；支持向量数据库（floatvector）；API 14+ 新增事务对象 `Transaction`；API 10+ 支持冲突解决模式 `ConflictResolution`。
