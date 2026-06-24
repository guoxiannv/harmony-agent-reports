# 02 — State & Reactive Decorators

## @Entry
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将自定义组件声明为UI页面入口，每个页面仅允许一个@Entry | @Entry | 无需导入，ArkUI内建装饰器 | `@Entry` 或 `@Entry({ routeName?: string, storage?: LocalStorage, useSharedStorage?: boolean })` | `@Entry @Component struct Index { build() { Text('Hello') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/02_Entry：页面入口.md |

## @Watch
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 监听@State状态变量的变化，值变化时触发指定回调函数 | @Watch | 无需导入，ArkUI内建装饰器 | `Watch: (value: string) => PropertyDecorator` — value为回调函数名 | `@State @Watch('onChange') num: number = 0; onChange() { console.info(\`num change to ${this.num}\`); }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/28_状态管理与渲染控制/03_状态变量变化监听.md |

## @Component
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将一个结构体声明为自定义组件，必须搭配build()方法 | @Component | 无需导入，ArkUI内建装饰器 | `@Component` 或 `@Component({ freezeWhenInactive?: boolean })` — ComponentOptions参数控制冻结 | `@Component struct MyComp { build() { Text('Hello') } }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/05_自定义组件参数.md |

## @State
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 声明组件内部状态变量，变化时自动触发UI重新渲染 | @State | 无需导入，ArkUI内建装饰器 | `@State variable: T` — 支持Class、number、boolean、string及其数组 | `@State count: number = 0;` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## @Prop
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 父组件向子组件传递数据的单向绑定装饰器 | @Prop | 无需导入，ArkUI内建装饰器 | `@Prop variable: T` — 从父组件@State变量初始化，子组件修改不会同步回父组件 | `@Prop value: string;` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/01_自定义组件的生命周期.md |

## @Builder
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 定义自定义构建函数，用于封装重复UI结构 | @Builder | 无需导入，ArkUI内建装饰器 | `@Builder` functionName() / 全局或成员方法 | `@Builder function MyBuilder(value: string) { Text(value) }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/03_wrapBuilder.md |

### Module Notes

- @State、@Prop、@Builder、@Component、@Entry、@Watch 均为 ArkUI 状态管理 V1 的内建装饰器，**无需 import 语句**，直接在 struct 上或 struct 内部使用。
- @State、@Prop、@Component、@Builder 四个装饰器在 harmonyos-references 参考文档中**没有独立的 API 定义文件**（即不存在以这些装饰器名为标题的 .md 文件）。它们的具体签名和详细用法仅记录在 harmonyos-guides 开发指南中（不在本参考文档集内）。本表中的签名来源于参考文档中出现的示例用法。
- @Watch 和 @Entry 有独立的参考文档文件，分别位于状态管理和组件扩展装饰器目录中。
- @Builder 在参考文档中没有独立的装饰器定义，但 `wrapBuilder.md` 提供了对 `@Builder` 全局函数的包装能力，间接证实了 `@Builder` 的存在和用法。
- 状态管理 V2 的对应装饰器（@ComponentV2、@Local、@Param、@ObservedV2、@Trace 等）属于另一个体系，定义在 `@ohos.arkui.StateManagement` 模块中（需 `import { ... } from '@kit.ArkUI'`）。
