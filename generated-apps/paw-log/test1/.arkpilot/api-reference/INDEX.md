# PawLog API Reference Index

- **Spec**: `.arkpilot/autopilot/spec.md`
- **Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **Total APIs Researched**: 60 (2 APIs noted as conceptual/design-time; 2 missing)
- **Groups**: 6

## API Index

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **Permissions — 权限请求** | | [`01-permissions.md`](01-permissions.md) |
| `abilityAccessCtrl.requestPermissionsFromUser()` | 运行时请求用户授权 | [`abilityaccessctrl-requestpermissionsfromuser`](01-permissions.md#abilityaccessctrl-requestpermissionsfromuser) |
| `@ohos.abilityAccessCtrl` | 程序访问控制管理模块 | [`ohosabilityaccessctrl`](01-permissions.md#ohosabilityaccessctrl) |
| `ohos.permission.READ_IMAGEVIDEO` | 读取图片视频权限字符串常量 | [`permissions-类型权限字符串常量`](01-permissions.md#permissions-类型权限字符串常量) |
| `ohos.permission.READ_MEDIA` | 读取媒体文件权限字符串常量 | [`permissions-类型权限字符串常量`](01-permissions.md#permissions-类型权限字符串常量) |
| `ohos.permission.WRITE_MEDIA` | 写入媒体文件权限字符串常量 | [`permissions-类型权限字符串常量`](01-permissions.md#permissions-类型权限字符串常量) |
| `Context (UIAbilityContext)` | UIAbility上下文，提供 Ability 信息等能力 | [`context-uiabilitycontext`](01-permissions.md#context-uiabilitycontext) |
| `@ohos.app.ability.UIAbility` | 带界面应用组件基类，提供生命周期回调 | [`ohosappabilityuiability`](01-permissions.md#ohosappabilityuiability) |
| `PermissionRequestResult` | 权限请求结果对象 | [`permissionrequestresult`](01-permissions.md#permissionrequestresult) |
| **Data Persistence — 数据持久化** | | [`02-persistence.md`](02-persistence.md) |
| `@ohos.data.preferences` (Preferences) | 轻量级 Key-Value 键值型数据持久化 | [`ohosdatapreferences-用户首选项`](02-persistence.md#ohosdatapreferences-用户首选项) |
| `@ohos.data.relationalStore` (RDB) | 关系型数据库（基于 SQLite） | [`ohosdatarelationalstore-关系型数据库`](02-persistence.md#ohosdatarelationalstore-关系型数据库) |
| `RdbStore` | RDB 管理接口（insert/update/delete/query） | [`interface-rdbstore`](02-persistence.md#interface-rdbstore) |
| `ValueType` | 数据字段允许类型 | [`types`](02-persistence.md#types) |
| `ValuesBucket` | 插入数据库用的键值对集合类型 | [`types`](02-persistence.md#types) |
| `ResultSet` | RDB 查询结果集 | [`interface-resultset`](02-persistence.md#interface-resultset) |
| **File Storage — 文件存储** | | [`03-file-storage.md`](03-file-storage.md) |
| `@ohos.file.fs` (fileIo) | 基础文件操作模块 | [`ohosfilefs-fileio`](03-file-storage.md#ohosfilefs-fileio) |
| `fileIo.open()` | 打开文件或目录 | [`fileioopen`](03-file-storage.md#fileioopen) |
| `fileIo.mkdir()` | 创建目录（API 11+ 支持递归） | [`fileiomkdir`](03-file-storage.md#fileiomkdir) |
| `fileIo.read()` | 从文件读取数据到 ArrayBuffer | [`fileioread`](03-file-storage.md#fileioread) |
| `fileIo.write()` | 将数据写入文件 | [`fileiowrite`](03-file-storage.md#fileiowrite) |
| `fileIo.copyFile()` | 复制文件 | [`fileiocopyfile`](03-file-storage.md#fileiocopyfile) |
| `fileIo.unlink()` | 删除文件 | [`fileiounlink`](03-file-storage.md#fileiounlink) |
| `fileIo.stat()` / `Stat` | 获取文件/目录属性 | [`fileiostat--stat-filestat`](03-file-storage.md#fileiostat--stat-filestat) |
| `@ohos.file.fileuri` | 文件 URI 转换 | [`ohosfilefileuri-fileuri`](03-file-storage.md#ohosfilefileuri-fileuri) |
| `Context.filesDir` / `Context.cacheDir` | 应用沙箱路径入口 | [`context-filesdir--cachedir-应用沙箱路径`](03-file-storage.md#context-filesdir--cachedir-应用沙箱路径) |
| **Image Picker — 图片选择** | | [`04-image-picker.md`](04-image-picker.md) |
| `@ohos.file.photoAccessHelper` | 相册管理模块（导入 `@kit.MediaLibraryKit`） | [`ohosfilephotoaccesshelper-photoaccesshelper`](04-image-picker.md#ohosfilephotoaccesshelper-photoaccesshelper) |
| `PhotoAccessHelper.getPhotoAccessHelper()` | 获取相册管理实例 | [`photoaccesshelpergetphotoaccesshelper`](04-image-picker.md#photoaccesshelpergetphotoaccesshelper) |
| `photoAccessHelper.PhotoViewPicker` | 图库选择器 | [`class-photoviewpicker`](04-image-picker.md#class-photoviewpicker) |
| `PhotoViewPicker.select()` | 拉起图库选择界面（返回永久授权 uri） | [`select`](04-image-picker.md#select) |
| `PhotoSelectOptions` | 选择选项（MIME 类型、最大数等） | [`photoselectoptions`](04-image-picker.md#photoselectoptions) |
| `PhotoAsset` | 媒体文件属性封装 | [`interface-photoasset`](04-image-picker.md#interface-photoasset) |
| `Album` | 实体相册接口 | [`interface-album`](04-image-picker.md#interface-album) |
| `PhotoKeys` | 图片视频关键信息枚举 | [`photokeys`](04-image-picker.md#photokeys) |
| **Image Processing — 图片处理** | | [`05-image-processing.md`](05-image-processing.md) |
| `@ohos.multimedia.image` (Image Kit) | 图片解码/编码/编辑模块入口 | [`@ohosmultimediaimage-image-kit`](05-image-processing.md#@ohosmultimediaimage-image-kit) |
| `image.createImageSource()` | 通过 uri/fd/buffer 创建 ImageSource | [`imagecreateimagesource`](05-image-processing.md#imagecreateimagesource) |
| `image.ImageSource` | 图片源类，解码为 PixelMap | [`imageimagesource`](05-image-processing.md#imageimagesource) |
| `image.createImagePacker()` | 创建编码器实例 | [`imagecreateimagepacker`](05-image-processing.md#imagecreateimagepacker) |
| `image.ImagePacker` | 图片编码类 | [`imageimagepacker`](05-image-processing.md#imageimagepacker) |
| `image.PackingOption` | 编码选项（格式、质量） | [`imagepackingoption`](05-image-processing.md#imagepackingoption) |
| `image.createPixelMap()` | 通过像素数据创建 PixelMap | [`imagecreatepixelmap`](05-image-processing.md#imagecreatepixelmap) |
| `image.PixelMap` | 位图对象（裁剪/缩放/旋转/读写像素） | [`imagepixelmap`](05-image-processing.md#imagepixelmap) |
| `image.DecodingOptions` | 解码设置选项 | [`imagedecodingoptions`](05-image-processing.md#imagedecodingoptions) |
| `image.Size` | 图片尺寸接口 | [`imagesize`](05-image-processing.md#imagesize) |
| `image.ImageInfo` | 图片元数据信息 | [`imageimageinfo`](05-image-processing.md#imageimageinfo) |
| `image.CreateIncrementalSource()` | 增量方式创建 ImageSource | [`imagecreateincrementalsource`](05-image-processing.md#imagecreateincrementalsource) |
| **Notifications — 本地通知** | | [`06-notifications.md`](06-notifications.md) |
| `@ohos.notificationManager` | 通知管理模块 | [`ohosnotificationmanager-notificationmanager`](06-notifications.md#ohosnotificationmanager-notificationmanager) |
| `notificationManager.publish()` | 发布通知 | [`notificationmanagerpublish`](06-notifications.md#notificationmanagerpublish) |
| `notificationManager.requestEnableNotification()` | 请求通知权限（替代 requestPermission） | [`notificationmanagerrequestpermission`](06-notifications.md#notificationmanagerrequestpermission) |
| `notificationManager.cancel()` | 取消指定通知 | [`notificationmanagercancel`](06-notifications.md#notificationmanagercancel) |
| `notificationManager.cancelAll()` | 取消全部通知 | [`notificationmanagercancelall`](06-notifications.md#notificationmanagercancelall) |
| `NotificationRequest` | 通知请求描述 | [`notificationrequest`](06-notifications.md#notificationrequest) |
| `NotificationBasicContent` | 普通文本通知内容 | [`notificationbasiccontent`](06-notifications.md#notificationbasiccontent) |
| `NotificationContent` | 通知内容容器 | [`notificationcontent`](06-notifications.md#notificationcontent) |
| `NotificationSlot` | 通知渠道定义 | [`notificationslot`](06-notifications.md#notificationslot) |
| `notificationManager.addSlot()` | 创建通知渠道 | [`notificationmanageraddslot`](06-notifications.md#notificationmanageraddslot) |
| `SlotType` | 通知渠道类型枚举 | [`slottype`](06-notifications.md#slottype) |
| `getNotificationSetting()` | 获取通知设置（含 notificationEnabled） | [`notificationsetting20`](06-notifications.md#notificationsetting20) |
| `@ohos.wantAgent` | WantAgent 创建模块（通知点击跳转） | [`ohoswantagent-wantagent`](06-notifications.md#ohoswantagent-wantagent) |

## Noteworthy Findings

- **Missing APIs (2)**:
  - `image.ImageDecoder` — 未找到对应类，解码能力由 `image.ImageSource` 提供
  - `notificationManager.requestPermission()` — 不存在，替代 API 为 `requestEnableNotification(context)`
- **Deprecated APIs**: `@ohos.file.picker` (PhotoViewPicker) 自 API 12 起废弃，改用 `photoAccessHelper.PhotoViewPicker`
- **Important Naming**: `@ohos.multimedia.photoAccessHelper` 实际模块名为 `@ohos.file.photoAccessHelper`
- **All docs sourced from**: local HarmonyOS references repo (`cn/harmonyos-references`)

## Usage

Implement agents should read this `INDEX.md` first, then load individual module files as needed.
