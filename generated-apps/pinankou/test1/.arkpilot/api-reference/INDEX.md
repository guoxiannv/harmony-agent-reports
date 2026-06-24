# 平安扣 (Pinankou) - ArkTS API 参考索引

> **Spec**: `/Users/huaweiide/Desktop/fe/code/harmony-pilot/generated-apps/pinankou/test1/.arkpilot/autopilot/spec.md`
> **Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
> **模块总数**: 8 | **API 总数**: 70 | **未找到**: 6 (均为 ArkTS 内置装饰器，无独立文档文件)

## API 速查表

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **01 — Layout & Navigation** | | [01-layout.md](01-layout.md) |
| `Tabs` / `TabContent` | 底部/顶部页签切换容器 | [01-layout.md#tabs](01-layout.md#tabs) |
| `Navigation` / `NavRouter` | 路由导航根容器（NavRouter 已废弃，推荐 NavPathStack） | [01-layout.md#navigation](01-layout.md#navigation) |
| `Column` / `Row` | 垂直/水平方向布局容器 | [01-layout.md#column](01-layout.md#column) |
| `Stack` | 堆叠容器（子组件依次入栈覆盖） | [01-layout.md#stack](01-layout.md#stack) |
| `Flex` | 弹性布局（性能敏感场景建议用 Column/Row） | [01-layout.md#flex](01-layout.md#flex) |
| `Blank` / `Divider` | 空白填充 / 分割线 | [01-layout.md#blank](01-layout.md#blank) |
| **02 — Controls, Input & Dialogs** | | [02-controls.md](02-controls.md) |
| `Button` | 按钮组件（支持多种样式） | [02-controls.md#button](02-controls.md#button) |
| `TextInput` / `TextArea` | 单行/多行文本输入框 | [02-controls.md#textinput](02-controls.md#textinput) |
| `Checkbox` / `Radio` / `Toggle` | 多选框 / 单选框 / 开关 | [02-controls.md#checkbox](02-controls.md#checkbox) |
| `Select` | 下拉选择菜单 | [02-controls.md#select](02-controls.md#select) |
| `DatePicker` / `TimePicker` | 滑动选择日期/时间 | [02-controls.md#datepicker](02-controls.md#datepicker) |
| `AlertDialog` / `ActionSheet` | 警告弹窗 / 选项列表弹窗 | [02-controls.md#alertdialog](02-controls.md#alertdialog) |
| `CustomDialog` | 自定义弹窗（需 @CustomDialog 装饰器） | [02-controls.md#customdialog](02-controls.md#customdialog) |
| `Menu` | 垂直列表菜单（需 bindMenu/bindContextMenu） | [02-controls.md#menu](02-controls.md#menu) |
| **03 — List, Scroll & Data Display** | | [03-list.md](03-list.md) |
| `List` / `ListItem` | 列表容器与列表项 | [03-list.md#list](03-list.md#list) |
| `Scroll` | 通用可滚动容器 | [03-list.md#scroll](03-list.md#scroll) |
| `ForEach` / `LazyForEach` | 循环/懒加载渲染控制 | [03-list.md#foreach](03-list.md#foreach) |
| `Image` | 图片组件（本地/网络/资源） | [03-list.md#image](03-list.md#image) |
| `Text` | 文本显示组件 | [03-list.md#text](03-list.md#text) |
| `Badge` / `Counter` | 信息标记 / 计数器 | [03-list.md#badge](03-list.md#badge) |
| `Swiper` | 滑块轮播视图 | [03-list.md#swiper](03-list.md#swiper) |
| **04 — State Management** | | [04-state.md](04-state.md) |
| `@State` | 组件内响应式状态（未找到独立文档） | [04-state.md#@state](04-state.md#@state) |
| `@Prop` | 父→子单向数据同步（未找到独立文档） | [04-state.md#@prop](04-state.md#@prop) |
| `@Link` | 父子双向数据同步（未找到独立文档） | [04-state.md#@link](04-state.md#@link) |
| `@Provide` / `@Consume` | 祖先→后代响应式数据传递 | [04-state.md#@provide](04-state.md#@provide) |
| `@Watch` | 状态变量变化监听回调 | [04-state.md#@watch](04-state.md#@watch) |
| `@ObjectLink` / `@Observed` | 嵌套对象响应式（未找到独立文档） | [04-state.md#@objectlink](04-state.md#@objectlink) |
| `@StorageLink` | 与 AppStorage 双向绑定 | [04-state.md#@storagelink](04-state.md#@storagelink) |
| `@LocalStorageLink` | 与 LocalStorage 双向绑定 | [04-state.md#@localstoragelink](04-state.md#@localstoragelink) |
| `PersistentStorage` | AppStorage 属性持久化到本地 | [04-state.md#persistentstorage](04-state.md#persistentstorage) |
| `Environment` | 系统环境变量查询（响应式） | [04-state.md#environment](04-state.md#environment) |
| **05 — Data Persistence** | | [05-persistence.md](05-persistence.md) |
| `@ohos.data.preferences` | Key-Value 轻量持久化（用户设置/偏好） | [05-persistence.md#ohosdatapreferences](05-persistence.md#ohosdatapreferences) |
| `@ohos.data.relationalStore` | SQLite 关系型数据库 | [05-persistence.md#ohosdatarelationalstore](05-persistence.md#ohosdatarelationalstore) |
| `@ohos.data.distributedKVStore` | 跨设备分布式键值数据库 | [05-persistence.md#ohosdatadistributedkvstore](05-persistence.md#ohosdatadistributedkvstore) |
| `@ohos.data.dataShare` | 跨应用数据共享 | [05-persistence.md#ohosdatadatashare](05-persistence.md#ohosdatadatashare) |
| **06 — Camera & Image** | | [06-media.md](06-media.md) |
| `@ohos.multimedia.camera` | Camera Kit 相机管理（预览/拍照） | [06-media.md#@ohosmultimediacamera](06-media.md#@ohosmultimediacamera) |
| `@ohos.multimedia.cameraPicker` | Picker 方式拉起相机拍照/录制 | [06-media.md#@ohosmultimediacamerapicker](06-media.md#@ohosmultimediacamerapicker) |
| `@ohos.multimedia.image` | Image Kit 图片编解码/PixelMap | [06-media.md#@ohosmultimediaimage](06-media.md#@ohosmultimediaimage) |
| `photoPicker (PhotoViewPicker)` | 图库选择器（获取永久授权 URI） | [06-media.md#photopicker-photoviewpicker](06-media.md#photopicker-photoviewpicker) |
| `photoAccessHelper` | 相册管理（创建/读写媒体） | [06-media.md#photoaccesshelper](06-media.md#photoaccesshelper) |
| `@ohos.file.fs` | Core File Kit 文件操作（fileIo） | [06-media.md#@ohosfilefs](06-media.md#@ohosfilefs) |
| **07 — Phone, SMS & Communication** | | [07-communication.md](07-communication.md) |
| `@ohos.telephony.call` | 拨打电话（makeCall 跳转系统拨号） | [07-communication.md#ohostelephonycall](07-communication.md#ohostelephonycall) |
| `@ohos.telephony.sms` | 短信服务（sendShortMessage） | [07-communication.md#ohostelephonysms](07-communication.md#ohostelephonysms) |
| `@ohos.telephony.radio` | 网络信号信息查询 | [07-communication.md#ohostelephonyradio](07-communication.md#ohostelephonyradio) |
| `Want` | 组件间通信载体 | [07-communication.md#want](07-communication.md#want) |
| `startAbility` | 通过 Context 启动 UIAbility | [07-communication.md#startability](07-communication.md#startability) |
| **08 — Charts & Graphics** | | [08-charts.md](08-charts.md) |
| `Canvas` | 画布组件（自定义绘制图表） | [08-charts.md#canvas](08-charts.md#canvas) |
| `CanvasRenderingContext2D` | 2D 渲染上下文（核心图表绘制 API） | [08-charts.md#canvasrenderingcontext2d](08-charts.md#canvasrenderingcontext2d) |
| `Path` / `Rect` / `Circle` / `Line` | 声明式形状绘制组件 | [08-charts.md#path-绘制组件](08-charts.md#path-绘制组件) |
| `Shape` | 绘制组件父容器（类似 SVG 效果） | [08-charts.md#shape-绘制父组件](08-charts.md#shape-绘制父组件) |
| `Path2D` | Canvas 可复用路径对象 | [08-charts.md#path2d](08-charts.md#path2d) |
| `Chart (JS)` | ⚠️ 仅 JS 组件体系有 Chart，ArkTS 需用 Canvas | [08-charts.md#chart-js-组件](08-charts.md#chart-js-组件) |
| `@ohos.graphics.drawing` | 底层 2D 绘制（px 单位，API 11+） | [08-charts.md#ohosgraphicsdrawing](08-charts.md#ohosgraphicsdrawing) |

## 使用说明

1. **Implement agents 应先读此 INDEX.md**，然后按需加载各模块文件。
2. 所有 ArkUI 显示组件均无需 import 语句（系统内置组件）。
3. 需 import 的模块：
   - `import { Want, common } from '@kit.AbilityKit'` — startAbility
   - `import { preferences, relationalStore } from '@kit.ArkData'` — 数据持久化
   - `import { camera, cameraPicker } from '@kit.CameraKit'` — 相机
   - `import { image } from '@kit.ImageKit'` — 图片处理
   - `import { photoAccessHelper } from '@kit.MediaLibraryKit'` — 相册
   - `import { fileIo } from '@kit.CoreFileKit'` — 文件操作
   - `import { call, sms, radio } from '@kit.TelephonyKit'` — 电话/短信
4. **缺失装饰器注意**: `@State`, `@Prop`, `@Link`, `@Consume`, `@ObjectLink`, `@Observed` 为 ArkTS 内置装饰器，本地文档中无独立 API 文件，用法见鸿蒙开发者指南的"状态管理 V1"章节。
