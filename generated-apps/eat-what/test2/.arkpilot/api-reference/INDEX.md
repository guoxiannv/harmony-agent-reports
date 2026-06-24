# "今天吃什么" — ArkTS API 参考索引

> **规格文件**: `.arkpilot/autopilot/spec.md`
> **文档根目录**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
> **API 总数**: 73（含 8 个内联参考的状态装饰器）
> **模块数**: 7

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **布局与导航** (13) | | [01-layout-navigation.md](01-layout-navigation.md) |
| Column | 垂直线性布局容器 | [column](01-layout-navigation.md#column) |
| Row | 水平线性布局容器 | [row](01-layout-navigation.md#row) |
| Stack | 堆叠容器 | [stack](01-layout-navigation.md#stack) |
| Flex | 弹性布局容器 | [flex](01-layout-navigation.md#flex) |
| Scroll | 可滚动容器 | [scroll](01-layout-navigation.md#scroll) |
| List | 列表容器（支持懒加载） | [list](01-layout-navigation.md#list) |
| Grid | 网格容器 | [grid](01-layout-navigation.md#grid) |
| Tabs | 页签切换容器 | [tabs](01-layout-navigation.md#tabs) |
| TabContent | 页签内容视图 | [tabcontent](01-layout-navigation.md#tabcontent) |
| Navigation | 路由导航根容器 | [navigation](01-layout-navigation.md#navigation) |
| Divider | 分割线组件 | [divider](01-layout-navigation.md#divider) |
| Blank | 空白填充组件 | [blank](01-layout-navigation.md#blank) |
| @ohos.router | 页面路由（API 18 起废弃） | [ohosrouter](01-layout-navigation.md#ohosrouter-页面路由不推荐) |
| **状态管理** (15) | | [02-state-management.md](02-state-management.md) |
| @Entry | 页面入口装饰器 | [entry](02-state-management.md#entry) |
| @State | 组件内状态（内联参考） | [state](02-state-management.md#state) |
| @Prop | 父→子单向数据传递（内联参考） | [prop](02-state-management.md#prop) |
| @Link | 父⇄子双向数据绑定（内联参考） | [link](02-state-management.md#link) |
| @Provide | 跨组件状态提供（内联参考） | [provide](02-state-management.md#provide) |
| @Consume | 跨组件状态消费（内联参考） | [consume](02-state-management.md#consume) |
| @Watch | 状态变量变化监听 | [watch](02-state-management.md#watch) |
| @Builder | 自定义构建函数（内联参考） | [builder](02-state-management.md#builder) |
| @ObjectLink | @Observed 类实例观察（内联参考） | [objectlink](02-state-management.md#objectlink) |
| @StorageLink | AppStorage 双向绑定（内联参考） | [storagelink](02-state-management.md#storagelink) |
| AppStorage | 应用全局 UI 状态存储 | [appstorage](02-state-management.md#appstorage) |
| LocalStorage | 页面级 UI 状态存储 | [localstorage](02-state-management.md#localstorage) |
| PersistentStorage | 持久化 UI 状态 | [persistentstorage](02-state-management.md#persistentstorage) |
| Environment | 设备环境查询 | [environment](02-state-management.md#environment) |
| ForEach | 基于数组的循环渲染 | [foreach](02-state-management.md#foreach) |
| Repeat | 循环渲染（API 12+，推荐） | [repeat](02-state-management.md#repeat) |
| **数据持久化** (3) | | [03-data-persistence.md](03-data-persistence.md) |
| @ohos.data.preferences | Key-Value 轻量级用户首选项 | [preferences](03-data-persistence.md#ohosdatapreferences) |
| @ohos.data.sendablePreferences | Sendable 共享用户首选项 | [sendablePreferences](03-data-persistence.md#ohosdatasendablepreferences) |
| @ohos.data.relationalStore | SQLite 关系型数据库 | [relationalStore](03-data-persistence.md#ohosdatarelationalstore) |
| **画布与动画** (12) | | [04-canvas-animation.md](04-canvas-animation.md) |
| Canvas | 画布组件 | [canvas](04-canvas-animation.md#canvas) |
| CanvasRenderingContext2D | 2D 渲染上下文 | [context2d](04-canvas-animation.md#canvasrenderingcontext2d) |
| CanvasGradient | 渐变对象 | [gradient](04-canvas-animation.md#canvasgradient) |
| Path | 路径绘制组件（SVG 命令） | [path](04-canvas-animation.md#path图形绘制组件) |
| Path2D | 路径对象（Canvas 绘制用） | [path2d](04-canvas-animation.md#path2d) |
| Circle | 圆形绘制组件 | [circle](04-canvas-animation.md#circle) |
| Shape | 图形绘制父容器 | [shape](04-canvas-animation.md#shape) |
| animateTo | 显式动画（API 18 起改用 UIContext） | [animateto](04-canvas-animation.md#animateto) |
| transition | 组件内转场 | [transition](04-canvas-animation.md#transition) |
| keyframeAnimateTo | 关键帧动画 | [keyframe](04-canvas-animation.md#keyframeanimateto) |
| @ohos.curves | 插值曲线（弹簧/弹性/贝塞尔） | [curves](04-canvas-animation.md#ohoscurves) |
| animation（属性动画） | 属性变化自动过渡 | [animation](04-canvas-animation.md#属性动画-animation) |
| **弹窗、选择器与输入** (13) | | [05-dialogs-pickers.md](05-dialogs-pickers.md) |
| CustomDialog | 自定义弹窗 | [customdialog](05-dialogs-pickers.md#customdialog) |
| AlertDialog | 警告弹窗 | [alertdialog](05-dialogs-pickers.md#alertdialog) |
| DatePicker | 内联日期选择器 | [datepicker](05-dialogs-pickers.md#datepicker) |
| DatePickerDialog | 日期选择器弹窗 | [datepickerdialog](05-dialogs-pickers.md#datepickerdialog) |
| Rating | 评分组件 | [rating](05-dialogs-pickers.md#rating) |
| Button | 按钮组件 | [button](05-dialogs-pickers.md#button) |
| Slider | 滑动条组件 | [slider](05-dialogs-pickers.md#slider) |
| Checkbox | 多选框组件 | [checkbox](05-dialogs-pickers.md#checkbox) |
| TextInput | 单行文本输入 | [textinput](05-dialogs-pickers.md#textinput) |
| TextArea | 多行文本输入 | [textarea](05-dialogs-pickers.md#textarea) |
| Text | 文本显示组件 | [text](05-dialogs-pickers.md#text) |
| Image | 图片组件 | [image](05-dialogs-pickers.md#image) |
| @ohos.promptAction | Toast/对话框/操作菜单 API | [promptaction](05-dialogs-pickers.md#ohospromtaction) |
| **截图与分享** (6) | | [06-image-share.md](06-image-share.md) |
| @ohos.arkui.componentSnapshot | 组件截图（返回 PixelMap） | [componentsnapshot](06-image-share.md#ohosarkuicomponentsnapshot-组件截图) |
| @ohos.multimedia.image (ImagePacker) | 图片编码压缩 | [imagepacker](06-image-share.md#interface-imagepacker) |
| @ohos.multimedia.image (PixelMap) | 图像像素类 | [pixelmap](06-image-share.md#interface-pixelmap) |
| systemShare | 系统分享面板 | [systemshare](06-image-share.md#systemshare分享) |
| @ohos.file.photoAccessHelper | 相册管理（保存到图库） | [photoaccesshelper](06-image-share.md#函数) |
| SaveButton | 安全保存控件 | [savebutton](06-image-share.md#savebutton) |
| **生命周期与资源** (10) | | [07-lifecycle-resources.md](07-lifecycle-resources.md) |
| UIAbility | 应用组件生命周期管理 | [uiability](07-lifecycle-resources.md#uiability) |
| AbilityStage | Module 级组件管理器 | [abilitystage](07-lifecycle-resources.md#abilitystage) |
| WindowStage | 窗口入口管理 | [windowstage](07-lifecycle-resources.md#interface-windowstage) |
| Context | Stage 模型上下文基类 | [context](07-lifecycle-resources.md#context-stage模型的上下文基类) |
| aboutToAppear | 组件创建初始化回调 | [abouttoappear](07-lifecycle-resources.md#abouttoappear) |
| aboutToDisappear | 组件析构清理回调 | [abouttodisappear](07-lifecycle-resources.md#abouttodisappear) |
| onPageShow | 路由页面显示触发 | [onpageshow](07-lifecycle-resources.md#onpageshow) |
| onPageHide | 路由页面隐藏触发 | [onpagehide](07-lifecycle-resources.md#onpagehide) |
| @ohos.resourceManager | 应用资源管理 | [resourcemanager](07-lifecycle-resources.md#ohosresourcemanager-资源管理) |
| @ohos.hilog | 应用日志打印 | [hilog](07-lifecycle-resources.md#ohoshilog-hilog日志打印) |

## 重要提醒

- **8 个状态装饰器**（@State / @Prop / @Link / @Provide / @Consume / @Builder / @ObjectLink / @StorageLink）在本地参考文档中没有独立的 API 参考文件，其用法记录在 HarmonyOS 开发指南中。`02-state-management.md` 根据内联内容进行了整理。
- **@ohos.router** 从 API 18 起废弃，推荐使用 **Navigation + NavPathStack**。
- **animateTo 全局函数** 从 API 18 起废弃，推荐通过 `this.getUIContext()?.animateTo()` 调用。
- **componentSnapshot.get()** 从 API 18 起废弃，推荐使用 `UIContext.getComponentSnapshot()`。
- 所有 **ArkUI 内置组件**（Column/Row/Text/Button 等）无需 import 语句。
