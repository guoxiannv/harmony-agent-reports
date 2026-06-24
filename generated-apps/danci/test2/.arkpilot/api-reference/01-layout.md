# 01 — Layout Components

## Flex
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 弹性布局容器，高效排列对齐子元素并分配剩余空间 | Flex | 内置组件，无需额外导入 | `Flex(value?: FlexOptions)` | `Flex({ direction: FlexDirection.Row }) { Text('1').width('20%').height(50) }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/01_Flex.md |

## Column
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿垂直方向布局的容器，可设置子组件间距 | Column | 内置组件，无需额外导入 | `Column(options?: ColumnOptions)` | `Column({ space: 5 }) { Text('content').width('90%') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/02_Column.md |

## Row
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 沿水平方向布局的容器，可设置子组件间距 | Row | 内置组件，无需额外导入 | `Row(options?: RowOptions)` | `Row({ space: 5 }) { Row().width('30%').height(50) }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/03_Row.md |

## Stack
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 堆叠容器，子组件按顺序依次入栈，后一个覆盖前一个 | Stack | 内置组件，无需额外导入 | `Stack(options?: StackOptions)` | `Stack({ alignContent: Alignment.Bottom }) { Text('child') }` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/04_行列与堆叠/04_Stack.md |

## Scroll
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可滚动的容器组件，子组件尺寸超出父组件时内容可滚动 | Scroll | 内置组件，无需额外导入；Scroller 控制器为内置类 | `Scroll(scroller?: Scroller)` | `Scroll(this.scroller) { Column() { ... } }.scrollable(ScrollDirection.Vertical)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/07_滚动与滑动/08_Scroll.md |

## Module Notes

- Flex、Column、Row 均为内置 ArkUI 组件，无需 import 语句即可使用。
- Flex 渲染时有二次布局过程，对性能要求高的场景建议用 Column/Row 替代。
- Column 默认 alignItems 为 HorizontalAlign.Center；Row 默认 alignItems 为 VerticalAlign.Center。
- Scroll 默认 clip 为 true，默认 scrollable 方向为 ScrollDirection.Vertical。
- Scroll 的 Scroller 控制器需要 `new Scroller()` 创建实例，绑定到组件后通过 scrollTo/scrollBy/scrollEdge 等接口控制滚动。
