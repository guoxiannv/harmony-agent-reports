# 05 -- Data Persistence

## preferences (dataPreferences)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 Preferences 实例（Key-Value 轻量级数据持久化） | preferences.getPreferences | `import { preferences } from '@kit.ArkData';` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let sp = preferences.getPreferences(context, 'myStore'); sp.then((object: Preferences) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| Preferences 实例数据写入 | preferences.Preferences.put | `import { preferences } from '@kit.ArkData';` | `put(key: string, value: ValueType, callback: AsyncCallback<void>): void` | `dataPreferences.put('startup', 'auto', (err) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| Preferences 实例数据读取 | preferences.Preferences.get | `import { preferences } from '@kit.ArkData';` | `get(key: string, defValue: ValueType, callback: AsyncCallback<ValueType>): void` | `dataPreferences.get('startup', 'default', (err, val) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| Preferences 实例数据删除 | preferences.Preferences.delete | `import { preferences } from '@kit.ArkData';` | `delete(key: string, callback: AsyncCallback<void>): void` | `dataPreferences.delete('startup', (err) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| Preferences 实例数据刷入磁盘 | preferences.Preferences.flush | `import { preferences } from '@kit.ArkData';` | `flush(): Promise<void>` | `dataPreferences.flush().then(() => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |

## relationalStore (RdbStore)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建或打开关系型数据库（SQLite） | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData';` | `getRdbStore(context: Context, config: StoreConfig, callback: AsyncCallback<RdbStore>): void` | `relationalStore.getRdbStore(context, { name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 }, (err, rdbStore) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md` |
| 执行 SQL 插入 | RdbStore.insert | `import { relationalStore } from '@kit.ArkData';` | `insert(table: string, values: ValuesBucket, callback: AsyncCallback<number>): void` | `rdbStore.insert("EMPLOYEE", { "name": "John", "age": 30 }, (err, rowId) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/03_Interface (RdbStore).md` |
| 执行 SQL 查询（谓词方式） | RdbStore.query | `import { relationalStore } from '@kit.ArkData';` | `query(predicates: RdbPredicates, columns: Array<string>, callback: AsyncCallback<ResultSet>): void` | `rdbStore.query(predicates, ["name", "age"], (err, resultSet) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/03_Interface (RdbStore).md` |
| 执行原生 SQL | RdbStore.executeSql | `import { relationalStore } from '@kit.ArkData';` | `executeSql(sql: string, bindArgs?: Array<ValueType>, callback?: AsyncCallback<void>): void` | `rdbStore.executeSql("DELETE FROM EMPLOYEE WHERE age > ?", [50], (err) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/03_Interface (RdbStore).md` |
| 删除数据库 | relationalStore.deleteRdbStore | `import { relationalStore } from '@kit.ArkData';` | `deleteRdbStore(context: Context, name: string): Promise<void>` | `relationalStore.deleteRdbStore(context, "RdbTest.db").then(() => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md` |

## PersistentStorage

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将 AppStorage 属性持久化到本地文件 | PersistentStorage.persistProp | arkui (框架内置，无需导入) | `static persistProp<T>(key: string, defaultValue: T): void` | `PersistentStorage.persistProp('highScore', '0');` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 批量将 AppStorage 属性持久化 | PersistentStorage.persistProps | arkui (框架内置，无需导入) | `static persistProps(props: PersistPropsOptions[]): void` | `PersistentStorage.persistProps([{ key: 'highScore', defaultValue: '0' }, { key: 'wightScore', defaultValue: '1' }]);` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 从 PersistentStorage 中删除指定属性 | PersistentStorage.deleteProp | arkui (框架内置，无需导入) | `static deleteProp(key: string): void` | `PersistentStorage.deleteProp('highScore');` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 返回所有持久化属性名列表 | PersistentStorage.keys | arkui (框架内置，无需导入) | `static keys(): Array<string>` | `let keys: Array<string> = PersistentStorage.keys();` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md` |

## Environment

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将系统内置环境变量存入 AppStorage | Environment.envProp | arkui (框架内置，无需导入) | `static envProp<S>(key: string, value: S): boolean` | `Environment.envProp('accessibilityEnabled', 'default');` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 批量将系统环境变量存入 AppStorage | Environment.envProps | arkui (框架内置，无需导入) | `static envProps(props: EnvPropsOptions[]): void` | `Environment.envProps([{ key: 'languageCode', defaultValue: 'en' }, { key: 'accessibilityEnabled', defaultValue: 'default' }]);` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 返回已存入 AppStorage 的环境变量 key 数组 | Environment.keys | arkui (框架内置，无需导入) | `static keys(): Array<string>` | `let keys: Array<string> = Environment.keys();` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md` |

## fileIO (file management)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件 | fileIo.open | `import { fileIo } from '@kit.CoreFileKit';` | `open(path: string, mode?: number): Promise<File>` | `fileIo.open(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE).then((file) => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 读取文件数据 | fileIo.read | `import { fileIo } from '@kit.CoreFileKit';` | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `let buf = new ArrayBuffer(4096); fileIo.read(fd, buf).then((readLen) => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 写入文件数据 | fileIo.write | `import { fileIo } from '@kit.CoreFileKit';` | `write(fd: number, buffer: ArrayBuffer | string, options?: WriteOptions): Promise<number>` | `fileIo.write(fd, "Hello").then((writeLen) => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 获取文件或目录属性 | fileIo.stat | `import { fileIo } from '@kit.CoreFileKit';` | `stat(file: string | number): Promise<Stat>` | `fileIo.stat(pathDir + "/test.txt").then((stat) => { console.info(`size: ${stat.size}`); });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 创建目录 | fileIo.mkdir | `import { fileIo } from '@kit.CoreFileKit';` | `mkdir(path: string, mode?: number): Promise<void>` | `fileIo.mkdir(pathDir + "/newDir").then(() => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 删除文件 | fileIo.unlink | `import { fileIo } from '@kit.CoreFileKit';` | `unlink(path: string): Promise<void>` | `fileIo.unlink(pathDir + "/test.txt").then(() => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 复制文件 | fileIo.copyFile | `import { fileIo } from '@kit.CoreFileKit';` | `copyFile(src: string | number, dest: string | number, mode?: number): Promise<void>` | `fileIo.copyFile(pathDir + "/src.txt", pathDir + "/dest.txt").then(() => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 关闭文件描述符 | fileIo.close | `import { fileIo } from '@kit.CoreFileKit';` | `close(fd: number): Promise<void>` | `fileIo.close(file.fd).then(() => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 读取文本文件全部内容 | fileIo.readText | `import { fileIo } from '@kit.CoreFileKit';` | `readText(filePath: string): Promise<string>` | `fileIo.readText(pathDir + "/test.txt").then((text) => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 列出目录下文件 | fileIo.listFile | `import { fileIo } from '@kit.CoreFileKit';` | `listFile(path: string, options?: { filter?: Filter; recursion?: boolean; listNum?: number }): Promise<string[]>` | `fileIo.listFile(pathDir).then((fileList) => { ... });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |

## Module Notes

- `preferences` 适用于轻量级 Key-Value 持久化；首选项无法保证进程并发安全，不支持在多进程场景下使用。
- `relationalStore` 基于 SQLite，建议单条数据不超过 2MB，单次查询不超过 5000 条。
- `PersistentStorage` 和 `Environment` 是 ArkUI 框架内置装饰器/API，无需 `import`，直接使用。
- `PersistentStorage` 的旧 API（`PersistProp`、`DeleteProp` 等）从 API version 10 起废弃，应使用 `persistProp`、`deleteProp` 等小写形式 API。
- `Environment` 的旧 API（`EnvProp`、`EnvProps` 等）同样从 API version 10 起废弃，应使用 `envProp`、`envProps`。
- `fileIo` 导入路径为 `'@kit.CoreFileKit'`，API 名称为 `fileIo`（小写 o），非 `fileIO`。
