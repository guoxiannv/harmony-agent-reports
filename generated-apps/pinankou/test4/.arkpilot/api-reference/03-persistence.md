# 03 -- Data Persistence (数据持久化)

## @ohos.data.preferences (用户首选项)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 轻量级 KV 持久化存储 | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `let sp = preferences.getPreferences(this.context, 'myStore'); sp.then(...)` | `07_ohos.data.preferences (用户首选项).md` |
| Preferences 实例获取值 | Preferences.get | `preferences.Preferences` | `get(key: string, defValue: ValueType): Promise<ValueType>` | `dataPreferences.get('startup', 'default').then(val => ...)` | `07_ohos.data.preferences (用户首选项).md` |
| Preferences 实例写入值 | Preferences.put | `preferences.Preferences` | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto').then(() => ...)` | `07_ohos.data.preferences (用户首选项).md` |
| Preferences 实例删除键 | Preferences.delete | `preferences.Preferences` | `delete(key: string): Promise<void>` | `dataPreferences.delete('startup').then(() => ...)` | `07_ohos.data.preferences (用户首选项).md` |
| Preferences 实例同步刷新到文件 | Preferences.flush | `preferences.Preferences` | `flush(): Promise<void>` | `dataPreferences.flush().then(() => ...)` | `07_ohos.data.preferences (用户首选项).md` |

## @ohos.data.sendablePreferences (共享用户首选项)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 支持 Sendable 跨线程传递的 KV 存储 | sendablePreferences.getPreferences | `import { sendablePreferences } from '@kit.ArkData'` | `getPreferences(context: Context, options: Options): Promise<Preferences>` | `let opts: sendablePreferences.Options = { name: 'myStore' }; sendablePreferences.getPreferences(ctx, opts).then(...)` | `08_ohos.data.sendablePreferences (共享用户首选项).md` |
| 同步获取实例（API 12+） | sendablePreferences.getPreferencesSync | `import { sendablePreferences } from '@kit.ArkData'` | `getPreferencesSync(context: Context, options: Options): Preferences` | `let prefs = sendablePreferences.getPreferencesSync(this.context, { name: 'myStore' })` | `08_ohos.data.sendablePreferences (共享用户首选项).md` |

## @ohos.data.relationalStore (关系型数据库)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 模块入口，创建/打开 RDB | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData'` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `relationalStore.getRdbStore(this.context, { name: "RdbTest.db", securityLevel: relationalStore.SecurityLevel.S3 }).then(store => ...)` | `02_Functions.md` |
| 执行 SQL 语句 | RdbStore.executeSql | `relationalStore.RdbStore` | `executeSql(sql: string): Promise<void>` | `store.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL)')` | `03_Interface (RdbStore).md` |
| 插入数据行 | RdbStore.insert | `relationalStore.RdbStore` | `insert(table: string, values: ValuesBucket): Promise<number>` | `store.insert("EMPLOYEE", { NAME: "Lisa", AGE: 18 })` | `03_Interface (RdbStore).md` |
| 按谓词更新数据 | RdbStore.update | `relationalStore.RdbStore` | `update(values: ValuesBucket, predicates: RdbPredicates): Promise<number>` | `store.update({ AGE: 22 }, predicates)` | `03_Interface (RdbStore).md` |
| 按谓词删除数据 | RdbStore.delete | `relationalStore.RdbStore` | `delete(predicates: RdbPredicates): Promise<number>` | `store.delete(predicates)` | `03_Interface (RdbStore).md` |
| 按谓词查询 | RdbStore.query | `relationalStore.RdbStore` | `query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>` | `store.query(predicates, ["ID","NAME"]).then(resultSet => ...)` | `03_Interface (RdbStore).md` |
| 执行原始 SQL 查询 | RdbStore.querySql | `relationalStore.RdbStore` | `querySql(sql: string, bindArgs?: Array<ValueType>): Promise<ResultSet>` | `store.querySql("SELECT * FROM EMPLOYEE WHERE AGE > ?", [18]).then(...)` | `03_Interface (RdbStore).md` |

## ResultSet
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 移动到第一行 | ResultSet.goToFirstRow | `relationalStore.ResultSet` | `goToFirstRow(): boolean` | `resultSet.goToFirstRow()` | `04_Interface (ResultSet).md` |
| 移动到下一行 | ResultSet.goToNextRow | `relationalStore.ResultSet` | `goToNextRow(): boolean` | `while (resultSet.goToNextRow()) { ... }` | `04_Interface (ResultSet).md` |
| 获取字符串列值 | ResultSet.getString | `relationalStore.ResultSet` | `getString(columnIndex: number): string` | `resultSet.getString(resultSet.getColumnIndex("NAME"))` | `04_Interface (ResultSet).md` |
| 获取长整数列值 | ResultSet.getLong | `relationalStore.ResultSet` | `getLong(columnIndex: number): number` | `resultSet.getLong(resultSet.getColumnIndex("ID"))` | `04_Interface (ResultSet).md` |
| 获取浮点数列值 | ResultSet.getDouble | `relationalStore.ResultSet` | `getDouble(columnIndex: number): number` | `resultSet.getDouble(resultSet.getColumnIndex("SALARY"))` | `04_Interface (ResultSet).md` |
| 根据列名获取索引 | ResultSet.getColumnIndex | `relationalStore.ResultSet` | `getColumnIndex(columnName: string): number` | `resultSet.getColumnIndex("NAME")` | `04_Interface (ResultSet).md` |
| 获取所有列名 | ResultSet.getColumnNames | `relationalStore.ResultSet` | `getColumnNames(): Array<string>` | `const names = resultSet.getColumnNames()` | `04_Interface (ResultSet).md` |
| 关闭结果集释放资源 | ResultSet.close | `relationalStore.ResultSet` | `close(): void` | `resultSet.close()` | `04_Interface (ResultSet).md` |

## RdbPredicates
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 构造表谓词 | RdbPredicates.constructor | `relationalStore.RdbPredicates` | `constructor(name: string)` | `new relationalStore.RdbPredicates("EMPLOYEE")` | `08_Class (RdbPredicates).md` |
| 等值条件 | RdbPredicates.equalTo | `relationalStore.RdbPredicates` | `equalTo(field: string, value: ValueType): RdbPredicates` | `predicates.equalTo("NAME", "Lisa")` | `08_Class (RdbPredicates).md` |
| 不等条件 | RdbPredicates.notEqualTo | `relationalStore.RdbPredicates` | `notEqualTo(field: string, value: ValueType): RdbPredicates` | `predicates.notEqualTo("NAME", "Lisa")` | `08_Class (RdbPredicates).md` |
| 包含条件 (LIKE) | RdbPredicates.contains | `relationalStore.RdbPredicates` | `contains(field: string, value: string): RdbPredicates` | `predicates.contains("NAME", "os")` | `08_Class (RdbPredicates).md` |
| 逻辑 AND | RdbPredicates.and | `relationalStore.RdbPredicates` | `and(): RdbPredicates` | `predicates.equalTo("NAME","Lisa").and().equalTo("SALARY", 200.5)` | `08_Class (RdbPredicates).md` |
| 逻辑 OR | RdbPredicates.or | `relationalStore.RdbPredicates` | `or(): RdbPredicates` | `predicates.equalTo("NAME","Lisa").or().equalTo("NAME","Rose")` | `08_Class (RdbPredicates).md` |
| 升序排序 | RdbPredicates.orderByAsc | `relationalStore.RdbPredicates` | `orderByAsc(field: string): RdbPredicates` | `predicates.orderByAsc("AGE")` | `08_Class (RdbPredicates).md` |
| 降序排序 | RdbPredicates.orderByDesc | `relationalStore.RdbPredicates` | `orderByDesc(field: string): RdbPredicates` | `predicates.orderByDesc("SALARY")` | `08_Class (RdbPredicates).md` |
| 限制结果数 | RdbPredicates.limit | `relationalStore.RdbPredicates` | `limit(total: number, offset: number): RdbPredicates` | `predicates.limit(10, 0)` | `08_Class (RdbPredicates).md` |

## @ohos.data.ValuesBucket (数据集)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数据库值类型定义 | ValueType | `import { ValueType, ValuesBucket } from '@kit.ArkData'` | `type ValueType = number | string | boolean` | `let val: ValueType = "text"` | `14_ohos.data.ValuesBucket (数据集).md` |
| 数据库数据行键值对集合 | ValuesBucket | `import { ValueType, ValuesBucket } from '@kit.ArkData'` | `type ValuesBucket = Record<string, ValueType | Uint8Array | null>` | `const vb: ValuesBucket = { NAME: "Lisa", AGE: 18 }` | `14_ohos.data.ValuesBucket (数据集).md` |

## @ohos.data.dataSharePredicates (数据共享谓词)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 构造数据共享谓词 | DataSharePredicates | `import { dataSharePredicates } from '@kit.ArkData'` | `class DataSharePredicates` | `let predicates = new dataSharePredicates.DataSharePredicates()` | `04_ohos.data.dataSharePredicates (数据共享谓词).md` |
| 等值匹配 | DataSharePredicates.equalTo | `dataSharePredicates.DataSharePredicates` | `equalTo(field: string, value: ValueType): DataSharePredicates` | `predicates.equalTo("NAME", "Rose")` | `04_ohos.data.dataSharePredicates (数据共享谓词).md` |
| 逻辑 AND | DataSharePredicates.and | `dataSharePredicates.DataSharePredicates` | `and(): DataSharePredicates` | `predicates.equalTo("NAME","lisi").and().equalTo("SALARY",200.5)` | `04_ohos.data.dataSharePredicates (数据共享谓词).md` |
| 升序排序 | DataSharePredicates.orderByAsc | `dataSharePredicates.DataSharePredicates` | `orderByAsc(field: string): DataSharePredicates` | `predicates.orderByAsc("AGE")` | `04_ohos.data.dataSharePredicates (数据共享谓词).md` |
| 降序排序 | DataSharePredicates.orderByDesc | `dataSharePredicates.DataSharePredicates` | `orderByDesc(field: string): DataSharePredicates` | `predicates.orderByDesc("AGE")` | `04_ohos.data.dataSharePredicates (数据共享谓词).md` |
| 限制结果数和起始位置 | DataSharePredicates.limit | `dataSharePredicates.DataSharePredicates` | `limit(total: number, offset: number): DataSharePredicates` | `predicates.limit(10, 0)` | `04_ohos.data.dataSharePredicates (数据共享谓词).md` |

## @ohos.file.fs (文件管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 模块入口，文件基础操作 | fileIo | `import { fileIo } from '@kit.CoreFileKit'` | 命名空间导出 stat, access, open, close, copyFile, read, write, mkdir, listFile, unlink 等 | `let pathDir = this.context.filesDir; fileIo.stat(pathDir + "/test.txt")` | `06_ohos.file.fs (文件管理).md` |
| 获取文件/目录信息 | fileIo.stat | `import { fileIo } from '@kit.CoreFileKit'` | `stat(file: string | number): Promise<Stat>` | `fileIo.stat(pathDir + "/test.txt").then(stat => { stat.size })` | `06_ohos.file.fs (文件管理).md` |
| 检查文件/目录访问权限 | fileIo.access | `import { fileIo } from '@kit.CoreFileKit'` | `access(path: string, mode?: AccessModeType): Promise<boolean>` | `fileIo.access(filePath).then(res => { if(res) ... })` | `06_ohos.file.fs (文件管理).md` |
| 打开文件 | fileIo.open | `import { fileIo } from '@kit.CoreFileKit'` | `open(path: string, mode?: OpenMode): Promise<File>` | `fileIo.open(path, fileIo.OpenMode.READ_ONLY).then(file => ...)` | `06_ohos.file.fs (文件管理).md` |
| 关闭文件描述符 | fileIo.close | `import { fileIo } from '@kit.CoreFileKit'` | `close(file: number | File): Promise<void>` | `fileIo.close(file.fd)` | `06_ohos.file.fs (文件管理).md` |
| 读取文件内容到缓冲区 | fileIo.read | `import { fileIo } from '@kit.CoreFileKit'` | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `fileIo.read(file.fd, buf).then(bytesRead => ...)` | `06_ohos.file.fs (文件管理).md` |
| 写入缓冲区内容到文件 | fileIo.write | `import { fileIo } from '@kit.CoreFileKit'` | `write(fd: number, buffer: ArrayBuffer | string, options?: WriteOptions): Promise<number>` | `fileIo.write(file.fd, "Hello").then(bytesWritten => ...)` | `06_ohos.file.fs (文件管理).md` |
| 复制文件 | fileIo.copyFile | `import { fileIo } from '@kit.CoreFileKit'` | `copyFile(src: string | number, dest: string | number, mode?: number): Promise<void>` | `fileIo.copyFile(srcPath, destPath)` | `06_ohos.file.fs (文件管理).md` |
| 创建目录 | fileIo.mkdir | `import { fileIo } from '@kit.CoreFileKit'` | `mkdir(path: string, recursion?: boolean): Promise<void>` | `fileIo.mkdir(pathDir + "/newDir")` | `06_ohos.file.fs (文件管理).md` |
| 列出目录内容 | fileIo.listFile | `import { fileIo } from '@kit.CoreFileKit'` | `listFile(path: string, options?: ListFileOptions): Promise<string[]>` | `fileIo.listFile(pathDir).then(files => ...)` | `06_ohos.file.fs (文件管理).md` |
| 删除文件 | fileIo.unlink | `import { fileIo } from '@kit.CoreFileKit'` | `unlink(path: string): Promise<void>` | `fileIo.unlink(pathDir + "/test.txt")` | `06_ohos.file.fs (文件管理).md` |

## 模块说明

- `preferences` (API 9+) 是轻量 KV 存储的首选，Value 最大 16MB，Key 最大 1024 字节。不适合多进程场景。
- `sendablePreferences` (API 12+) 是 `preferences` 的 Sendable 版本，支持在 ArkTS 并发实例间引用传递。
- `relationalStore` (API 9+) 基于 SQLite，单条数据不超过 2MB。单次查询推荐不超过 5000 条，大数据量查询建议在 TaskPool 中执行。
- `ValuesBucket` 和 `RdbPredicates` 均为非线程安全类型，多线程操作时需加锁保护。
- `dataSharePredicates` 用于 DataShare 框架的筛选条件，也可直接用于 RDB 和 KV 数据库的查询条件。
- `fileIo` (API 9+) 需要 context.filesDir 获取应用沙箱路径，导入模块为 `@kit.CoreFileKit`。
