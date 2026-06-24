# 03 — State Management & Reactivity

## AppStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用全局UI状态存储 | AppStorage | 不导入(全局内置) | AppStorage.link(propName: string): SubscribedAbstractProperty<T>; AppStorage.prop(propName: string): SubscribedAbstractProperty<T>; AppStorage.setOrCreate(propName, newValue); AppStorage.get(propName); AppStorage.set(propName, newValue); AppStorage.delete(propName); AppStorage.has(propName); AppStorage.keys(); AppStorage.size(); AppStorage.clear() | `AppStorage.setOrCreate('PropA', 47); let link = AppStorage.link('PropA')` | 01_应用级变量的状态管理.md |
| AppStorage ref引用(API12+) | AppStorage.ref | 不导入(全局内置) | static ref<T>(propName: string): AbstractProperty<T> | undefined | `let refToPropA = AppStorage.ref('PropA'); refToPropA?.set(48);` | 01_应用级变量的状态管理.md |
| AppStorage setAndRef(API12+) | AppStorage.setAndRef | 不导入(全局内置) | static setAndRef<T>(propName: string, defaultValue: T): AbstractProperty<T> | `let ref1 = AppStorage.setAndRef('PropB', 49);` | 01_应用级变量的状态管理.md |

## LocalStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面级UI状态存储 | LocalStorage | 不导入(全局内置) | constructor(initializingProperties?: Object); link(propName): SubscribedAbstractProperty<T>; prop(propName): SubscribedAbstractProperty<T>; setOrCreate(propName, newValue); get(propName); set(propName, newValue); has(propName); delete(propName); keys(); size(); clear() | `let storage = new LocalStorage({'PropA': 47}); let link = storage.link('PropA');` | 01_应用级变量的状态管理.md |
| LocalStorage ref(API12+) | LocalStorage.ref | 不导入(全局内置) | ref<T>(propName: string): AbstractProperty<T> | undefined | `storage.ref('PropA')?.set(48);` | 01_应用级变量的状态管理.md |

## PersistentStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持久化存储UI状态 | PersistentStorage | 不导入(全局内置) | persistProp<T>(key, defaultValue): void; deleteProp(key): void; persistProps(props: PersistPropsOptions[]): void; keys(): Array<string> | `PersistentStorage.persistProp('highScore', '0'); PersistentStorage.persistProps([{key:'highScore', defaultValue:'0'}]);` | 01_应用级变量的状态管理.md |

## Environment
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设备环境查询 | Environment | 不导入(全局内置) | envProp<S>(key, value): boolean; envProps(props: EnvPropsOptions[]): void; keys(): Array<string> | `Environment.envProp('accessibilityEnabled', 'default'); Environment.envProps([{key:'languageCode', defaultValue:'en'}]);` | 01_应用级变量的状态管理.md |
| 内置环境变量 | Environment内置变量 | 不导入(全局内置) | accessibilityEnabled: string; colorMode: ColorMode; fontScale: number; fontWeightScale: number; layoutDirection: LayoutDirection; languageCode: string | - | 01_应用级变量的状态管理.md, 04_内置环境变量说明.md |

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态变量变化监听(V1) | @Watch | 不导入(装饰器) | Watch: (value: string) => PropertyDecorator | `@State @Watch('onChange') num: number = 0;` | 03_状态变量变化监听.md |

## @Provide ProvideOptions 参数
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Provide支持allowOverride参数 | ProvideOptions | 不导入(装饰器参数) | { allowOverride?: string } | `@Provide({allowOverride: 'someVar'}) someVar: number = 0;` | 02_状态管理V1装饰器参数.md |

## 模块说明

1. **@State, @Prop, @Link, @Observed, @ObjectLink, @Consume, @StorageLink, @StorageProp** 是 ArkTS 编译器内置装饰器,在 API 参考文档中没有独立的文档页面。它们在 harmonyos-guides (开发指南) 中有详细说明。

2. **@StorageLink** 和 **@StorageProp** 在 `01_应用级变量的状态管理.md` 中被引用为 AppStorage 的订阅者装饰器,但没有独立的签名定义页面。@StorageLink 与 AppStorage.link() 语义相同(双向绑定),@StorageProp 与 AppStorage.prop() 语义相同(单向绑定)。

3. **AppStorage/LocalStorage/PersistentStorage/Environment** 的 API version 7 旧接口从 API version 10 开始废弃,推荐使用 API version 10+ 小写驼峰接口。

4. **@Provide** 装饰器本身无独立参考文档,仅有 ProvideOptions 参数文档。@Consume 装饰器同样无独立参考文档。

5. **@Watch 回调** 的函数名由字符串参数指定,不能在回调中使用 lambda 表达式绑定 this。

6. **PersistentStorage** API version 12+ 支持 null/undefined 作为 defaultValue。
