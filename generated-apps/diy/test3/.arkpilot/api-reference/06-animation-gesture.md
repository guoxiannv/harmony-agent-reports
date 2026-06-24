# 06 -- Animation & Gesture

## animateTo

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 在闭包中改变状态变量时自动插入过渡动效 | animateTo | 全局（推荐通过 UIContext 调用） | `animateTo(value: AnimateParam, event: () => void): void` （API 7 引入，API 18 起废弃全局用法，建议使用 `UIContext.animateTo()`） | `animateTo({ duration: 2000, curve: Curve.EaseOut }, () => { this.widthSize = 150; })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/02_显式动画 (animateTo).md |

## transition

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件插入/删除时配置转场过渡动效 | transition | 内置组件属性 | `transition(value: TransitionOptions | TransitionEffect): T` (API 7)；`transition(effect: TransitionEffect, onFinish: Optional<TransitionFinishCallback>): T` (API 12) | `.transition(TransitionEffect.OPACITY.animation({ duration: 1000 }).combine(TransitionEffect.scale({ x: 0, y: 0 })))` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/05_组件内转场 (transition).md |

## animation (属性动画)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件属性变化时自动产生渐变过渡效果 | animation | 内置组件属性 | `animation(value: AnimateParam): T` (API 7) | `.animation({ duration: 2000, curve: Curve.EaseOut, iterations: 3, playMode: PlayMode.Normal })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/01_属性动画 (animation).md |

## keyframeAnimateTo

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 指定若干关键帧状态实现分段动画 | keyframeAnimateTo | `import { UIContext } from '@kit.ArkUI'`; 通过 UIContext 实例调用 | `keyframeAnimateTo(param: KeyframeAnimateParam, keyframes: Array<KeyframeState>): void` (API 11) | `this.uiContext.keyframeAnimateTo({ iterations: 3 }, [{ duration: 800, event: () => { this.myScale = 1.5; } }, { duration: 500, event: () => { this.myScale = 1.0; } }])` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/03_关键帧动画 (keyframeAnimateTo).md |

## TapGesture

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 支持单击、双击和多次点击事件识别 | TapGesture | 内置手势 | `TapGesture(value?: TapGestureParameters)` (API 7) | `.gesture(TapGesture({ count: 2 }).onAction((event?: GestureEvent) => { console.info('double tap') }))` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/02_基础手势/01_TapGesture.md |

## LongPressGesture

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 触发长按手势事件，默认最短长按 500ms | LongPressGesture | 内置手势 | `LongPressGesture(value?: { fingers?: number; repeat?: boolean; duration?: number })` (API 7) | `.gesture(LongPressGesture({ repeat: true, duration: 500 }).onAction((event?: GestureEvent) => { this.count++; }))` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/02_基础手势/02_LongPressGesture.md |

## PanGesture

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动手势事件，滑动距离达到设定值时触发 | PanGesture | 内置手势 | `PanGesture(value?: { fingers?: number; direction?: PanDirection; distance?: number } | PanGestureOptions)` (API 7) | `.gesture(PanGesture({ direction: PanDirection.Horizontal, distance: 5 }).onActionStart(() => { console.info('pan start'); }).onActionUpdate((event: GestureEvent) => { this.offsetX = event.offsetX; }))` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/02_基础手势/03_PanGesture.md |

## PinchGesture

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 触发捏合手势，最少 2 指最多 5 指，最小识别距离 5vp | PinchGesture | 内置手势 | `PinchGesture(value?: { fingers?: number; distance?: number })` (API 7) | `.gesture(PinchGesture({ fingers: 2, distance: 5 }).onActionUpdate((event: GestureEvent) => { this.scale = event.scale; }))` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/02_基础手势/04_PinchGesture.md |

## GestureGroup

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 手势识别组合（顺序/并发/互斥模式） | GestureGroup | 内置手势 | `GestureGroup(mode: GestureMode, ...gesture: GestureType[])` (API 7)，mode 支持 `Sequence`/`Parallel`/`Exclusive` | `.gesture(GestureGroup(GestureMode.Sequence, LongPressGesture().onAction(() => {}), PanGesture().onActionStart(() => {})))` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/03_手势处理/03_GestureGroup.md |

## onClick

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件被点击时触发回调 | onClick | 内置组件事件 | `onClick(event: (event: ClickEvent) => void): T` (API 7) | `.onClick((event: ClickEvent) => { console.info('click at: ' + event.x + ',' + event.y); })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/01_通用事件/02_交互响应事件/01_点击事件.md |

## onTouch

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 手指触摸动作（按下/滑动/抬起）触发回调 | onTouch | 内置组件事件 | `onTouch(event: (event: TouchEvent) => void): T` (API 7) | `.onTouch((event: TouchEvent) => { if (event.type === TouchType.Down) { console.info('touch down'); } })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/01_通用事件/01_基础输入事件/01_触摸事件.md |

## Module Notes

- `animateTo` (global) is deprecated from API 18; always prefer `this.getUIContext()?.animateTo()` or `import { UIContext } from '@kit.ArkUI'` with an explicit UIContext instance.
- `keyframeAnimateTo` is a UIContext instance method (API 11+), not a global function. Requires `this.getUIContext()` or similar.
- `transition` using `TransitionOptions` (deprecated API 10+) must be paired with `animateTo` to take effect; the newer `TransitionEffect` API is self-contained and recommended.
- `animation` is a component attribute that only applies to property changes declared **before** it in the builder chain.
- Gestures (TapGesture etc.) are bound via `.gesture()` on components; for simple click handling, `onClick` is lighter than `TapGesture`.
- `onClick` and `onTouch` are component-level universal events, not gesture recognizers — they do not require `.gesture()` binding.
