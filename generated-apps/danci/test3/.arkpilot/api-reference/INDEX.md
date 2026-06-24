# ArkTS API 参考索引 — WordFlip Kids（儿童定制化单词复习卡）

> **Spec**: `/.arkpilot/autopilot/spec.md`
> **Docs Root**: `/Users/huaweiide/Desktop/fe/code/harmony-pilot/vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
> **总 API 数**: 52（已找到 42 + 内置装饰器 10）
> **模块数**: 5

---

## API 速查表

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **布局与组件** || [01-layout.md](01-layout.md) |
| `Column` | 垂直线性布局容器 | [01-layout.md#column](01-layout.md#column) |
| `Row` | 水平线性布局容器 | [01-layout.md#row](01-layout.md#row) |
| `Stack` | 堆叠容器，子组件按序叠加 | [01-layout.md#stack](01-layout.md#stack) |
| `Text` | 文本显示组件 | [01-layout.md#text](01-layout.md#text) |
| `Button` | 按钮组件，支持多种样式 | [01-layout.md#button](01-layout.md#button) |
| `Blank` | 空白填充组件 | [01-layout.md#blank](01-layout.md#blank) |
| `Divider` | 分割线组件 | [01-layout.md#divider](01-layout.md#divider) |
| `Scroll` | 可滚动容器组件 | [01-layout.md#scroll](01-layout.md#scroll) |
| `Flex` | 弹性布局容器组件 | [01-layout.md#flex](01-layout.md#flex) |
| `Align/JustifyContent` | 主轴/交叉轴对齐属性集 | [01-layout.md#对齐与布局](01-layout.md#align--justifycontent--alignitems) |
| `LayoutWeight` | 子组件按权重分配空间 | [01-layout.md#layoutweight](01-layout.md#layoutweight) |
| `Width/Height` | 尺寸设置属性 | [01-layout.md#尺寸与背景](01-layout.md#width--height-（尺寸设置）) |
| `backgroundColor` | 背景色设置 | [01-layout.md#尺寸与背景](01-layout.md#backgroundcolor) |
| `borderRadius` | 边框圆角 | [01-layout.md#尺寸与背景](01-layout.md#borderradius) |
| **3D 翻转动画** || [02-animation.md](02-animation.md) |
| `rotate` | 组件 3D 旋转（含透视） | [02-animation.md#rotate](02-animation.md#rotate) |
| `animation` | 属性变化自动插入渐变动画 | [02-animation.md#animation](02-animation.md#animation) |
| `animateTo` | 状态变化闭包显式动画 | [02-animation.md#animateto](02-animation.md#animatetodeprecated) |
| `transition` | 插入/删除转场动效 | [02-animation.md#transition](02-animation.md#transition) |
| `opacity` | 透明度设置 | [02-animation.md#opacity](02-animation.md#opacity) |
| `scale` | 组件 X/Y/Z 缩放 | [02-animation.md#scale](02-animation.md#scale) |
| `transformCenter` | rotate/scale 变换锚点 | [02-animation.md#rotateoptions](02-animation.md#rotateoptions对象说明) |
| `perspective` | 3D 视距透视投影 | [02-animation.md#rotateoptions](02-animation.md#rotateoptions对象说明) |
| **状态管理** || [03-state.md](03-state.md) |
| `@State` | 组件内状态 → UI 刷新（内置 V1） | [03-state.md#state](03-state.md#state) |
| `@Prop` | 父→子单向状态传递（内置 V1） | [03-state.md#prop](03-state.md#prop) |
| `@Link` | 父子双向状态绑定（内置 V1） | [03-state.md#link](03-state.md#link) |
| `@Watch` | 状态变化监听回调 | [03-state.md#watch](03-state.md#watch) |
| `@Provide/@Consume` | 跨多层祖先-后代状态共享 | [03-state.md#provide](03-state.md#provide) |
| `@ObjectLink/@Observed` | 装饰类对象的引用传递 | [03-state.md#objectlink](03-state.md#objectlink) |
| `@StorageLink/@StorageProp` | 与 AppStorage 双向/单向绑定 | [03-state.md#storagelink](03-state.md#storagelink) |
| **数据持久化 & 资源** || [04-persistence.md](04-persistence.md) |
| `AppStorage` | 应用全局内存键值存储（V1 内置 / V2 `@kit.ArkUI`） | [04-persistence.md#appstorage](04-persistence.md#appstorage-应用全局的ui状态存储) |
| `PersistentStorage` | 持久化 UI 状态到磁盘 | [04-persistence.md#persistentstorage](04-persistence.md#persistentstorage-持久化存储ui状态) |
| `@ohos.data.preferences` | 轻量级键值持久化（`@kit.ArkData`） | [04-persistence.md#preferences](04-persistence.md#ohosdatapreferences-用户首选项) |
| `resourceManager` | 通过 Context 读取资源与 rawfile | [04-persistence.md#resourcemanager](04-persistence.md#resourcemanager-资源管理) |
| `rawfile` | `resources/rawfile/` 目录文件读取 | [04-persistence.md#rawfile](04-persistence.md#rawfile-rawfile目录资源读取) |
| `Environment` | 系统环境变量查询（V1/V2 `@Env`） | [04-persistence.md#environment](04-persistence.md#environment-设备环境查询) |
| `@ohos.resourceManager` | 资源管理模块（`@kit.LocalizationKit`） | [04-persistence.md#ohosresourcemanager](04-persistence.md#ohosresourcemanager-资源管理) |
| **生命周期 & 悬浮层** || [05-lifecycle.md](05-lifecycle.md) |
| `@Component` | 声明自定义组件 | [05-lifecycle.md#component](05-lifecycle.md#component) |
| `@Entry` | 标记页面入口组件 | [05-lifecycle.md#entry](05-lifecycle.md#entry) |
| `aboutToAppear` | 组件创建后、build()前初始化 | [05-lifecycle.md#abouttoappear](05-lifecycle.md#abouttoappear) |
| `aboutToDisappear` | 组件销毁时清理 | [05-lifecycle.md#abouttodisappear](05-lifecycle.md#abouttodisappear) |
| `onPageShow/onPageHide` | 路由页面显示/隐藏回调 | [05-lifecycle.md#onpageshow](05-lifecycle.md#onpageshow) |
| `@Builder/@LocalBuilder` | 自定义构建函数/局部构建函数 | [05-lifecycle.md#builder](05-lifecycle.md#builder) |
| `CustomDialogController` | 自定义弹窗控制器 | [05-lifecycle.md#customdialog](05-lifecycle.md#customdialog-customdialogcontroller) |
| `bindSheet` | 绑定半模态页面（CompletionOverlay） | [05-lifecycle.md#bindsheet](05-lifecycle.md#bindsheet) |
| `SheetTransition` | 半模态转场（通过 bindSheet 实现） | [05-lifecycle.md#sheettransition](05-lifecycle.md#sheettransition) |

---

## 模块概览

| 模块 | 文件名 | API 数 | 关键用途 |
|------|--------|--------|----------|
| 布局 & UI 组件 | `01-layout.md` | 14 | Column/Row/Stack/Text/Button/Scroll 等组件、对齐与尺寸属性 |
| 3D 翻转动画 | `02-animation.md` | 8 | rotate 3D 旋转、animation/animateTo 动画、transition 转场、opacity 过渡 |
| 状态管理 | `03-state.md` | 12 | @State/@Prop/@Link 装饰器、@Watch/@Provide/@Consume、@ObjectLink/@Observed |
| 数据持久化 & 资源 | `04-persistence.md` | 7 | AppStorage/PersistentStorage、Preferences、resourceManager/rawfile |
| 生命周期 & 悬浮层 | `05-lifecycle.md` | 11 | @Entry/@Component、生命周期回调、@Builder、CustomDialog/bindSheet |

---

## 重要发现

1. **3D 翻转核心方案**: `rotate({x:0, y:1, z:0, angle: 180, perspective: 1000})` + opacity 前后面切换 + `animation`/`animateTo` 驱动。`transformCenter` 和 `perspective` 是 `RotateOptions` 内字段，非独立属性。
2. **animateTo 废弃**: API 18+ 推荐 `this.getUIContext()?.animateTo()` 替代全局 `animateTo()`。
3. **V1 装饰器（@State/@Prop/@Link 等）**: 这些是 ArkUI 内置装饰器，无需 import 语句，在开发指南中定义而非 API 参考文档。docs 仓库无独立 API 文档文件的装饰器已在 `03-state.md` 中记录用途。
4. **数据持久化推荐 path**: 简单单词库加载 → `rawfile`（资源打包）+ `AppStorage`（运行时全局状态）；用户设置 → `@ohos.data.preferences`（`@kit.ArkData`）。
5. **CompletionOverlay 实现**: 推荐使用 `bindSheet`（半模态页面，API 10+，仅 Stage 模型）或 `CustomDialogController`。
6. **getContext() 废弃**: API 18+ 应使用 `this.getUIContext().getHostContext()` 获取 context。

---

> **实现指引**: 实现 agent 应先读本 INDEX.md 了解全貌，再按需加载各模块文件。
