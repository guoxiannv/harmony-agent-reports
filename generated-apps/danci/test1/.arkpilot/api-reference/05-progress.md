# 05 — Progress Indicators & Stats Display

## Progress
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基础进度条组件 | Progress | 内置组件（无需导入） | `Progress(options: ProgressOptions)` | `Progress({ value: 10, type: ProgressType.Linear }).width(200)` | 12_信息展示/10_Progress.md |

## ProgressOptions
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 进度条配置参数 | ProgressOptions | 内置类型（无需导入） | `{ value: number, total?: number, type?: ProgressType, style?: ProgressStyle }` | `Progress({ value: 20, total: 150, type: ProgressType.Capsule })` | 12_信息展示/10_Progress.md |

## ProgressType
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 进度条类型枚举 | ProgressType | 内置枚举（无需导入） | `enum ProgressType { Linear, Ring, Eclipse, ScaleRing, Capsule }` | `ProgressType.Linear` / `ProgressType.Ring` | 12_信息展示/10_Progress.md |

## ProgressStyle（已废弃）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 进度条样式枚举（已废弃，推荐使用 type） | ProgressStyle | 内置枚举（无需导入） | `enum ProgressStyle { Linear, Ring, Eclipse, ScaleRing, Capsule }` | `ProgressStyle.Linear`（deprecated） | 12_信息展示/10_Progress.md |

## .style() — 属性方式
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置进度条样式选项 | .style() | 属性方法 | `.style(value: ProgressStyleOptions/CapsuleStyleOptions/RingStyleOptions/LinearStyleOptions/ScaleRingStyleOptions/EclipseStyleOptions)` | `.style({ strokeWidth: 15, scaleCount: 15, scaleWidth: 5 })` | 12_信息展示/10_Progress.md |

## .color() — 属性方式
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置进度条前景色（支持渐变） | .color() | 属性方法 | `.color(value: ResourceColor/LinarGradient)` | `.color(Color.Grey)` 或 `.color(this.gradientColor)` | 12_信息展示/10_Progress.md |

## .value() — 属性方式
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 动态设置当前进度值 | .value() | 属性方法 | `.value(value: number)` | `.value(50)` | 12_信息展示/10_Progress.md |

## Shape
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 绘制组件的父容器（类似 SVG） | Shape | 内置组件（无需导入） | `Shape(value?: PixelMap)` | `Shape() { Rect().width(300).height(50) }.viewPort({ x: -2, y: -2, width: 304, height: 130 })` | 15_图形绘制/08_Shape.md |

## Circle
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 圆形绘制组件 | Circle | 内置组件（无需导入） | `Circle(value?: CircleOptions)` | `Circle({ width: 150, height: 150 })` | 15_图形绘制/01_Circle.md |

## Rect
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 矩形绘制组件 | Rect | 内置组件（无需导入） | `Rect(options?: RectOptions/RoundedRectOptions)` | `Rect({ width: '90%', height: 50 }).fill(Color.Pink)` | 15_图形绘制/07_Rect.md |

## .stroke() — Shape/Circle/Rect 属性
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置图形边框颜色 | .stroke() | 属性方法 | `.stroke(value: ResourceColor)` | `.stroke(Color.Red)` | 15_图形绘制/08_Shape.md |

## .strokeWidth() — Shape/Circle/Rect 属性
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置图形边框宽度 | .strokeWidth() | 属性方法 | `.strokeWidth(value: Length)` | `.strokeWidth(3)` | 15_图形绘制/08_Shape.md |

## Text（用于统计数据展示）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文本展示组件，可用于进度/统计数字显示 | Text | 内置组件（无需导入） | `Text(content?: string/Resource)` | `Text('当前进度：' + config.value + '/' + config.total).fontSize(20)` | 10_文本与输入/01_Text.md |

## 模块说明

- `Progress.Bar` 和 `Progress.Circular` 不作为独立 API 存在。条状进度条使用 `ProgressType.Linear`，环形进度条使用 `ProgressType.Ring` 或 `ProgressType.ScaleRing`。
- 所有图形绘制组件（Shape/Circle/Rect）均为内置 ArkUI 组件，无需 import 语句，直接使用即可。
- `.style()` 是 Progress 组件的属性方法，接受各类型对应的 StyleOptions 对象，用于配置 `strokeWidth`、`scaleCount`、`scaleWidth`、`shadow`、`enableSmoothEffect`、`status` 等。
- `ProgressStyle` 枚举从 API version 8 起废弃，统一使用 `ProgressType` 枚举替代。
- `CapsuleStyleOptions` 支持内置文本（`content`/`font`/`fontColor`）和百分比显示（`showDefaultPercentage`）。
