# 手作·印记 App — ArkTS API 参考索引

- **规格文件**: `.arkpilot/autopilot/spec.md`
- **文档来源**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **API 总数**: 73（8 个模块）
- **生成日期**: 2026-06-20

---

## 01 — 布局与容器组件 / `01-layout.md`

| API / 组件 | 用途 | 导入方式 |
|-----------|------|---------|
| [Tabs / TabContent](01-layout.md#tabstabcontent) | 底部 Tab 导航容器与页签内容切换 | 内置组件 |
| [Column](01-layout.md#column) | 垂直方向布局容器 | 内置组件 |
| [Row](01-layout.md#row) | 水平方向布局容器 | 内置组件 |
| [Scroll](01-layout.md#scroll) | 可滚动容器 | 内置组件 |
| [List](01-layout.md#list) | 列表容器（会员/课程/库存列表） | 内置组件 |
| [Grid / ForEach](01-layout.md#gridforeach) | 网格容器（作品图墙） + 循环渲染 | 内置组件 |
| [Stack](01-layout.md#stack) | 堆叠容器 | 内置组件 |
| [Flex](01-layout.md#flex) | 弹性布局容器 | 内置组件 |
| [Blank](01-layout.md#blank) | 空白填充组件 | 内置组件 |
| [Divider](01-layout.md#divider) | 分割线组件 | 内置组件 |
| [Badge](01-layout.md#badge) | 信息标记（未读/提醒） | 内置组件 |
| [Swiper](01-layout.md#swiper) | 滑块轮播容器 | 内置组件 |
| [router](01-layout.md#router-page-routing) | 页面路由跳转 | `@kit.ArkUI` |

## 02 — 控件与输入组件 / `02-controls.md`

| API / 组件 | 用途 | 导入方式 |
|-----------|------|---------|
| [Button](02-controls.md#button) | 按钮（操作触发） | 内置组件 |
| [TextInput](02-controls.md#textinput) | 单行文本输入 | 内置组件 |
| [TextArea](02-controls.md#textarea) | 多行文本输入（备注等） | 内置组件 |
| [Search](02-controls.md#search) | 搜索框（会员搜索） | 内置组件 |
| [Checkbox](02-controls.md#checkbox) | 多选框（工艺多选） | 内置组件 |
| [Radio](02-controls.md#radio) | 单选框 | 内置组件 |
| [Select](02-controls.md#select) | 下拉选择菜单 | 内置组件 |
| [DatePicker](02-controls.md#datepicker) | 日期选择器（课程创建） | 内置组件 |
| [TimePicker](02-controls.md#timepicker) | 时间选择器 | 内置组件 |
| [Text](02-controls.md#text) | 文本展示（核心组件） | 内置组件 |
| [Progress](02-controls.md#progress) | 进度条（库存进度） | 内置组件 |
| [LoadingProgress](02-controls.md#loadingprogress) | 加载动效 | 内置组件 |

## 03 — 弹窗与面板 / `03-dialogs.md`

| API / 组件 | 用途 | 导入方式 |
|-----------|------|---------|
| [AlertDialog](03-dialogs.md#alertdialog) | 警告弹窗（删除确认等） | 内置（推荐 UIContext） |
| [CustomDialog](03-dialogs.md#customdialog) | 完全自定义弹窗 | `@CustomDialog` |
| [ActionSheet](03-dialogs.md#actionsheet) | 列表选择弹窗 | 内置 |
| [BottomSheet (bindSheet)](03-dialogs.md#bottomsheet-bindsheet) | 半模态页面（签到成功反馈等） | 内置组件属性 |
| [promptAction](03-dialogs.md#promptaction) | 全局 Toast/对话框 | `@kit.ArkUI` |
| [Toast (openToast)](03-dialogs.md#toast) | 即时反馈提示 | 内置组件属性 |
| [Menu](03-dialogs.md#menu) | 垂直列表菜单（更多操作） | 内置（bindMenu） |

## 04 — 状态管理与响应式 / `04-state.md` + `04-state-supplement.md`

| API / 装饰器 | 用途 | 导入方式 |
|-------------|------|---------|
| [@State](04-state.md#@state) | 组件内可变状态 | 内置装饰器 |
| [@Prop](04-state.md#@prop) | 父→子单向同步 | 内置装饰器 |
| [@Link](04-state.md#@link) | 父↔子双向同步 | 内置装饰器 |
| [@Provide / @Consume](04-state.md#@provide/@consume) | 跨级祖→孙传递 | 内置装饰器 |
| [@Watch](04-state.md#@watch) | 状态变量变化监听 | 内置装饰器 |
| [@ObjectLink](04-state.md#@objectlink) | @Observed 类对象引用同步 | 内置装饰器 |
| [@Observed](04-state.md#@observed) | 可观察类装饰器 | 内置装饰器 |
| [@Builder](04-state.md#@builder) | 自定义构建函数 | 内置装饰器 |
| [@BuilderParam](04-state.md#@builderparam) | 构建函数引用 | 内置装饰器 |
| [AppStorage](04-state.md#appstorage) | 应用全局 UI 状态存储 | 内置 API |
| [LocalStorage](04-state.md#localstorage9) | UIAbility 级状态存储 | 内置 API |
| [@StorageLink / @StorageProp](04-state.md#@storagelink/-@storageprop) | 组件↔AppStorage 绑定 | 内置装饰器 |
| [ForEach](04-state.md#foreach) | 数组循环渲染 | 内置组件 API |
| [LazyForEach](04-state.md#lazyforeach) | 懒加载循环渲染 | 内置组件 API |

> ⚠️ @State / @Prop / @Link / @ObjectLink / @Observed / @Builder / @BuilderParam 的完整定义在 `04-state-supplement.md`（本地文档中无独立 API 参考页，从开发指南和错误码文档整理）

## 05 — 数据持久化 / `05-persistence.md`

| API / 模块 | 用途 | 导入路径 |
|------------|------|---------|
| [preferences](05-persistence.md#preferences-datapreferences) | K-V 轻量持久化（设置/状态） | `@kit.ArkData` |
| [relationalStore (RdbStore)](05-persistence.md#relationalstore-rdbstore) | SQLite 关系数据库（会员/课程/积分/库存数据） | `@kit.ArkData` |
| [PersistentStorage](05-persistence.md#persistentstorage) | AppStorage 属性持久化 | 内置（无需 import） |
| [Environment](05-persistence.md#environment) | 系统环境变量查询 | 内置（无需 import） |
| [fileIo](05-persistence.md#fileio-file-management) | 文件管理读写（图片文件存储） | `@kit.CoreFileKit` |

## 06 — 通知与提醒 / `06-notification.md`

| API / 模块 | 用途 | 导入路径 |
|------------|------|---------|
| [notificationManager](06-notification.md#notificationmanager) | 管理通知：发布/取消/渠道/权限 | `@kit.NotificationKit` |
| [notification.publish](06-notification.md#notificationmanagerpublish) | 向系统通知栏发布通知（沉睡提醒） | `@kit.NotificationKit` |
| [WantAgent](06-notification.md#wantagent-notificationwantagent) | 通知点击行为（打开 App 等） | `@kit.AbilityKit` |
| [Want](06-notification.md#want) | 组件间信息载体（bundleName/abilityName/params） | `@kit.AbilityKit` |
| [reminderAgentManager](06-notification.md#reminderagentmanager) | 系统后台提醒（倒计时/日历/闹钟类型） | `@kit.BackgroundTasksKit` |

## 07 — 图片与媒体 / `07-image.md`

| API / 模块 | 用途 | 导入路径 |
|------------|------|---------|
| [Image](07-image.md#image) | 图片展示组件（会员作品图等） | 内置组件 |
| [photoAccessHelper (PhotoViewPicker)](07-image.md#class-photoviewpicker) | 图库选择器（选择作品图片） | `@kit.MediaLibraryKit` |
| [picker (DocumentViewPicker)](07-image.md#documentviewpicker) | 文档选择器（文件选择/保存） | `@kit.CoreFileKit` |
| [fileIo](07-image.md#ohosfilefs-文件管理) | 文件读写（保存缩略图） | `@kit.CoreFileKit` |
| [image (ImageSource)](07-image.md#interface-imagesource) | 图片源解码 | `@kit.ImageKit` |
| [image (PixelMap)](07-image.md#interface-pixelmap) | 像素图处理 | `@kit.ImageKit` |
| [image (ImagePacker)](07-image.md#interface-imagepacker) | 图片压缩编码 | `@kit.ImageKit` |
| [camera](07-image.md#ohosmultimediacamera-相机管理) | 相机拍照（可选实现） | `@kit.CameraKit` |

## 08 — 动画 / `08-animation.md`

| API / 模块 | 用途 | 导入方式/路径 |
|-----------|------|-------------|
| [animateTo](08-animation.md#animateto-显式动画) | 显式动画（签到成功反馈等） | 内置（推荐 UIContext） |
| [animation](08-animation.md#animation-属性动画) | 属性动画（组件渐变过渡） | 内置组件属性 |
| [PageTransition](08-animation.md#transition--pagetransition-页面间转场) | 页面间转场动效 | 内置方法 |
| [组件内转场 (transition)](08-animation.md#transition--组件内转场) | 组件插入/删除过渡 | 内置组件属性 |
| [Curve](08-animation.md#curve-动画曲线--ohoscurves) | 动画曲线（阶梯/贝塞尔/弹簧） | `@ohos.curves` |
| [interpolatingSpring](08-animation.md#interpolatingspring-插值弹簧曲线) | 插值弹簧曲线 | `@ohos.curves` |
| [springCurve / springMotion](08-animation.md#springcurve--springmotion-弹簧弹性动画曲线) | 物理弹簧阻尼动画 | `@ohos.curves` |

---

## 重要发现

1. **API 废弃迁移**: `router`（API 18+ 废弃 → 推荐 `Navigation` 组件/`UIContext.getRouter()`）、`AlertDialog/ActionSheet/promptAction` 系列（API 18+ 废弃 → 推荐 `UIContext` 方法）、`@ohos.notification`（API 9+ 废弃 → `notificationManager`）
2. **状态装饰器文档缺失**: @State / @Prop / @Link 等 8 个装饰器在 `harmonyos-references` 中无独立 API 参考页（位于 `.arkts-guides` 开发指南），已整理补充在 `04-state-supplement.md`
3. **数据持久化**: 应用使用 `relationalStore`（SQLite）存储结构化数据（会员/课程/积分/库存）+ `preferences` 存储轻量配置
4. **权限需求**: 通知需要 `ohos.permission.PUBLISH_AGENT_REMINDER`、提醒需要 `ohos.permission.NOTIFICATION_CONTROLLER`、网络图片需要 `ohos.permission.INTERNET`
5. **所有 UI 内置组件**（如 Column/Row/Button/Text 等）无需 import，可直接在 `@Component struct` 的 `build()` 中使用

---

*实施代理请先读此 INDEX，再按需加载对应模块文件。生成的 API 参考文件在 `api-reference/` 目录下。*
