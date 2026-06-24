# 手作·印记 — API 参考文档索引

- **Spec**: `.arkpilot/autopilot/spec.md`
- **Docs root**: `harmonyos-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **Total APIs**: 40 (3 modules, 0 missing)
- **Kits**: `@kit.ArkData` / `@kit.MediaLibraryKit` / `@kit.CoreFileKit` / `@kit.ImageKit` / `@kit.NotificationKit` / `@kit.AbilityKit`

## API 总览

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **01 — Data Persistence (RDB & Preferences)** | | [01-persistence.md](01-persistence.md) |
| `relationalStore.getRdbStore` | 创建/打开关系型数据库 | [anchor](01-persistence.md#relationalstoregetrdbstore) |
| `relationalStore.deleteRdbStore` | 删除数据库文件 | [anchor](01-persistence.md#relationalstoredeleterdbstore) |
| `RdbStore.insert` | 插入数据行 | [anchor](01-persistence.md#insert) |
| `RdbStore.update` | 按条件更新数据 | [anchor](01-persistence.md#update) |
| `RdbStore.delete` | 按条件删除数据 | [anchor](01-persistence.md#delete) |
| `RdbStore.query` | 按条件查询，返回 ResultSet | [anchor](01-persistence.md#query) |
| `ResultSet` | 游标式结果集访问 (goToNextRow, getString 等) | [anchor](01-persistence.md#interface-resultset) |
| `preferences.getPreferences` | 获取 Key-Value 首选项实例 | [anchor](01-persistence.md#preferencesgetpreferences) |
| `Preferences.put / get / delete` | 缓存级别的 KV 读写删除 | [anchor](01-persistence.md#h2put) |
| `Preferences.flush` | 将缓存持久化到 XML 文件 | [anchor](01-persistence.md#h2flush) |
| `ValueType` (RDB / Prefs) | 字段数据类型映射 | [anchor](01-persistence.md#valuetype) |
| **02 — Image Picker & Album Access** | | [02-image-picker.md](02-image-picker.md) |
| `PhotoViewPicker.select()` | 系统相册选择照片，返回可永久授权的 URI | [anchor](02-image-picker.md#photoviewpicker-照片选择器) |
| `photoAccessHelper.getPhotoAccessHelper` | 获取相册管理实例 | [anchor](02-image-picker.md#photoaccesshelpergetphotoaccesshelper) |
| `PhotoAccessHelper.getAssets` | 按条件查询相册资产 | [anchor](02-image-picker.md#photoaccesshelpergetassets) |
| `PhotoAccessHelper.createAsset` | 创建新的媒体资源到相册 | [anchor](02-image-picker.md#photoaccesshelpercreateasset) |
| `DocumentViewPicker` | 系统文档选择器（选择/保存通用文件） | [anchor](02-image-picker.md#ohosfilepicker-选择器) |
| `image.createImagePacker` | 创建图片编码器 (JPEG/PNG/WebP) | [anchor](02-image-picker.md#imagecreateimagepacker-图片编码) |
| `ImagePacker.packToData` | 编码为 ArrayBuffer（替代已废弃的 packing） | [anchor](02-image-picker.md#imagepackerpacktodata) |
| `ImagePacker.packToFile` | 编码并直接写入文件 fd | [anchor](02-image-picker.md#imagepackerpacktofile) |
| `image.createImageSource` | 从 URI/fd/缓冲区创建图片解码源 | [anchor](02-image-picker.md#imagecreateimagesource-图片解码) |
| `ImageSource.createPixelMap` | 解码为可渲染的 PixelMap | [anchor](02-image-picker.md#imagesourcecreatepixelmap) |
| `@ohos.file.fs` | 文件打开/读取/写入/关闭操作 | [anchor](02-image-picker.md#ohosfilefs-文件io操作) |
| `Image` 组件 | 显示 Resource/PixelMap/file:// URI 图片 | [anchor](02-image-picker.md#image组件-显示图片) |
| **03 — Local Notifications (Reminders)** | | [03-local-notification.md](03-local-notification.md) |
| `@ohos.notificationManager` | 通知 API 入口模块 | [anchor](03-local-notification.md#ohosnotificationmanager-notificationmanager) |
| `notificationManager.publish` | 发布本地通知 | [anchor](03-local-notification.md#notificationmanagerpublish-发布通知) |
| `notificationManager.requestEnableNotification` | 请求通知权限（API 12+ 需传 UIAbilityContext） | [anchor](03-local-notification.md#notificationmanagerrequestenablenotification-请求通知权限) |
| `notificationManager.cancel` | 按 ID 取消已发布通知 | [anchor](03-local-notification.md#notificationmanagercancel-取消通知) |
| `NotificationRequest` | 通知请求对象（content/id/slotType/wantAgent） | [anchor](03-local-notification.md#notificationrequest-通知请求对象) |
| `NotificationBasicContent` | 基本文本通知（title/text/additionalText） | [anchor](03-local-notification.md#notificationbasiccontent-基本通知内容) |
| `NotificationLongTextContent` | 长文本展开型通知 | [anchor](03-local-notification.md#notificationlongtextcontent-长文本通知内容) |
| `wantAgent (from @kit.AbilityKit)` | 通知点击跳转到指定 Ability | [anchor](03-local-notification.md#ohosappabilitywantagent-wantagent点击通知跳转) |

## 重要注意事项

- `data.createRdbStore` / `data.deleteRdbStore` **已废弃** — 使用 `relationalStore.getRdbStore` / `relationalStore.deleteRdbStore`
- `@ohos.multimedia.mediaLibrary` **已废弃** — 使用 `@ohos.file.photoAccessHelper`
- `ImagePacker.packing()` **已废弃** (API 13+) — 使用 `packToData()`
- `@ohos.wantAgent` → `@ohos.app.ability.wantAgent`，从 `@kit.AbilityKit` 导入
- Preferences `put/delete` 仅修改缓存，必须调用 `flush()` 持久化
- PhotoViewPicker 返回的 URI 具有永久授权，无需额外申请权限
- 通知必须先通过 `requestEnableNotification` 获取用户授权
- 所有 Kit import 统一使用 `@kit.*` 模式

## 使用说明

1. 先读 `INDEX.md` 了解全貌
2. 按需加载对应的 `<NN>-<group>.md` 模块文件获取详细签名、示例和注意事项
