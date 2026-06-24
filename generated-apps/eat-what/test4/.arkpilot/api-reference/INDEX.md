# API Reference — 今天吃什么

- **Spec**: `test4/.arkpilot/autopilot/spec.md`
- **Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **API Research Count**: 75 APIs across 6 modules (59 found, 16 missing — noted inline)
- **Generated**: 2026-06-20

Implement agents: load this index first, then read individual module files as needed.

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **01 — Navigation, Tabs & Sheet Routing** | | [`01-navigation.md`](01-navigation.md) |
| `Tabs` | 页签内容视图切换容器组件 | [#tabs](01-navigation.md#tabs) |
| `TabContent` | Tabs 中单个页签内容视图 | [#tabcontent](01-navigation.md#tabcontent) |
| `Navigation` | 路由导航根视图容器（替代 Navigator） | [#navigation](01-navigation.md#navigation) |
| `@Entry` | 标识自定义组件为 UI 页面入口 | [#entry](01-navigation.md#entry) |
| `CustomDialog` | 自定义弹窗组件 | [#customdialog](01-navigation.md#customdialog) |
| `CustomDialogController` | 自定义弹窗控制器 | [#customdialogcontroller](01-navigation.md#customdialogcontroller) |
| `SheetTransition` (bindSheet) | 半模态页面转场 | [#sheettransition-bindsheet](01-navigation.md#sheettransition-bindsheet) |
| ⚠️ `@Component` / `@Builder` / `@BuilderParam` | 编译器内置装饰器，无独立 API 参考页 | — |
| **02 — Layout & Scroll Containers** | | [`02-layout.md`](02-layout.md) |
| `Column` | 垂直布局容器 | [#column](02-layout.md#column) |
| `Row` | 水平布局容器 | [#row](02-layout.md#row) |
| `Stack` | 堆叠容器 | [#stack](02-layout.md#stack) |
| `Flex` | 弹性布局容器 | [#flex](02-layout.md#flex) |
| `Scroll` | 可滚动容器组件 | [#scroll](02-layout.md#scroll) |
| `List` / `ListItem` | 列表容器（支持懒加载） | [#list](02-layout.md#list) |
| `Swiper` | 滑块视图容器 | [#swiper](02-layout.md#swiper) |
| `width` / `height` | 组件宽高属性 | [#width](02-layout.md#width) |
| `padding` / `margin` | 内/外边距属性 | [#padding](02-layout.md#padding) |
| `constraintSize` | 约束尺寸（含 maxWidth） | [#constraintsize](02-layout.md#constraintsize) |
| `layoutWeight` | 布局权重分配 | [#layoutweight](02-layout.md#layoutweight) |
| `vp` / `fp` / `lpx` units | 像素密度单位 | [#像素单位](02-layout.md#像素单位) |
| **03 — State Management & Reactivity** | | [`03-state.md`](03-state.md) |
| `AppStorage` | 全局 UI 状态存储 | [#appstorage](03-state.md#appstorage) |
| `LocalStorage` | 页面级 UI 状态存储 | [#localstorage9](03-state.md#localstorage9) |
| `PersistentStorage` | 持久化 UI 状态 | [#persistentstorage](03-state.md#persistentstorage) |
| `Environment` | 设备环境查询 | [#environment](03-state.md#environment) |
| `@Watch` | 状态变量变化监听 | [#watch](03-state.md#watch) |
| ⚠️ `@State` / `@Prop` / `@Link` / `@Provide` / `@Consume` / `@Observed` / `@ObjectLink` / `@StorageLink` / `@StorageProp` | 编译器内置装饰器，无独立 API 参考页 | — |
| **04 — Canvas Rendering & Animation** | | [`04-canvas-animation.md`](04-canvas-animation.md) |
| `Canvas` | 画布组件 | [#canvas](04-canvas-animation.md#canvas) |
| `CanvasRenderingContext2D` | 2D 渲染上下文 | [#canvasrenderingcontext2d](04-canvas-animation.md#canvasrenderingcontext2d) |
| `Path2D` | 可复用路径对象 | [#path2d](04-canvas-animation.md#path2d) |
| `OffscreenCanvas` | 离屏画布（Worker 并发） | [#offscreencanvas](04-canvas-animation.md#offscreencanvas) |
| `animateTo` | 显式动画（API 18+ 推荐 UIContext 版） | [#animateto](04-canvas-animation.md#animateto) |
| `animation` | 属性动画 | [#animation](04-canvas-animation.md#animation) |
| `curve` (`@ohos.curves`) | 动画插值曲线 | [#curve](04-canvas-animation.md#curve) |
| `transition` | 组件内转场动效 | [#transition](04-canvas-animation.md#transition) |
| `rotate` / `scale` | 组件通用变换属性 | [#rotate](04-canvas-animation.md#rotate) |
| **05 — Local Data Persistence** | | [`05-persistence.md`](05-persistence.md) |
| `ohos.data.preferences` | 键值型轻量数据持久化 | [#ohosdatapreferences-用户首选项](05-persistence.md#ohosdatapreferences-用户首选项) |
| `preferences.getPreferences` | 获取 Preferences 实例 | [#preferencesgetpreferences](05-persistence.md#preferencesgetpreferences) |
| `Preferences` (put/get/delete/flush) | 首选项实例操作接口 | [#preferences](05-persistence.md#preferences) |
| `relationalStore` (RDB) | 关系型数据库（基于 SQLite） | [#模块描述](05-persistence.md#模块描述) |
| `relationalStore.getRdbStore` | 创建/打开数据库 | [#relationalstoregetrdbstore](05-persistence.md#relationalstoregetrdbstore) |
| `relationalStore.RdbStore` | 数据库增删改查接口 | [#interface-rdbstore](05-persistence.md#interface-rdbstore) |
| `PersistentStorage` | ArkUI 持久化内置对象 | [#persistentstorage](05-persistence.md#persistentstorage) |
| **06 — Share Card & Image Export** | | [`06-share.md`](06-share.md) |
| `ShareKit` (`@kit.ShareKit`) | 分享服务（systemShare/harmonyShare） | [#systemShare-分享](06-share.md#systemShare-分享) |
| `ohos.multimedia.image` | 图片处理模块 | [#ohosmultimediaimage-图片处理](06-share.md#ohosmultimediaimage-图片处理) |
| `image.createImagePacker` | 创建图片编码器 | [#imagecreateimagepacker](06-share.md#imagecreateimagepacker) |
| `image.ImagePacker` | 图片编码器（packToData/packToFile） | [#interface-imagepacker](06-share.md#interface-imagepacker) |
| `image.PackingOption` | 编码选项（format/quality） | [#packingoption](06-share.md#packingoption) |
| `ohos.window` | 窗口管理 | [#ohoswindow-窗口](06-share.md#ohoswindow-窗口) |
| `ohos.pasteboard` | 剪贴板模块 | [#ohospasteboard-剪贴板](06-share.md#ohospasteboard-剪贴板) |
| `pasteboard.createData` | 创建剪贴板数据 | [#pasteboardcreatedata9](06-share.md#pasteboardcreatedata9) |
| `pasteboard.setData` | 写入系统剪贴板 | [#setdata9](06-share.md#setdata9) |
| `componentSnapshot` | 组件截图（推荐 UIContext 版） | [#ohosarkuicomponentsnapshot-组件截图](06-share.md#ohosarkuicomponentsnapshot-组件截图) |
| ⚠️ `window.snapshot` | 窗口截图（实际名 snapshot 非 screenshot） | [#snapshot9](06-share.md#snapshot9) |

## Notable Findings

| 模块 | 发现 |
|------|------|
| 01-navigation | Navigator 从 API 13 废弃，应使用 Navigation + NavPathStack |
| 02-layout | Column/Row 性能优于 Flex；maxWidth 通过 `constraintSize({ maxWidth })` 设置 |
| 03-state | 9 个装饰器为编译器内置，API 参考无独立页面（需查开发指南） |
| 04-canvas-animation | `animateTo` 全局版 API 18+ 废弃，推荐 `this.getUIContext()?.animateTo()`；`transition` 旧版 API 10+ 废弃 |
| 05-persistence | Preferences 支持 XML/GSKV 两种存储模式；`EnvironmentStorage` 不存在（正确为 `Environment`） |
| 06-share | `ohos.share` 不存在（正确为 `@kit.ShareKit`）；`componentSnapshot.get()` 从 API 18 废弃 |

## Missing APIs Summary

| 缺失 API | 原因 |
|----------|------|
| `@Component`, `@Builder`, `@BuilderParam`, `@State`, `@Prop`, `@Link`, `@Provide`, `@Consume`, `@Observed`, `@ObjectLink`, `@StorageLink`, `@StorageProp` | 内置装饰器，仅存于开发指南 |
| `Animatable` | 对应 `AnimatableArithmetic<T>` 接口 |
| `@Animatable` | 对应 `@AnimatableExtend` 装饰器 |
| `dataPreferences` | 变量名，非 API |
| `EnvironmentStorage` | 不存在，使用 `Environment` |
| `ohos.share` | 不存在，使用 `@kit.ShareKit` |
| `window.screenshot` | 实际名为 `window.snapshot()` |
| `component.snapshot` | 应使用 `ComponentSnapshot.get()` |
