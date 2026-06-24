# 01 — Layout & Container Components

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 垂直方向线性布局容器 | Column | 内置 ArkUI 组件，无需额外 import | `Column(options?: ColumnOptions)` 可设置子组件垂直方向间距（space: string \| number，默认 0，单位 vp） | `Column({ space: 5 }) { Text('1').width('90%').height(30) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md` |

## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 水平方向线性布局容器 | Row | 内置 ArkUI 组件，无需额外 import | `Row(options?: RowOptions)` 可设置子组件水平方向间距（space: string \| number，默认 0，单位 vp） | `Row({ space: 5 }) { Text('1').width('30%').height(50) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/03_Row.md` |

## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，子组件按顺序入栈覆盖 | Stack | 内置 ArkUI 组件，无需额外 import | `Stack(options?: StackOptions)` 可设置子组件对齐方式（alignContent: Alignment，默认 Alignment.Center） | `Stack({ alignContent: Alignment.Bottom }) { Text('child').width('90%').height('100%') }.syncLoad(true)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/04_Stack.md` |

## Flex
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器，排列对齐子元素并分配剩余空间 | Flex | 内置 ArkUI 组件，无需额外 import | `Flex(value?: FlexOptions)` 参数包含 direction、wrap、justifyContent、alignItems、alignContent、space | `Flex({ direction: FlexDirection.Row }) { Text('1').width('20%').height(50) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/01_Flex.md` |

## Blank
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 空白填充组件，自动填充容器空余空间 | Blank | 内置 ArkUI 组件，无需额外 import | `Blank(min?: number \| string)` min 为容器主轴上的最小大小，默认 0，支持 px/vp | `Blank().color(Color.Yellow)` / `Blank('160')` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/01_Blank.md` |

## Divider
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 分割线组件，分割不同内容块/内容元素 | Divider | 内置 ArkUI 组件，无需额外 import | `Divider()` 支持属性：vertical（方向）、color、strokeWidth（宽度）、lineCap（端点样式） | `Divider().strokeWidth(8).color('#F1F3F5')` / 垂直分割线：`Divider().vertical(true).height(22)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/13_空白与分隔/02_Divider.md` |

## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动容器组件，内容超过父组件时可滚动 | Scroll | 内置 ArkUI 组件，无需额外 import | `Scroll(scroller?: Scroller)` 支持 scrollable（方向）、scrollBar、edgeEffect、friction、nestedScroll 等，需 Scroller 控制器 | `Scroll(this.scroller) { Column() { /* content */ } }.scrollable(ScrollDirection.Vertical).scrollBar(BarState.On)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/08_Scroll.md` |

## 模块说明

- 所有组件均为 ArkUI 内置组件，无需显式 import。但使用 Flex 的 `space` 属性时需导入 `LengthMetrics`：`import { LengthMetrics } from '@kit.ArkUI'`。
- Scroll 需要一个 `Scroller` 控制器实例：`scroller: Scroller = new Scroller()`，控制器导入路径为 `@kit.ArkUI`（内置类型无需独立 import）。
- Flex 在渲染时有二次布局过程，对性能要求严格的场景建议用 Column/Row 替代。
- Column/Row 不设宽高时在主轴/交叉轴方向自适应子组件大小；Flex 不设主轴长度时默认撑满父容器。
- Blank 仅在父组件为 Row/Column/Flex 时生效，且只作用于容器主轴方向。
- Divider 的 `strokeWidth` 控制分割线的粗细，水平分割线时控制高度，垂直分割线时控制宽度。
- 所有 API 均从 API version 7 开始支持，元服务支持从 API version 11 开始。
