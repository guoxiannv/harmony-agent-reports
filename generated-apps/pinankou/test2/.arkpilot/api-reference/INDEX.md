# 平安扣 Pinankou — ArkTS API 参考索引

- **Spec**: `spec.md`
- **Docs Root**: `cn/harmonyos-references`
- **API 总数**: 86 个（已找到 78 个，8 个装饰器需参考开发指南，1 个组件 (ProgressIndicator) 用 Progress 替代，1 个模块 (fileAccess) 用 fileManagerService 替代）
- **模块数**: 8

| API / 组件 | 用途 | 详细文档 |
|---|---|---|
| **01 — 布局与导航** | | [`01-layout-navigation.md`](01-layout-navigation.md) |
| `Column` | 垂直方向线性布局容器 | [↗](01-layout-navigation.md#column) |
| `Row` | 水平方向线性布局容器 | [↗](01-layout-navigation.md#row) |
| `Stack` | 堆叠容器，子组件叠加覆盖 | [↗](01-layout-navigation.md#stack) |
| `Blank` | 空白填充组件 | [↗](01-layout-navigation.md#blank) |
| `Divider` | 分割线组件 | [↗](01-layout-navigation.md#divider) |
| `List` / `ListItem` | 列表容器及条目 | [↗](01-layout-navigation.md#list) |
| `Scroll` | 可滚动容器 | [↗](01-layout-navigation.md#scroll) |
| `Grid` / `GridItem` | 网格容器及单项 | [↗](01-layout-navigation.md#grid) |
| `Swiper` | 滑块视图容器 | [↗](01-layout-navigation.md#swiper) |
| `Tabs` / `TabContent` | 页签切换容器 | [↗](01-layout-navigation.md#tabs) |
| `Navigation` / `NavDestination` | 路由导航根视图（推荐替代 Router） | [↗](01-layout-navigation.md#navigation) |
| `Badge` | 信息标记组件 | [↗](01-layout-navigation.md#badge) |
| **02 — 状态管理** | | [`02-state-management.md`](02-state-management.md) |
| `@State` `@Prop` `@Link` | 组件内/单向/双向状态（内置装饰器） | [↗](02-state-management.md) |
| `@Provide` `@Consume` | 跨层级数据传递 | [↗](02-state-management.md#provide) |
| `@Observed` `@ObjectLink` | 嵌套对象可观察绑定 | [↗](02-state-management.md) |
| `@Watch` | 状态变量变化监听 | [↗](02-state-management.md#watch) |
| `AppStorage` | 应用全局 UI 状态存储 | [↗](02-state-management.md#appstorage) |
| `LocalStorage` | 页面级 UI 状态存储 | [↗](02-state-management.md#localstorage9) |
| `PersistentStorage` | AppStorage 持久化到磁盘 | [↗](02-state-management.md#persistentstorage) |
| `Environment` | 设备环境变量查询 | [↗](02-state-management.md#environment) |
| **03 — 数据持久化** | | [`03-data-persistence.md`](03-data-persistence.md) |
| `dataPreferences` | 轻量 Key-Value 本地存储 | [↗](03-data-persistence.md#ohosdatapreferences-用户首选项) |
| `relationalStore` | 关系型数据库 (SQLite) | [↗](03-data-persistence.md#模块描述) |
| `distributedKVStore` | 分布式键值数据库 | [↗](03-data-persistence.md#ohosdatadistributedkvstore-分布式键值数据库) |
| `distributedObject` | 分布式数据对象（自动协同） | [↗](03-data-persistence.md#ohosdatadistributeddataobject-分布式数据对象) |
| **04 — 相机与媒体** | | [`04-media-camera.md`](04-media-camera.md) |
| `CameraManager` | 相机管理核心类 | [↗](04-media-camera.md#cameramanager) |
| `cameraPicker` | 快速拍照/录制（无需 CAMERA 权限） | [↗](04-media-camera.md#camerapicker) |
| `PhotoViewPicker` | 图库选择器 | [↗](04-media-camera.md#photoviewpicker-imagepicker) |
| `ImagePacker` | 图片编码/压缩 | [↗](04-media-camera.md#imagepacker) |
| `AudioCapturer` | 音频采集 (PCM) | [↗](04-media-camera.md#audiocapturer) |
| `AVRecorder` | 音视频录制（替代 AudioRecorder） | [↗](04-media-camera.md#avrecorder-audiorecorder-alternative) |
| `photoAccessHelper` | 相册资源管理 | [↗](04-media-camera.md#photoaccesshelper) |
| **05 — 定位与网络** | | [`05-location-network.md`](05-location-network.md) |
| `geoLocationManager` | GNSS/网络定位 | [↗](05-location-network.md#geolocationmanager) |
| `geoLocationManager.on('locationChange')` | 持续位置变化订阅 | [↗](05-location-network.md#geolocationmanageronlocationchange) |
| `geoLocationManager.getLastLocation` | 获取最后已知位置 | [↗](05-location-network.md#geolocationmanagergetlastlocation) |
| `geocoder` (逆地理编码) | 坐标→地址描述 | [↗](05-location-network.md#geolocationmanagergetaddressesfromlocation) |
| `http` | HTTP 数据请求 | [↗](05-location-network.md#ohnethttp) |
| `request.uploadFile` / `request.downloadFile` | 文件上传/下载任务 | [↗](05-location-network.md#requestuploadfile9) |
| **06 — 统计图表** | | [`06-stats-charts.md`](06-stats-charts.md) |
| `Canvas` / `CanvasRenderingContext2D` | 画布容器及上下文（核心制图API） | [↗](06-stats-charts.md#canvas) |
| `Path` / `Shape` / `Circle` / `Rect` | 形状绘制组件 | [↗](06-stats-charts.md#path) |
| `DataPanel` | 数据占比图（环/线2种样式） | [↗](06-stats-charts.md#datapanel) |
| `Text` / `Span` | 文本显示（图表标签） | [↗](06-stats-charts.md#text) |
| `LoadingProgress` | 加载动效提示 | [↗](06-stats-charts.md#loadingprogress) |
| **07 — 通知与后台任务** | | [`07-notifications-background.md`](07-notifications-background.md) |
| `notificationManager` | 通知发布/更新/取消 | [↗](07-notifications-background.md#notificationmanager) |
| `notificationContent` | 通知内容类型定义 | [↗](07-notifications-background.md#notificationcontent) |
| `notificationSlot` | 通知渠道定义 | [↗](07-notifications-background.md#notificationslot) |
| `WantAgent` | 通知点击跳转/响应 | [↗](07-notifications-background.md#notificationwantagent) |
| `workScheduler` / `WorkInfo` | 延迟任务调度 | [↗](07-notifications-background.md#workscheduler) |
| `backgroundTaskManager` | 后台短/长时任务管理 | [↗](07-notifications-background.md#backgroundtaskmanager) |
| `reminderAgentManager` | 后台代理提醒 | [↗](07-notifications-background.md#reminderagent-reminder) |
| **08 — 工具能力** | | [`08-utility-capabilities.md`](08-utility-capabilities.md) |
| `fileIo (fs)` | 基础文件读写操作 | [↗](08-utility-capabilities.md#fileio-fs) |
| `photoAccessHelper` | 相册媒体资源访问 | [↗](08-utility-capabilities.md#photoaccesshelper) |
| `contact (contactsManager)` | 联系人管理 | [↗](08-utility-capabilities.md#contact-contactsmanager) |
| `call (telephony)` | 拨打电话 | [↗](08-utility-capabilities.md#call-telephony) |
| `UIAbility` / `AbilityStage` | 应用组件生命周期 | [↗](08-utility-capabilities.md#uiability) |
| `window` | 窗口管理 | [↗](08-utility-capabilities.md#window) |
| `abilityAccessCtrl` | 权限校验和管理 | [↗](08-utility-capabilities.md#abilityaccessctrl) |
| `bundleManager` | 应用包信息查询 | [↗](08-utility-capabilities.md#bundlemnager) |

**关键发现与注意事项**:
- `Router` (@ohos.router, API18 废弃) 和 `NavRouter` (API13 废弃) → **统一使用 Navigation + NavPathStack + NavDestination**
- `@State` / `@Prop` / `@Link` 等 8 个装饰器为内置语法，无独立 API 文档文件，参考 HarmonyOS 开发指南
- V1 状态管理大写 API（Link/Prop/SetOrCreate）自 API10 废弃；V2 使用 `@ohos.arkui.StateManagement`
- `AudioRecorder` 已废弃 → 使用 `AVRecorder`
- `ProgressIndicator` 未找到 → 推荐 `Progress` 组件或 `DataPanel`
- `fileAccess` 未找到 → 使用 `fileManagerService` (@kit.FileManagerServiceKit)
- `request.uploadFile`/`downloadFile` 需 `BaseContext`（仅 Stage 模型），旧接口自 API9 废弃
- 持久化建议：配置用 `dataPreferences`，业务数据用 `relationalStore`
- 图表核心：`CanvasRenderingContext2D` 自定义绘制 + `DataPanel` 快速占比图
