# 04 — Animation & 3D Flip

## animateTo
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显式动画：在闭包中修改状态变量，系统自动插入过渡动画 | animateTo | 全局 API（需 UI 上下文），API 18+ 推荐 `getUIContext().animateTo()` | `animateTo(value: AnimateParam, event: () => void): void` | `animateTo({ duration: 2000, curve: Curve.EaseOut }, () => { this.widthSize = 150; })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/02_显式动画 (animateTo).md` |

## animation
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 属性动画：组件属性变化时自动产生渐变过渡 | animation | 全局 API（组件方法） | `animation(value: AnimateParam): T` | `.animation({ duration: 2000, curve: Curve.EaseOut, iterations: 3, playMode: PlayMode.Normal })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/01_属性动画 (animation).md` |

## rotate
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件旋转变换，支持 3D 旋转轴和视距 | rotate | 全局 API（通用属性） | `rotate(value: RotateOptions): T` | `.rotate({ x: 0, y: 0, z: 1, angle: 90, centerX: '50%', centerY: '50%' })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## transition
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件内转场：组件插入/删除时的过渡动效 | transition | 全局 API（组件方法） | `transition(value: TransitionOptions \| TransitionEffect): T` | `.transition(TransitionEffect.OPACITY.animation({ duration: 1000 }).combine(TransitionEffect.rotate({ z: 1, angle: 180 })))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/05_组件内转场 (transition).md` |

## opacity
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件不透明度，子组件继承父组件透明度并叠加 | opacity | 全局 API（通用属性） | `opacity(value: number \| Resource): T` | `.opacity(0.7)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/01_透明度设置.md` |

## Module Notes

- **animateTo** 从 API version 18 开始废弃全局版本，应使用 `this.getUIContext()?.animateTo(...)` 替代。
- **rotate** 支持 `RotateOptions`（旋转轴矢量+角度）和 API 20+ 新增的 `RotateAngleOptions`（各轴独立角度）。可用于 3D 翻转效果。
- **opacity** 作为通用属性可被 `animation` 和 `animateTo` 驱动动画；作为 `TransitionEffect.OPACITY` 用于组件转场。
- **RotateOptions** 包含 `perspective` 属性（API 10+）用于设置 3D 旋转视距，是 3D 卡片翻转的关键参数。
