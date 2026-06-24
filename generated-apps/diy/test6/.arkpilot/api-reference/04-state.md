# 04 — State Management & Reactivity

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 状态变量变化监听（V1） | @Watch | 内置装饰器，无需导入 | `Watch: (value: string) => PropertyDecorator` | `@State @Watch('onChange') num: number = 0;` | `28_状态管理与渲染控制/03_状态变量变化监听.md` |

## @State
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件内可变状态装饰器（V1） | @State | 内置装饰器，无需导入 | 装饰器语法 `@State variable: T = value` | `@State count: number = 0;` | 开发指南而非 API 参考文档 |

## @Prop
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父→子单向同步装饰器（V1） | @Prop | 内置装饰器，无需导入 | 装饰器语法 `@Prop variable: T` | `@Prop count: number;` | 开发指南而非 API 参考文档 |

## @Link
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父→子双向同步装饰器（V1） | @Link | 内置装饰器，无需导入 | 装饰器语法 `@Link variable: T` | `@Link count: number;` | 开发指南而非 API 参考文档 |

## @Provide/@Consume
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 跨级祖先→后代状态传递装饰器（V1） | @Provide/@Consume | 内置装饰器，无需导入 | 装饰器语法 `@Provide variable: T` / `@Consume variable: T` | `@Provide count: number = 0;` / `@Consume count: number;` | `28_状态管理与渲染控制/02_状态管理V1装饰器参数.md` |

## AppStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用全局 UI 状态存储 | AppStorage | 无需导入，全局单例 | `static ref<T>(propName: string): AbstractProperty<T> \| undefined` | `AppStorage.setOrCreate('PropA', 47);` | `28_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 获取应用全局状态的双向绑定 | AppStorage.link | 同上 | `static link<T>(propName: string): SubscribedAbstractProperty<T>` | `let link = AppStorage.link('PropA');` | 同上 |
| 获取应用全局状态的单向绑定 | AppStorage.prop | 同上 | `static prop<T>(propName: string): SubscribedAbstractProperty<T>` | `let prop = AppStorage.prop('PropA');` | 同上 |

## LocalStorage
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility 级 UI 状态存储 | LocalStorage | 无需导入 | `constructor(initializingProperties?: Object)` | `let storage = new LocalStorage({ count: 0 });` | `28_状态管理与渲染控制/01_应用级变量的状态管理.md` |
| 获取 LocalStorage 双向绑定 | LocalStorage.link | 同上 | `link<T>(propName: string): SubscribedAbstractProperty<T>` | `let link = storage.link('count');` | 同上 |
| 获取 LocalStorage 单向绑定 | LocalStorage.prop | 同上 | `prop<T>(propName: string): SubscribedAbstractProperty<T>` | `let prop = storage.prop('count');` | 同上 |

## @StorageLink/@StorageProp
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件与 AppStorage 双向绑定装饰器 | @StorageLink | 内置装饰器，无需导入 | `@StorageLink(propName: string) variable: T` | `@StorageLink('PropA') count: number = 0;` | 同 `01_应用级变量的状态管理.md`，实际 API 在开发指南 |
| 组件与 AppStorage 单向绑定装饰器 | @StorageProp | 内置装饰器，无需导入 | `@StorageProp(propName: string) variable: T` | `@StorageProp('PropA') count: number = 0;` | 同 `01_应用级变量的状态管理.md`，实际 API 在开发指南 |

## @ObjectLink/@Observed
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可观察类装饰器（V1） | @Observed | 内置装饰器，无需导入 | `@Observed class ClassName {}` | `@Observed class Item { name: string = ''; }` | 开发指南而非 API 参考文档 |
| 子组件接收可观察对象引用（V1） | @ObjectLink | 内置装饰器，无需导入 | `@ObjectLink variable: T` | `@ObjectLink item: Item;` | 开发指南而非 API 参考文档 |

## @Builder/@BuilderParam
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义构建函数装饰器 | @Builder | 内置装饰器，无需导入 | 装饰器语法 `@Builder functionName() {}` | `@Builder MyBuilder() { Text('hello'); }` | 开发指南而非 API 参考文档 |
| 自定义构建函数引用装饰器 | @BuilderParam | 内置装饰器，无需导入 | `@BuilderParam builder: () => void` | `@BuilderParam content: () => void;` | 开发指南而非 API 参考文档 |

## ForEach
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数组数据循环渲染 | ForEach | 内置接口，无需导入 | `ForEach(arr: Array<any>, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` | `ForEach(this.arr, (item: string) => { Text(item) }, (item: string) => item)` | `28_状态管理与渲染控制/05_ForEach.md` |

## LazyForEach
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 懒加载数据源迭代渲染 | LazyForEach | 内置接口，无需导入 | `LazyForEach(dataSource: IDataSource, itemGenerator: (item: any, index: number) => void, keyGenerator?: (item: any, index: number) => string)` | `LazyForEach(this.dataSource, (item: string) => { Text(item) })` | `28_状态管理与渲染控制/06_LazyForEach.md` |

## 模块备注

多数 V1 装饰器（@State、@Prop、@Link、@Provide/@Consume、@ObjectLink、@Observed）在 `harmonyos-references` 中没有独立 API 参考页面，其签名和用法仅记录在 ArkUI 开发指南（arkts-guides）中。本模块记录的来源文件均指向 `28_状态管理与渲染控制/` 目录下能找到的 API 参考文件。缺少参考文件的装饰器已在对应表格中标注。
