# 08 — Charts & Graphics

## Canvas
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 画布组件，用于自定义绘制图形 | Canvas | 内置 ArkUI 组件（无需额外 import） | `Canvas(context?: CanvasRenderingContext2D \| DrawingRenderingContext)` | `<Canvas(this.context).width('100%').height('100%').backgroundColor('#ffff00').onReady(() => { this.context.fillRect(20, 20, 150, 100) })>` | 14_画布绘制/01_Canvas.md |
| 使用 CanvasParams 创建不缓存指令的 Canvas | Canvas23+ | 内置 ArkUI 组件 | `Canvas(params: CanvasParams)` | — | 14_画布绘制/01_Canvas.md |
| 支持 AI 分析的 Canvas | Canvas12+ | 内置 ArkUI 组件 | `Canvas(context: CanvasRenderingContext2D \| DrawingRenderingContext, imageAIOptions: ImageAIOptions)` | — | 14_画布绘制/01_Canvas.md |

## CanvasRenderingContext2D
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 与 Canvas 绑定的 2D 渲染上下文，绘制形状/文本/图片 | CanvasRenderingContext2D | 内置类型（new 构造） | `constructor(settings?: RenderingContextSettings)` | `private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 带单位模式的构造 | CanvasRenderingContext2D12+ | 内置类型 | `constructor(settings?: RenderingContextSettings, unit?: LengthMetricsUnit)` | `new CanvasRenderingContext2D(this.settings, LengthMetricsUnit.PX)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 填充矩形 | fillRect | CanvasRenderingContext2D | `fillRect(x: number, y: number, w: number, h: number): void` | `context.fillRect(30, 30, 100, 100)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 绘制矩形边框 | strokeRect | CanvasRenderingContext2D | `strokeRect(x: number, y: number, w: number, h: number): void` | `context.strokeRect(25, 25, 85, 105)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 清空矩形区域 | clearRect | CanvasRenderingContext2D | `clearRect(x: number, y: number, w: number, h: number): void` | `context.clearRect(10, 10, 50, 50)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 创建新路径 | beginPath | CanvasRenderingContext2D | `beginPath(): void` | `context.beginPath()` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 路径移动 | moveTo | CanvasRenderingContext2D | `moveTo(x: number, y: number): void` | `context.moveTo(30, 50)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 路径画线 | lineTo | CanvasRenderingContext2D | `lineTo(x: number, y: number): void` | `context.lineTo(220, 50)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 闭合路径 | closePath | CanvasRenderingContext2D | `closePath(): void` | `context.closePath()` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 绘制弧线/圆 | arc | CanvasRenderingContext2D | `arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void` | `context.arc(100, 75, 50, 0, 6.28)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 三次贝塞尔曲线 | bezierCurveTo | CanvasRenderingContext2D | `bezierCurveTo(cp1x: number, cp1y: number, cp2x: number, cp2y: number, x: number, y: number): void` | — | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 二次贝塞尔曲线 | quadraticCurveTo | CanvasRenderingContext2D | `quadraticCurveTo(cpx: number, cpy: number, x: number, y: number): void` | — | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 椭圆路径 | ellipse | CanvasRenderingContext2D | `ellipse(x: number, y: number, radiusX: number, radiusY: number, rotation: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void` | — | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 矩形路径 | rect | CanvasRenderingContext2D | `rect(x: number, y: number, w: number, h: number): void` | `context.rect(20, 20, 100, 100)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 圆角矩形路径 | roundRect20+ | CanvasRenderingContext2D | `roundRect(x: number, y: number, w: number, h: number, radii: number \| Radii): void` | — | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 填充当前路径 | fill | CanvasRenderingContext2D | `fill(fillRule?: CanvasFillRule): void` | `context.fill()` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 填充指定 Path2D | fill (with path) | CanvasRenderingContext2D | `fill(path: Path2D, fillRule?: CanvasFillRule): void` | — | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 描边当前路径 | stroke | CanvasRenderingContext2D | `stroke(): void` | `context.stroke()` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 描边指定 Path2D | stroke (with path) | CanvasRenderingContext2D | `stroke(path: Path2D): void` | `context.stroke(path2D)` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 填充文本 | fillText | CanvasRenderingContext2D | `fillText(text: string \| Resource, x: number, y: number, maxWidth?: number): void` | — | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 描边文本 | strokeText | CanvasRenderingContext2D | `strokeText(text: string \| Resource, x: number, y: number, maxWidth?: number): void` | — | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 填充色属性 | fillStyle | CanvasRenderingContext2D | `fillStyle: string \| number \| CanvasGradient \| CanvasPattern` | `context.fillStyle = '#0000ff'` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 描边色属性 | strokeStyle | CanvasRenderingContext2D | `strokeStyle: string \| number \| CanvasGradient \| CanvasPattern` | `context.strokeStyle = '#0000ff'` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 线宽属性 | lineWidth | CanvasRenderingContext2D | `lineWidth: number` | `context.lineWidth = 5` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 线端样式 | lineCap | CanvasRenderingContext2D | `lineCap: CanvasLineCap` ('butt'/'round'/'square') | `context.lineCap = 'round'` | 14_画布绘制/04_CanvasRenderingContext2D.md |
| 交点样式 | lineJoin | CanvasRenderingContext2D | `lineJoin: CanvasLineJoin` ('round'/'bevel'/'miter') | — | 14_画布绘制/04_CanvasRenderingContext2D.md |

## Path (绘制组件)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路径绘制组件，生成封闭的自定义形状 | Path | 内置 ArkUI 组件 | `Path(options?: PathOptions)` | `Path({ width: 200, height: 200, commands: 'M0 0 L100 0 L100 100 Z' }).fill(Color.Blue)` | 15_图形绘制/06_Path.md |
| Path 命令字符串 | commands | Path 属性 | `commands: ResourceStr` (SVG 路径命令) | — | 15_图形绘制/06_Path.md |

## Rect (绘制组件)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 矩形绘制组件 | Rect | 内置 ArkUI 组件 | `Rect(options?: RectOptions \| RoundedRectOptions)` | `Rect({ width: 100, height: 100, radius: 10 }).fill(Color.Red)` | 15_图形绘制/07_Rect.md |

## Circle (绘制组件)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 圆形绘制组件 | Circle | 内置 ArkUI 组件 | `Circle(value?: CircleOptions)` | `Circle({ width: 100, height: 100 }).fill(Color.Blue)` | 15_图形绘制/01_Circle.md |

## Line (绘制组件)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 直线绘制组件 | Line | 内置 ArkUI 组件 | `Line(options?: LineOptions)` | `Line().startPoint([0, 0]).endPoint([100, 100]).stroke(Color.Red)` | 15_图形绘制/03_Line.md |

## Shape (绘制父组件)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 绘制组件的父组件，类似 SVG 效果 | Shape | 内置 ArkUI 组件 | `Shape(value?: PixelMap)` | `<Shape().viewPort({ x: 0, y: 0, width: 200, height: 200 }) { Circle().fill(Color.Blue) }>` | 15_图形绘制/08_Shape.md |
| Shape 视口 | viewPort | Shape 属性 | `viewPort: ViewportRect` (x / y / width / height) | — | 15_图形绘制/08_Shape.md |

## Path2D
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Canvas 路径对象，通过 stroke/fill 绘制 | Path2D | 内置类型（new 构造） | `constructor()` / `constructor(path: Path2D)` / `constructor(d: string)` | `let path = new Path2D(); path.moveTo(25, 25); path.lineTo(75, 105); context.stroke(path)` | 14_画布绘制/11_Path2D.md |
| 添加另一路径 | addPath | Path2D | `addPath(path: Path2D, transform?: Matrix2D): void` | — | 14_画布绘制/11_Path2D.md |
| 闭合路径 | closePath | Path2D | `closePath(): void` | — | 14_画布绘制/11_Path2D.md |
| 移动 | moveTo | Path2D | `moveTo(x: number, y: number): void` | — | 14_画布绘制/11_Path2D.md |
| 画线 | lineTo | Path2D | `lineTo(x: number, y: number): void` | — | 14_画布绘制/11_Path2D.md |
| 贝塞尔曲线 | bezierCurveTo | Path2D | `bezierCurveTo(cp1x: number, cp1y: number, cp2x: number, cp2y: number, x: number, y: number): void` | — | 14_画布绘制/11_Path2D.md |
| 弧线 | arc | Path2D | `arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void` | — | 14_画布绘制/11_Path2D.md |
| 矩形 | rect | Path2D | `rect(x: number, y: number, w: number, h: number): void` | — | 14_画布绘制/11_Path2D.md |

## Chart (JS 组件)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图表组件（线形图/柱状图/量规图） | chart | JS 组件（非 ArkTS） | `<chart type="line" options="{{...}}" datasets="{{...}}"></chart>` | — | 03_JS组件/01_.../03_基础组件/02_chart.md |

## @ohos.graphics.drawing
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 绘制模块（矩形/圆形/直线/Path/字体） | @ohos.graphics.drawing | `import { drawing } from '@kit.ArkGraphics2D'` | API 11+, 使用 px 单位, 单线程模型 | — | 05_图形/02_.../06_ohos.graphics.drawing/01_模块描述.md |
| drawing 画布（以 PixelMap 为目标） | drawing.Canvas | `@kit.ArkGraphics2D` | `constructor(pixelmap: image.PixelMap)` | `const canvas = new drawing.Canvas(pixelMap)` | 05_图形/02_.../03_Class (Canvas).md |
| 绘制矩形 | drawRect | drawing.Canvas | `drawRect(rect: common2D.Rect): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 绘制圆形 | drawCircle | drawing.Canvas | `drawCircle(x: number, y: number, radius: number): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 绘制直线 | drawLine | drawing.Canvas | `drawLine(line: common2D.Point, end: common2D.Point): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 绘制路径 | drawPath | drawing.Canvas | `drawPath(path: Path): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 绘制椭圆 | drawOval12+ | drawing.Canvas | `drawOval(oval: common2D.Rect): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 绘制弧线 | drawArc12+ | drawing.Canvas | `drawArc(rect: common2D.Rect, startAngle: number, sweepAngle: number): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 绘制图片 | drawImage | drawing.Canvas | `drawImage(image: Image, x: number, y: number, samplingOptions: SamplingOptions): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 绘制圆角矩形 | drawRoundRect12+ | drawing.Canvas | `drawRoundRect(roundRect: RoundRect): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 绘制文字块 | drawTextBlob | drawing.Canvas | `drawTextBlob(blob: TextBlob, x: number, y: number): void` | — | 05_图形/02_.../03_Class (Canvas).md |
| 画刷对象（填充） | drawing.Brush | `@kit.ArkGraphics2D` | `constructor()` | `const brush = new drawing.Brush(); brush.setColor(color)` | 05_图形/02_.../02_Class (Brush).md |
| 画笔对象（描边） | drawing.Pen | `@kit.ArkGraphics2D` | `constructor()` | `const pen = new drawing.Pen(); pen.setColor(color); pen.setStrokeWidth(10)` | 05_图形/02_.../13_Class (Pen).md |
| 绘制路径对象 | drawing.Path | `@kit.ArkGraphics2D` | `constructor()` | `let path = new drawing.Path(); path.moveTo(0,0); path.lineTo(0,700); path.close()` | 05_图形/02_.../10_Class (Path).md |
| 矩形工具类 | drawing.RectUtils | `@kit.ArkGraphics2D` | `static makeLtrb(left: number, top: number, right: number, bottom: number): common2D.Rect` | `let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100)` | 05_图形/02_.../14_Class (RectUtils).md |

## 模块说明

- **Canvas + CanvasRenderingContext2D** 是 ArkTS 中实现自定义图表绘制的核心路径。`CanvasRenderingContext2D` 提供完整的 2D 绘制 API（路径、填充、描边、文本、变换等），直接在 `onReady` 回调中调用。
- **Shape + Circle/Rect/Line/Path** 是声明式图形绘制方案，适合独立图形元素（如仪表盘刻度、图标），不支持 Canvas 式逐帧自定义绘图。
- **Path2D** 用于在 Canvas 上下文中预定义可重用的路径对象，与 `CanvasRenderingContext2D.stroke/fill` 配合使用。
- **Chart** 组件仅存在于 JS 组件体系中，**不是 ArkTS 组件**。ArkTS 中实现图表需要通过 `Canvas + CanvasRenderingContext2D` 自定义绘制，或使用 `DataPanel` / `Gauge` 等内置信息展示组件。
- **@ohos.graphics.drawing** 是底层 2D 绘制模块（API 11+），以 `PixelMap` 为目标绘制，使用 `px` 单位、单线程模型。适用于 `RenderNode` 自定义绘制场景。通过 `import { drawing } from '@kit.ArkGraphics2D'` 导入。
- Canvas 组件宽或高超过 8000px 时使用 CPU 渲染，会导致性能明显下降。
- Canvas 组件最大面积不超过 10000px * 10000px。
