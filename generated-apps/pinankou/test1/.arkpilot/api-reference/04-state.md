# 04 -- State Management

## @State
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件内状态声明 | @State | 内置装饰器，无需导入 | `@State` 装饰器，支持 `@State variable: T = value` | `@State count: number = 0;` | 未找到独立API参考文档，详见开发者指南 arkts-state |

## @Prop
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父→子单向传参 | @Prop | 内置装饰器，无需导入 | `@Prop variable: T` 装饰器 | `@Prop name: string;` | 未找到独立API参考文档，详见开发者指南 arkts-prop |

## @Link
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父→子双向同步 | @Link | 内置装饰器，无需导入 | `@Link variable: T` 装饰器 | `@Link value: number;` | 未找到独立API参考文档，详见开发者指南 arkts-link |

## @Provide
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 后代组件数据提供 | @Provide | 内置装饰器，无需导入 | `@Provide({allowOverride?: string}) variable: T` | `@Provide({allowOverride: 'override'}) data: number = 0;` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |
| @Provide装饰器参数 | ProvideOptions | 内置 | allowOverride: string (可选) | `@Provide({allowOverride: 'override'}) value: number = 0;` | 同上 |

## @Consume
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 接收祖先@Provide数据 | @Consume | 内置装饰器，无需导入 | `@Consume variable: T` 装饰器 | `@Consume data: number;` | 未找到独立API参考文档，详见开发者指南 arkts-provide-and-consume |

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态变量变化监听 | @Watch | 内置装饰器，无需导入 | `Watch: (value: string) => PropertyDecorator` | `@State @Watch('onChange') num: number = 0;` `onChange() { console.info(\`num change to \${this.num}\`); }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/03_状态变量变化监听.md |

## @ObjectLink
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 装饰@Observed类对象引用 | @ObjectLink | 内置装饰器，无需导入 | `@ObjectLink variable: T` 装饰器 | `@ObjectLink item: MyModel;` | 未找到独立API参考文档，详见开发者指南 arkts-observed-and-objectlink |

## @StorageLink
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| AppStorage双向绑定 | @StorageLink | 内置装饰器，无需导入 | `@StorageLink('propName') variable: T` | `@StorageLink('count') count: number = 0;` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## @LocalStorageLink
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| LocalStorage双向绑定 | @LocalStorageLink | 内置装饰器，无需导入 | `@LocalStorageLink('propName') variable: T` | `@LocalStorageLink('name') name: string = '';` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## @Observed
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 类数据变化监控 | @Observed | 内置装饰器，无需导入 | `@Observed class ClassName` 类装饰器 | `@Observed class Info { name: string = ''; }` | 未找到独立API参考文档，详见开发者指南 arkts-observed-and-objectlink |

## PersistentStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持久化AppStorage属性到文件 | PersistentStorage.persistProp | 全局对象，无需导入 | `static persistProp<T>(key: string, defaultValue: T): void` | `PersistentStorage.persistProp('highScore', '0');` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 删除持久化属性 | PersistentStorage.deleteProp | 全局对象，无需导入 | `static deleteProp(key: string): void` | `PersistentStorage.deleteProp('highScore');` | 同上 |
| 批量持久化 | PersistentStorage.persistProps | 全局对象，无需导入 | `static persistProps(props: PersistPropsOptions[]): void` | `PersistentStorage.persistProps([{key:'highScore',defaultValue:'0'}]);` | 同上 |
| 获取所有持久化key | PersistentStorage.keys | 全局对象，无需导入 | `static keys(): Array<string>` | `let keys: Array<string> = PersistentStorage.keys();` | 同上 |

## Environment
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 注册系统环境变量到AppStorage | Environment.envProp | 全局对象，无需导入 | `static envProp<S>(key: string, value: S): boolean` | `Environment.envProp('accessibilityEnabled', 'default');` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 批量注册环境变量 | Environment.envProps | 全局对象，无需导入 | `static envProps(props: EnvPropsOptions[]): void` | `Environment.envProps([{key:'languageCode',defaultValue:'en'}]);` | 同上 |
| 获取环境变量key列表 | Environment.keys | 全局对象，无需导入 | `static keys(): Array<string>` | `let keys: Array<string> = Environment.keys();` | 同上 |
| @Env装饰器（API22+） | @Env | 内置装饰器，无需导入 | `Env: EnvDecorator` | `@Env(SystemProperties.BREAK_POINT) breakpoint: WindowSizeLayoutBreakpointInfo;` | 29_响应式环境变量/01_Env：环境变量.md |
| 环境变量枚举 | SystemProperties | `import { uiObserver } from '@kit.ArkUI'` | 枚举值：BREAK_POINT / WINDOW_SIZE / WINDOW_SIZE_PX / WINDOW_AVOID_AREA / WINDOW_AVOID_AREA_PX | `@Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;` | 29_响应式环境变量/01_Env：环境变量.md |

## AppStorage 与 LocalStorage（应用级状态管理）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| AppStorage 全局状态存储 | AppStorage | 全局对象，无需导入 | `setOrCreate<T>(propName, newValue): void` | `AppStorage.setOrCreate('PropA', 47);` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| AppStorage 双向绑定引用 | AppStorage.link | 全局对象，无需导入 | `static link<T>(propName: string): SubscribedAbstractProperty<T>` | `let link = AppStorage.link<number>('PropA');` | 同上 |
| AppStorage 单向绑定 | AppStorage.prop | 全局对象，无需导入 | `static prop<T>(propName: string): SubscribedAbstractProperty<T>` | `let prop = AppStorage.prop<number>('PropA');` | 同上 |
| 自动释放的引用(ref) | AppStorage.ref | 全局对象，无需导入 | `static ref<T>(propName: string): AbstractProperty<T> \| undefined` | `let ref = AppStorage.ref<number>('PropA');` | 同上 |
| 创建 LocalStorage 实例 | LocalStorage.constructor | 需要 `let storage = new LocalStorage(...)` | `constructor(initializingProperties?: Object)` | `let storage = new LocalStorage({'PropA': 47});` | 同上 |
| LocalStorage 双向绑定 | LocalStorage.link | 实例方法 | `link<T>(propName: string): SubscribedAbstractProperty<T>` | `storage.link<number>('PropA');` | 同上 |
| LocalStorage 单向绑定 | LocalStorage.prop | 实例方法 | `prop<S>(propName: string): SubscribedAbstractProperty<S>` | `storage.prop<number>('PropA');` | 同上 |

## 内置环境变量说明

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| ColorMode枚举 | ColorMode | `@kit.ArkUI` | LIGHT=0, DARK=1 | `ColorMode.LIGHT` | 04_内置环境变量说明.md |
| LayoutDirection枚举 | LayoutDirection | `@kit.ArkUI` | LTR=0, RTL=1, Auto=2 | `LayoutDirection.LTR` | 同上 |
| 无障碍朗读 | accessibilityEnabled | Environment.envProp key | string | `Environment.envProp('accessibilityEnabled', 'default');` | 同上 |
| 字体缩放比例 | fontScale | Environment.envProp key | number | `Environment.envProp('fontScale', 1);` | 同上 |
| 字重比例 | fontWeightScale | Environment.envProp key | number | `Environment.envProp('fontWeightScale', 1);` | 同上 |
| 布局方向 | layoutDirection | Environment.envProp key | LayoutDirection | `Environment.envProp('layoutDirection', 0);` | 同上 |
| 系统语言 | languageCode | Environment.envProp key | string (小写) | `Environment.envProp('languageCode', 'zh');` | 同上 |

## Module Notes

- @State, @Prop, @Link, @Consume, @ObjectLink, @Observed 属于ArkTS内置状态管理装饰器，在本地API参考文档中无独立的文档文件，其详细用法见HarmonyOS开发者指南。
- @StorageLink 和 @LocalStorageLink 在应用级变量状态管理文档中被引用为AppStorage/LocalStorage的订阅者，无独立参考文档。
- @Watch 在API参考中存在独立文档`03_状态变量变化监听.md`。
- PersistentStorage 和 Environment API (`envProp`/`persistProp`等) 全部位于`01_应用级变量的状态管理.md`中，自API version 10开始推荐使用小写方法名（替代API 7时代的首字母大写版本）。
- @Env(SystemProperties.BREAK_POINT) 自API version 22开始支持，用于响应式布局断点监听。
- AppStorage/LocalStorage 从API 12开始支持 Map、Set、Date 类型，以及 null、undefined 和联合类型。
