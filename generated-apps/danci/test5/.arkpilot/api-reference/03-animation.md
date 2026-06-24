# 03 -- Animation & 3D Flip

## animation (属性动画)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件的通用属性变化时实现渐变过渡效果 | animation | 内置属性，无需导入 | `animation(value: AnimateParam): T` | `.animation({duration:2000, curve:Curve.EaseOut, iterations:3, playMode:PlayMode.Normal})` | `02_ArkTS组件/18_动画/01_属性动画 (animation).md` |

## animate (显式动画 animateTo)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过闭包代码导致的状态变化插入过渡动效 | animateTo | 全局函数，无需导入（API 18 起废弃，建议使用 UIContext.animateTo） | `animateTo(value: AnimateParam, event: () => void): void` | `animateTo({duration:2000, curve:Curve.EaseOut}, ()=>{ this.widthSize=150; })` | `02_ArkTS组件/18_动画/02_显式动画 (animateTo).md` |

## transition (组件内转场)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件插入和删除时显示过渡动效 | transition | 内置属性，无需导入 | `transition(value: TransitionOptions | TransitionEffect): T` | `.transition(TransitionEffect.OPACITY.animation({duration:1000}).combine(TransitionEffect.rotate({z:1, angle:180})))` | `02_ArkTS组件/18_动画/05_组件内转场 (transition).md` |

## rotate

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件旋转（以组件左上角为坐标原点） | rotate | 内置属性，无需导入 | `rotate(value: RotateOptions): T` | `.rotate({x:0, y:0, z:1, centerX:'50%', centerY:'50%', angle:300})` | `02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## scale

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件缩放（X/Y/Z 轴比例，含缩放中心点） | scale | 内置属性，无需导入 | `scale(value: ScaleOptions): T` | `.scale({x:2, y:0.5})` | `02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## opacity

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件不透明度，子组件继承父组件透明度 | opacity | 内置属性，无需导入 | `opacity(value: number | Resource): T` | `.opacity(0.7)` | `02_ArkTS组件/02_通用属性/03_视效与模糊/01_透明度设置.md` |

## transform (矩阵变换)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 二维矩阵变换，支持链式组合 translate/scale/rotate | transform | `import { matrix4 } from '@kit.ArkUI';` | `transform(value: object): T`（object 为 Matrix4Transit） | `.transform(matrix4.identity().translate({x:50,y:50}).scale({x:1.5,y:1}).rotate({x:0,y:0,z:1,angle:60}))` | `02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## TransitionEffect

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 以函数式 API 指定转场效果（平移/旋转/缩放/透明度/滑入滑出） | TransitionEffect | 内置类型，无需导入 | `TransitionEffect.OPACITY` / `.translate()` / `.rotate()` / `.scale()` / `.opacity()` / `.move()` / `.asymmetric()` / `.combine()` / `.animation()` | `TransitionEffect.asymmetric(TransitionEffect.OPACITY, TransitionEffect.IDENTITY)` | `02_ArkTS组件/18_动画/05_组件内转场 (transition).md` |

## curve (插值曲线)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供动画插值曲线（阶梯/贝塞尔/弹簧/弹性动画曲线） | curves | `import { curves } from '@kit.ArkUI';` | `curves.initCurve(curve?)` / `curves.cubicBezierCurve(x1,y1,x2,y2)` / `curves.springCurve(v,m,s,d)` / `curves.springMotion(r?,df?,od?)` / `curves.responsiveSpringMotion(r?,df?,od?)` / `curves.interpolatingSpring(v,m,s,d)` / `curves.stepsCurve(count,end)` / `curves.customCurve(interpolate)` | `curves.cubicBezierCurve(0.25,0.1,0.25,1.0)` | `01_ArkTS API/01_UI界面/15_ohos.curves (插值计算).md` |

## AnimationCurve (Curve 枚举)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 预定义动画曲线枚举（Linear/Ease/EaseIn/EaseOut 等 13 种） | Curve | `import { curves } from '@kit.ArkUI';` | `enum Curve { Linear=0, Ease=1, EaseIn=2, ..., Friction=12 }` | `Curve.EaseOut` / `curves.initCurve(Curve.EaseIn)` | `01_ArkTS API/01_UI界面/15_ohos.curves (插值计算).md` |

## Module Notes

- `animation` 属性动画只对写在 `.animation()` **前面**的属性生效，对组件构造器的属性不生效。
- `animateTo` 从 API 18 起废弃，推荐使用 `this.getUIContext()?.animateTo()` 替代。
- `TransformEffect` 是 API 10+ 推荐的新式转场 API；旧式 `TransitionOptions`（结构体参数）已废弃。
- 使用 `TransitionEffect` 时，若未指定 `animateTo` 或自身 `animation()` 参数，转场无动画直接出现/消失。
- `transform` 接口用于二维矩阵变换；包含透视的三维变换应使用 API 20+ 的 `transform3D` 接口。
- 弹性动画曲线（`springMotion` / `responsiveSpringMotion` / `interpolatingSpring`）不响应 `animation`/`animateTo` 中的 `duration` 参数。
- `rotate` 中的 `perspective` 设置视距，不支持做转场动画。
