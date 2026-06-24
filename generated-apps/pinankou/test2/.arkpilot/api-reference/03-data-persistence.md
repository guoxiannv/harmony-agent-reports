# 03 — 数据持久化 Data Persistence

## @ohos.data.preferences (用户首选项)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 轻量级 Key-Value 持久化存储（数字、字符串、布尔及其数组） | `preferences.getPreferences` | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `preferences.getPreferences(this.context, 'myStore').then(val => dataPreferences = val)` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| 读键值（同步） | `Preferences.getSync` | 同上（Preferences 实例方法） | `getSync(key: string, defValue: ValueType): ValueType` | `dataPreferences.getSync('startup', 'default')` | 同上 |
| 写键值 | `Preferences.put` | 同上 | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto')` | 同上 |
| 持久化落盘（XML 模式必需） | `Preferences.flush` | 同上 | `flush(): Promise<void>` | `dataPreferences.flush()` | 同上 |

## @ohos.data.relationalStore (关系型数据库)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建/打开关系型数据库（SQLite） | `relationalStore.getRdbStore` | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig, callback: AsyncCallback<RdbStore>): void` | `relationalStore.getRdbStore(this.context, { name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 }, callback)` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md` |
| 执行 SQL 语句（增删改表等） | `RdbStore.executeSql` | 同上（RdbStore 实例方法） | `executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>` | `store.executeSql("CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER)")` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/03_Interface (RdbStore).md` |
| 插入数据 | `RdbStore.insert` | 同上 | `insert(table: string, values: ValuesBucket): Promise<number>` | `store.insert("EMPLOYEE", { "NAME": "John", "AGE": 30 })` | 同上 |
| 查询数据 | `RdbStore.query` | 同上 | `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>` | `let predicates = new relationalStore.RdbPredicates("EMPLOYEE"); predicates.equalTo("NAME", "John"); store.query(predicates)` | 同上 |

## @ohos.data.distributedKVStore (分布式键值数据库)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 KV 管理器 | `distributedKVStore.createKVManager` | `import { distributedKVStore } from '@kit.ArkData'` | `createKVManager(config: KVManagerConfig): KVManager` | `kvManager = distributedKVStore.createKVManager({ context, bundleName: 'com.example.test' })` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/06_ohos.data.distributedKVStore (分布式键值数据库).md` |
| 创建/获取分布式 KV 数据库 | `KVManager.getKVStore` | 同上（KVManager 实例方法） | `getKVStore<T>(storeId: string, options: Options, callback: AsyncCallback<T>): void` | `kvManager.getKVStore('storeId', { kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION, securityLevel: distributedKVStore.SecurityLevel.S2 }, callback)` | 同上 |
| 写入键值 | `SingleKVStore.put` | 同上 | `put(key: string, value: ValueType, callback: AsyncCallback<void>): void` | `kvStore.put('key', 'value', callback)` | 同上 |
| 读取键值 | `SingleKVStore.get` | 同上 | `get(key: string, callback: AsyncCallback<ValueType>): void` | `kvStore.get('key', callback)` | 同上 |

## @ohos.data.distributedDataObject (分布式数据对象)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建分布式数据对象（多设备协同） | `distributedDataObject.create` | `import { distributedDataObject } from '@kit.ArkData'` | `create(context: Context, source: object): DataObject` | `let g_object = distributedDataObject.create(this.context, new SourceObject("jack", 18, false))` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/05_ohos.data.distributedDataObject (分布式数据对象).md` |
| 加入/退出分布式组网 | `DataObject.setSessionId` | 同上（DataObject 实例方法） | `setSessionId(sessionId: string): Promise<void>` | `g_object.setSessionId(distributedDataObject.genSessionId())` | 同上 |
| 监听数据变更 | `DataObject.on('change')` | 同上 | `on(type: 'change', callback: (sessionId: string, fields: Array<string>) => void): void` | `g_object.on('change', (sessionId, fields) => { console.info('changed', sessionId) })` | 同上 |
| 保存数据对象（持久化 24h） | `DataObject.save` | 同上 | `save(deviceId: string): Promise<SaveSuccessResponse>` | `g_object.save('local').then(res => { console.info('saved version: ' + res.version) })` | 同上 |

## Module Notes

- `@ohos.data.preferences` 不支持多进程并发安全，有文件损坏和数据丢失的风险。
- `@ohos.data.distributedDataObject.createDistributedObject`（API 8）已废弃，请使用 `create`（API 9+）。
- `@ohos.data.distributedKVStore` 的设备协同场景需要 `ohos.permission.DISTRIBUTED_DATASYNC` 权限。
- `@ohos.data.relationalStore` 单条数据建议不超过 2MB，单次查询不超过 5000 条。
