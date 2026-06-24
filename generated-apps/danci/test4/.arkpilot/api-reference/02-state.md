# 02 — State Management & Rendering Control

## @State
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件内状态声明，触发 UI 刷新 | @State | 内置装饰器，无需导入 | `@State variable: T = initialValue` | `@State count: number = 0` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |

## @Prop
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父组件向子组件单向数据传递 | @Prop | 内置装饰器，无需导入 | `@Prop variable: T` | `@Prop name: string` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |

## @Link
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父组件与子组件双向数据同步 | @Link | 内置装饰器，无需导入 | `@Link variable: T` | `@Link count: number` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |

## @Builder / @BuilderParam
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 全局自定义构建函数 | @Builder | 内置装饰器，无需导入 | `@Builder function MyBuilder() { ... }` | `@Builder function TextBuilder(value: string) { Text(value) }` | 25_自定义组件/06_组件扩展装饰器/03_wrapBuilder.md |
| 封装全局 @Builder 用于传递 | wrapBuilder | 内置函数，无需导入 | `wrapBuilder<Args extends Object[]>(builder: (...args: Args) => void): WrappedBuilder<Args>` | `let builderVar = wrapBuilder(MyBuilder)` | 25_自定义组件/06_组件扩展装饰器/03_wrapBuilder.md |
| 实现全局 @Builder 动态切换 | mutableBuilder | 内置函数，无需导入 | `mutableBuilder<Args extends Object[]>(builder: BuilderCallback): MutableBuilder<Args>` | `this.switchingBuilder = mutableBuilder(buttonBuilder)` | 25_自定义组件/06_组件扩展装饰器/04_mutableBuilder.md |
| 组件内自定义构建函数 | @BuilderParam | 内置装饰器，无需导入 | `@BuilderParam content: () => void` | `@BuilderParam header: () => void` | 25_自定义组件/03_自定义组件的自定义布局.md |

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态变量变化时触发回调 | @Watch | 内置装饰器，无需导入 | `Watch: (value: string) => PropertyDecorator` | `@Watch('onChange') num: number = 0` | 28_状态管理与渲染控制/03_状态变量变化监听.md |

## ForEach
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基于数组数据进行循环渲染 | ForEach | 内置组件，无需导入 | `ForEach(arr: Array<any>, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` | `ForEach(this.arr, (item: string) => { Text(item) }, (item: string) => item)` | 28_状态管理与渲染控制/05_ForEach.md |

## 条件渲染（if/else）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据条件渲染不同 UI | if/else | ArkTS 内置语法 | `if (condition) { ... } else { ... }` | `if (this.isVisible) { Text('visible') }` | 28_状态管理与渲染控制/05_ForEach.md |

## @Extend
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 扩展已有组件的能力，添加自定义属性方法 | @Extend | 内置装饰器，无需导入 | `@Extend(ComponentType) function funcName() { ... }` | `@Extend(Text) function style(align: TextAlign) { .textAlign(align) }` | 10_文本与输入/01_Text.md |

## @Styles
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 定义组件内可复用的样式方法 | @Styles | 内置装饰器，无需导入 | `@Styles funcName(): void { .property(value) ... }` | `@Styles normalStyles(): void { .backgroundColor("#0A59F7") }` | 02_通用属性/05_多态样式.md |

## AppStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取 AppStorage 中属性引用 | AppStorage.ref | 全局对象，无需导入 | `static ref<T>(propName: string): AbstractProperty<T> \| undefined` | `AppStorage.ref('PropA')` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 获取/创建属性引用 | AppStorage.setAndRef | 全局对象，无需导入 | `static setAndRef<T>(propName: string, defaultValue: T): AbstractProperty<T>` | `AppStorage.setAndRef('PropB', 49)` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 建立双向数据绑定 | AppStorage.link | 全局对象，无需导入 | `static link<T>(propName: string): SubscribedAbstractProperty<T>` | `AppStorage.link('PropA')` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 建立单向属性绑定 | AppStorage.prop | 全局对象，无需导入 | `static prop<T>(propName: string): SubscribedAbstractProperty<T>` | `AppStorage.prop('PropA')` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 创建或设置属性值 | AppStorage.setOrCreate | 全局对象，无需导入 | `static setOrCreate<T>(propName: string, newValue: T): void` | `AppStorage.setOrCreate('PropA', 47)` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 检查属性是否存在 | AppStorage.has | 全局对象，无需导入 | `static has(propName: string): boolean` | `AppStorage.has('simpleProp')` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 获取属性值 | AppStorage.get | 全局对象，无需导入 | `static get<T>(propName: string): T \| undefined` | `AppStorage.get('PropA')` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 设置属性值 | AppStorage.set | 全局对象，无需导入 | `static set<T>(propName: string, newValue: T): boolean` | `AppStorage.set('PropA', 47)` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 删除属性 | AppStorage.delete | 全局对象，无需导入 | `static delete(propName: string): boolean` | `AppStorage.delete('PropA')` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |
| 列出所有属性名 | AppStorage.keys | 全局对象，无需导入 | `static keys(): IterableIterator<string>` | `AppStorage.keys()` | 28_状态管理与渲染控制/01_应用级变量的状态管理.md |

## @Provide / @Consume
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 祖先组件提供数据给后代 | @Provide | 内置装饰器，无需导入 | `@Provide variable: T` | `@Provide count: number = 0` | 28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |
| 后代组件消费祖先提供的数据 | @Consume | 内置装饰器，无需导入 | `@Consume variable: T` | `@Consume count: number` | 28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |
| @Provide 支持重写配置 | ProvideOptions | 内置装饰器参数 | `{ allowOverride: string }` | `@Provide({ allowOverride: 'overrideVar' }) count: number = 0` | 28_状态管理与渲染控制/02_状态管理V1装饰器参数.md |

## Module Notes

- @State, @Prop, @Link, @Builder, @BuilderParam 装饰器本身在 references 目录下没有独立的 API 签名文档页，其详细用法和限制请参考开发者指南中的 ArkTS 状态管理章节。references 目录只包含了 ProvideOptions 参数类型定义和 wrapBuilder/mutableBuilder 的包装工具 API。
- @Extend 和 @Styles 在 references 中没有独立文档，仅在其他组件文档的示例代码中出现。@Extend 用于扩展原生组件的属性方法（如 `@Extend(Text)`），@Styles 用于定义组件内可复用的样式方法。
- AppStorage 的完整 API（ref, setAndRef, link, setAndLink, prop, setAndProp, has, get, set, setOrCreate, delete, keys, size, clear）在 01_应用级变量的状态管理.md 中有完整参考文档。
- PersistentStorage、LocalStorage、Environment 的 API 也包含在上述同一文档中，但本模块仅覆盖 AppStorage 和 @Provide/@Consume。
