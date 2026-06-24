# 04 -- Canvas Rendering & Animation

## Canvas
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 画布组件，提供自定义绘制区域，不支持子组件，最大10000x10000px | Canvas | 无需 import（内置 ArkUI 组件） | `Canvas(context?: CanvasRenderingContext2D \| DrawingRenderingContext)` (API 8+) / `Canvas(params: CanvasParams)` (API 23+) | `Canvas(this.context).width('100%').height('100%').onReady(() => { this.context.fillRect(0, 30, 100, 100); })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/14_画布绘制/01_Canvas.md` |

## CanvasRenderingContext2D
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 2D 渲染上下文，绑定 Canvas 组件，提供图形、文本、图像绘制能力 | CanvasRenderingContext2D | 无需 import（内置 ArkUI 类） | `new CanvasRenderingContext2D(settings?: RenderingContextSettings, unit?: LengthMetricsUnit)` (API 8+) | `private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/14_画布绘制/04_CanvasRenderingContext2D.md` |

## Path2D
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 可复用路径对象，支持从 SVG 路径字符串或方法调用定义路径 | Path2D | 无需 import（内置 ArkUI 类） | `new Path2D()` / `new Path2D(path: Path2D)` / `new Path2D(d: string)` (API 8+) | `let path2Da: Path2D = new Path2D("M250 150 L150 350 L350 350 Z"); this.context.stroke(path2Da);` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/14_画布绘制/11_Path2D.md` |

## OffscreenCanvas
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 离屏画布，可在非主线程渲染，避免影响 UI 性能 | OffscreenCanvas | 无需 import（内置 ArkUI 类） | `new OffscreenCanvas(width: number, height: number)` (API 8+) | `let offCanvas = new OffscreenCanvas(200, 300); let offContext = offCanvas.getContext("2d", this.settings);` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/14_画布绘制/09_OffscreenCanvas.md` |

## animateTo
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显式动画，闭包中改变状态时自动插入过渡动效 | animateTo | 无需 import（全局 API）；V2 推荐 `this.getUIContext()?.animateTo()` 需 import `UIContext` from `@kit.ArkUI` | `animateTo(value: AnimateParam, event: () => void): void` (API 7+) | `animateTo({ duration: 2000, curve: Curve.EaseOut }, () => { this.widthSize = 150; })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/02_显式动画 (animateTo).md` |

## animation
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 属性动画，组件属性变化时实现渐变过渡效果 | animation | 无需 import（组件属性） | `animation(value: AnimateParam): T` (API 7+) | `.animation({ duration: 2000, curve: Curve.EaseOut, iterations: 3 })` — 只对写在之前的属性生效 | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/01_属性动画 (animation).md` |

## curve
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 动画插值曲线，构造阶梯/贝塞尔/弹簧/弹性动画曲线 | curves | `import { curves } from '@kit.ArkUI'` | `curves.cubicBezierCurve(x1,y1,x2,y2): ICurve` (API 9+) / `curves.springCurve(v,mass,stiffness,damping)` (API 9+) 等 | `curves.cubicBezierCurve(0.25, 0.1, 0.25, 1.0).interpolate(0.5)` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/15_ohos.curves (插值计算).md` |

## AnimatableArithmetic
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 非数字数据类型的动画运算规则接口 | AnimatableArithmetic\<T\> | 无需 import（内置接口） | `plus(rhs): T` `subtract(rhs): T` `multiply(scale): T` `equals(rhs): boolean` | `class Point implements AnimatableArithmetic<Point> { plus(rhs) { ... } subtract(rhs) { ... } multiply(scale) { ... } equals(rhs) { ... } }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/01_定义可动画属性 (_AnimatableExtend).md` |

## transition
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件内转场，组件插入/删除时显示过渡动效 | transition | 无需 import（组件属性） | `transition(effect: TransitionEffect): T` (API 10+) | `.transition(TransitionEffect.OPACITY.animation({ duration: 2000 }).combine(TransitionEffect.rotate({ z: 1, angle: 180 })))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/05_组件内转场 (transition).md` |

## rotate
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件绕指定轴旋转 | rotate | 无需 import（通用属性方法） | `rotate(value: RotateOptions): T` (API 7+) | `.rotate({ x: 0, y: 0, z: 1, centerX: '50%', centerY: '50%', angle: 300 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## scale
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件沿各轴缩放 | scale | 无需 import（通用属性方法） | `scale(value: ScaleOptions): T` (API 7+) | `.scale({ x: 2, y: 0.5 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## @AnimatableExtend
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义装饰器，在组件上定义可动画属性方法，动画过程中逐帧调用 | @AnimatableExtend | 无需 import（内置装饰器） | `@AnimatableExtend(UIComponentName) function funcName(value: typeName) { .propertyName(value) }` 参数类型须为 number 或实现 AnimatableArithmetic\<T\> 的类型 | `@AnimatableExtend(Text) function animatableWidth(width: number) { .width(width) }` + `.animatableWidth(this.textWidth).animation({ duration: 2000, curve: Curve.Ease })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/25_自定义组件/06_组件扩展装饰器/01_定义可动画属性 (_AnimatableExtend).md` |

## 模块说明

- `animateTo` 从 API 18 起不推荐使用全局版本，建议通过 `this.getUIContext()?.animateTo()` UIContext 实例方法替代。
- `curve` 入参类型接受 `Curve` 枚举、`ICurve` 接口实现或字符串；`Curve` 枚举值包括 `Linear`, `Ease`, `EaseIn`, `EaseOut`, `EaseInOut` 等 13 种。
- `AnimatableArithmetic<T>` 接口用于非 number 类型的逐帧动画运算；标准 number 类型可直接使用。
- 文档中不存在独立 `@Animatable` 装饰器，仅有 `@AnimatableExtend`。`@AnimatableExtend` 中的 `Animatable` 为该装饰器名称的一部分，不作为独立 API 存在。
- `rotate` `/` `scale` 是组件通用属性，非 Canvas 绘制 API，适用于所有 ArkUI 组件。
- `OffscreenCanvas` 的 `getContext()` 仅支持 `"2d"` 类型；从 API 11 起可通过 `postMessage` 转移到 Worker 线程并发绘制。
- `transition` 的旧版 API `transition(value: TransitionOptions)` 从 API 10 起已废弃，推荐使用 `TransitionEffect` 版。
- 文档中不存在名为 `Animatable` 的独立接口或类作为 API — 仅有 `AnimatableArithmetic<T>` 接口（在 `@AnimatableExtend` 文档中定义）。如果需求意图是 `AnimatableArithmetic<T>`，应使用该接口而非 `Animatable`。
