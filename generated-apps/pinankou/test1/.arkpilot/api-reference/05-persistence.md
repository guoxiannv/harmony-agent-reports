# 05 -- Data Persistence

## @ohos.data.preferences

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取Preferences实例（异步回调） | preferences.getPreferences | import { preferences } from '@kit.ArkData' | getPreferences(context: Context, name: string, callback: AsyncCallback\<Preferences\>): void | `preferences.getPreferences(this.context, 'myStore', (err, val) => { ... })` | ArkData/01_ArkTS API/07_ohos.data.preferences (用户首选项).md |
| 获取Preferences实例（Promise） | preferences.getPreferences | import { preferences } from '@kit.ArkData' | getPreferences(context: Context, name: string): Promise\<Preferences\> | `let sp = preferences.getPreferences(this.context, 'myStore')` | 同上 |
| 获取Preferences实例（同步，API 10+） | preferences.getPreferencesSync | import { preferences } from '@kit.ArkData' | getPreferencesSync(context: Context, options: Options): Preferences | `dataPreferences = preferences.getPreferencesSync(this.context, options)` | 同上 |
| 写入键值对（异步回调） | Preferences.put | import { preferences } from '@kit.ArkData' | put(key: string, value: ValueType, callback: AsyncCallback\<void\>): void | `dataPreferences.put('startup', 'auto', (err) => { ... })` | 同上 |
| 写入键值对（Promise） | Preferences.put | import { preferences } from '@kit.ArkData' | put(key: string, value: ValueType): Promise\<void\> | `dataPreferences.put('startup', 'auto')` | 同上 |
| 写入键值对（同步，API 10+） | Preferences.putSync | import { preferences } from '@kit.ArkData' | putSync(key: string, value: ValueType): void | `dataPreferences.putSync('startup', 'auto')` | 同上 |
| 读取键值（异步回调） | Preferences.get | import { preferences } from '@kit.ArkData' | get(key: string, defValue: ValueType, callback: AsyncCallback\<ValueType\>): void | `dataPreferences.get('startup', 'default', (err, val) => { ... })` | 同上 |
| 读取键值（Promise） | Preferences.get | import { preferences } from '@kit.ArkData' | get(key: string, defValue: ValueType): Promise\<ValueType\> | `let data = dataPreferences.get('startup', 'default')` | 同上 |
| 读取键值（同步，API 10+） | Preferences.getSync | import { preferences } from '@kit.ArkData' | getSync(key: string, defValue: ValueType): ValueType | `let value = dataPreferences.getSync('startup', 'default')` | 同上 |
| 删除键值对（Promise） | Preferences.delete | import { preferences } from '@kit.ArkData' | delete(key: string): Promise\<void\> | `dataPreferences.delete('startup')` | 同上 |
| 持久化写入磁盘（Promise） | Preferences.flush | import { preferences } from '@kit.ArkData' | flush(): Promise\<void\> | `dataPreferences.flush()` | 同上 |
| 清除所有数据 | Preferences.clear | import { preferences } from '@kit.ArkData' | clear(): Promise\<void\> | `dataPreferences.clear()` | 同上 |
| 删除Preferences实例及文件 | preferences.deletePreferences | import { preferences } from '@kit.ArkData' | deletePreferences(context: Context, name: string): Promise\<void\> | `preferences.deletePreferences(this.context, 'myStore')` | 同上 |
| 订阅数据变更 | Preferences.on('change') | import { preferences } from '@kit.ArkData' | on(type: 'change', callback: Callback\<string\>): void | `dataPreferences.on('change', (key) => { console.info(key + " changed.") })` | 同上 |
| 取消订阅数据变更 | Preferences.off('change') | import { preferences } from '@kit.ArkData' | off(type: 'change', callback?: Callback\<string\>): void | `dataPreferences.off('change', observer)` | 同上 |

## @ohos.data.relationalStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开关系型数据库（Promise） | relationalStore.getRdbStore | import { relationalStore } from '@kit.ArkData' | getRdbStore(context: Context, config: StoreConfig): Promise\<RdbStore\> | `relationalStore.getRdbStore(this.context, STORE_CONFIG).then(rdbStore => { ... })` | ArkData/01_ArkTS API/09_ohos.data.relationalStore/02_Functions.md |
| 创建或打开关系型数据库（同步，API 24+） | relationalStore.getRdbStoreSync | import { relationalStore } from '@kit.ArkData' | getRdbStoreSync(context: Context, config: StoreConfig): RdbStore | `store = relationalStore.getRdbStoreSync(this.context, STORE_CONFIG)` | 同上 |
| 删除数据库（Promise） | relationalStore.deleteRdbStore | import { relationalStore } from '@kit.ArkData' | deleteRdbStore(context: Context, name: string): Promise\<void\> | `relationalStore.deleteRdbStore(this.context, "RdbTest.db")` | 同上 |
| 插入数据（Promise） | RdbStore.insert | import { relationalStore } from '@kit.ArkData' | insert(table: string, values: ValuesBucket): Promise\<number\> | `store.insert('EMPLOYEE', valueBucket)` | 同上/03_Interface (RdbStore).md |
| 查询数据 | RdbStore.query | import { relationalStore } from '@kit.ArkData' | query(predicates: RdbPredicates, columns?: Array\<string\>): Promise\<ResultSet\> | `store.query(predicates, ['ID', 'NAME'])` | 同上 |
| 更新数据（Promise） | RdbStore.update | import { relationalStore } from '@kit.ArkData' | update(values: ValuesBucket, predicates: RdbPredicates): Promise\<number\> | `store.update(valueBucket, predicates)` | 同上 |
| 删除数据（Promise） | RdbStore.delete | import { relationalStore } from '@kit.ArkData' | delete(predicates: RdbPredicates): Promise\<number\> | `store.delete(predicates)` | 同上 |
| 执行原生SQL | RdbStore.executeSql | import { relationalStore } from '@kit.ArkData' | executeSql(sql: string, bindArgs?: Array\<ValueType\>): Promise\<void\> | `store.executeSql(SQL_CREATE_TABLE)` | 同上 |
| 检查向量数据库支持（API 18+） | relationalStore.isVectorSupported | import { relationalStore } from '@kit.ArkData' | isVectorSupported(): boolean | `let supported = relationalStore.isVectorSupported()` | 同上/02_Functions.md |

## @ohos.data.distributedKVStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建KVManager实例 | distributedKVStore.createKVManager | import { distributedKVStore } from '@kit.ArkData' | createKVManager(config: KVManagerConfig): KVManager | `kvManager = distributedKVStore.createKVManager(kvManagerConfig)` | ArkData/01_ArkTS API/06_ohos.data.distributedKVStore.md |
| 创建/获取分布式键值数据库（callback） | KVManager.getKVStore | import { distributedKVStore } from '@kit.ArkData' | getKVStore\<T\>(storeId: string, options: Options, callback: AsyncCallback\<T\>): void | `kvManager.getKVStore('storeId', options, (err, store) => { ... })` | 同上 |
| 写入键值对（callback） | SingleKVStore.put | import { distributedKVStore } from '@kit.ArkData' | put(key: string, value: Uint8Array\|string\|number\|boolean, callback: AsyncCallback\<void\>): void | `kvStore.put('key_test_string', 'value-test-string', (err) => { ... })` | 同上 |
| 写入键值对（Promise） | SingleKVStore.put | import { distributedKVStore } from '@kit.ArkData' | put(key: string, value: Uint8Array\|string\|number\|boolean): Promise\<void\> | `kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT)` | 同上 |
| 获取键值（Promise） | SingleKVStore.get | import { distributedKVStore } from '@kit.ArkData' | get(key: string): Promise\<Uint8Array\|string\|number\|boolean\> | `kvStore.get('key_test_string')` | 同上 |
| 删除键值对 | SingleKVStore.delete | import { distributedKVStore } from '@kit.ArkData' | delete(key: string): Promise\<void\> | `kvStore.delete('key_test_string')` | 同上 |
| 订阅数据变更 | SingleKVStore.on('dataChange') | import { distributedKVStore } from '@kit.ArkData' | on(event: 'dataChange', type: SubscribeType, observer: Callback\<ChangeNotification\>): void | `kvStore.on('dataChange', SubscribeType.SUBSCRIBE_TYPE_ALL, (data) => { ... })` | 同上 |
| 跨设备同步 | SingleKVStore.sync | import { distributedKVStore } from '@kit.ArkData' | sync(deviceIdList: string[], mode: SyncMode, allowedDelayMs?: number): void | `kvStore.sync([deviceId], SyncMode.PUSH_PULL)` | 同上 |
| 关闭数据库 | KVManager.closeKVStore | import { distributedKVStore } from '@kit.ArkData' | closeKVStore(appId: string, storeId: string, kvStore: KVStore): Promise\<void\> | `kvManager.closeKVStore(this.context, 'storeId', kvStore)` | 同上 |

## @ohos.data.dataShare

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建DataProxyHandle实例 | dataShare.createDataProxyHandle | import { dataShare } from '@kit.ArkData' | createDataProxyHandle(): Promise\<DataProxyHandle\> | `dataShare.createDataProxyHandle().then(handle => { ... })` | ArkData/01_ArkTS API/03_ohos.data.dataShare (数据共享).md |
| 发布共享配置 | DataProxyHandle.publish | import { dataShare } from '@kit.ArkData' | publish(data: ProxyData[], config: DataProxyConfig): Promise\<DataProxyResult[]\> | `dataProxyHandle.publish(newConfigData, config)` | 同上 |
| 获取共享配置 | DataProxyHandle.get | import { dataShare } from '@kit.ArkData' | get(uris: string[], config: DataProxyConfig): Promise\<DataProxyGetResult[]\> | `dataProxyHandle.get(urisToGet, config)` | 同上 |
| 删除共享配置 | DataProxyHandle.delete | import { dataShare } from '@kit.ArkData' | delete(uris: string[], config: DataProxyConfig): Promise\<DataProxyResult[]\> | `dataProxyHandle.delete(urisToDelete, config)` | 同上 |
| 订阅共享配置变更 | DataProxyHandle.on('dataChange') | import { dataShare } from '@kit.ArkData' | on(event: 'dataChange', uris: string[], config: DataProxyConfig, callback: AsyncCallback\<DataProxyChangeInfo[]\>): DataProxyResult[] | `dataProxyHandle.on('dataChange', urisToWatch, config, callback)` | 同上 |
| 取消订阅共享配置变更 | DataProxyHandle.off('dataChange') | import { dataShare } from '@kit.ArkData' | off(event: 'dataChange', uris: string[], config: DataProxyConfig, callback?: AsyncCallback\<DataProxyChangeInfo[]\>): DataProxyResult[] | `dataProxyHandle.off('dataChange', urisToUnWatch, config, callback)` | 同上 |

## 模块要点

- 四个数据持久化API均从 `@kit.ArkData` 导入，使用 `import { preferences, relationalStore, distributedKVStore, dataShare } from '@kit.ArkData'` 统一导入。
- **用户首选项 (preferences)**: Key-Value轻量存储，适合保存用户设置。Key最大1024字节，Value最大16MB。API 9起支持，API 10引入同步方法和Options配置。支持XML与GSKV两种存储模式（API 18+）。注意不支持多进程并发安全，使用时需调用flush()落盘。
- **关系型数据库 (relationalStore)**: 基于SQLite的完整关系型数据库。支持SQL语句操作，单条数据建议不超过2MB，单次查询建议不超过5000条。API 18+支持向量数据库。API 24+支持同步getRdbStoreSync。通过StoreConfig配置安全级别（S1-S4）。
- **分布式键值数据库 (distributedKVStore)**: 支持多设备数据协同，提供SingleKVStore（单版本）和DeviceKVStore（设备协同）两种类型。需要DISTRIBUTED_DATASYNC权限进行跨设备同步。支持Schema结构化数据校验。
- **数据共享 (dataShare)**: 提供跨应用数据共享机制，使用DataProxyHandle进行配置发布/订阅/获取/删除。URI格式为 `datashareproxy://{bundleName}/{path}`。仅Stage模型可用。API 20起支持，API 26扩展了配置数量和值长度限制。
