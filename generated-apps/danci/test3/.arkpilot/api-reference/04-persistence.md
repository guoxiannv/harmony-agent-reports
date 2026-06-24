# 04 — Data Persistence & Resource Loading

## AppStorage (应用全局的UI状态存储)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用全局内存键值存储（V1） | AppStorage | 内置，无需导入 | `AppStorage.setOrCreate<T>(propName: string, newValue: T): void` | `AppStorage.setOrCreate('score', 0); let val = AppStorage.get('score') as number;` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 应用全局内存键值存储（V2） | AppStorageV2 | `import { AppStorageV2 } from '@kit.ArkUI'` | `static connect<T>(type: TypeConstructorWithArgs<T>, keyOrDefaultCreator?, defaultCreator?): T \| undefined` | `AppStorageV2.connect(SampleClass, () => new SampleClass());` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/14_ohos.arkui.StateManagement (状态管理).md` |
| 双向绑定到AppStorage | AppStorage.link | 内置 | `static link<T>(propName: string): SubscribedAbstractProperty<T>` | `let link = AppStorage.link('score'); link.set(100);` | 同上 |
| 单向绑定到AppStorage | AppStorage.prop | 内置 | `static prop<T>(propName: string): SubscribedAbstractProperty<T>` | `let prop = AppStorage.prop('score');` | 同上 |

## PersistentStorage (持久化存储UI状态)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持久化单个属性到磁盘（V1） | PersistentStorage.persistProp | 内置，无需导入 | `static persistProp<T>(key: string, defaultValue: T): void` | `PersistentStorage.persistProp('highScore', '0');` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 批量持久化属性 | PersistentStorage.persistProps | 内置 | `static persistProps(props: PersistPropsOptions[]): void` | `PersistentStorage.persistProps([{ key: 'highScore', defaultValue: '0' }]);` | 同上 |
| 删除持久化属性 | PersistentStorage.deleteProp | 内置 | `static deleteProp(key: string): void` | `PersistentStorage.deleteProp('highScore');` | 同上 |
| 持久化存储UI状态（V2） | PersistenceV2 | `import { PersistenceV2 } from '@kit.ArkUI'` | `static globalConnect<T>(type: ConnectOptions<T>): T \| undefined` | `PersistenceV2.globalConnect({ type: Sample, defaultCreator: () => new Sample() })` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/14_ohos.arkui.StateManagement (状态管理).md` |
| 手动触发持久化（V2） | PersistenceV2.save | `@kit.ArkUI` | `static save<T>(keyOrType: string \| TypeConstructorWithArgs<T>): void` | `PersistenceV2.save('key_as2');` | 同上 |

## @ohos.data.preferences (用户首选项 / PreferencesKit)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取Preferences实例 | preferences.getPreferences | `import { preferences } from '@kit.ArkData'` | `getPreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void` | `preferences.getPreferences(this.context, 'myStore', (err, val) => { ... });` | `02_应用框架/03_ArkData（方舟数据管理）/01_ArkTS API/07_ohos.data.preferences (用户首选项).md` |
| 读取值 | Preferences.get | `@kit.ArkData` | `get(key: string, defValue: ValueType, callback: AsyncCallback<ValueType>): void` | `preferences.get('key', 'default', (err, val) => {});` | 同上 |
| 写入值 | Preferences.put | `@kit.ArkData` | `put(key: string, value: ValueType, callback: AsyncCallback<void>): void` | `preferences.put('score', 100, () => {});` | 同上 |
| 刷新到磁盘 | Preferences.flush | `@kit.ArkData` | `flush(callback: AsyncCallback<void>): void` | `preferences.flush(() => {});` | 同上 |
| 删除键值 | Preferences.delete | `@kit.ArkData` | `delete(key: string, callback: AsyncCallback<void>): void` | `preferences.delete('score', () => {});` | 同上 |

## Environment (环境变量 / 响应式环境变量)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 注册环境变量到AppStorage（V1） | Environment.envProp | 内置，无需导入 | `static envProp<S>(key: string, value: S): boolean` | `Environment.envProp('accessibilityEnabled', 'default');` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 批量注册环境变量 | Environment.envProps | 内置 | `static envProps(props: EnvPropsOptions[]): void` | `Environment.envProps([{ key: 'languageCode', defaultValue: 'en' }]);` | 同上 |
| @Env装饰器读取系统环境变量（V2） | @Env | 内置（需导入 `uiObserver` 获取类型） | `@Env(SystemProperties.BREAK_POINT) breakpoint: WindowSizeLayoutBreakpointInfo;` | `@Env(SystemProperties.WINDOW_SIZE) windowSize: SizeInVP;` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/29_响应式环境变量/01_Env：环境变量.md` |

## resourceManager (资源管理)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取资源管理对象（Stage模型） | context.resourceManager | 无需导入，`context` via `@kit.AbilityKit` | `context.resourceManager: ResourceManager` | `let resMgr = this.context.resourceManager;` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/02_application/15_Context (Stage模型的上下文基类).md` |
| 按资源ID读取字符串（同步） | resourceManager.getStringSync | `import { resourceManager } from '@kit.LocalizationKit'` | `getStringSync(resId: number): string` | `resMgr.getStringSync($r('app.string.test').id);` | `02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/03_ohos.resourceManager (资源管理).md` |
| 按资源名称读取字符串（同步） | resourceManager.getStringByNameSync | `@kit.LocalizationKit` | `getStringByNameSync(resName: string): string` | `resMgr.getStringByNameSync("test");` | 同上 |
| 读取rawfile文件内容（同步） | resourceManager.getRawFileContentSync | `@kit.LocalizationKit` | `getRawFileContentSync(path: string): Uint8Array` | `let data = resMgr.getRawFileContentSync("test.txt");` | 同上 |
| 读取rawfile文件内容（异步） | resourceManager.getRawFileContent | `@kit.LocalizationKit` | `getRawFileContent(path: string): Promise<Uint8Array>` | `resMgr.getRawFileContent("test.txt").then(data => {});` | 同上 |
| 获取rawfile目录文件列表 | resourceManager.getRawFileList | `@kit.LocalizationKit` | `getRawFileListSync(path: string): Array<string>` | `let files = resMgr.getRawFileListSync("");` | 同上 |
| RawFileDescriptor | RawFileDescriptor | `@kit.LocalizationKit` | `type RawFileDescriptor = { fd: number; offset: number; length: number }` | 用于获取rawfile文件的文件描述符信息 | `02_应用框架/14_Localization Kit（本地化开发服务）/01_ArkTS API/05_global/01_RawFileDescriptor.md` |

## Module Notes

- **AppStorage vs Preferences**: AppStorage/PersistentStorage 是 ArkUI 状态管理框架的一部分，适用于与 UI 绑定的全局/持久化状态。Preferences 是 ArkData 提供的通用键值持久化，不与 UI 绑定，需要手动调用 flush() 持久化。在需要 UI 响应式绑定且持久化的场景，推荐 PersistentStorage (V1) 或 PersistenceV2 (V2)；在非 UI 业务场景下选择 Preferences。
- **AppStorageV2 / PersistenceV2**: 从 API 12 开始引入的 V2 状态管理（@ObservedV2/@Trace 体系），使用 class 类型和 connect/globalConnect 替代 V1 的字符串键方式。PersistenceV2 继承自 AppStorageV2，支持自动持久化 @Trace 属性，非 @Trace 属性需要手动调用 save()。
- **getContext 已标记废弃**: 从 API 18 开始废弃，建议通过 `this.getUIContext().getHostContext()` 获取 Context。通过 Context.resourceManager 可访问资源。
- **@Env (V2) 与 Environment.envProp (V1)**: V2 的 `@Env` 装饰器从 API 22 开始支持，基于 SystemProperties 枚举读取系统环境变量。V1 的 `Environment.envProp` 从 API 7 开始支持（API 10 起推荐使用小写版 `envProp`），将环境变量值存入 AppStorage 后再通过 @StorageProp/@StorageLink 使用。
