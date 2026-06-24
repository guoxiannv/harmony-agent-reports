# 03 — 3D Flip Animation

## animateTo

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显式动画，通过闭包改变状态变量产生过渡动效 | animateTo | 全局内置方法（推荐通过 `this.getUIContext()?.animateTo()` 调用） | `animateTo(value: AnimateParam, event: () => void): void` | `animateTo({ duration: 2000, curve: Curve.EaseOut }, () => { this.widthSize = 150; })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/02_显式动画 (animateTo).md` |

## animation属性

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件的通用属性（width/height/opacity/rotate/scale 等）变化时通过属性动画实现渐变过渡 | animation | 通用属性（无需导入） | `animation(value: AnimateParam): T` | `.width(this.widthSize).height(this.heightSize).animation({ duration: 2000, curve: Curve.EaseOut })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/01_属性动画 (animation).md` |

## transition

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 组件插入和删除时显示过渡动效，支持组合多种转场效果 | transition | 通用属性（无需导入） | `.transition(value: TransitionOptions \| TransitionEffect): T` | `.transition(TransitionEffect.OPACITY.animation({duration:2000}).combine(TransitionEffect.rotate({z:1, angle:180})))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/18_动画/05_组件内转场 (transition).md` |

## rotate变换

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件在3D坐标系中绕指定轴旋转，支持中心点、视距等参数 | rotate | 通用属性（无需导入） | `rotate(value: RotateOptions): T` | `.rotate({ x: 0, y: 0, z: 1, centerX: '50%', centerY: '50%', angle: 300 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## opacity变换

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件的透明不透明度，子组件继承父组件透明度 | opacity | 通用属性（无需导入） | `opacity(value: number \| Resource): T` | `.opacity(0.7)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/01_透明度设置.md` |

## scale变换

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 设置组件在X/Y/Z轴上的缩放比例，支持自定义缩放中心点 | scale | 通用属性（无需导入） | `scale(value: ScaleOptions): T` | `.scale({ x: 2, y: 0.5 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## transform

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 Matrix4Transit 矩阵对象对组件进行二维变换矩阵操作（三维变换推荐 transform3D） | transform | `import { matrix4 } from '@kit.ArkUI'` | `transform(value: object): T` | `.transform(matrix4.identity().translate({x:50,y:50}).scale({x:1.5,y:1}).rotate({x:0,y:0,z:1,angle:60}))` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/02_通用属性/03_视效与模糊/02_图形变换.md` |

## 模块说明

- animateTo 从 API version 18 开始废弃，推荐使用 `getUIContext()` 获取 UIContext 实例后调用 `animateTo`。
- transform 用于二维矩阵变换；包含透视效果的三维变换应使用 `transform3D`（API 20+）。
- transition 从 API 10 起推荐使用 `TransitionEffect` 链式接口，旧版 `TransitionOptions` 已废弃。
- 属性动画只对写在 `animation()` 前面的属性生效，对组件构造器的属性不生效。
