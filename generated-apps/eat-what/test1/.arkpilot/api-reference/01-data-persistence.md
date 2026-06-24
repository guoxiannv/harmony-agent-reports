# 01 — Data Persistence (数据持久化)

## @ohos.data.preferences (用户首选项)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 Preferences 实例（Promise） | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let prefs = await preferences.getPreferences(this.context, 'myStore');` | 07_ohos.data.preferences (用户首选项).md |
| 读取键值（Promise） | Preferences.get | — | `get(key: string, defValue: ValueType): Promise<ValueType>` | `let theme = await dataPreferences.get('theme', 'light');` | 07_ohos.data.preferences (用户首选项).md |
| 写入键值（Promise） | Preferences.put | — | `put(key: string, value: ValueType): Promise<void>` | `await dataPreferences.put('theme', 'dark');` | 07_ohos.data.preferences (用户首选项).md |
| 刷入磁盘（Promise） | Preferences.flush | — | `flush(): Promise<void>` | `await dataPreferences.flush();` | 07_ohos.data.preferences (用户首选项).md |
| 检查键是否存在（Promise） | Preferences.has | — | `has(key: string): Promise<boolean>` | `let exists = await dataPreferences.has('theme');` | 07_ohos.data.preferences (用户首选项).md |
| 删除键值（Promise） | Preferences.delete | — | `delete(key: string): Promise<void>` | `await dataPreferences.delete('theme');` | 07_ohos.data.preferences (用户首选项).md |
| 删除整个 Preferences 实例 | preferences.deletePreferences | — | `deletePreferences(context: Context, name: string): Promise<void>` | `await preferences.deletePreferences(this.context, 'myStore');` | 07_ohos.data.preferences (用户首选项).md |
| 从缓存移除（不清除磁盘） | preferences.removePreferencesFromCache | — | `removePreferencesFromCache(context: Context, name: string): Promise<void>` | `await preferences.removePreferencesFromCache(this.context, 'myStore');` | 07_ohos.data.preferences (用户首选项).md |
| 获取所有键值（Promise） | Preferences.getAll | — | `getAll(): Promise<Object>` | `let all = await dataPreferences.getAll();` | 07_ohos.data.preferences (用户首选项).md |
| 同步读取键值（API 10+） | Preferences.getSync | — | `getSync(key: string, defValue: ValueType): ValueType` | `let val = dataPreferences.getSync('theme', 'light');` | 07_ohos.data.preferences (用户首选项).md |
| 同步写入（API 10+） | Preferences.putSync | — | `putSync(key: string, value: ValueType): void` | `dataPreferences.putSync('theme', 'dark');` | 07_ohos.data.preferences (用户首选项).md |
| 订阅数据变更 | Preferences.on | — | `on(type: 'change', callback: Callback<string>): void` | `dataPreferences.on('change', (key) => { console.info(key + ' changed'); });` | 07_ohos.data.preferences (用户首选项).md |
| 取消订阅 | Preferences.off | — | `off(type: 'change', callback?: Callback<string>): void` | `dataPreferences.off('change', observer);` | 07_ohos.data.preferences (用户首选项).md |

## @ohos.data.relationalStore (关系型数据库)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建/打开数据库（Promise） | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `let store = await relationalStore.getRdbStore(this.context, { name: 'app.db', securityLevel: relationalStore.SecurityLevel.S3 });` | 02_Functions.md |
| 插入数据（Promise） | RdbStore.insert | — | `insert(table: string, values: ValuesBucket): Promise<number>` | `let rowId = await store.insert('FOOD', { NAME: '饺子', CATEGORY: '主食' });` | 03_Interface (RdbStore).md |
| 更新数据（Promise） | RdbStore.update | — | `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>` | `let affected = await store.update({ AGE: 20 }, new relationalStore.RdbPredicates('EMPLOYEE').equalTo('NAME', 'Lisa'));` | 03_Interface (RdbStore).md |
| 删除数据（Promise） | RdbStore.delete | — | `delete(predicates: RdbPredicates): Promise<number>` | `let deleted = await store.delete(new relationalStore.RdbPredicates('FOOD').equalTo('ID', 1));` | 03_Interface (RdbStore).md |
| 查询数据（Promise） | RdbStore.query | — | `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>` | `let resultSet = await store.query(new relationalStore.RdbPredicates('FOOD').equalTo('CATEGORY', '主食'));` | 03_Interface (RdbStore).md |
| 执行 SQL（Promise） | RdbStore.executeSql | — | `executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>` | `await store.executeSql('CREATE TABLE IF NOT EXISTS FOOD (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, CATEGORY TEXT)');` | 03_Interface (RdbStore).md |
| 执行 SQL 并返回行（API 12+） | RdbStore.execute | — | `execute(sql: string, bindArgs?: Array<ValueType>, callback?: AsyncCallback<ValueType>): Promise<ValueType>` | `await store.execute('SELECT COUNT(*) FROM FOOD');` | 03_Interface (RdbStore).md |
| 查询单条 SQL（Promise） | RdbStore.querySql | — | `querySql(sql: string, bindArgs?: Array<ValueType>): Promise<ResultSet>` | `let rs = await store.querySql('SELECT * FROM FOOD WHERE CATEGORY = ?', ['主食']);` | 03_Interface (RdbStore).md |

### related interfaces

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数据库安全级别 | SecurityLevel | `import { relationalStore } from '@kit.ArkData'` | `S1=1, S2=2, S3=3, S4=4` | `securityLevel: relationalStore.SecurityLevel.S3` | 09_Enums.md |
| 数据库配置 | StoreConfig | — | `{ name: string, securityLevel: SecurityLevel, encrypt?: boolean, dataGroupId?: string, customDir?: string, allowRebuild?: boolean, isReadOnly?: boolean }` | `const STORE_CONFIG: relationalStore.StoreConfig = { name: 'eatwhat.db', securityLevel: relationalStore.SecurityLevel.S3 };` | 07_Interfaces (其他).md |
| 查询谓词 | RdbPredicates | — | `class RdbPredicates { constructor(name: string); equalTo(field: string, value: ValueType): RdbPredicates; ... }` | `new relationalStore.RdbPredicates('FOOD').equalTo('CATEGORY', '主食')` | 08_Class (RdbPredicates).md |
| 结果集 | ResultSet | — | `goToFirstRow(): boolean; getString(columnIndex: number): string; getLong(columnIndex: number): number; close(): void;` | `if (rs.goToFirstRow()) { let name = rs.getString(1); } rs.close();` | 04_Interface (ResultSet).md |
| 数据行对象 | ValuesBucket | `import { relationalStore } from '@kit.ArkData'` | `type ValuesBucket = { [key: string]: ValueType \| Asset \| Assets \| Uint8Array }` | `{ NAME: '饺子', CATEGORY: '主食', CALORIES: 250 }` | 14_ohos.data.ValuesBucket (数据集).md |

## @ohos.data.sendablePreferences (共享用户首选项)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取实例（Promise，API 12+） | sendablePreferences.getPreferences | `import { sendablePreferences } from '@kit.ArkData'` | `getPreferences(context: Context, options: Options): Promise<Preferences>` | `let prefs = await sendablePreferences.getPreferences(this.context, { name: 'sharedStore' });` | 08_ohos.data.sendablePreferences (共享用户首选项).md |
| 获取实例（同步，API 12+） | sendablePreferences.getPreferencesSync | — | `getPreferencesSync(context: Context, options: Options): Preferences` | `let prefs = sendablePreferences.getPreferencesSync(this.context, { name: 'sharedStore' });` | 08_ohos.data.sendablePreferences (共享用户首选项).md |
| 读取值（Promise） | Preferences.get | — | `get(key: string, defValue: lang.ISendable): Promise<lang.ISendable>` | `let val = await prefs.get('theme', 'light');` | 08_ohos.data.sendablePreferences (共享用户首选项).md |
| 同步读取 | Preferences.getSync | — | `getSync(key: string, defValue: lang.ISendable): lang.ISendable` | `let val = prefs.getSync('theme', 'light');` | 08_ohos.data.sendablePreferences (共享用户首选项).md |
| 写入值（Promise） | Preferences.put | — | `put(key: string, value: lang.ISendable): Promise<void>` | `await prefs.put('theme', 'dark');` | 08_ohos.data.sendablePreferences (共享用户首选项).md |
| 同步写入 | Preferences.putSync | — | `putSync(key: string, value: lang.ISendable): void` | `prefs.putSync('theme', 'dark');` | 08_ohos.data.sendablePreferences (共享用户首选项).md |
| 检查键（Promise） | Preferences.has | — | `has(key: string): Promise<boolean>` | `let exists = await prefs.has('theme');` | 08_ohos.data.sendablePreferences (共享用户首选项).md |
| 删除键（Promise） | Preferences.delete | — | `delete(key: string): Promise<void>` | `await prefs.delete('theme');` | 08_ohos.data.sendablePreferences (共享用户首选项).md |
| 刷入磁盘 | Preferences.flush | — | `flush(): Promise<void>` | `await prefs.flush();` | 08_ohos.data.sendablePreferences (共享用户首选项).md |

## Module notes

- User preferences (theme, wheel customization) should use `@ohos.data.preferences`. Simple key-value storage for small config data (theme name, wheel settings).
- Structured user data (checkin records, ingredient list, dish history) should use `@ohos.data.relationalStore` with SQLite-backed tables.
- Built-in dish dataset: seed a relationalStore RDB with a pre-populated dish table on first launch. The dataset is local-only and does not need cloud sync.
- `@ohos.data.sendablePreferences` (API 12+) is not needed for single-thread use cases. Only use it if you need to share Preferences across TaskPool/Worker threads via ISendable.
- Avoid using distributed features unless multi-device sync is explicitly required.
- Single record size limit in RDB: under 2MB recommended. Single query result: under 5000 rows recommended.
