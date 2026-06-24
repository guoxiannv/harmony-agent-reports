# Kids Vocabulary Review App — ArkTS API Reference

- **Spec**: `.arkpilot/autopilot/spec.md`
- **Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **Total APIs Tracked**: 47 (38 found in API refs + 9 decorators from development guides)
- **Modules**: 4

## Quick-Reference Table

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **01 — Layout & Container Components** | | [`01-layout-containers.md`](01-layout-containers.md) |
| `Column` | 垂直方向线性布局容器 | [#column](01-layout-containers.md#column) |
| `Row` | 水平方向线性布局容器 | [#row](01-layout-containers.md#row) |
| `Stack` | 堆叠容器（子组件依次叠加） | [#stack](01-layout-containers.md#stack) |
| `Flex` | 弹性布局容器 | [#flex](01-layout-containers.md#flex) |
| `Blank` | 空白填充（主轴方向自动撑满） | [#blank](01-layout-containers.md#blank) |
| `Divider` | 分割线组件 | [#divider](01-layout-containers.md#divider) |
| `Scroll` | 可滚动的容器组件 | [#scroll](01-layout-containers.md#scroll) |
| **02 — Controls & Text** | | [`02-controls-text.md`](02-controls-text.md) |
| `Button` | 按钮组件 | [#button](02-controls-text.md#button) |
| `Text` | 文本显示组件 | [#text](02-controls-text.md#text) |
| `Image` | 图片组件 | [#image](02-controls-text.md#image) |
| `onClick` | 点击事件回调 | [#onclick](02-controls-text.md#onclick) |
| `gesture` / `GestureEvent` | 手势绑定与事件信息 | [#gesture](02-controls-text.md#gesture) |
| `HitTestBehavior` | 触摸测试模式枚举 | [#hittestbehavior](02-controls-text.md#hittestbehavior) |
| `TextAlign` | 文本对齐方式枚举 | [#textalign](02-controls-text.md#textalign) |
| **03 — Animation & 3D Flip** | | [`03-animation.md`](03-animation.md) |
| `animation` (属性动画) | 属性渐变过渡 | [#animation-属性动画](03-animation.md#animation-属性动画) |
| `animateTo` (显式动画) | 闭包状态变化动效 | [#animate-显式动画-animateto](03-animation.md#animate-显式动画-animateto) |
| `transition` (组件转场) | 组件插入/删除过渡动效 | [#transition-组件内转场](03-animation.md#transition-组件内转场) |
| `TransitionEffect` | 新式函数式转场 API | [#transition-组件内转场](03-animation.md#transition-组件内转场) |
| `rotate` | 组件旋转（3D 翻转） | [#rotate](03-animation.md#rotate) |
| `scale` | 组件缩放 | [#scale](03-animation.md#scale) |
| `opacity` | 不透明度设置 | [#opacity-透明度设置](03-animation.md#opacity-透明度设置) |
| `transform` | 二维矩阵变换 | [#transform](03-animation.md#transform) |
| `curve` / `AnimationCurve` | 动画插值曲线（13种预定义） | [#curve-插值曲线](03-animation.md#curve-插值曲线) |
| **04 — State Management & Lifecycle** | | [`04-state-lifecycle.md`](04-state-lifecycle.md) |
| `@Component` | 自定义组件装饰器 | [#component](04-state-lifecycle.md#component) |
| `@Entry` | 页面入口装饰器 | [#entry](04-state-lifecycle.md#entry) |
| `@Preview` | 组件预览装饰器 | [#preview](04-state-lifecycle.md#preview) |
| `@State` ⚠️ | V1 可变状态装饰器（guides only） | [#state](04-state-lifecycle.md#state) |
| `@Prop` ⚠️ | V1 单向数据绑定（guides only） | [#prop](04-state-lifecycle.md#prop) |
| `@Link` ⚠️ | V1 双向数据绑定（guides only） | [#link](04-state-lifecycle.md#link) |
| `@Watch` | 状态变化监听装饰器 | [#watch](04-state-lifecycle.md#watch) |
| `@Builder` ⚠️ | 自定义构建函数装饰器（guides only） | [#builder](04-state-lifecycle.md#builder) |
| `@BuilderParam` ⚠️ | 构建函数参数装饰器（guides only） | [#builderparam](04-state-lifecycle.md#builderparam) |
| `@Observed` ⚠️ | V1 可观察对象装饰器（guides only） | [#observed](04-state-lifecycle.md#observed) |
| `@ObjectLink` ⚠️ | V1 可观察对象引用（guides only） | [#objectlink](04-state-lifecycle.md#objectlink) |
| `@Reusable` ⚠️ | 组件复用装饰器（guides only） | [#reusable](04-state-lifecycle.md#reusable) |
| `build()` | 组件 UI 描述函数 | [#build](04-state-lifecycle.md#build) |
| `aboutToAppear` | 创建后 build 前回调 | [#abouttoappear](04-state-lifecycle.md#abouttoappear) |
| `aboutToDisappear` | 析构前回调 | [#abouttodisappear](04-state-lifecycle.md#abouttodisappear) |
| `LocalStorage` | 页面级 UI 状态存储 | [#localstorage9](04-state-lifecycle.md#localstorage9) |
| `AppStorage` | 应用全局 UI 状态存储 | [#appstorage](04-state-lifecycle.md#appstorage) |
| `PersistentStorage` | 持久化 UI 状态到磁盘 | [#persistentstorage](04-state-lifecycle.md#persistentstorage) |
| `StateManagement` (@ohos.arkui.StateManagement) | V2 状态管理模块 | [#ohosarkuistatemanagement-状态管理](04-state-lifecycle.md#ohosarkuistatemanagement-状态管理) |

> ⚠️ 标记为 "guides only" 的装饰器（`@State`、`@Prop`、`@Link`、`@Builder`、`@BuilderParam`、`@Observed`、`@ObjectLink`、`@Reusable`）是 ArkTS 语言级特性，定义在 ArkUI 开发指南中而非 API 参考目录下。API 参考中记录了 `@Component`、`@Entry`、`@Preview`、`@Watch` 等可 import 的装饰器以及 LocalStorage/AppStorage 等存储模块。

## 3D Flip 动画关键 API 组合

```
Stack {           // 前后两面用 Stack 叠加
  CardFront()     // 正面：英文单词
  CardBack()      // 背面：中文 + 音标（初始 opacity=0 / rotateY=180）
}
.rotate({ z: 0, x: 1, y: 0, angle: flipAngle })  // 绕 Y 轴旋转
.animation({ duration: 600, curve: Curve.EaseOut, delay: 0 })  // 属性动画
```
