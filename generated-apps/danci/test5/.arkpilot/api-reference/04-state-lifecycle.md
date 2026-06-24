# 04 — State Management & Lifecycle

## @Component
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件标记装饰器，用于声明式UI | @Component | 内置装饰器，无需导入 | `@Component` | `@Component struct MyComponent { build() { ... } }` | `25_自定义组件/01_自定义组件的生命周期.md` |

## @Entry
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面入口装饰器，标记自定义组件作为UI页面入口 | @Entry | 内置装饰器，无需导入 | `@Entry` / `@Entry({ routeName: string, storage?: LocalStorage, useSharedStorage?: boolean })` | `@Entry @Component struct Index { build() { Text('@Entry Test') } }` | `25_自定义组件/06_组件扩展装饰器/02_Entry：页面入口.md` |

## @Preview
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件预览装饰器，支持IDE预览自定义组件 | @Preview | 内置装饰器，无需导入 | `@Preview` / `@Preview({ title?: string, width?: number, height?: number, locale?: string, colorMode?: string, deviceType?: string, dpi?: number, orientation?: string, roundScreen?: boolean })` | `@Preview @Component struct Test { @State message: string = 'Preview'; build() { ... } }` | `26_组件预览/01_组件预览.md` |

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 监听状态变量变化的属性装饰器 | @Watch | 内置装饰器，无需导入 | `Watch: (value: string) => PropertyDecorator` | `@State @Watch('onChange') num: number = 0; onChange() { console.info(\`num change to \${this.num}\`); }` | `28_状态管理与渲染控制/03_状态变量变化监听.md` |

## ProvideOptions（@Provide参数）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| @Provide装饰器参数，配置是否支持重写 | ProvideOptions | 内置，无导入 | `{ allowOverride?: string }` | `@Provide({ allowOverride: 'name' }) name: string = 'Tom';` | `28_状态管理与渲染控制/02_状态管理V1装饰器参数.md` |

## aboutToAppear
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件创建后、build()执行前的生命周期回调 | aboutToAppear | 组件内置方法，无需导入 | `aboutToAppear?(): void` | `aboutToAppear() { console.info('component appears'); }` | `25_自定义组件/01_自定义组件的生命周期.md` |

## aboutToDisappear
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件析构销毁时的生命周期回调 | aboutToDisappear | 组件内置方法，无需导入 | `aboutToDisappear?(): void` | `aboutToDisappear() { console.info('component disappears'); }` | `25_自定义组件/01_自定义组件的生命周期.md` |

## build
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件声明式UI描述，必须实现 | build | 组件内置方法，无需导入 | `build(): void` | `build() { Column() { Text('hello').fontSize(20) } }` | `25_自定义组件/01_自定义组件的生命周期.md` |

## LocalStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面级UI状态存储，支持构造函数及get/set/link/prop/delete等操作 | LocalStorage | 内置类，无需导入 | `constructor(initializingProperties?: Object)` / `has(propName: string): boolean` / `get<T>(propName: string): T | undefined` / `set<T>(propName: string, newValue: T): boolean` / `link<T>(propName: string): SubscribedAbstractProperty<T>` / `prop<S>(propName: string): SubscribedAbstractProperty<S>` / `delete(propName: string): boolean` | `let storage: LocalStorage = new LocalStorage({ 'PropA': 47 }); let link = storage.link('PropA');` | `28_状态管理与渲染控制/01_应用级变量的状态管理.md` |

## AppStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用全局的UI状态存储，单例，支持跨页面共享 | AppStorage | 内置单例，无需导入 | `static ref<T>(propName: string): AbstractProperty<T> | undefined` / `static link<T>(propName: string): SubscribedAbstractProperty<T>` / `static prop<T>(propName: string): SubscribedAbstractProperty<T>` / `static setOrCreate<T>(propName: string, newValue: T): void` / `static get<T>(propName: string): T | undefined` / `static has(propName: string): boolean` / `static delete(propName: string): boolean` / `static keys(): IterableIterator<string>` / `static clear(): boolean` | `AppStorage.setOrCreate('PropA', 47); let linkToPropA = AppStorage.link('PropA');` | `28_状态管理与渲染控制/01_应用级变量的状态管理.md` |

## PersistentStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持久化存储UI状态，将AppStorage中属性持久化到文件 | PersistentStorage | 内置单例，无需导入 | `static persistProp<T>(key: string, defaultValue: T): void` / `static deleteProp(key: string): void` / `static persistProps(props: PersistPropsOptions[]): void` / `static keys(): Array<string>` | `PersistentStorage.persistProp('highScore', '0'); PersistentStorage.persistProps([{ key: 'wightScore', defaultValue: '1' }]);` | `28_状态管理与渲染控制/01_应用级变量的状态管理.md` |

## StateManagement（@ohos.arkui.StateManagement）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态管理V2模块，提供AppStorageV2/PersistenceV2/UIUtils | AppStorageV2 / PersistenceV2 / UIUtils | `import { AppStorageV2, PersistenceV2, UIUtils } from '@kit.ArkUI'` | `AppStorageV2.connect<T>(type: TypeConstructorWithArgs<T>, keyOrDefaultCreator?, defaultCreator?): T | undefined` / `PersistenceV2.globalConnect<T>(type: ConnectOptions<T>): T | undefined` / `UIUtils.makeObserved<T>(source: T): T` / `UIUtils.getTarget<T>(source: T): T` / `UIUtils.makeV1Observed<T>(source: T): T` / `UIUtils.makeBinding<T>(getter: GetterCallback<T>, setter?: SetterCallback<T>): Binding<T> | MutableBinding<T>` | `const as1 = AppStorageV2.connect(SampleClass, () => new SampleClass()); PersistenceV2.globalConnect({ type: Sample, defaultCreator: () => new Sample() });` | `01_ArkTS API/01_UI界面/14_ohos.arkui.StateManagement (状态管理).md` |

## @ComponentInit / @ComponentAppear / @ComponentBuilt / @ComponentDisappear（推荐生命周期）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 新推荐的自定义组件生命周期装饰器（API 23+） | @ComponentInit / @ComponentAppear / @ComponentBuilt / @ComponentDisappear | 内置装饰器，无需导入（Stage模型下使用） | `ComponentInit: MethodDecorator` / `ComponentAppear: MethodDecorator` / `ComponentBuilt: MethodDecorator` / `ComponentDisappear: MethodDecorator` | `@ComponentAppear myAppear() { console.info('appear'); }` | `25_自定义组件/02_自定义组件的生命周期（推荐）.md` |

## 模块备注

**状态管理V1装饰器（@State、@Prop、@Link、@Observed、@ObjectLink、@Builder、@BuilderParam、@Consume、@Reusable）** 未在此API参考目录（状态管理与渲染控制/自定义组件/公共定义）中找到独立API参考文档，这些装饰器的完整定义和签名位于开发指南（guides/）中而非API参考（references/）。建议将这些API移至独立的"状态管理V1装饰器"模块中。本地API参考仅包含 @Watch、@Provide参数（ProvideOptions）以及持久化/存储类的API。

**@Builder 和 @BuilderParam** 在API参考中通过 `wrapBuilder` 和 `mutableBuilder` 辅助函数间接引用，但装饰器本身定义在开发指南中。

**@Observed 和 @ObjectLink** 在 `@ohos.arkui.StateManagement` API 的 `UIUtils.makeV1Observed` 和 `UIUtils.enableV2Compatibility` 方法中被引用，但装饰器定义在guides中。

**@Provide 和 @Consume** 仅在 `ProvideOptions` 参数类型中有API参考条目，装饰器本身在guides中。

**@Reusable** 对应的属性 `reuseId()` 和 `reuse()` 方法有API参考文档（通用属性/其他），但 `@Reusable` 装饰器的定义在guides中。

**AppStorage 已废弃的旧式API**（`AppStorage.Link`、`AppStorage.SetAndLink`、`AppStorage.Prop` 等，首字母大写）从API version 10起废弃，应使用小写新式API替代。

**PersistentStorage 旧式API**（`PersistProp`、`DeleteProp` 等，首字母大写）从API version 10起废弃。旧式API `defaultValue` 不能为 null/undefined，新式API从API12开始支持。
