# 03 -- Data Persistence

## PersistentStorage

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将AppStorage中的属性持久化到磁盘文件 | PersistentStorage.persistProp | 框架内置，无需导入 | `static persistProp<T>(key: string, defaultValue: T): void` | `PersistentStorage.persistProp('highScore', '0');` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 批量持久化多个属性 | PersistentStorage.persistProps | 框架内置 | `static persistProps(props: PersistPropsOptions[]): void` | `PersistentStorage.persistProps([{ key: 'highScore', defaultValue: '0' }, { key: 'wightScore', defaultValue: '1' }]);` | 同上 |
| 从PersistentStorage中删除指定属性 | PersistentStorage.deleteProp | 框架内置 | `static deleteProp(key: string): void` | `PersistentStorage.deleteProp('highScore');` | 同上 |
| 列出所有持久化属性的key | PersistentStorage.keys | 框架内置 | `static keys(): Array<string>` | `let keys: Array<string> = PersistentStorage.keys();` | 同上 |

## AppStorage

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或设置AppStorage中的属性值 | AppStorage.setOrCreate | 框架内置，无需导入 | `static setOrCreate<T>(propName: string, newValue: T): void` | `AppStorage.setOrCreate('simpleProp', 121);` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 获取AppStorage中属性的值 | AppStorage.get | 框架内置 | `static get<T>(propName: string): T | undefined` | `let value: number = AppStorage.get('PropA') as number;` | 同上 |
| 设置AppStorage属性值（返回操作状态） | AppStorage.set | 框架内置 | `static set<T>(propName: string, newValue: T): boolean` | `AppStorage.set('PropA', 47);` | 同上 |
| 建立双向数据绑定 | AppStorage.link | 框架内置 | `static link<T>(propName: string): SubscribedAbstractProperty<T>` | `let linkToPropA = AppStorage.link<number>('PropA');` | 同上 |
| 建立单向数据绑定 | AppStorage.prop | 框架内置 | `static prop<T>(propName: string): SubscribedAbstractProperty<T>` | `let prop1 = AppStorage.prop<number>('PropA');` | 同上 |
| 创建或删除AppStorage属性 | AppStorage.setAndLink / setAndProp | 框架内置 | `static setAndLink<T>(propName: string, defaultValue: T): SubscribedAbstractProperty<T>` | `let link1 = AppStorage.setAndLink('PropB', 49);` | 同上 |
| 检查属性是否存在 | AppStorage.has | 框架内置 | `static has(propName: string): boolean` | `AppStorage.has('simpleProp');` | 同上 |
| 删除AppStorage中的属性 | AppStorage.delete | 框架内置 | `static delete(propName: string): boolean` | `AppStorage.delete('PropA');` | 同上 |
| 列出所有属性名 | AppStorage.keys | 框架内置 | `static keys(): IterableIterator<string>` | `let keys = AppStorage.keys();` | 同上 |
| 获取属性数量 | AppStorage.size | 框架内置 | `static size(): number` | `let res: number = AppStorage.size();` | 同上 |
| 清空所有属性 | AppStorage.clear | 框架内置 | `static clear(): boolean` | `AppStorage.clear();` | 同上 |

## dataPreferences (ohos.data.preferences)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取Preferences实例（Promise） | preferences.getPreferences | `import { preferences } from '@kit.ArkData';` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let sp = preferences.getPreferences(this.context, 'myStore');` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md |
| 存入键值对 | Preferences.put | 同模块 | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto');` | 同上 |
| 读取键值 | Preferences.get | 同模块 | `get(key: string, defValue: ValueType): Promise<ValueType>` | `let data = dataPreferences.get('startup', 'default');` | 同上 |
| 检查是否存在键 | Preferences.has | 同模块 | `has(key: string): Promise<boolean>` | `dataPreferences.has('startup');` | 同上 |
| 删除键值对 | Preferences.delete | 同模块 | `delete(key: string): Promise<void>` | `dataPreferences.delete('startup');` | 同上 |
| 持久化到文件（XML模式） | Preferences.flush | 同模块 | `flush(): Promise<void>` | `dataPreferences.flush();` | 同上 |
| 清空所有数据 | Preferences.clear | 同模块 | `clear(): Promise<void>` | `dataPreferences.clear();` | 同上 |
| 订阅数据变更 | Preferences.on | 同模块 | `on(type: 'change', callback: Callback<string>): void` | `dataPreferences.on('change', observer);` | 同上 |

## relationalStore (ohos.data.relationalStore)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开关系型数据库 | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData';` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `relationalStore.getRdbStore(this.context, STORE_CONFIG)` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md |
| 插入数据 | RdbStore.insert | 同模块 | `insert(table: string, values: ValuesBucket): Promise<number>` | `store.insert("EMPLOYEE", valueBucket);` | 03_Interface (RdbStore).md |
| 更新数据 | RdbStore.update | 同模块 | `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>` | `store.update(valueBucket, predicates);` | 同上 |
| 删除数据 | RdbStore.delete | 同模块 | `delete(predicates: RdbPredicates): Promise<number>` | `store.delete(predicates);` | 同上 |
| 查询数据（带predicates） | RdbStore.query | 同模块 | `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>` | `store.query(predicates);` | 同上 |
| 执行SQL语句 | RdbStore.executeSql | 同模块 | `executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>` | `store.executeSql(SQL_CREATE_TABLE);` | 同上 |
| 执行SQL查询 | RdbStore.querySql | 同模块 | `querySql(sql: string, bindArgs?: Array<ValueType>): Promise<ResultSet>` | `store.querySql("SELECT * FROM EMPLOYEE");` | 同上 |
| 开始事务 | RdbStore.beginTransaction | 同模块 | `beginTransaction(): void` | `store.beginTransaction();` | 同上 |
| 提交事务 | RdbStore.commit | 同模块 | `commit(): void` | `store.commit();` | 同上 |
| 回滚事务 | RdbStore.rollBack | 同模块 | `rollBack(): void` | `store.rollBack();` | 同上 |

## resourceManager (ohos.resourceManager)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过Context获取resourceManager（Stage模型） | context.resourceManager | `import { resourceManager } from '@kit.LocalizationKit';`（FA模型需导入） | `context.resourceManager: ResourceManager` | `let resourceManager = this.context.resourceManager;` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |
| 读取字符串资源 | ResourceManager.getStringValue | 同模块 | `getStringValue(resId: number, callback: AsyncCallback<string>): void` | `resourceManager.getStringValue($r('app.string.test').id, (err, val) => {})` | 同上 |
| 读取rawfile文件内容(同步) | ResourceManager.getRawFileContentSync | 同模块 | `getRawFileContentSync(path: string): Uint8Array` | `let rawFile = this.context.resourceManager.getRawFileContentSync("test.txt");` | 同上 |
| 读取rawfile文件内容(异步Promise) | ResourceManager.getRawFileContent | 同模块 | `getRawFileContent(path: string): Promise<Uint8Array>` | `this.context.resourceManager.getRawFileContent("test.txt")` | 同上 |
| 读取媒体资源 | ResourceManager.getMediaContent | 同模块 | `getMediaContent(resId: number): Promise<Uint8Array>` | `resourceManager.getMediaContent($r('app.media.icon').id)` | 同上 |
| 读取布尔资源 | ResourceManager.getBoolean | 同模块 | `getBoolean(resId: number): Promise<boolean>` | `resourceManager.getBoolean($r('app.boolean.test').id)` | 同上 |
| 读取数字资源 | ResourceManager.getNumber | 同模块 | `getNumber(resId: number): Promise<number>` | `resourceManager.getNumber($r('app.integer.test').id)` | 同上 |

## LocalStorage

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建LocalStorage实例 | LocalStorage.constructor | 框架内置，无需导入 | `constructor(initializingProperties?: Object)` | `let storage: LocalStorage = new LocalStorage({ 'PropA': 47 });` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 设置属性值 | LocalStorage.set | 框架内置 | `set<T>(propName: string, newValue: T): boolean` | `storage.set('PropA', 47);` | 同上 |
| 获取属性值 | LocalStorage.get | 框架内置 | `get<T>(propName: string): T | undefined` | `let value = storage.get('PropA');` | 同上 |
| 创建或设置属性 | LocalStorage.setOrCreate | 框架内置 | `setOrCreate<T>(propName: string, newValue: T): boolean` | `storage.setOrCreate('PropB', 111);` | 同上 |
| 建立双向绑定 | LocalStorage.link | 框架内置 | `link<T>(propName: string): SubscribedAbstractProperty<T>` | `let link = storage.link<number>('PropA');` | 同上 |
| 建立单向绑定 | LocalStorage.prop | 框架内置 | `prop<S>(propName: string): SubscribedAbstractProperty<S>` | `let prop = storage.prop<number>('PropA');` | 同上 |
| 检查属性 | LocalStorage.has | 框架内置 | `has(propName: string): boolean` | `storage.has('PropA');` | 同上 |
| 删除属性 | LocalStorage.delete | 框架内置 | `delete(propName: string): boolean` | `storage.delete('PropA');` | 同上 |
| 列出所有key | LocalStorage.keys | 框架内置 | `keys(): IterableIterator<string>` | `let keys = storage.keys();` | 同上 |
| 清空属性 | LocalStorage.clear | 框架内置 | `clear(): boolean` | `storage.clear();` | 同上 |

## Module Notes

- **PersistentStorage** and **AppStorage** are tightly coupled: `persistProp` bridges AppStorage keys to disk persistence. Always call `PersistentStorage.persistProp` before UI component access to ensure proper initialization order. From API 12+, both support `null`, `undefined`, `Map`, `Set`, `Date` types.
- **dataPreferences** is the recommended KV storage for lightweight user preferences (API 9+). Note: it does NOT guarantee process concurrency safety -- avoid multi-process use. Values can be up to 16MB, keys up to 1024 bytes. XML mode requires explicit `flush()`, GSKV mode persists in real-time.
- **relationalStore** uses SQLite under the hood (API 9+). Single row data must be under 2MB. For large queries (>5000 rows), use TaskPool to avoid UI thread blocking.
- **resourceManager**: Stage model apps access it via `this.context.resourceManager` without importing the module. FA model still needs `import { resourceManager } from '@kit.LocalizationKit'`.
- **LocalStorage** provides page-level scoped state, each page gets its own `@LocalStorageLink`/`@LocalStorageProp` bindings. Use `UIContext.getSharedLocalStorage()` for stage-shared LocalStorage (API 12+).
