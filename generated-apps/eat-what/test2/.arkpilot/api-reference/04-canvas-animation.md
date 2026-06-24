# 04 — Canvas & Animation

## Canvas
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 画布组件，用于自定义绘制图形 | Canvas | 内置组件 | `Canvas(context?: CanvasRenderingContext2D \| DrawingRenderingContext)` / `Canvas(params: CanvasParams)` | `Canvas(this.context).width('100%').height('100%').onReady(() => { this.context.fillRect(0, 30, 100, 100) })` | `14_画布绘制/01_Canvas.md` |

## CanvasRenderingContext2D
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 2D渲染上下文，在Canvas上绘制形状、文本、图片 | CanvasRenderingContext2D | 内置类 | `constructor(settings?: RenderingContextSettings, unit?: LengthMetricsUnit)` | `private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);` | `14_画布绘制/04_CanvasRenderingContext2D.md` |

## CanvasGradient
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 渐变对象，设置渐变断点值和颜色 | CanvasGradient | 由`createLinearGradient`/`createRadialGradient`创建 | `addColorStop(offset: number, color: string \| ColorMetrics): void` | `let grad = context.createLinearGradient(50, 0, 300, 100); grad.addColorStop(0.0, 'rgb(39,135,217)'); context.fillStyle = grad` | `14_画布绘制/02_CanvasGradient.md` |

## Path（图形绘制组件）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 根据SVG路径命令字符串绘制封闭自定义形状 | Path | 内置组件 | `Path(options?: PathOptions)` | `<Path().commands('M0 0 L600 0').stroke(Color.Black).strokeWidth(3)>` | `15_图形绘制/06_Path.md` |

## Path2D
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路径对象，通过接口描述路径并用Canvas的stroke/fill绘制 | Path2D | 内置类 | `constructor(d: string)` / `constructor(path: Path2D)` / `constructor()` | `let path = new Path2D("M250 150 L150 350 L350 350 Z"); context.stroke(path)` | `14_画布绘制/11_Path2D.md` |

## Circle
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 圆形绘制组件 | Circle | 内置组件 | `Circle(value?: CircleOptions)` | `<Circle({ width: 150, height: 150 }).fillOpacity(0).strokeWidth(3).stroke(Color.Red)>` | `15_图形绘制/01_Circle.md` |

## Shape
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 绘制组件的父容器，实现类似SVG的批量图形效果 | Shape | 内置组件 | `Shape(value?: PixelMap)` | `<Shape() { Rect().width(300).height(50) }.width(350).height(140).viewPort({...}).fill(Color.Orange)>` | `15_图形绘制/08_Shape.md` |

## animateTo
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显式动画，闭包内状态变化自动插入过渡动效 | animateTo | 全局函数（API 18推荐使用`UIContext.animateTo`） | `animateTo(value: AnimateParam, event: () => void): void` | `animateTo({ duration: 2000, curve: Curve.EaseOut }, () => { this.widthSize = 150 })` | `18_动画/02_显式动画 (animateTo).md` |

## transition
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件内转场，组件插入/删除时显示过渡动效 | transition | 组件属性 | `transition(effect: TransitionEffect, onFinish?: TransitionFinishCallback): T` | `.transition(TransitionEffect.OPACITY.animation({ duration: 2000 }).combine(TransitionEffect.rotate({ z: 1, angle: 180 })))` | `18_动画/05_组件内转场 (transition).md` |

## keyframeAnimateTo
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 关键帧动画，分段控制多个关键帧状态 | keyframeAnimateTo | 需通过`UIContext`实例调用 | `keyframeAnimateTo(param: KeyframeAnimateParam, keyframes: Array<KeyframeState>): void` | `uiContext.keyframeAnimateTo({ iterations: 3 }, [{ duration: 800, event: () => { this.myScale = 1.5 } }, { duration: 500, event: () => { this.myScale = 1 } }])` | `18_动画/03_关键帧动画 (keyframeAnimateTo).md` |

## @ohos.curves
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 插值曲线模块，构造动画插值曲线（阶梯、贝塞尔、弹簧、弹性） | curves | `import { curves } from '@kit.ArkUI'` | `curves.initCurve(curve?: Curve): ICurve` / `curves.cubicBezierCurve(x1,y1,x2,y2): ICurve` / `curves.springMotion(response?, dampingFraction?, overlapDuration?): ICurve` | `curves.cubicBezierCurve(0.1, 0.0, 0.1, 1.0)` | `01_UI界面/15_ohos.curves (插值计算).md` |

## 属性动画 (animation)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件属性变化时自动产生渐变过渡效果 | animation | 组件属性 | `animation(value: AnimateParam): T` | `.animation({ duration: 2000, curve: Curve.EaseOut, iterations: 3, playMode: PlayMode.Normal })` | `18_动画/01_属性动画 (animation).md` |

## Module Notes

- `CanvasRenderingContext2D` 从 API 12 开始支持通过 `LengthMetricsUnit` 构造参数配置单位模式。
- `animateTo` 从 API 18 开始废弃全局函数，推荐通过 `this.getUIContext()?.animateTo()` 调用。
- `Path2D` 可接受 SVG 路径规范字符串构造（如 `M250 150 L150 350 L350 350 Z`），也支持从另一个 Path2D 对象复制。
- `transition` 从 API 10 开始推荐使用 `TransitionEffect` 链式 API（`TransitionEffect.OPACITY.combine(TransitionEffect.rotate(...))`），旧版 `TransitionOptions` 已废弃。
- `@ohos.curves` 的弹性曲线（`springMotion`、`responsiveSpringMotion`、`interpolatingSpring`）为物理曲线，`duration` 参数不生效，动画时长由曲线参数决定。
- `keyframeAnimateTo` 不支持 `springMotion`、`responsiveSpringMotion`、`interpolatingSpring` 曲线（因这类曲线时长不生效）。
