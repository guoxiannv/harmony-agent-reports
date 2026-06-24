# 03 — State Management & Lifecycle

## @Entry
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面入口标识，一个UI页面仅允许一个@Entry装饰的自定义组件 | @Entry | 框架内置，无需导入 | `@Entry` (装饰器) / `EntryOptions: { routeName?: string; storage?: LocalStorage; useSharedStorage?: boolean }` | `@Entry @Component struct Index { build() { Text('Hello') } }` | `25_自定义组件/06_组件扩展装饰器/02_Entry：页面入口.md` |

## @Component
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 标识一个结构体为自定义组件，配合freezeWhenInactive支持组件冻结 | @Component / ComponentOptions | 框架内置，无需导入 | `ComponentOptions: { freezeWhenInactive?: boolean }` | `@Component struct MyComp { build() { ... } }` 或 `@Component({ freezeWhenInactive: true })` | `25_自定义组件/05_自定义组件参数.md` |

## build()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件必须实现的声明式UI描述方法 | build | 框架内置 | `build(): void` | `build() { Column() { Text('Hello') } }` | `25_自定义组件/01_自定义组件的生命周期.md` |

## aboutToAppear()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件创建后、build()执行前调用，可在此修改状态变量 | aboutToAppear | 框架内置 | `aboutToAppear?(): void` | `aboutToAppear() { this.message = 'loaded'; }` | `25_自定义组件/01_自定义组件的生命周期.md` |

## aboutToDisappear()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义组件析构销毁时执行，不建议在此修改状态变量 | aboutToDisappear | 框架内置 | `aboutToDisappear?(): void` | `aboutToDisappear() { console.info('bye'); }` | `25_自定义组件/01_自定义组件的生命周期.md` |

## ForEach
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基于数组数据进行循环渲染，需与容器组件配合 | ForEach | 框架内置 | `ForEach(arr: Array\<any\>, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` | `ForEach(this.arr, (item: string) => { Text(item) }, (item: string) => item)` | `28_状态管理与渲染控制/05_ForEach.md` |

## LazyForEach
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 懒加载循环渲染，适用于大数据量场景 | LazyForEach | 框架内置 | `LazyForEach(dataSource: IDataSource, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` | `LazyForEach(this.dataSource, (item: string) => { Text(item) })` | `28_状态管理与渲染控制/06_LazyForEach.md` |

## @Preview
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 装饰自定义组件实现IDE组件预览 | @Preview | 框架内置 | `@Preview` (装饰器) / `PreviewParams: { title?: string; width?: number; height?: number; deviceType?: string; ... }` | `@Preview @Component struct Test { build() { Text('preview') } }` | `26_组件预览/01_组件预览.md` |

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态管理V1中监听状态变量变化 | @Watch | 框架内置 | `Watch: (value: string) => PropertyDecorator` | `@State @Watch('onChange') num: number = 0; onChange() { ... }` | `28_状态管理与渲染控制/03_状态变量变化监听.md` |

## AppStorage / LocalStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用级/页面级UI状态存储，支持link/prop/ref等操作 | AppStorage / LocalStorage | 框架内置 | `AppStorage.link(propName): SubscribedAbstractProperty\<T\>` / `LocalStorage(initializingProperties?)` | `AppStorage.setOrCreate('PropA', 47); let link = AppStorage.link('PropA');` | `28_状态管理与渲染控制/01_应用级变量的状态管理.md` |

## wrapBuilder (@Builder 包装器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 封装全局@Builder函数为WrappedBuilder对象，便于传递和使用 | wrapBuilder | 框架内置 | `wrapBuilder\<Args extends Object[]\>(builder: (...args: Args) => void): WrappedBuilder\<Args\>` | `@Builder function MyBuilder(v: string) { Text(v) } let w = wrapBuilder(MyBuilder);` | `25_自定义组件/06_组件扩展装饰器/03_wrapBuilder.md` |

## mutableBuilder (@Builder 动态切换)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 实现全局@Builder动态切换，继承自WrappedBuilder | mutableBuilder | 框架内置 | `mutableBuilder\<Args extends Object[]\>(builder: BuilderCallback): MutableBuilder\<Args\>` | `let switchingBuilder = mutableBuilder(textBuilder);` | `25_自定义组件/06_组件扩展装饰器/04_mutableBuilder.md` |

## 模块说明
- **@State, @Prop, @Link, @Builder, @BuilderParam, @Observed, @ObjectLink, @Reusable, @LocalStorageProp, @LocalStorageLink, if/else 条件渲染, @PreviewGroup**: 这些装饰器和语法在当前API参考文档树中**无独立API参考页面**，仅在开发者指南(developer.huawei.com/consumer/cn/doc/harmonyos-guides/)中详细文档化，或在API参考示例中引用。其完整指导位于`arkts-state-management`, `arkts-builder`, `arkts-rendering-control-ifelse`, `arkts-reusable`, `arkts-appstorage`等开发者指南页。
- **@ForEach**的`keyGenerator`默认规则：`(item: T, index: number) => { return index + '__' + JSON.stringify(item); }`
- **aboutToAppear**中允许修改状态变量，修改将在后续build()中生效；**aboutToDisappear**中不建议修改@Link变量
- **build()**方法中不能调用async函数或产生副作用
