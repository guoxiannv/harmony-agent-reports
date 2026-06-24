# PawLog ArkTS API Reference Index

- **Spec**: `.arkpilot/autopilot/spec.md`
- **Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **Total APIs**: 38 researched across 6 modules
- **Found**: 36 | **Missing**: 2 (setSlot, and permission name docs not in API reference)
- **Test Target**: `generated-apps/paw-log/test2`

---

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **01 — 权限与 Ability Access Control** | | [`01-permissions.md`](01-permissions.md) |
| `ohos.abilityAccessCtrl` | 权限校验与用户授权管理 | [#ohosabilityaccessctrl](01-permissions.md#ohosabilityaccessctrl-程序访问控制管理) |
| `AtManager.checkAccessToken` | 检查指定权限是否已授予（异步） | [#checkaccesstoken9](01-permissions.md#checkaccesstoken9) |
| `AtManager.checkAccessTokenSync` | 检查指定权限是否已授予（同步，API 10+） | [#checkaccesstokensync10](01-permissions.md#checkaccesstokensync10) |
| `AtManager.requestPermissionsFromUser` | 拉起系统授权弹框 | [#requestpermissionsfromuser9](01-permissions.md#requestpermissionsfromuser9) |
| `AtManager.requestPermissionOnSetting` | 二次拉起权限设置弹框（API 12+） | [#requestpermissiononsetting12](01-permissions.md#requestpermissiononsetting12) |
| `PermissionRequestResult` | 权限请求结果对象 | [#permissionrequestresult](01-permissions.md#permissionrequestresult) |
| `GrantStatus` | 授权状态枚举 | [#grantstatus](01-permissions.md#grantstatus) |
| `PermissionStatus` | 权限状态（API 20+） | [#permissionstatus20](01-permissions.md#permissionstatus20) |
| **02 — 数据持久化 (ArkData)** | | [`02-arkdata.md`](02-arkdata.md) |
| `@ohos.data.preferences` | 键值对轻量持久化存储 | [#@ohosdatapreferences](02-arkdata.md#@ohosdatapreferences-用户首选项) |
| `@ohos.data.relationalStore` | SQLite 关系型数据库 | [#@ohosdatarelationalstore](02-arkdata.md#@ohosdatarelationalstore-关系型数据库) |
| `@ohos.data.sendableRelationalStore` | 跨线程 Sendable 数据库（API 12+） | [#@ohosdatasendablerelationalstore](02-arkdata.md#@ohosdatasendablerelationalstore-共享关系型数据库) |
| `@ohos.data.ValuesBucket` | 数据集类型定义 | [#@ohosdatavaluesbucket](02-arkdata.md#@ohosdatavaluesbucket-数据集) |
| `@ohos.data.dataSharePredicates` | 数据查询谓词 | [#@ohosdatadatasharepredicates](02-arkdata.md#@ohosdatadatasharepredicates-数据共享谓词) |
| **03 — 文件管理 (Core File Kit)** | | [`03-file.md`](03-file.md) |
| `@ohos.file.fs` | 文件/目录基本操作与 IO | [#ohosfilefs](03-file.md#ohosfilefs-文件管理) |
| `@ohos.file.picker` | 系统文件选择器（文档/音频/图片） | [#ohosfilepicker](03-file.md#ohosfilepicker-选择器) |
| `@ohos.file.environment` | 系统目录路径获取 | [#ohosfileenvironment](03-file.md#ohosfileenvironment-目录环境能力) |
| `@ohos.file.fileuri` | 文件 URI ↔ 沙箱路径转换 | [#ohosfilefileuri](03-file.md#ohosfilefileuri-文件URI) |
| **04 — 相册访问 (Media Library)** | | [`04-photo-access.md`](04-photo-access.md) |
| `@ohos.file.photoAccessHelper` | 相册管理实例获取 | [#ohosfilephotoaccesshelper](04-photo-access.md#ohosfilephotoaccesshelper-相册管理模块) |
| `PhotoViewPicker` | 系统相册选择器拉起 | [#photoviewpicker](04-photo-access.md#photoviewpicker) |
| `AlbumPickerComponent` | 嵌入相册列表组件（API 12+） | [#albumpickercomponent](04-photo-access.md#albumpickercomponent) |
| `PhotoPickerComponent` | 嵌入媒体选择组件（API 12+） | [#photopickercomponent](04-photo-access.md#photopickercomponent) |
| `FetchResult` | 检索结果集遍历 | [#fetchresult](04-photo-access.md#fetchresult) |
| `PhotoAsset` | 媒体文件资产接口 | [#photoasset](04-photo-access.md#photoasset) |
| `MediaAssetManager` | 媒体资产管理（缩略图请求等） | [#mediaassetmanager](04-photo-access.md#mediaassetmanager) |
| **05 — 图片处理 (Image Kit)** | | [`05-image.md`](05-image.md) |
| `@ohos.multimedia.image` | 图片解码/编码/编辑能力 | [#ohosmultimediaimage](05-image.md#ohosmultimediaimage-图片处理) |
| `PixelMap` | 位图对象（缩放/裁剪/旋转） | [#pixelmap](05-image.md#pixelmap) |
| `ImagePacker` | 图片压缩编码 | [#imagepacker](05-image.md#imagepacker) |
| `ImageSource` | 图片源解码 | [#imagesource](05-image.md#imagesource) |
| `image.createImageSource` | 创建 ImageSource 实例 | [#imagecreateimagesource](05-image.md#imagecreateimagesource) |
| `image.createPixelMap` | 创建 PixelMap 对象 | [#imagecreatepixelmap8](05-image.md#imagecreatepixelmap8) |
| `image.PackingOption` | 编码选项（格式/质量等） | [#packingoption](05-image.md#packingoption) |
| **06 — 通知 (Notification Kit)** | | [`06-notification.md`](06-notification.md) |
| `@ohos.notificationManager` | 通知管理器模块 | [#ohosnotificationmanager](06-notification.md#ohosnotificationmanager-notificationmanager模块) |
| `notificationManager.publish` | 发布/更新通知 | [#notificationmanagerpublish](06-notification.md#notificationmanagerpublish) |
| `NotificationRequest` | 通知请求对象 | [#notificationrequest](06-notification.md#notificationrequest) |
| `NotificationSlot` | 通知渠道配置 | [#notificationslot](06-notification.md#notificationslot) |
| `NotificationContent` | 通知内容联合类型 | [#notificationcontent](06-notification.md#notificationcontent) |
| `notificationManager.requestEnableNotification` | 请求通知授权 | [#requestenablenotification](06-notification.md#notificationmanagerrequestenablenotification10) |

---

## 关键发现

- **权限**：`ohos.permission.READ_IMAGEVIDEO` / `WRITE_IMAGEVIDEO` 为 app-permissions 文档中的 user_grant 常量，需在 `module.json5` 的 `requestPermissions` 中声明。使用 Picker 组件（PhotoViewPicker / PhotoPickerComponent）可**免权限**获取相册内容。
- **图片选择**：优先使用 `PhotoViewPicker.select`（API 10+）或 `PhotoPickerComponent`（API 12+ 嵌入组件），它们返回的 URI 具有临时或永久授权，无需声明相册权限。
- **文件操作**：`@kit.CoreFileKit` 统一导入。沙箱路径用 `file.fs` 直接操作；picker 文档 URI 需通过 `fileUri` 转换。
- **数据持久化**：`@kit.ArkData` 统一导入。轻量数据用 `preferences`，结构化数据用 `relationalStore`。`sendableRelationalStore` 仅 API 12+ 跨线程场景需要。
- **通知**：`@kit.NotificationKit` 统一导入。`requestEnableNotification` 从 API 12 起需传 `UIAbilityContext`。通知渠道用 `addSlot/removeSlot` 管理，无 `setSlot` API。
- **图片处理**：`import { image } from '@kit.ImageKit'`。PixelMap 序列化上限 128MB，使用后必须调用 `release()`。

## 使用指引

Implement agents 应先读此 `INDEX.md`，再按需加载对应模块的 `.md` 文件。
