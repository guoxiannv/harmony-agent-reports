# 05 -- Local Data Persistence

## ohos.data.preferences (PreferencesKit)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供KV键值型轻量级数据持久化能力 | `preferences` | `import { preferences } from '@kit.ArkData'` | `@ohos.data.preferences` 模块 | -- | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md |
| 获取Preferences实例（Promise） | `preferences.getPreferences` | `@kit.ArkData` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let sp = preferences.getPreferences(this.context, 'myStore');` | 如上 |
| 获取Preferences实例（Callback） | `preferences.getPreferences` | `@kit.ArkData` | `getPreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void` | `preferences.getPreferences(this.context, 'myStore', (err, val) => {});` | 如上 |
| 获取Preferences实例（Options, Promise, 10+） | `preferences.getPreferences` | `@kit.ArkData` | `getPreferences(context: Context, options: Options): Promise<Preferences>` | `let sp = preferences.getPreferences(this.context, { name: 'myStore' });` | 如上 |
| Preferences实例接口 | `Preferences` | `@kit.ArkData` | `interface Preferences` 提供 get/put/delete/flush/has/clear/on/off 等方法 | -- | 如上 |
| 写入数据到缓存 | `preferences.put` | 通过 Preferences 实例调用 | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto');` | 如上 |
| 从缓存读取数据 | `preferences.get` | 通过 Preferences 实例调用 | `get(key: string, defValue: ValueType): Promise<ValueType>` | `let data = dataPreferences.get('startup', 'default');` | 如上 |
| 从缓存删除指定Key | `preferences.delete` | 通过 Preferences 实例调用 | `delete(key: string): Promise<void>` | `dataPreferences.delete('startup');` | 如上 |
| 将缓存数据持久化落盘 | `preferences.flush` | 通过 Preferences 实例调用 | `flush(): Promise<void>` | `dataPreferences.flush();` | 如上 |

## relationalStore (RDB)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供关系型数据库（SQLite）能力 | `relationalStore` | `import { relationalStore } from '@kit.ArkData'` | `@ohos.data.relationalStore` 模块 | -- | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库) |
| 创建或打开已有的关系型数据库（Promise） | `relationalStore.getRdbStore` | `@kit.ArkData` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `relationalStore.getRdbStore(this.context, STORE_CONFIG).then(...);` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md |
| 创建或打开已有的关系型数据库（Callback） | `relationalStore.getRdbStore` | `@kit.ArkData` | `getRdbStore(context: Context, config: StoreConfig, callback: AsyncCallback<RdbStore>): void` | `relationalStore.getRdbStore(context, STORE_CONFIG, (err, rdbStore) => {});` | 如上 |
| RDB数据库操作接口 | `relationalStore.RdbStore` | `@kit.ArkData` | `interface RdbStore` 提供 insert/update/delete/query/querySql/executeSql 等方法 | -- | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/03_Interface (RdbStore).md |
| 插入一行数据 | `RdbStore.insert` | `@kit.ArkData` | `insert(table: string, values: ValuesBucket, callback: AsyncCallback<number>): void` | `store.insert("EMPLOYEE", valueBucket1, (err, rowId) => {});` | 如上 |
| 删除数据（通过RdbPredicates） | `RdbStore.delete` | `@kit.ArkData` | `delete(predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.delete(predicates, (err, rows) => {});` | 如上 |
| 更新数据 | `RdbStore.update` | `@kit.ArkData` | `update(values: ValuesBucket, predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.update(valueBucket, predicates, (err, rows) => {});` | 如上 |
| 查询数据 | `RdbStore.query` | `@kit.ArkData` | `query(predicates: RdbPredicates, columns: Array<string>, callback: AsyncCallback<ResultSet>): void` | `store.query(predicates, columns, (err, resultSet) => {});` | 如上 |
| 执行SQL语句 | `RdbStore.executeSql` | `@kit.ArkData` | `executeSql(sql: string): Promise<void>` | `store.executeSql(SQL_CREATE_TABLE);` | 如上 |

## PersistentStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持久化UI状态到文件 | `PersistentStorage` | 全局内置对象（无需导入） | 将AppStorage中指定属性持久化到文件 | `PersistentStorage.persistProp('highScore', '0');` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 持久化单个属性 | `PersistentStorage.persistProp` | 全局内置 | `static persistProp<T>(key: string, defaultValue: T): void` | `PersistentStorage.persistProp('highScore', '0');` | 如上 |
| 从持久化中删除属性 | `PersistentStorage.deleteProp` | 全局内置 | `static deleteProp(key: string): void` | `PersistentStorage.deleteProp('highScore');` | 如上 |
| 批量持久化属性 | `PersistentStorage.persistProps` | 全局内置 | `static persistProps(props: PersistPropsOptions[]): void` | `PersistentStorage.persistProps([{ key: 'highScore', defaultValue: '0' }]);` | 如上 |

## Module Notes

- **Preferences** 使用 XML（默认）或 GSKV 存储模式。XML 模式下修改后需调用 `flush()` 落盘；GSKV 模式下数据实时落盘。
- **RDB** 基于 SQLite，单条数据不超过 2MB，单次查询不超过 5000 条，大查询推荐在 TaskPool 中执行。
- **PersistentStorage** 属于 ArkUI 状态管理，不是 ArkData 模块，无需 import。它通过 AppStorage 桥接持久化。
- 首选项不支持多进程并发安全，会有文件损坏和数据丢失的风险。
- `relationalStore.StoreConfig` 必须配置 `name` 和 `securityLevel`。
