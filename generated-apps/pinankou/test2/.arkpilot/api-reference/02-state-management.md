# 02 — 状态管理 State Management

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 监听状态变量变化 | @Watch | 无需导入，内置装饰器 | `Watch: (value: string) => PropertyDecorator` | `@State @Watch('onChange') num: number = 0;` 当 num 变化时触发 onChange 回调 | 02_ArkTS组件/28_状态管理与渲染控制/03_状态变量变化监听.md |

## AppStorage (V1)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用全局的UI状态存储 | AppStorage | 全局对象，无需导入 | `AppStorage.setOrCreate<T>(propName: string, newValue: T): void` | `AppStorage.setOrCreate('PropA', 47);` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 获取属性引用（免释放） | AppStorage.ref | 全局对象 | `static ref<T>(propName: string): AbstractProperty<T> | undefined` | `let ref = AppStorage.ref('PropA');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 双向绑定数据 | AppStorage.link | 全局对象 | `static link<T>(propName: string): SubscribedAbstractProperty<T>` | `let link = AppStorage.link('PropA');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 单向绑定数据 | AppStorage.prop | 全局对象 | `static prop<T>(propName: string): SubscribedAbstractProperty<T>` | `let prop = AppStorage.prop('PropA');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 读取属性值 | AppStorage.get | 全局对象 | `static get<T>(propName: string): T | undefined` | `let val = AppStorage.get('PropA');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 设置属性值 | AppStorage.set | 全局对象 | `static set<T>(propName: string, newValue: T): boolean` | `AppStorage.set('PropA', 47);` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## LocalStorage (V1)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面级UI状态存储 | LocalStorage | 全局对象，无需导入 | `constructor(initializingProperties?: Object)` | `let storage = new LocalStorage({ 'PropA': 47 });` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 双向绑定数据 | LocalStorage.link | 实例方法 | `link<T>(propName: string): SubscribedAbstractProperty<T>` | `storage.link('PropA');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 单向绑定数据 | LocalStorage.prop | 实例方法 | `prop<S>(propName: string): SubscribedAbstractProperty<S>` | `storage.prop('PropA');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 获取属性引用（免释放） | LocalStorage.ref | 实例方法 | `ref<T>(propName: string): AbstractProperty<T> | undefined` | `storage.ref('PropA');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 创建/设置属性 | LocalStorage.setOrCreate | 实例方法 | `setOrCreate<T>(propName: string, newValue: T): boolean` | `storage.setOrCreate('PropA', 121);` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## PersistentStorage (V1)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持久化存储UI状态 | PersistentStorage | 全局对象，无需导入 | `static persistProp<T>(key: string, defaultValue: T): void` | `PersistentStorage.persistProp('highScore', '0');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 批量持久化 | PersistentStorage.persistProps | 全局对象 | `static persistProps(props: PersistPropsOptions[]): void` | `PersistentStorage.persistProps([{ key: 'highScore', defaultValue: '0' }]);` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 删除持久化属性 | PersistentStorage.deleteProp | 全局对象 | `static deleteProp(key: string): void` | `PersistentStorage.deleteProp('highScore');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## Environment (V1)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设备环境查询 | Environment | 全局对象，无需导入 | `static envProp<S>(key: string, value: S): boolean` | `Environment.envProp('languageCode', 'en');` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 批量环境变量初始化 | Environment.envProps | 全局对象 | `static envProps(props: EnvPropsOptions[]): void` | `Environment.envProps([{ key: 'languageCode', defaultValue: 'en' }]);` | 02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 支持的内置环境变量 | accessibilityEnabled, colorMode, fontScale, fontWeightScale, layoutDirection, languageCode | — | 见 `内置环境变量说明` 中的完整表格 | 通过 colorMode 获取 LIGHT/DARK 模式 | 02_ArkTS组件/28_状态管理与渲染控制/04_内置环境变量说明.md |

## @Env (V2)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 读取系统环境变量 | @Env | `import { uiObserver } from '@kit.ArkUI';` | `Env: EnvDecorator` | `@Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;` | 02_ArkTS组件/29_响应式环境变量/01_Env：环境变量.md |
| 环境变量属性名枚举 | SystemProperties | `@kit.ArkUI` | 枚举值: BREAK_POINT, WINDOW_SIZE, WINDOW_SIZE_PX, WINDOW_AVOID_AREA, WINDOW_AVOID_AREA_PX | `@Env(SystemProperties.WINDOW_SIZE)` | 02_ArkTS组件/29_响应式环境变量/01_Env：环境变量.md |

## @Provide 装饰器参数
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Provide 支持重写参数 | ProvideOptions | 内置装饰器参数 | `interface { allowOverride?: string }` | `@Provide({allowOverride: 'someValue'}) value: string = 'hello';` | 02_ArkTS组件/28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |

## 模块说明
- `@State`、`@Prop`、`@Link`、`@Consume`、`@Observed`、`@ObjectLink`、`@LocalStorageLink`、`@LocalStorageProp` 装饰器不在 API 参考文档中单独列文件，而是在 HarmonyOS 开发指南中详细描述（如 `arkts-state-mgmt-v1`、`arkts-appstorage`）。这些是 ArkUI V1 状态管理装饰器，无独立的 `@ohos.*` 模块导入路径，可直接在组件中使用。
- 上述文件仅覆盖 V1 版本的 API 参考；V2 版本对应 `@ohos.arkui.StateManagement`（`@kit.ArkUI`）中的 `AppStorageV2`、`PersistenceV2`、`UIUtils`。
- 从 API version 12 开始，AppStorage/LocalStorage 支持 Map、Set、Date 类型及 null/undefined 联合类型。
- V1 的旧版 API（首字母大写：`Link`/`Prop`/`SetOrCreate`/`Has`/`Get`/`Set`/`Delete`/`Keys`/`Clear`）从 API version 10 起废弃，应使用小写版本。
