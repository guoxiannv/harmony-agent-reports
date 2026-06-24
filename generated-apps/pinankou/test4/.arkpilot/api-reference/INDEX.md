# 平安扣 Pinankou — ArkTS API 参考索引

- **Spec**: `.arkpilot/autopilot/spec.md`
- **Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **API 总数**: 33 APIs (5 个模块)
- **全部 API 已验证**: 通过与本地 HarmonyOS 文档交叉验证，0 个缺失

## 模块总览

| Module | 文件 | APIs | 功能域 |
|--------|------|------|--------|
| 01 | [01-permissions.md](01-permissions.md) | 10 | 权限声明与运行时授权 |
| 02 | [02-camera-image.md](02-camera-image.md) | 9 | 拍照、相册、图片处理 |
| 03 | [03-persistence.md](03-persistence.md) | 9 | 本地数据持久化 |
| 04 | [04-location.md](04-location.md) | 3 | 位置服务与地理围栏 |
| 05 | [05-telephony.md](05-telephony.md) | 2 | 拨号服务 |

## API 索引

### 01 — Permissions (权限声明)

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| @ohos.abilityAccessCtrl | 权限校验、运行时授权请求 | [01-permissions.md](01-permissions.md#ohosabilityaccessctrl-程序访问控制管理) |
| @ohos.bundle.bundleManager | 获取 accessTokenId 等应用包信息 | [01-permissions.md](01-permissions.md#ohosbundlebundlemanager-应用程序包管理模块) |
| ohos.permission.CAMERA | 相机权限 | [01-permissions.md](01-permissions.md#ohospermission-权限字符串常量) |
| ohos.permission.APPROXIMATELY_LOCATION | 模糊位置权限 | [01-permissions.md](01-permissions.md#ohospermission-权限字符串常量) |
| ohos.permission.LOCATION | 精确位置权限 | [01-permissions.md](01-permissions.md#ohospermission-权限字符串常量) |
| ohos.permission.LOCATION_IN_BACKGROUND | 后台位置权限 | [01-permissions.md](01-permissions.md#ohospermission-权限字符串常量) |
| ohos.permission.READ_MEDIA | 读取媒体文件权限 | [01-permissions.md](01-permissions.md#ohospermission-权限字符串常量) |
| ohos.permission.WRITE_MEDIA | 写入媒体文件权限 | [01-permissions.md](01-permissions.md#ohospermission-权限字符串常量) |
| ohos.permission.CALL_PHONE | 拨打电话权限 | [01-permissions.md](01-permissions.md#ohospermission-权限字符串常量) |
| PermissionRequestResult | 权限请求结果对象 | [01-permissions.md](01-permissions.md#permissionrequestresult) |

### 02 — Camera & Image (拍照与图片)

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| @ohos.multimedia.camera | 相机核心模块：预览/拍照/录像 | [02-camera-image.md](02-camera-image.md#ohosmultimediacamera-相机管理) |
| @ohos.multimedia.cameraPicker | 系统相机选择器（拉起系统相机） | [02-camera-image.md](02-camera-image.md#ohosmultimediacamerapicker-相机选择器) |
| @ohos.multimedia.image | 图片解码/编码/编辑/元数据处理 | [02-camera-image.md](02-camera-image.md#ohosmultimediaimage-图片处理) |
| @ohos.file.photoAccessHelper | 相册管理模块 | [02-camera-image.md](02-camera-image.md#ohosfilephotoaccesshelper-相册管理模块) |
| @ohos.file.sendablePhotoAccessHelper | Sendable 版相册管理（API 12+） | [02-camera-image.md](02-camera-image.md#ohosfilesendablephotoaccesshelper-基于sendable对象的相册管理模块) |
| @ohos.file.PhotoPickerComponent | 嵌入页面的照片选择组件（免权限） | [02-camera-image.md](02-camera-image.md#ohosfilephotopickercomponent-photopicker组件) |
| CameraManager | 相机管理器：查询设备/创建流/创建会话 | [02-camera-image.md](02-camera-image.md#cameramanager) |
| CameraInput | 相机输入对象：开关相机/监听异常 | [02-camera-image.md](02-camera-image.md#camerainput) |
| PhotoOutput | 拍照输出接口 | [02-camera-image.md](02-camera-image.md#photooutput) |

### 03 — Data Persistence (数据持久化)

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| @ohos.data.preferences | 轻量级 Key-Value 持久化 | [03-persistence.md](03-persistence.md#ohosdatapreferences-用户首选项) |
| @ohos.data.sendablePreferences | Sendable 版 Key-Value（API 12+） | [03-persistence.md](03-persistence.md#ohosdatasendablepreferences-共享用户首选项) |
| @ohos.data.relationalStore | SQLite 关系型数据库 | [03-persistence.md](03-persistence.md#模块描述) |
| RdbStore | 数据库 CRUD 接口 | [03-persistence.md](03-persistence.md#interface-rdbstore) |
| ResultSet | 查询结果集（游标式访问） | [03-persistence.md](03-persistence.md#interface-resultset) |
| RdbPredicates | SQL 谓词条件构建 | [03-persistence.md](03-persistence.md#class-rdbpredicates) |
| @ohos.data.ValuesBucket | 数据集合（插入/更新的值载体） | [03-persistence.md](03-persistence.md#ohosdatavaluesbucket-数据集) |
| @ohos.data.dataSharePredicates | DataShare 谓词（查询条件） | [03-persistence.md](03-persistence.md#ohosdatadatasharepredicates-数据共享谓词) |
| @ohos.file.fs / fileIo | 基础文件管理 | [03-persistence.md](03-persistence.md#ohosfilefs-文件管理) |

### 04 — Location (位置服务)

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| @ohos.geoLocationManager | GNSS/网络定位、地理编码、地理围栏、国家码 | [04-location.md](04-location.md#ohosgeolocationmanager-位置服务) |
| @ohos.app.ability.FenceExtensionAbility | 地理围栏后台回调扩展 Ability（API 14+） | [04-location.md](04-location.md#ohosappabilityfenceextensionability-fenceextensionability) |
| @ohos.app.ability.FenceExtensionContext | FenceExtensionAbility 上下文 | [04-location.md](04-location.md#ohosappabilityfenceextensioncontext-fenceextensioncontext) |

### 05 — Telephony (拨号服务)

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| @ohos.telephony.call | 拨打电话/跳转拨号界面/通话状态 | [05-telephony.md](05-telephony.md#ohostelephonycall-拨打电话) |
| voipCall | 应用内 VoIP 通话管理（API 11+） | [05-telephony.md](05-telephony.md#voipcall-应用内通话管理) |

## 关键发现

- **权限**: `Permissions` 是 `@kit.AbilityKit` 导出的字符串字面量联合类型，无独立文档文件；位置权限需注意精确/模糊/后台三级粒度。
- **相机**: 推荐使用 `PhotoPickerComponent`（API 12+，免权限）或 `cameraPicker`（API 11+）简化拍照流程。
- **图片**: 支持 JPEG/PNG/GIF/WebP/HEIC/DNG 等格式解码；`sendablePhotoAccessHelper`（API 12+）适合并发场景。
- **持久化**: 结构化实体数据推荐 `relationalStore`（SQLite），单条<2MB；配置类推荐 `preferences`；sendable 版（API 12+）支持跨 Sendable 传递。
- **定位**: 坐标系统统一为 WGS-84；地理围栏最多 100 个（GNSS）/10 个（Beacon）。
- **拨号**: 第三方应用应使用 `call.makeCall()` 跳转系统拨号界面（`call.dial()` 自 API 9 起废弃，仅系统应用可用）。

> **Implement agents**: 先读此 INDEX.md 确定需要的模块，再按需加载对应的 `<NN>-<group>.md` 模块文件。
