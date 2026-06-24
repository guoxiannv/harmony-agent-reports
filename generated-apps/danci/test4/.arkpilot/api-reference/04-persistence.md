# 04 — Data Persistence & File Access

## @ohos.data.preferences

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 键值型轻量数据持久化（用户首选项） | preferences.getPreferences | `import { preferences } from '@kit.ArkData';` | `getPreferences(context: Context, name: string): Promise<Preferences>` | `preferences.getPreferences(this.context, 'myStore').then(p => { p.put('key', 'val'); p.flush(); })` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md |
| 同步获取Preferences实例 | preferences.getPreferencesSync | 同上 | `getPreferencesSync(context: Context, options: Options): Preferences` | `let prefs = preferences.getPreferencesSync(this.context, { name: 'myStore' });` | 同上 |
| Preferences实例：读取值 | Preferences.get | 同上 | `get(key: string, defValue: ValueType): Promise<ValueType>` | `dataPreferences.get('startup', 'default')` | 同上 |
| Preferences实例：写入值 | Preferences.put | 同上 | `put(key: string, value: ValueType): Promise<void>` | `dataPreferences.put('startup', 'auto')` | 同上 |
| Preferences实例：持久化落盘 | Preferences.flush | 同上 | `flush(): Promise<void>` | `dataPreferences.flush()` | 同上 |
| Preferences实例：删除键 | Preferences.delete | 同上 | `delete(key: string): Promise<void>` | `dataPreferences.delete('startup')` | 同上 |
| Preferences实例：检查键 | Preferences.has | 同上 | `has(key: string): Promise<boolean>` | `dataPreferences.has('startup')` | 同上 |
| 删除整个Preferences文件 | preferences.deletePreferences | 同上 | `deletePreferences(context: Context, name: string): Promise<void>` | `preferences.deletePreferences(this.context, 'myStore')` | 同上 |

## @ohos.data.relationalStore

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建/打开关系型数据库（SQLite） | relationalStore.getRdbStore | `import { relationalStore } from '@kit.ArkData';` | `getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>` | `relationalStore.getRdbStore(this.context, {name:"RdbTest.db", securityLevel:relationalStore.SecurityLevel.S3}).then(store => store.executeSql(...))` | 02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/09_ohos.data.relationalStore (关系型数据库)/02_Functions.md |
| 删除数据库文件 | relationalStore.deleteRdbStore | 同上 | `deleteRdbStore(context: Context, name: string): Promise<void>` | `relationalStore.deleteRdbStore(this.context, "RdbTest.db")` | 同上 |
| 判断是否支持向量数据库 | relationalStore.isVectorSupported | 同上 | `isVectorSupported(): boolean` | `let supported = relationalStore.isVectorSupported()` | 同上 |

## @ohos.file.fs

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件/目录 | fileIo.open | `import { fileIo } from '@kit.CoreFileKit';` | `open(path: string, mode?: number): Promise<File>` | `fileIo.open(filePath, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE)` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md |
| 读取文件内容 | fileIo.read | 同上 | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `fileIo.read(file.fd, buf)` | 同上 |
| 写入文件内容 | fileIo.write | 同上 | `write(fd: number, buffer: ArrayBuffer, options?: WriteOptions): Promise<number>` | `fileIo.write(file.fd, buf)` | 同上 |
| 关闭文件 | fileIo.close | 同上 | `close(fileOrFd: File\|number): Promise<void>` | `fileIo.close(file)` | 同上 |
| 获取文件/目录详细信息 | fileIo.stat | 同上 | `stat(file: string\|number): Promise<Stat>` | `fileIo.stat(pathDir + "/test.txt")` | 同上 |
| 检查文件/目录是否存在 | fileIo.access | 同上 | `access(path: string, mode?: AccessModeType): Promise<boolean>` | `fileIo.access(filePath)` | 同上 |
| 创建目录 | fileIo.mkdir | 同上 | `mkdir(path: string, recursive?: boolean): Promise<void>` | `fileIo.mkdir(dirPath, true)` | 同上 |

## @ohos.resourceManager

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取资源管理对象（Stage模型） | context.resourceManager | `import { resourceManager } from '@kit.LocalizationKit';` (FA模型) / Stage模型下无需导入 | `context.resourceManager: ResourceManager` | `let rm = this.context.resourceManager; rm.getStringByName('app_name', (err, val) => {...})` | 02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md |
| 获取字符串资源 | ResourceManager.getStringByName | 同上 | `getStringByName(resName: string, callback: AsyncCallback<string>): void` | `resourceManager.getStringByName('app_name', (err, val) => { console.info(val); })` | 同上 |
| 获取资源管理对象（FA模型） | resourceManager.getResourceManager | 同上 | `getResourceManager(callback: AsyncCallback<ResourceManager>): void` | `resourceManager.getResourceManager((error, mgr) => { ... })` | 同上 |

## @ohos.util.json (JSON.parse / JSON.stringify)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| JSON字符串解析为ArkTS对象 | JSON.parse | `import { JSON } from '@kit.ArkTS';` | `parse(text: string, reviver?: Transformer, options?: ParseOptions): Object \| null` | `let obj = JSON.parse('{"name":"John","age":30}');` | 02_应用框架/04_ArkTS（方舟编程语言）/01_ArkTS API/17_ohos.util.json (JSON解析与生成).md |
| ArkTS对象序列化为JSON字符串 | JSON.stringify | 同上 | `stringify(value: Object, replacer?: (number\|string)[]\|null, space?: string\|number): string` | `let str = JSON.stringify(obj);` | 同上 |

## AppStorage / PersistentStorage

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用全局UI状态存储（内存） | AppStorage.setOrCreate | 内置全局对象，无需导入 | `static setOrCreate<T>(propName: string, newValue: T): void` | `AppStorage.setOrCreate('PropA', 47);` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| AppStorage双向绑定 | AppStorage.link | 同上 | `static link<T>(propName: string): SubscribedAbstractProperty<T>` | `let link = AppStorage.link('PropA'); link.set(48);` | 同上 |
| AppStorage单向绑定 | AppStorage.prop | 同上 | `static prop<T>(propName: string): SubscribedAbstractProperty<T>` | `let prop = AppStorage.prop('PropA');` | 同上 |
| AppStorage读取值 | AppStorage.get | 同上 | `static get<T>(propName: string): T \| undefined` | `let val = AppStorage.get('PropA');` | 同上 |
| AppStorage设置值 | AppStorage.set | 同上 | `static set<T>(propName: string, newValue: T): boolean` | `AppStorage.set('PropA', 48)` | 同上 |
| AppStorageV2连接（API 12+） | AppStorageV2.connect | `import { AppStorageV2 } from '@kit.ArkUI';` | `static connect<T>(type: TypeConstructorWithArgs<T>, keyOrDefaultCreator?, defaultCreator?): T \| undefined` | `AppStorageV2.connect(SampleClass, () => new SampleClass())` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/14_ohos.arkui.StateManagement (状态管理).md |
| 持久化存储UI状态到磁盘 | PersistentStorage.persistProp | 内置全局对象，无需导入 | `static persistProp<T>(key: string, defaultValue: T): void` | `PersistentStorage.persistProp('highScore', '0');` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 批量持久化属性 | PersistentStorage.persistProps | 同上 | `static persistProps(props: PersistPropsOptions[]): void` | `PersistentStorage.persistProps([{key:'hp',defaultValue:'100'}]);` | 同上 |
| 删除持久化属性 | PersistentStorage.deleteProp | 同上 | `static deleteProp(key: string): void` | `PersistentStorage.deleteProp('highScore');` | 同上 |
| PersistenceV2磁盘持久化（API 12+） | PersistenceV2.globalConnect | `import { PersistenceV2 } from '@kit.ArkUI';` | `static globalConnect<T>(type: ConnectOptions<T>): T \| undefined` | `PersistenceV2.globalConnect({type:Sample, key:'k1', defaultCreator:()=>new Sample()})` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/14_ohos.arkui.StateManagement (状态管理).md |

## Module Notes

- **preferences** 不支持多进程并发安全，key最大1024字节，value最大16MB。API 18+支持XML/GSKV两种存储模式，GSKV模式数据实时落盘无需flush。
- **relationalStore** 基于SQLite，单条数据建议不超过2MB，单次查询不超过5000条。API 18+支持向量数据库。支持加密数据库（encrypt参数）。
- **fileIo** 所有操作需要应用沙箱路径。API 11+支持URI。需通过 `context.filesDir` 获取沙箱路径。
- **resourceManager** Stage模型下通过 `context.resourceManager` 直接获取，无需 `getResourceManager()`。FA模型需显式导入模块调用 `getResourceManager()`。
- **JSON** `@ohos.util.json` 从API 12开始支持，导入 `@kit.ArkTS`。支持BigInt模式解析。不支持非线性容器序列化。
- **AppStorage V1**（API 7+）与 **AppStorageV2**（API 12+）是两套不同的API，V2通过 `@kit.ArkUI` 导入，不可混用key。V1是内置全局对象无需导入。
- **PersistentStorage**（API 7+）与 **PersistenceV2**（API 12+）同理。PersistenceV2支持 `@ObservedV2`/`@Trace` 装饰对象的自动持久化，支持加密等级（EL1-EL5）。
