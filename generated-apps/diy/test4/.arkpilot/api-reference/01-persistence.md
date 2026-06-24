# 01 -- Data Persistence (RDB & Preferences)

## relationalStore.getRdbStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开关系型数据库 | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig, callback: AsyncCallback<RdbStore>): void` | `relationalStore.getRdbStore(this.context, STORE_CONFIG).then((rdbStore) => { store = rdbStore; })` | `09_ohos.data.relationalStore (关系型数据库)/02_Functions.md` |
| 创建或打开关系型数据库（Promise） | relationalStore.getRdbStore | 同上 | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `relationalStore.getRdbStore(this.context, STORE_CONFIG).then(...)` | 同上 |
| 创建或打开关系型数据库（同步24+） | relationalStore.getRdbStoreSync | 同上 | `getRdbStoreSync(context: Context, config: StoreConfig): RdbStore` | `store = relationalStore.getRdbStoreSync(this.context, STORE_CONFIG)` | 同上 |

## relationalStore.deleteRdbStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 删除数据库文件 | relationalStore.deleteRdbStore | `import { relationalStore } from '@kit.ArkData'` | `deleteRdbStore(context: Context, name: string, callback: AsyncCallback<void>): void` | `relationalStore.deleteRdbStore(context, "RdbTest.db", (err) => {...})` | `09_ohos.data.relationalStore (关系型数据库)/02_Functions.md` |
| 删除数据库文件（Promise） | relationalStore.deleteRdbStore | 同上 | `deleteRdbStore(context: Context, name: string): Promise<void>` | `relationalStore.deleteRdbStore(context, "RdbTest.db").then(...)` | 同上 |
| 按配置删除数据库(10+) | relationalStore.deleteRdbStore | 同上 | `deleteRdbStore(context: Context, config: StoreConfig): Promise<void>` | `relationalStore.deleteRdbStore(context, STORE_CONFIG).then(...)` | 同上 |

## RdbStore.insert

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 插入一行数据 | RdbStore.insert | 通过 `relationalStore.getRdbStore` 获取实例 | `insert(table: string, values: ValuesBucket, callback: AsyncCallback<number>): void` | `store.insert("EMPLOYEE", valueBucket, (err, rowId) => {...})` | `03_Interface (RdbStore).md` |
| 插入一行数据（Promise） | RdbStore.insert | 同上 | `insert(table: string, values: ValuesBucket): Promise<number>` | `store.insert("EMPLOYEE", valueBucket).then(...)` | 同上 |

## RdbStore.update

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 更新数据（callback） | RdbStore.update | 通过 `relationalStore.getRdbStore` 获取实例 | `update(values: ValuesBucket, predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.update(valueBucket, predicates, (err, rows) => {...})` | `03_Interface (RdbStore).md` |
| 更新数据（Promise） | RdbStore.update | 同上 | `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>` | `store.update(valueBucket, predicates).then(...)` | 同上 |

## RdbStore.delete

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 删除数据（callback） | RdbStore.delete | 通过 `relationalStore.getRdbStore` 获取实例 | `delete(predicates: RdbPredicates, callback: AsyncCallback<number>): void` | `store.delete(predicates, (err, rows) => {...})` | `03_Interface (RdbStore).md` |
| 删除数据（Promise） | RdbStore.delete | 同上 | `delete(predicates: RdbPredicates): Promise<number>` | `store.delete(predicates).then(...)` | 同上 |

## RdbStore.query

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 查询数据（callback） | RdbStore.query | 通过 `relationalStore.getRdbStore` 获取实例 | `query(predicates: RdbPredicates, columns: Array<string>, callback: AsyncCallback<ResultSet>): void` | `store.query(predicates, ["ID","NAME"], (err, resultSet) => {...})` | `03_Interface (RdbStore).md` |
| 查询数据（Promise） | RdbStore.query | 同上 | `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>` | `store.query(predicates, ["ID"]).then((resultSet) => {...})` | 同上 |

## resultSet (查询结果集)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 结果集导航到下一行 | ResultSet.goToNextRow | 通过 query 获取 ResultSet 实例 | `goToNextRow(): boolean` | `while (resultSet.goToNextRow()) {...}` | `04_Interface (ResultSet).md` |
| 获取列索引 | ResultSet.getColumnIndex | 同上 | `getColumnIndex(columnName: string): number` | `const idx = resultSet.getColumnIndex("NAME")` | 同上 |
| 获取字符串值 | ResultSet.getString | 同上 | `getString(columnIndex: number): string` | `const name = resultSet.getString(idx)` | 同上 |
| 获取 Long 值 | ResultSet.getLong | 同上 | `getLong(columnIndex: number): number` | `const age = resultSet.getLong(idx)` | 同上 |
| 获取 Double 值 | ResultSet.getDouble | 同上 | `getDouble(columnIndex: number): number` | `const salary = resultSet.getDouble(idx)` | 同上 |
| 获取 Blob 值 | ResultSet.getBlob | 同上 | `getBlob(columnIndex: number): Uint8Array` | `const codes = resultSet.getBlob(idx)` | 同上 |
| 获取通用值(12+) | ResultSet.getValue | 同上 | `getValue(columnIndex: number): ValueType` | `const name = resultSet.getValue(colIndex)` | 同上 |
| 关闭结果集 | ResultSet.close | 同上 | `close(): void` | `resultSet.close()` | 同上 |

## valueType (数据类型映射)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| RDB 数据字段类型 | ValueType (relationalStore) | `import { relationalStore } from '@kit.ArkData'` | `type ValueType = null \| number \| string \| boolean \| Uint8Array \| Asset \| Assets \| Float32Array \| bigint` | `const bucket: relationalStore.ValuesBucket = { NAME: "Lisa", AGE: 18 }` | `10_Types.md` |
| 首选项数据类型 | ValueType (preferences) | `import { preferences } from '@kit.ArkData'` | `type ValueType = number \| string \| boolean \| Array<number> \| Array<string> \| Array<boolean> \| Uint8Array \| object \| bigint` | `dataPreferences.put('startup', 'auto')` | `07_ohos.data.preferences (用户首选项).md` |

## preferences.getPreferences

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 Preferences 实例（callback） | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void` | `preferences.getPreferences(context, 'myStore', (err, val) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 获取 Preferences 实例（Promise） | preferences.getPreferences | 同上 | `getPreferences(context: Context, name: string): Promise<Preferences>` | `preferences.getPreferences(context, 'myStore').then(...)` | 同上 |
| 获取 Preferences 实例（同步10+） | preferences.getPreferencesSync | 同上 | `getPreferencesSync(context: Context, options: Options): Preferences` | `dataPreferences = preferences.getPreferencesSync(this.context, { name: 'myStore' })` | 同上 |

## Preferences.put

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 写入键值对（callback） | Preferences.put | 通过 `getPreferences` 获取实例 | `put(key: string, value: ValueType, callback: AsyncCallback<void>): void` | `dataPreferences.put('startup', 'auto', (err) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 写入键值对（Promise） | Preferences.put | 同上 | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto').then(...)` | 同上 |
| 写入键值对（同步10+） | Preferences.putSync | 同上 | `putSync(key: string, value: ValueType): void` | `dataPreferences.putSync('startup', 'auto')` | 同上 |

## Preferences.get

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取键对应值（callback） | Preferences.get | 通过 `getPreferences` 获取实例 | `get(key: string, defValue: ValueType, callback: AsyncCallback<ValueType>): void` | `dataPreferences.get('startup', 'default', (err, val) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 获取键对应值（Promise） | Preferences.get | 同上 | `get(key: string, defValue: ValueType): Promise<ValueType>` | `dataPreferences.get('startup', 'default').then(...)` | 同上 |
| 获取键对应值（同步10+） | Preferences.getSync | 同上 | `getSync(key: string, defValue: ValueType): ValueType` | `const val = dataPreferences.getSync('startup', 'default')` | 同上 |

## Preferences.delete

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 删除键值对（callback） | Preferences.delete | 通过 `getPreferences` 获取实例 | `delete(key: string, callback: AsyncCallback<void>): void` | `dataPreferences.delete('startup', (err) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 删除键值对（Promise） | Preferences.delete | 同上 | `delete(key: string): Promise<void>` | `dataPreferences.delete('startup').then(...)` | 同上 |
| 删除键值对（同步10+） | Preferences.deleteSync | 同上 | `deleteSync(key: string): void` | `dataPreferences.deleteSync('startup')` | 同上 |

## Preferences.flush

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持久化到文件（callback） | Preferences.flush | 通过 `getPreferences` 获取实例 | `flush(callback: AsyncCallback<void>): void` | `dataPreferences.flush((err) => {...})` | `07_ohos.data.preferences (用户首选项).md` |
| 持久化到文件（Promise） | Preferences.flush | 同上 | `flush(): Promise<void>` | `dataPreferences.flush().then(...)` | 同上 |
| 持久化到文件（同步14+） | Preferences.flushSync | 同上 | `flushSync(): void` | `dataPreferences.flushSync()` | 同上 |

## 模块说明

- RDB 基于 SQLite，单条数据不超过 2MB（共享内存限制），单条字符串字段最大 8MB。
- 大数据量查询建议单次不超过 5000 条，或在 TaskPool 中执行。
- Preferences 实例会被缓存，首次获取后后续直接从缓存读取。Key 最大 1024 字节，Value 最大 16MB。
- Preferences 的 `put`/`delete` 只修改缓存，必须调用 `flush()` 持久化到文件（XML 模式）。GSKV 模式下操作实时落盘，无需 flush。
- Preferences ValueType 在 preferences 模块和 relationalStore 模块中定义不同：preferences.ValueType 支持数组（`Array<number|string|boolean>`），而 relationalStore.ValueType 支持 `Asset/Assets/Float32Array/bigint`。
- `data.createRdbStore` 和 `data.deleteRdbStore` 是过时命名，当前统一使用 `relationalStore.getRdbStore` 和 `relationalStore.deleteRdbStore`。
