# 02 — 3D Flip Animation & Transitions

## rotate()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件绕指定轴旋转（支持3D旋转轴与perspective视距） | rotate | 通用属性（无需导入） | rotate(value: RotateOptions): T | `.rotate({ x: 0, y: 1, z: 0, angle: 45, perspective: 800 })` | 02_.../02_通用属性/03_视效与模糊/02_图形变换.md |

## .animation()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件属性变化时自动产生渐变过渡动画 | animation | 通用属性（无需导入） | animation(value: AnimateParam): T | `.animation({ duration: 2000, curve: Curve.EaseOut, iterations: -1, playMode: PlayMode.Alternate })` | 02_.../18_动画/01_属性动画 (animation).md |

## animateTo()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 全局显式动画接口，闭包内状态变更自动产生过渡动效 | animateTo | UIContext（建议通过 getUIContext() 调用） | animateTo(value: AnimateParam, event: () => void): void | `getUIContext()?.animateTo({ duration: 2000 }, () => { this.rotateAngle = 90; })` | 02_.../18_动画/02_显式动画 (animateTo).md |

## transition()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件插入/删除时的过渡转场动画 | transition | 通用属性（无需导入） | transition(value: TransitionEffect): T | `.transition(TransitionEffect.OPACITY.animation({ duration: 2000 }).combine(TransitionEffect.rotate({ z: 1, angle: 180 })))` | 02_.../18_动画/05_组件内转场 (transition).md |

## AnimateParam 对象
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| animation/animateTo 通用动画参数配置 | AnimateParam | 无需导入（animation/animateTo 内联参数） | { duration?: number, curve?: Curve \| ICurve \| string, delay?: number, iterations?: number, playMode?: PlayMode, onFinish?: () => void } | `{ duration: 1200, curve: Curve.Friction, delay: 500, iterations: -1 }` | 02_.../18_动画/02_显式动画 (animateTo).md |

## onClick 事件
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件点击动作回调（支持手势移动阈值） | onClick | 通用事件（无需导入） | onClick(event: (event: ClickEvent) => void): T | `.onClick(() => { animateTo({}, () => { this.flag = !this.flag; }); })` | 02_.../01_通用事件/02_交互响应事件/01_点击事件.md |

## Curve 枚举
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 内置动画插值曲线枚举值 | Curve | 内置枚举（无需导入） | enum Curve { Linear, Ease, EaseIn, EaseOut, EaseInOut, FastOutSlowIn, Friction, ... } | `curve: Curve.EaseInOut` | 02_.../18_动画/02_显式动画 (animateTo).md |

## ease / easeInOut
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 预定义贝塞尔曲线动画插值 | Curve.Ease / Curve.EaseInOut | 内置枚举（无需导入） | Curve.Ease = 1 / Curve.EaseInOut = 4 | `.animation({ curve: Curve.EaseInOut })` | 02_.../18_动画/02_显式动画 (animateTo).md |

## curves.springCurve()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 构造自定义弹簧曲线对象 | curves.springCurve | `import { curves } from '@kit.ArkUI'` | springCurve(velocity: number, mass: number, stiffness: number, damping: number): ICurve | `curves.springCurve(10, 1, 228, 30)` | 02_.../01_ArkTS API/01_UI界面/15_ohos.curves (插值计算).md |

## .opacity()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件不透明度 | opacity | 通用属性（无需导入） | opacity(value: number \| Resource): T | `.opacity(0.5)` | 02_.../02_通用属性/03_视效与模糊/01_透明度设置.md |

## .scale()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件X/Y/Z轴缩放 | scale | 通用属性（无需导入） | scale(value: ScaleOptions): T | `.scale({ x: 0.5, y: 0.5 })` | 02_.../02_通用属性/03_视效与模糊/02_图形变换.md |

## .translate()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件X/Y/Z轴平移 | translate | 通用属性（无需导入） | translate(value: TranslateOptions): T | `.translate({ x: 100, y: -50 })` | 02_.../02_通用属性/03_视效与模糊/02_图形变换.md |

## TapGesture（手势版 onClick）
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 gesture 绑定的点击手势（支持双击/多指） | TapGesture | 通用手势（无需导入） | TapGesture(value?: TapGestureParameters): TapGesture | `.gesture(TapGesture({ count: 1 }).onAction((e: GestureEvent) => {}))` | 02_.../03_手势处理/02_基础手势/01_TapGesture.md |

## 模块要点

- `rotate3d()` 并无单独 API：HarmonyOS 通过 `rotate({ x, y, z, angle })` 直接实现 3D 旋转，其中 (x,y,z) 定义旋转轴向量。使用 `perspective` 字段在同属性中设置视距。
- `perspective()` 无全局 API：perspective 作为 `RotateOptions` 的属性出现（`rotate({ y: 1, angle: 45, perspective: 800 })`），或通过 `transform3D(Matrix4Transit)` 的矩阵实现。
- `Animation` 类和 `AnimationOptions` 非独立类型：HarmonyOS 动画系统使用 `AnimateParam` 对象作为通用参数配置。
- 用 `.animation()` 做属性动画时，可动画属性必须写在 `.animation()` 调用之前；通过 `animateTo()` 可在闭包内批量触发状态变更。
- transition 组件内转场推荐使用 `TransitionEffect`（API 10+），已取代废弃的 `TransitionOptions`。

### 可用于另一模块的 API
| API | 理由 |
|-----|------|
| `keyframeAnimateTo` | 关键帧动画，属于独立动画模式 |
| `pageTransition` | 页面间转场，非组件级动画 |
| `sharedTransition` | 共享元素转场，非属性动画 |
| `geometryTransition` | 隐式共享元素转场 |
| `motionPath` | 路径动画 |
