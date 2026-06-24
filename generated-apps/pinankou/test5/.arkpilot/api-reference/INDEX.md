# 平安扣 Pinankou — ArkTS API 参考索引

- **规格文件**: `.arkpilot/autopilot/spec.md`
- **文档仓库**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **总 API 数**: 75 (6 个模块)
- **查询状态**: 全部完成，3 个 API 需注意替代方案

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **01 — 权限管理 (Permissions)** | | [`01-permissions.md`](01-permissions.md) |
| `@ohos.abilityAccessCtrl` | 程序访问控制管理（AtManager） | [#ohosabilityaccessctrl](01-permissions.md#ohosabilityaccessctrl-程序访问控制管理) |
| `AtManager.createAtManager` | 创建 AtManager 权限管理实例 | [#createatmanager](01-permissions.md#abilityaccessctrlcreateatmanager) |
| `AtManager.requestPermissionsFromUser` | 拉起弹框请求用户授权（拍照、定位等） | [#requestpermissionsfromuser](01-permissions.md#requestpermissionsfromuser9) |
| `AtManager.checkAccessToken` | 校验应用是否被授予指定权限 | [#checkaccesstoken](01-permissions.md#checkaccesstoken9) |
| `AtManager.requestPermissionOnSetting` | 用户拒绝后二次引导授权 | [#requestpermissionsonsetting](01-permissions.md#requestpermissionsonsetting12) |
| `AtManager.requestGlobalSwitch` | 全局开关弹框（相机/麦克风/位置） | [#requestglobalswitch](01-permissions.md#requestglobalswitch12) |
| `PermissionRequestResult` | 权限请求结果对象类型 | [#permissionrequestresult](01-permissions.md#permissionrequestresult10) |
| `ohos.permission.CAMERA` | 相机权限常量 | [#权限常量](01-permissions.md#权限常量-ohospermission) |
| `ohos.permission.LOCATION` | 位置权限常量 | [#权限常量](01-permissions.md#权限常量-ohospermission) |
| `ohos.permission.READ_IMAGEVIDEO` | 读取图片/视频权限 | [#权限常量](01-permissions.md#权限常量-ohospermission) |
| `ohos.permission.WRITE_IMAGEVIDEO` | 写入图片/视频权限 | [#权限常量](01-permissions.md#权限常量-ohospermission) |
| **02 — 相机拍照 (Camera & Picker)** | | [`02-camera-picker.md`](02-camera-picker.md) |
| `camera.getCameraManager` | 获取相机管理器实例 | [#cameramanager](02-camera-picker.md#ohosmultimediacamera-相机管理) |
| `CameraManager.getSupportedCameras` | 获取支持的相机设备列表 | [#cameramanager](02-camera-picker.md#cameramanager) |
| `CameraManager.createSession` | 创建 PhotoSession 拍照会话 | [#cameramanager](02-camera-picker.md#cameramanager) |
| `CameraManager.createCameraInput` | 创建 CameraInput 输入源 | [#cameramanager](02-camera-picker.md#cameramanager) |
| `CameraManager.createPreviewOutput` | 创建预览输出（SurfaceId） | [#cameramanager](02-camera-picker.md#cameramanager) |
| `CameraManager.createPhotoOutput` | 创建拍照输出 | [#cameramanager](02-camera-picker.md#cameramanager) |
| `CameraInput.open/close` | 打开/关闭相机设备 | [#camerainput](02-camera-picker.md#camerainput) |
| `CameraDevice` | 相机设备信息（位置、类型） | [#cameradevice](02-camera-picker.md#cameradevice) |
| `cameraPicker.pick` | 系统相机选择器（拍照/录像） | [#pick](02-camera-picker.md#ohosmultimediacamerapicker-相机选择器) |
| `SurfaceId` | 预览表面 ID（XComponent/ImageReceiver） | [#surfaceid](02-camera-picker.md#surfaceid) |
| **03 — 媒体文件与图片处理 (Media File & Image)** | | [`03-media-file.md`](03-media-file.md) |
| `photoAccessHelper.getPhotoAccessHelper` | 获取相册管理实例 | [#photoaccesshelper](03-media-file.md#ohosfilephotoaccesshelper-相册管理模块) |
| `PhotoViewPicker.select` | 系统图库选择器（选择图片/视频） | [#photoviewpicker](03-media-file.md#ohosfilephotoaccesshelper-相册管理模块) |
| `PhotoAccessHelper.getAssets` | 查询相册媒体资源 | [#getassets](03-media-file.md#ohosfilephotoaccesshelper-相册管理模块) |
| `PhotoAsset` | 媒体文件属性封装 | [#photoasset](03-media-file.md#ohosfilephotoaccesshelper-相册管理模块) |
| `fileIo.open/close/read/write` | 应用沙箱文件读写 | [#fileio](03-media-file.md#ohosfilefs-文件管理) |
| `fileIo.mkdir/access/listFile` | 目录管理及文件检查 | [#fileio](03-media-file.md#ohosfilefs-文件管理) |
| `image.createImageSource` | 创建图片解码源（URI/fd） | [#createimagesource](03-media-file.md#ohosmultimediaimage-图片处理) |
| `image.createImagePacker` | 创建图片编码器（压缩/重编码） | [#createimagepacker](03-media-file.md#ohosmultimediaimage-图片处理) |
| `ImagePacker.packToData` | 图片压缩编码为 ArrayBuffer | [#packtodata](03-media-file.md#ohosmultimediaimage-图片处理) |
| `fileUri.getUriFromPath` | 路径 → 应用文件 URI | [#geturifrompath](03-media-file.md#ohosfilefileuri-文件URI) |
| **04 — 数据持久化 (Data Persistence)** | | [`04-data-persistence.md`](04-data-persistence.md) |
| `preferences.getPreferences` | 获取 Preferences 键值存储实例 | [#getpreferences](04-data-persistence.md#ohosdatapreferences-用户首选项) |
| `Preferences.put/get/delete/flush` | 键值读写删与持久化 | [#put](04-data-persistence.md#put) |
| `Preferences.on('change')` | 订阅 Preferences 变更通知 | [#onchange](04-data-persistence.md#onchange) |
| `relationalStore.getRdbStore` | 创建/打开关系型数据库 | [#getrdbstore](04-data-persistence.md#relationalstoregetrdbstore) |
| `RdbStore.insert/update/delete/query` | 数据库 CRUD 操作 | [#insert](04-data-persistence.md#insert) |
| `RdbStore.querySql/executeSql` | 原始 SQL 查询与执行 | [#querysql](04-data-persistence.md#querysql) |
| `ValuesBucket` | 数据行类型（键值对） | [#valuesbucket](04-data-persistence.md#ohosdatavaluesbucket-数据集) |
| **05 — 定位服务 (Location)** | | [`05-location.md`](05-location.md) |
| `geoLocationManager.getLastLocation` | 获取上次缓存位置（同步） | [#getlastlocation](05-location.md#geolocationmanagergetlastlocation) |
| `geoLocationManager.getCurrentLocation` | 单次定位获取当前位置 | [#getcurrentlocation](05-location.md#geolocationmanagergetcurrentlocation) |
| `geoLocationManager.on('locationChange')` | 订阅连续位置变化 | [#onlocationchange](05-location.md#geolocationmanageronlocationchange) |
| `geoLocationManager.isLocationEnabled` | 检查位置服务开关 | [#islocationenabled](05-location.md#geolocationmanagerislocationenabled) |
| **06 — 一键拨号 (One-Click Dialing)** | | [`06-call.md`](06-call.md) |
| `call.makeCall` | 跳转系统拨号界面（推荐方式） | [#makecall](06-call.md#callmakecall7) |
| `call.hasVoiceCapability` | 检查设备语音通话能力 | [#hasvoicecapability](06-call.md#callhasvoicecapability7) |
| `wantAgent.getWantAgent` | 创建 WantAgent 实例 | [#getwantagent](06-call.md#wantagentgetwantagent) |
| `wantAgent.trigger` | 触发 WantAgent 执行操作 | [#trigger](06-call.md#wantagenttrigger) |
| `Want` | 应用组件间信息传递载体 | [#want](06-call.md#want) |
| `WantAgentInfo` | WantAgent 创建配置信息 | [#wantagentinfo](06-call.md#wantagentinfo-1) |

## 注意事项

- **权限请求**: 使用 `AtManager.requestPermissionsFromUser`（非 UIAbilityContext 方法），`UIAbilityContext` 作为 context 参数传入
- **一键拨号**: 使用 `call.makeCall` 跳转系统拨号界面，无需特殊权限；`call.dial` 已废弃且仅系统应用可用
- **图片解码**: 使用 `ImageSource.createPixelMap()`，无 `unpackImage` API
- **相册选择**: `@ohos.file.picker.PhotoViewPicker` 从 API 12 废弃，迁移到 `photoAccessHelper.PhotoViewPicker`
- **RDB 适用性**: 单条数据受共享内存 2MB 限制；`executeSql` 不支持多条语句和事务（API 12+ 推荐 `execute()`）

> Implement agents: 先读 `INDEX.md` 概览，再按需加载单个模块文件。
