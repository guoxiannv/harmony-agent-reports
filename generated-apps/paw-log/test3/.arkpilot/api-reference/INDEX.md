# PawLog (宠迹) · API 参考索引

- **规格文件**: `test3/.arkpilot/autopilot/spec.md`
- **文档源**: `harmonyos-references/`
- **API 总数**: 109 个已确认（另有 6 个命名调整/缺失已在各模块中注明）
- **模块数**: 8 个功能模块

## API 速查表

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **01 — 权限管理** | | [`01-permissions.md`](01-permissions.md) |
| `abilityAccessCtrl` / `createAtManager()` | 权限管理入口 | `#abilityaccessctrl` |
| `AtManager.requestPermissionsFromUser` | 运行时权限申请 | `#atmanager` |
| `PermissionRequestResult` | 授权结果对象 | `#permissionrequestresult` |
| `ohos.permission.CAMERA` | 相机权限字符串 | `#ohospermissioncamera` |
| `ohos.permission.READ_IMAGE_VIDEO` | 读取图片/视频权限 | `#ohospermissionreadimagevideo` |
| `ohos.permission.WRITE_IMAGE_VIDEO` | 写入图片/视频权限 | `#ohospermissionwriteimagevideo` |
| `ohos.permission.NOTIFICATION_CONTROLLER` | 通知控制权限 | `#ohospermissionnotificationcontroller` |
| `ohos.permission.DISTRIBUTED_DATASYNC` | 分布式数据同步权限 | `#ohospermissiondistributeddatasync` |
| `Permissions` | 权限名称联合类型 | `#permissions` |
| **02 — 相机拍照** | | [`02-camera.md`](02-camera.md) |
| `camera.getCameraManager(context)` | 获取相机管理器 | `#cameragetcameramanager` |
| `CameraManager` | 相机管理器（获取设备/创建流） | `#cameramanager` |
| `CameraInput` | 相机输入/开关控制 | `#camerainput` |
| `CameraDevice` | 相机设备信息 | `#cameradevice` |
| `PhotoOutput.capture()` | 拍照输出 | `#photooutput` |
| `PreviewOutput` | 预览输出 | `#previewoutput` |
| `cameraManager.createPhotoOutput()` | 创建拍照输出 | `#createphotooutput11` |
| `ImageReceiver`（Image Kit） | 图片接收器 | `#imagereceiver` |
| **03 — 相册选择与图片处理** | | [`03-media-library.md`](03-media-library.md) |
| `PhotoViewPicker.select()` | 从相册选择图片/视频 | `#photoviewpicker` |
| `photoAccessHelper.getAssets()` | 查询媒体资源 | `#photoaccesshelper` |
| `ImagePacker.packToData()` | 图片编码为压缩数据 | `#imagepacker` |
| `image.createImageSource()` | 创建解码源 | `#imagecreateimagesource` |
| `image.createPixelMap()` | 创建位图对象 | `#imagecreatepixelmap` |
| `PixelMap` | 位图操作（读写/裁剪/缩放） | `#pixelmap` |
| `ImageSource` | 图片解码源 | `#imagesource` |
| `PackingOption` | 编码参数（格式/质量） | `#packingoption` |
| **04 — 文件管理** | | [`04-file.md`](04-file.md) |
| `fileIo.open/openSync` | 打开文件 | `#fileioopen` |
| `fileIo.read` / `fileIo.write` | 读写文件 | `#fileioread` |
| `fileIo.mkdir` | 创建目录 | `#fileiomkdir` |
| `fileIo.access` | 检查文件存在性 | `#fileioaccess` |
| `fileIo.listFile` | 列出目录内容 | `#fileiolistfile` |
| `fileIo.unlink` / `fileIo.copyFile` | 删除/复制文件 | `#fileiounlink` |
| `fileUri.getUriFromPath()` | 沙箱路径 → URI | `#fileurigeturifrompath` |
| `DocumentViewPicker` | 文件选择/保存 | `#documentviewpicker` |
| `context.filesDir` | 应用沙箱目录 | `#contextfilesdir` |
| `securityLabel` | 数据安全等级设置 | `#securitylabelsetsecuritylabel` |
| **05 — 本地通知** | | [`05-notification.md`](05-notification.md) |
| `notificationManager.publish()` | 发布通知 | `#notificationmanagerpublish` |
| `notificationManager.cancel()` | 取消指定通知 | `#notificationmanagercancel` |
| `notificationManager.cancelAll()` | 取消所有通知 | `#notificationmanagercancelall` |
| `notificationManager.requestEnableNotification()` | 拉起通知授权弹窗 | `#notificationmanagerrequestenablenotification10` |
| `NotificationRequest` | 通知请求对象 | `#notificationrequest` |
| `NotificationContent` | 通知内容容器 | `#notificationcontent` |
| `NotificationBasicContent` | 普通文本通知内容 | `#notificationbasiccontent` |
| `NotificationSlot` | 通知渠道配置 | `#notificationslot` |
| **06 — 数据持久化** | | [`06-data-persistence.md`](06-data-persistence.md) |
| `relationalStore.getRdbStore()` | 创建/打开关系型数据库 | `#ohosdatarelationalstore` |
| `RdbStore.insert/query/update/delete` | CRUD 操作 | `#insert` |
| `relationalStore.executeSql()` | 执行 SQL | `#executesqlpromise` |
| `preferences.getPreferences()` | 获取 Preferences 实例 | `#preferencesgetpreferencespromise` |
| `Preferences.put/get/delete` | KV 读写操作 | `#putpromise` |
| `dataSharePredicates` | 筛选谓词 | `#ohosdatadatasharepredicates-数据共享谓词` |
| `ValuesBucket` | 键值数据集 | `#valuesbucket-1` |
| `StoreConfig` | 数据库配置 | `#storeconfig` |
| `ResultSet` | 查询结果集 | `#interface-resultset` |
| **07 — 后台任务** | | [`07-background-tasks.md`](07-background-tasks.md) |
| `workScheduler.startWork()` | 申请延迟任务 | `#workschedulerstartwork` |
| `workScheduler.stopWork()` | 取消延迟任务 | `#workschedulerstopwork` |
| `WorkInfo` | 延迟任务信息 | `#workinfo` |
| `backgroundTaskManager.startBackgroundRunning()` | 申请长时任务 | `#backgroundtaskmanagerstartbackgroundrunning` |
| `backgroundTaskManager.BackgroundMode` | 长时任务模式枚举 | `#backgroundmode` |
| `backgroundTaskManager.requestSuspendDelay()` | 申请短时任务 | `#backgroundtaskmanagerrequestsuspenddelay` |
| **08 — Ability 生命周期与上下文** | | [`08-lifecycle-context.md`](08-lifecycle-context.md) |
| `UIAbility`（onCreate/onForeground/onBackground/onDestroy） | 应用生命周期 | `#uiability` |
| `AbilityStage` | Module 级组件管理器 | `#abilitystage` |
| `Context` | Stage 模型上下文基类 | `#context-stage模型的上下文基类` |
| `Want` | 组件间信息传递载体 | `#want` |
| `common.UIAbilityContext` | Ability 上下文类型 | `#uiabilitycontext` |
| `AbilityConstant.LaunchReason` | 启动原因枚举 | `#launchreason` |
| `StartOptions` | 启动可选参数 | `#startoptions` |

## 重要发现

- **权限请求**：`requestPermissionsFromUser` 是 `AtManager` 实例方法（非 Context 直接方法），`AtManager.verifyAccessToken` 已废弃，改用 `checkAccessToken`
- **相机**：`camera.createCameraManager` 不存在，实际为 `camera.getCameraManager(context)`；`createPhotoOutput` 等为 `CameraManager` 实例方法
- **图片**：`PhotoSaveButton` 和 `ImageDecoder` 在本地文档中未找到；图片解码通过 `ImageSource.createPixelMap()` 完成
- **文件**：`@ohos.file.fs` 导入名为 `fileIo`（非 `fs`）；`PhotoViewPicker` 在 `@ohos.file.picker` 中从 API 12 起废弃
- **通知**：`@ohos.notification` 已废弃（API 11+），使用 `@ohos.notificationManager` | `@kit.NotificationKit`
- **数据持久化**：`@ohos.data.relationalStore` / `@ohos.data.preferences` 统一使用 `@kit.ArkData` 导入
- **后台任务**：`WorkSchedulerInfo` 不存在，实际类型名为 `WorkInfo`；两个模块均从 `@kit.BackgroundTasksKit` 导入
- **生命周期**：`onForeground`/`onBackground` 为同步接口；`onDestroy` 支持 Promise 异步

## 使用说明

Implement agents 应先读此 `INDEX.md`，再按需加载单个模块文件（`01-*.md` ~ `08-*.md`）。模块间存在依赖关系时使用交叉链接引用。
