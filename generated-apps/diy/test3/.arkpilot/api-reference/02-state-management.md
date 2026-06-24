# 02 — State Management

## @State (V1 内置装饰器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件内本地响应式状态（签到状态、表单字段） | `@State` | 内置装饰器，无需导入 | `@State <variable>: <type> = <initial>` | `@State count: number = 0` | 开发者指南（arkts-state-mgmt），非 API ref |

## @Prop (V1 内置装饰器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父→子单向数据绑定 | `@Prop` | 内置装饰器，无需导入 | `@Prop <variable>: <type>` | `@Prop userName: string` | 开发者指南（arkts-state-mgmt），非 API ref |

## @Link (V1 内置装饰器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父子组件双向数据绑定 | `@Link` | 内置装饰器，无需导入 | `@Link <variable>: <type>` | `@Link itemCount: number` | 开发者指南（arkts-state-mgmt），非 API ref |

## @Watch (API 7+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态变量变化监听——自动计算积分、检测沉睡条件 | `@Watch` | 内置装饰器，无需导入 | `@Watch('callbackName')` | `@State @Watch('onCountChange') count: number = 0` | `02_应用框架/05_ArkUI/02_ArkTS组件/28_状态管理与渲染控制/03_状态变量变化监听.md` |

## @Monitor (API 12+, V2)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态变量变化监听（V2 版），支持多个变量、获取变化前后值 | `@Monitor` | 内置装饰器，无需导入 | `@Monitor('var1', 'var2', ...) => MethodDecorator` | `@Monitor('name') onNameChange(monitor: IMonitor) { ... }` | `02_应用框架/05_ArkUI/02_ArkTS组件/28_状态管理与渲染控制/03_状态变量变化监听.md` |

## @Provide / @Consume (V1 内置装饰器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 祖先→后代跨层级状态共享（用户信息、登录态） | `@Provide` / `@Consume` | 内置装饰器，无需导入 | `@Provide key: Type` / `@Consume key: Type` | `@Provide('user') userInfo: UserData` | 开发者指南 + `02_状态管理V1装饰器参数.md`（ProvideOptions） |

## @StorageProp / @StorageLink
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| AppStorage 响应式绑定——组件自动同步 AppStorage 中保存的值 | `@StorageProp` / `@StorageLink` | 内置装饰器，无需导入 | `@StorageProp('key') value: Type` | `@StorageProp('points') points: number = 0` | `01_应用级变量的状态管理.md` |

## @LocalStorageProp / @LocalStorageLink
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| LocalStorage 响应式绑定——页面级状态共享 | `@LocalStorageProp` / `@LocalStorageLink` | 内置装饰器，无需导入 | `@LocalStorageProp('key') value: Type` | `@LocalStorageLink('pageState') state: string` | `01_应用级变量的状态管理.md` |

## @ObjectLink + @Observed (V1 内置装饰器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 嵌套对象响应式双向绑定（课程对象、库存条目） | `@Observed` / `@ObjectLink` | 内置装饰器，无需导入 | `@Observed class` / `@ObjectLink obj: Type` | `@Observed class Item { ... }` | 开发者指南（arkts-observed-and-objectlink） |

## @Builder / @BuilderParam (V1 内置装饰器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可复用 UI 构建函数（ClayButton、ClayCard 等原子组件） | `@Builder` / `@BuilderParam` | 内置装饰器，无需导入 | `@Builder MyBuilder() { ... }` | `@Builder ClayCard() { ... }` | 开发者指南 + `25_自定义组件/03_自定义组件的自定义布局.md` |

## @Computed (V2, API 12+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 计算属性——基于其他状态自动计算的派生值（积分等级、连续签到天数） | `@Computed` | 内置装饰器（V2），无需导入 | `@Computed get computedProp(): Type` | `@Computed get level(): string { ... }` | `15_ohos.arkui.StateManagement (状态管理).md`（V2 状态管理） |

## @Env (API 7+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 环境变量装饰器——注入系统环境变量到组件 | `@Env` | 内置装饰器，无需导入 | `@Env('variableName') value: Type` | `@Env('locale') locale: string` | `02_应用框架/05_ArkUI/02_ArkTS组件/29_响应式环境变量/01_Env：环境变量.md` |

## AppStorage (API 10+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用级响应式共享状态——会员档案、签到状态全局访问 | `AppStorage` | 内置对象，无需导入 | `AppStorage.setOrCreate(key, val)` / `AppStorage.get(key)` | `AppStorage.setOrCreate('points', 0)` | `01_应用级变量的状态管理.md` |

## LocalStorage (API 9+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面级响应式状态存储——课程列表、积分明细的页面隔离状态 | `LocalStorage` | 内置对象，无需导入 | `new LocalStorage(initialObj)` / `.get(key)` / `.set(key, val)` | `let storage = new LocalStorage({ 'page': 'home' })` | `01_应用级变量的状态管理.md` |

## PersistentStorage (API 9+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 跨会话持久化——签到记录、用户配置持久保存 | `PersistentStorage` | 内置对象，无需导入 | `PersistentStorage.persistProp(key, default)` | `PersistentStorage.persistProp('lastCheckin', '')` | `01_应用级变量的状态管理.md` |

## ohos.arkui.StateManagement (V2, API 12+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| V2 高级状态管理——AppStorageV2、PersistenceV2、观察者工具 | `ohos.arkui.StateManagement` | `import { ... } from '@kit.ArkUI'` | AppStorageV2: `.connect()` / `remove()` / `keys()` | `import { AppStorageV2 } from '@kit.ArkUI'` | `15_ohos.arkui.StateManagement (状态管理).md` |

## 模块说明
- 所有 V1 装饰器（`@State`, `@Prop`, `@Link`, `@Observed`, `@ObjectLink`, `@Provide`, `@Consume`, `@Builder`, `@BuilderParam`）是 ArkTS 编译器内置支持的语言特性，**无需 import 语句**，详细用法见 HarmonyOS 开发者指南（非 API 参考文档）。
- `@Watch` 和 `@Monitor` 是唯二有独立 API 参考文档文件的状态变化监听装饰器。
- `@Computed` 是 V2 专属装饰器，需配合 `@ObservedV2`/`@Trace` 使用。
- AppStorage / LocalStorage / PersistentStorage 是内置运行时对象，同样 **无需 import**。
- V2 状态管理（`ohos.arkui.StateManagement`）需显式 import，适用于新项目。
