# 02 -- 3D Card Flip Animation

## rotate (3D旋转)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置3D旋转，支持绕任意轴旋转，可配置旋转中心、视距 | rotate(value: RotateOptions): T | 组件通用属性，无需额外导入 | `rotate({ x?: number, y?: number, z?: number, angle: number, centerX?: number | string, centerY?: number | string, centerZ?: number, perspective?: number })` | `.rotate({ x: 0, y: 1, z: 0, angle: 45, perspective: 500 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## animation (隐式动画)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 为组件属性变化添加渐变过渡动画，支持变化宽高、旋转、透明度等 | animation(value: AnimateParam): T | 组件通用属性，无需额外导入 | `animation({ duration?: number, curve?: Curve | string, delay?: number, iterations?: number, playMode?: PlayMode, onFinish?: () => void })` | `.animation({ duration: 2000, curve: Curve.EaseOut, iterations: 3, playMode: PlayMode.Normal })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/01_属性动画 (animation).md` |

## animateTo (显式动画)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 在闭包中改变状态时自动插入过渡动效 | animateTo(value: AnimateParam, event: () => void): void | 全局方法或 UIContext 实例方法，建议使用 `this.getUIContext()?.animateTo()` | `animateTo({ duration?: number, curve?: Curve | string, delay?: number, iterations?: number, playMode?: PlayMode, onFinish?: () => void }, () => { ... })` | `animateTo({ duration: 1200, curve: Curve.Friction }, () => { this.rotateAngle = 90; })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/02_显式动画 (animateTo).md` |

## transition (转场动画)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件插入/删除时的过渡动效，支持透明度、旋转、缩放、平移等组合转场 | transition(effect: TransitionEffect | TransitionOptions): T | 组件通用属性，无需额外导入 | 推荐 `TransitionEffect.OPACITY.animation({...}).combine(TransitionEffect.rotate({ z:1, angle:180 }))` | `.transition(TransitionEffect.OPACITY.animation({ duration: 2000 }).combine(TransitionEffect.rotate({ z: 1, angle: 180 })))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/05_组件内转场 (transition).md` |

## opacity (透明度)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件不透明度，0完全透明，1不透明 | opacity(value: number | Resource): T | 组件通用属性，无需额外导入 | `opacity(value: number | Resource): T` | `.opacity(0.7)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/01_透明度设置.md` |

## scale (缩放)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件缩放，支持X/Y/Z轴独立缩放，可配置缩放中心点 | scale(value: ScaleOptions): T | 组件通用属性，无需额外导入 | `scale({ x?: number, y?: number, z?: number, centerX?: number | string, centerY?: number | string })` | `.scale({ x: 2, y: 0.5 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## transformCenter (变换中心点)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 旋转/缩放时的变换中心点（锚点），通过 centerX/centerY 在对应选项对象中设置 | RotateOptions.centerX / centerY 或 ScaleOptions.centerX / centerY | 组件通用属性，无需额外导入 | `centerX?: number | string`（单位vp或百分比，默认'50%'），`centerY?: number | string` | `.rotate({ z: 1, angle: 90, centerX: 100, centerY: 60 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## perspective (透视投影)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 3D旋转时的视距，控制相机到z=0平面的距离，影响透视效果 | RotateOptions.perspective | 组件通用属性，无需额外导入 | `perspective?: number`（单位px，默认0，系统自动计算适合值） | `.rotate({ y: 1, angle: 45, perspective: 500 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## 模块备注

- `transformCenter`（变换中心点）和 `perspective`（透视投影）并非独立的组件属性API，而是 `RotateOptions`/`ScaleOptions` 选项对象中的字段，通过 `rotate()`、`scale()` 属性传入。
- `transition` 推荐使用 API 10+ 的 `TransitionEffect` 链式 API（`.combine()`），而非已废弃的 `TransitionOptions`。
- `animateTo` 全局方法从 API 18 开始废弃，建议通过 `this.getUIContext()?.animateTo()` 调用。
- 3D卡片翻转核心组合：`rotate` + `animation`/`animateTo` + `perspective`，配合 `opacity` 实现正反面切换的立体翻转效果。
