# 08 — Animation

## animateTo (显式动画)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 在状态变化闭包中插入过渡动效 | animateTo | 全局方法（无需额外导入） | `animateTo(value: AnimateParam, event: () => void): void` | `animateTo({ duration: 2000, curve: Curve.EaseOut }, () => { this.widthSize = 150; })` | `02_ArkTS组件/18_动画/02_显式动画 (animateTo).md` |

- 从 API version 7 支持，API version 18 起推荐使用 `this.getUIContext()?.animateTo()` 替代全局版本以明确 UI 上下文。
- `AnimateParam` 包含 `duration`、`curve`、`delay`、`iterations`、`playMode`、`onFinish`、`tempo`、`finishCallbackType`、`expectedFrameRateRange`。
- curve 配置 `springMotion`/`responsiveSpringMotion`/`interpolatingSpring` 时 `duration` 不生效。
- 不推荐在 `aboutToAppear`/`aboutToDisappear` 中调用。

## animation (属性动画)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件属性变化时自动添加渐变过渡效果 | animation | 组件属性方法（无需额外导入） | `animation(value: AnimateParam): T` | `.animation({ duration: 2000, curve: Curve.EaseOut, iterations: 3, playMode: PlayMode.Normal })` | `02_ArkTS组件/18_动画/01_属性动画 (animation).md` |

- 从 API version 7 开始支持。
- 属性动画只对写在 `animation()` 前面的属性生效，对组件构造器中的属性不生效。
- 支持的属性包括 `width`、`height`、`backgroundColor`、`opacity`、`scale`、`rotate`、`translate` 等。
- 卡片能力从 API version 9 开始支持。

## Transition — PageTransition (页面间转场)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 页面路由切换时自定义入场/退场动效 | PageTransitionEnter / PageTransitionExit | 组件生命周期方法（在 `pageTransition()` 中调用） | `PageTransitionEnter(value: PageTransitionOptions)` / `PageTransitionExit(value: PageTransitionOptions)` | `pageTransition() { PageTransitionEnter({ duration: 1200 }).slide(SlideEffect.Left); PageTransitionExit({ duration: 1000 }).translate({ x: 100 }).opacity(0) }` | `02_ArkTS组件/18_动画/04_页面间转场 (pageTransition).md` |

- 从 API version 7 开始支持。
- 提供 `.slide()`、`.translate()`、`.scale()`、`.opacity()` 四种默认动效。
- 通过 `onEnter`/`onExit` 回调获取 `RouteType` 和 `progress` 实现自定义逐帧动效。
- 推荐使用 Navigation 组件和模态转场替代。

## Transition — 组件内转场
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件插入/删除时显示过渡动效 | transition | 组件属性方法（无需额外导入） | `transition(value: TransitionEffect): T` | `.transition(TransitionEffect.OPACITY.animation({ duration: 1000 }).combine(TransitionEffect.scale({ x: 0, y: 0 })))` | `02_ArkTS组件/18_动画/05_组件内转场 (transition).md` |

- 从 API version 7 开始支持，API version 10 起推荐使用 `TransitionEffect` 替代已废弃的 `TransitionOptions`。
- 通过 `TransitionEffect.asymmetric(appear, disappear)` 设置非对称转场。
- 通过 `.combine()` 链式组合多种转场效果。
- 触发方式：`if` 条件改变、`ForEach` 新增删除、`visibility` 属性切换。
- API version 12 起支持 `transition(effect, onFinish)` 带完成回调的重载。

## Curve (动画曲线 — @ohos.curves)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置动画插值曲线，构造阶梯/贝塞尔/弹簧曲线 | curves | `import { curves } from '@kit.ArkUI'` | `curves.initCurve(curve?: Curve): ICurve` / `curves.cubicBezierCurve(x1,y1,x2,y2): ICurve` / `curves.stepsCurve(count,end): ICurve` | `curves.cubicBezierCurve(0.1, 0.0, 0.1, 1.0)` | `01_ArkTS API/01_UI界面/16_ohos.curves (插值计算).md` |

- 从 API version 7 开始支持，API version 9 起使用 `initCurve`/`stepsCurve`/`cubicBezierCurve` 替代已废弃的旧版。
- Curve 枚举包含：`Linear`、`Ease`、`EaseIn`、`EaseOut`、`EaseInOut`、`FastOutSlowIn`、`LinearOutSlowIn`、`FastOutLinearIn`、`Friction`、`ExtremeDeceleration`、`Rhythm`、`Sharp`、`Smooth`。
- `ICurve` 提供 `.interpolate(fraction)` 方法计算归一化时间点的插值。

## interpolatingSpring (插值弹簧曲线)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 构造从 0 到 1 的插值弹簧曲线，动画时长由弹簧参数决定 | curves.interpolatingSpring | `import { curves } from '@kit.ArkUI'` | `curves.interpolatingSpring(velocity: number, mass: number, stiffness: number, damping: number): ICurve` | `curves.interpolatingSpring(10, 1, 228, 30)` | `01_ArkTS API/01_UI界面/16_ohos.curves (插值计算).md` |

- 从 API version 10 开始支持，仅可在 Stage 模型下使用。
- `duration` 参数在 `animation`/`animateTo` 中不生效，动画时间由弹簧参数决定。
- 不能通过 `.interpolate()` 获得插值。

## springCurve / springMotion (弹簧/弹性动画曲线)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 构造弹簧曲线/弹性动画曲线，实现物理弹性动效 | curves.springCurve / curves.springMotion | `import { curves } from '@kit.ArkUI'` | `springCurve(velocity,mass,stiffness,damping): ICurve` / `springMotion(response?,dampingFraction?,overlapDuration?): ICurve` | `curves.springMotion(0.5, 0.6, 0)` / `curves.springCurve(10, 1, 228, 30)` | `01_ArkTS API/01_UI界面/16_ohos.curves (插值计算).md` |

- `springCurve` 从 API version 9 开始支持，曲线形状由弹簧参数决定，`duration` 仍然生效。
- `springMotion` 从 API version 9 开始支持，为物理曲线，`duration` 不生效，动画持续时间取决于曲线参数和之前的速度。
- `responsiveSpringMotion` 是 `springMotion` 的特例，默认 `response: 0.15`，适合跟手动画场景。
- 弹性动画曲线之间支持速度继承，后一个动画会替换前一个动画并继承之前的速度。

## scale / opacity animation (属性动画具体属性)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过属性动画实现组件的缩放和透明度渐变 | animation (属性动画) 作用于 scale / opacity 属性 | 无独立 API，通过 `.animation()` 属性方法驱动 | 同 `animation(value: AnimateParam): T`，作用于 `.scale()` / `.opacity()` 属性 | `.scale({ x: this.scaleVal }).opacity(this.opacityVal).animation({ duration: 1000 })` | `02_ArkTS组件/18_动画/01_属性动画 (animation).md` |

- scale/opacity 是 `animation()` 属性动画支持的标准可动画属性之一，无独立 API。
- 也可在 `animateTo` 闭包、`pageTransition`、`TransitionEffect` 中作为转场属性使用。

## Module Notes

- `gesture animation (手势动画)` 不是一个独立的 API。手势动画的实现模式是将 `animateTo()` 或 `.animation()` 属性与手势事件回调（如 `onPan`、`onPinch`、`onSwipe` 等）结合使用。手势相关 API 位于 `02_ArkTS组件/03_手势处理/` 目录。
- `springEffect` / `SpringProp` 不是 HarmonyOS ArkUI 中的 API 名称。等效功能由 `@ohos.curves` 模块中的 `curves.springCurve()`、`curves.springMotion()`、`curves.responsiveSpringMotion()` 和 `curves.interpolatingSpring()` 提供。
- 转场动画有两个独立概念：页面间转场（`PageTransitionEnter` / `PageTransitionExit`，在 `pageTransition()` 生命周期中配置）和组件内转场（`transition` 属性，使用 `TransitionEffect`）。
- 弹性/物理曲线（`springMotion`、`responsiveSpringMotion`、`interpolatingSpring`）不受 `duration` 参数控制，动画时长由物理参数决定。
