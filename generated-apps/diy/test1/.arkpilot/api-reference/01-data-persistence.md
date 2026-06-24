# 01 — 数据持久化 (RDB + Preferences)

## relationalStore (RDB)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建/打开关系型数据库 | `relationalStore.getRdbStore` | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `const STORE_CONFIG: relationalStore.StoreConfig = { name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 }; const store = await relationalStore.getRdbStore(this.context, STORE_CONFIG);` | `09_ohos.data.relationalStore/02_Functions.md` |
| 插入数据行 | `RdbStore.insert` | `import { relationalStore } from '@kit.ArkData'` | `insert(table: string, values: ValuesBucket): Promise<number>` | `const vb: relationalStore.ValuesBucket = { 'NAME': 'Lisa', 'AGE': 18 }; store.insert("EMPLOYEE", vb).then(rowId => {});` | `09_ohos.data.relationalStore/03_Interface (RdbStore).md` |
| 更新数据 | `RdbStore.update` | `import { relationalStore } from '@kit.ArkData'` | `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>` | `let predicates = new relationalStore.RdbPredicates("EMPLOYEE"); predicates.equalTo("NAME", "Lisa"); store.update(valueBucket, predicates).then(rows => {});` | `09_ohos.data.relationalStore/03_Interface (RdbStore).md` |
| 删除数据 | `RdbStore.delete` | `import { relationalStore } from '@kit.ArkData'` | `delete(predicates: RdbPredicates): Promise<number>` | `let predicates = new relationalStore.RdbPredicates("EMPLOYEE"); predicates.equalTo("NAME", "Lisa"); store.delete(predicates).then(rows => {});` | `09_ohos.data.relationalStore/03_Interface (RdbStore).md` |
| 条件查询 | `RdbStore.query` | `import { relationalStore } from '@kit.ArkData'` | `query(predicates: RdbPredicates): Promise<ResultSet>` | `let predicates = new relationalStore.RdbPredicates("EMPLOYEE"); predicates.equalTo("NAME", "Rose"); store.query(predicates).then(resultSet => {});` | `09_ohos.data.relationalStore/03_Interface (RdbStore).md` |
| 执行SQL（DDL/DML） | `RdbStore.execute` | `import { relationalStore } from '@kit.ArkData'` | `execute(sql: string, args?: Array<ValueType>): Promise<ValueType>` | `await store.execute('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL)');` | `09_ohos.data.relationalStore/03_Interface (RdbStore).md` |
| 查询谓词构造 | `RdbPredicates` | `import { relationalStore } from '@kit.ArkData'` | `constructor(name: string) + equalTo(field, value): RdbPredicates / contains / beginsWith / like / in / between / orderByAsc / limitAs / offsetAs / groupBy / distinct / and / or` | `new relationalStore.RdbPredicates("EMPLOYEE").equalTo("NAME", "Lisa").or().equalTo("NAME", "Rose");` | `09_ohos.data.relationalStore/08_Class (RdbPredicates).md` |

## dataPreferences (用户首选项)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 Preferences 实例 | `preferences.getPreferences` | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `preferences.getPreferences(this.context, 'myStore').then(pref => { dataPreferences = pref; });` | `07_ohos.data.preferences (用户首选项).md` |
| 读取键值 | `Preferences.get` | `import { preferences } from '@kit.ArkData'` | `get(key: string, defValue: ValueType): Promise<ValueType>` | `dataPreferences.get('startup', 'default').then(val => {});` | `07_ohos.data.preferences (用户首选项).md` |
| 写入键值 | `Preferences.put` | `import { preferences } from '@kit.ArkData'` | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto').then(() => {});` | `07_ohos.data.preferences (用户首选项).md` |
| 删除键值 | `Preferences.delete` | `import { preferences } from '@kit.ArkData'` | `delete(key: string): Promise<void>` | `dataPreferences.delete('startup').then(() => {});` | `07_ohos.data.preferences (用户首选项).md` |
| 检查键是否存在 | `Preferences.has` | `import { preferences } from '@kit.ArkData'` | `has(key: string): Promise<boolean>` | `dataPreferences.has('startup').then(exists => {});` | `07_ohos.data.preferences (用户首选项).md` |
| 持久化落盘（XML模式） | `Preferences.flush` | `import { preferences } from '@kit.ArkData'` | `flush(): Promise<void>` | `dataPreferences.flush().then(() => {});` | `07_ohos.data.preferences (用户首选项).md` |
| 获取所有键值 | `Preferences.getAll` | `import { preferences } from '@kit.ArkData'` | `getAll(): Promise<Object>` | `dataPreferences.getAll().then(allData => {});` | `07_ohos.data.preferences (用户首选项).md` |
| 订阅数据变更 | `Preferences.on('change')` | `import { preferences } from '@kit.ArkData'` | `on(type: 'change', callback: Callback<string>): void` | `dataPreferences.on('change', (key) => { console.info(key + ' changed'); });` | `07_ohos.data.preferences (用户首选项).md` |
| 同步读取（同步接口） | `Preferences.getSync` | `import { preferences } from '@kit.ArkData'` | `getSync(key: string, defValue: ValueType): ValueType` | `let val: preferences.ValueType = dataPreferences.getSync('startup', 'default');` | `07_ohos.data.preferences (用户首选项).md` |

## ValuesBucket & ValueType 类型

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| RDB 数据集类型 | `ValuesBucket` | `import { relationalStore } from '@kit.ArkData'` | `type ValuesBucket = Record<string, ValueType>` | `const vb: relationalStore.ValuesBucket = { 'NAME': 'Lisa', 'AGE': 18, 'SALARY': 100.5 };` | `14_ohos.data.ValuesBucket (数据集).md`（及 RDB Types） |
| 数据库字段值类型 | `ValueType` (RDB) | `import { relationalStore } from '@kit.ArkData'` | `type ValueType = null \| number \| string \| boolean \| Uint8Array \| Asset \| Assets \| Float32Array \| bigint` | 用作 ValuesBucket 的值类型约束 | `09_ohos.data.relationalStore/10_Types.md` |
| Preferences 值类型 | `preferences.ValueType` | `import { preferences } from '@kit.ArkData'` | `type ValueType = number \| string \| boolean \| Array<number> \| Array<string> \| Array<boolean> \| Uint8Array \| object \| bigint` | 用作 Preferences.put/get 的值类型 | `07_ohos.data.preferences (用户首选项).md` |

## 模块备注

- **relationalStore 首批 API version 9**，导入 kotlin-style 包名 `@kit.ArkData`（非旧版 `@ohos.data.relationalStore`）。
- **单条数据限制 2MB**（共享内存限制），字符串字段上限 8MB，超出截断。
- **大数据量查询** 建议单次不超过 5000 条，可使用 TaskPool 避免卡死。
- **preferences 首批 API version 9**，Key 最大 1024 字节，Value 最大 16MB。
- **Preferences 存储模式**：XML（默认，需手动 flush）和 GSKV（实时落盘），通过 `Options.storageType` 指定。
- **Preferences 非线程安全**，不支持多进程并发，有文件损坏风险。
- 同步接口（`getSync`、`putSync`、`deleteSync` 等）从 API 10 起支持。
