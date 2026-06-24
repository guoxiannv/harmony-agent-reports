# 06 — 统计图表 Stats Charts

## Canvas
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 画布容器，用于自定义绘制统计图表 | Canvas | 内置组件，无需导入 | `Canvas(context?: CanvasRenderingContext2D \| DrawingRenderingContext)` | `Canvas(this.context).width('100%').height(300)` | `02_ArkTS组件/14_画布绘制/01_Canvas.md` |

## CanvasRenderingContext2D
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 画布绘制上下文，提供形状、文本、图片等绘制方法 | CanvasRenderingContext2D | `import { LengthMetricsUnit } from '@kit.ArkUI'`（可选） | `constructor(settings?: RenderingContextSettings)` | `private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)` | `02_ArkTS组件/14_画布绘制/04_CanvasRenderingContext2D.md` |

**关键绘制方法（适用于统计图表）：** `fillRect(x,y,w,h)` 填充矩形（柱状图）；`strokeRect` 描边矩形；`clearRect` 清除区域；`beginPath/moveTo/lineTo/closePath` 路径绘制（折线图）；`arc(x,y,radius,startAngle,endAngle)` 绘制弧线（饼图）；`fill/stroke` 填充/描边路径；`fillText/strokeText` 绘制文本标签；`measureText` 测量文本宽度；`createLinearGradient/createRadialGradient` 创建渐变色。**只写属性**：`fillStyle`（填充色）、`strokeStyle`（描边色）、`lineWidth`（线宽）、`font`（字体，默认`'normal normal 14px sans-serif'`）、`globalAlpha`（透明度）、`textAlign/textBaseline`（文本对齐）。坐标默认单位 vp。

## Path
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路径绘制组件，根据绘制命令字符串生成封闭自定义形状 | Path | 内置组件，无需导入 | `Path(options?: PathOptions)` | `Path({ commands: 'M100 100 L200 100 L150 200 Z' }).fill('#0097FF')` | `02_ArkTS组件/15_图形绘制/06_Path.md` |

## Shape
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 绘制组件的父容器，实现类似 SVG 效果，可包含 Rect/Path/Circle 等子组件 | Shape | 内置组件，无需导入 | `Shape(value?: PixelMap)` | `Shape() { Circle().fill('#0097FF'); Rect().fill('#FF6B35') }.viewPort({ x:0, y:0, width:300, height:200 })` | `02_ArkTS组件/15_图形绘制/08_Shape.md` |

## Circle
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 圆形绘制组件，可用于饼图标记或数据点图形 | Circle | 内置组件，无需导入 | `Circle(value?: CircleOptions)` | `Circle({ width: 30, height: 30 }).fill('#0097FF')` | `02_ArkTS组件/15_图形绘制/01_Circle.md` |

## Rect
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 矩形绘制组件，支持圆角，可用于柱状图/条形图的图形元素 | Rect | 内置组件，无需导入 | `Rect(options?: RectOptions \| RoundedRectOptions)` | `Rect({ width: 50, height: 200, radius: 4 }).fill('#0097FF')` | `02_ArkTS组件/15_图形绘制/07_Rect.md` |

## LoadingProgress
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 加载动效组件，用于图表数据加载中的状态提示 | LoadingProgress | 内置组件，无需导入 | `LoadingProgress()` | `LoadingProgress().color('#0097FF').width(30).height(30)` | `02_ArkTS组件/12_信息展示/07_LoadingProgress.md` |

## Text
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文本显示组件，用于图表轴标签、数据标签、标题等 | Text | 内置组件，无需导入 | `Text(content?: string \| Resource, value?: TextOptions)` | `Text('¥12,345').fontSize(14).fontColor('#1A1A1A').fontWeight(FontWeight.Medium)` | `02_ArkTS组件/10_文本与输入/01_Text.md` |

## Span
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Text 子组件，行内文本片段，用于图表工具提示/数值+单位混排 | Span | 内置组件（Text 子组件） | `Span(value: string \| Resource)` | `Text() { Span('收入：').fontSize(12); Span('¥12,345').fontSize(16).fontColor('#FF6B35') }` | `02_ArkTS组件/10_文本与输入/06_Span.md` |

## Image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片组件，可用于图表图例图标、装饰性图标 | Image | 内置组件，无需导入 | `Image(src: PixelMap \| ResourceStr \| DrawableDescriptor)` | `Image($r('app.media.ic_chart_bar')).width(20).height(20).fillColor('#FF6B35')` | `02_ArkTS组件/11_图片与视频/01_Image.md` |

## DataPanel
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 数据占比图组件，支持线型和环形两种样式，最多9个数据项 | DataPanel | 内置组件，无需导入 | `DataPanel(options: DataPanelOptions)` | `DataPanel({ values: [30, 50, 20], max: 100, type: DataPanelType.Circle })` | `02_ArkTS组件/12_信息展示/05_DataPanel.md` |

## 模块说明

- **ProgressIndicator** 在本地文档中未找到。该 API 名可能为 HarmonyOS 早期/废弃 API。统计图表中推荐使用 `Progress` 组件（`Progress({ value: 50, total: 100, type: ProgressType.Linear })`）实现进度指示，或使用 `DataPanel` 实现环形占比图。
- **CanvasRenderingContext2D** 是统计图表自定义绘制的核心 API，柱状图使用 `fillRect`，折线图使用 `beginPath/moveTo/lineTo/stroke`，饼图使用 `arc/fill`。
- **DataPanel** 是 ArkUI 内置的数据占比图组件，支持 Circle（环形）和 Line（线型）两种类型，直接提供数值即可展示，无需自定义 Canvas 绘制。
- **Circle/Rect/Path** 作为 Shape 的子组件，适合在 Shape 容器中组合使用，实现 SVG 风格的统计图形。
