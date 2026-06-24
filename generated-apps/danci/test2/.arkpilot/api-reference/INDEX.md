# API 参考索引 — 童词卡（Kids Word Cards）

> **规格文件**: `.arkpilot/autopilot/spec.md`
> **文档源**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
> **总计**: 25 个 API / 组件，覆盖 5 个模块，全部确认找到

---

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **Column** | 垂直方向布局容器 | [01-layout.md#column](01-layout.md#column) |
| **Row** | 水平方向布局容器 | [01-layout.md#row](01-layout.md#row) |
| **Stack** | 堆叠容器，后层覆盖前层 | [01-layout.md#stack](01-layout.md#stack) |
| **Flex** | 弹性布局，分配剩余空间 | [01-layout.md#flex](01-layout.md#flex) |
| **Scroll** | 可滚动容器组件 | [01-layout.md#scroll](01-layout.md#scroll) |
| **@Component** | 声明自定义组件 | [02-state.md#component](02-state.md#component) |
| **@Entry** | 声明页面入口 | [02-state.md#entry](02-state.md#entry) |
| **@State** | 组件内部响应式状态 | [02-state.md#state](02-state.md#state) |
| **@Prop** | 父→子单向数据绑定 | [02-state.md#prop](02-state.md#prop) |
| **@Builder** | 自定义构建函数（封装可复用 UI） | [02-state.md#builder](02-state.md#builder) |
| **@Watch** | 状态变化监听回调 | [02-state.md#watch](02-state.md#watch) |
| **Text** | 文本显示组件 | [03-controls.md#Text](03-controls.md#Text) |
| **Button** | 按钮组件 | [03-controls.md#Button](03-controls.md#Button) |
| **Progress** | 进度条组件 | [03-controls.md#Progress](03-controls.md#Progress) |
| **animateTo** | 显式动画 — 状态变更触发过渡 | [04-animation.md#animateto](04-animation.md#animateto) |
| **animation** | 属性动画 — 属性变化自动过渡 | [04-animation.md#animation](04-animation.md#animation) |
| **rotate** | 组件旋转变换（支持 3D 轴） | [04-animation.md#rotate](04-animation.md#rotate) |
| **transition** | 组件入场/离场过渡动画 | [04-animation.md#transition](04-animation.md#transition) |
| **opacity** | 透明度属性（可动画化） | [04-animation.md#opacity](04-animation.md#opacity) |
| **onClick** | 点击事件回调 | [05-gesture-lifecycle.md#onclick](05-gesture-lifecycle.md#onclick) |
| **TapGesture** | 手势识别 — 单击/双击/多指 | [05-gesture-lifecycle.md#tapgesture](05-gesture-lifecycle.md#tapgesture) |
| **onTouch** | 触摸事件（按下/滑动/抬起） | [05-gesture-lifecycle.md#ontouch](05-gesture-lifecycle.md#ontouch) |
| **aboutToAppear** | 组件初始化生命周期回调 | [05-gesture-lifecycle.md#abouttoappear](05-gesture-lifecycle.md#abouttoappear) |
| **onPageShow** | 页面每次显示时触发的生命周期回调 | [05-gesture-lifecycle.md#onpageshow](05-gesture-lifecycle.md#onpageshow) |
| **AlertDialog** | 警告弹窗组件 | [05-gesture-lifecycle.md#alertdialog](05-gesture-lifecycle.md#alertdialog) |

## 重要发现

| 模块 | 关键发现 |
|------|----------|
| 01 — 布局 | Flex 有二次布局开销，性能敏感场景用 Column/Row 替代；Row 和 Column 默认 alignItems 不同 |
| 02 — 状态 | V1 内建装饰器无需 import；`@Watch`/`@Entry` 有独立文档，`@State`/`@Prop`/`@Builder`/`@Component` 为内建 |
| 03 — 控件 | 三个组件均无需导入；`Progress.style` 已废弃改用 `type`；Button API 18 起默认样式变更为 `ROUNDED_RECTANGLE` |
| 04 — 动画 | `animateTo` 全局版本 API 18 废弃，改用 `getUIContext().animateTo()`；`rotate.perspective` 对 3D 翻转深度至关重要 |
| 05 — 手势/生命周期 | `AlertDialog.show()` API 18 废弃，改用 `getUIContext().showAlertDialog()`；`TapGesture` 与 `onClick` 共存时优先 |

---

> **提示**: Implement agent 应首先加载本索引文件 `INDEX.md`，再按需加载各模块文件（`01-layout.md` ~ `05-gesture-lifecycle.md`）。每个模块文件包含完整的导入路径、API 签名和代码示例。
