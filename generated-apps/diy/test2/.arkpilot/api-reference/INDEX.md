# ArkTS API Reference — 手作·印记 App

- **Spec**: `.arkpilot/autopilot/spec.md`
- **Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **Total APIs Researched**: 86 (across 6 modules, all `found`)
- **Purpose**: Non-generic platform API reference for implement agents. Read `INDEX.md` first, then load individual module files as needed.

## API Index

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **Permissions & Runtime Authorization** |
| `@ohos.abilityAccessCtrl` | 权限校验、用户授权请求、权限状态监听 | [01-permissions.md](01-permissions.md#ohosabilityaccessctrl) |
| `ohos.permission.READ_IMAGEVIDEO` | 读取相册媒体资源权限声明 | [01-permissions.md](01-permissions.md#ohospermissionread_imagevideo) |
| `ohos.permission.WRITE_IMAGEVIDEO` | 写入相册媒体资源权限声明 | [01-permissions.md](01-permissions.md#ohospermissionwrite_imagevideo) |
| `PermissionRequestResult` | 权限请求结果对象（authResults / errorReasons） | [01-permissions.md](01-permissions.md#permissionrequestresult) |
| `GrantStatus` | 授权状态枚举（DENIED / GRANTED） | [01-permissions.md](01-permissions.md#grantstatus) |
| **Relational Database (RDB)** |
| `relationalStore` (from `@kit.ArkData`) | RDB 模块：getRdbStore / deleteRdbStore / isVectorSupported | [02-relational-database.md](02-relational-database.md#relationalstore) |
| `RdbStore` | CRUD：insert / update / delete / query / querySql / executeSql / batchInsert | [02-relational-database.md](02-relational-database.md#rdbstore) |
| `ResultSet` | 查询结果集：行指针移动 / getString / getLong / getBlob / 字段类型读取 | [02-relational-database.md](02-relational-database.md#resultset) |
| `ValuesBucket` | 数据库插入/更新的键值对数据（`Record<string, ValueType \| Uint8Array \| null>`） | [02-relational-database.md](02-relational-database.md#valuesbucket) |
| **Preferences (KV Storage)** |
| `preferences` (from `@kit.ArkData`) | KV 持久化模块：getPreferences / deletePreferences | [03-preferences.md](03-preferences.md#ohosdatapreferences) |
| `Preferences` 实例 | get / put / has / delete / flush / clear / on('change') 事件订阅 | [03-preferences.md](03-preferences.md#preferences) |
| `StorageType` (API 18+) | 存储模式枚举：XML（需 flush） / GSKV（实时持久化） | [03-preferences.md](03-preferences.md#storagetype18) |
| **Album Access & File Picker** |
| `photoAccessHelper.PhotoViewPicker` | 图库选择器（推荐），拉起系统相册，返回永久授权 URI | [04-album-file.md](04-album-file.md#photoviewpicker-photoaccesshelper) |
| `picker.DocumentViewPicker` | 文档选择器，选择/保存任意格式文档 | [04-album-file.md](04-album-file.md#documentviewpicker) |
| `photoAccessHelper.getPhotoAccessHelper` | 获取相册管理模块实例 | [04-album-file.md](04-album-file.md#photoaccesshelpergetphotoaccesshelper) |
| `phAccessHelper.getAssets` | 通过 picker URI 查询媒体资源（无需 READ_IMAGEVIDEO 权限） | [04-album-file.md](04-album-file.md#getassets) |
| `phAccessHelper.createAsset` | 创建图片/视频到媒体库 | [04-album-file.md](04-album-file.md#createasset) |
| `fileIo` (from `@kit.CoreFileKit`) | 文件读写：openSync / read / write / closeSync / mkdir / unlink / copyFile / readText | [04-album-file.md](04-album-file.md#fileiostat) |
| **Image Processing (Thumbnails)** |
| `image` (from `@kit.ImageKit`) | Image Kit 模块：createImageSource / createImagePacker | [05-image-processing.md](05-image-processing.md#image-module) |
| `ImageSource` | 图片源：解码 / createThumbnail / 获取图片信息 / Exif 读写 | [05-image-processing.md](05-image-processing.md#imagesource) |
| `ImagePacker` | 图片编码：将 ImageSource / PixelMap 编码为压缩数据或文件 | [05-image-processing.md](05-image-processing.md#imagepacker) |
| `PackingOption` | 编码选项：format / quality / bufferSize | [05-image-processing.md](05-image-processing.md#packingoption) |
| `createImageSource` | 通过 uri / fd / ArrayBuffer 创建 ImageSource | [05-image-processing.md](05-image-processing.md#createimagesource) |
| `createImagePacker` | 创建 ImagePacker 实例 | [05-image-processing.md](05-image-processing.md#createimagepacker) |
| **Share Kit (System Share)** |
| `systemShare.ShareController` | 分享面板控制器：拉起系统分享面板 | [06-share.md](06-share.md#systemshare) |
| `systemShare.SharedData` | 封装分享数据（文本/链接/文件/图片） | [06-share.md](06-share.md#shareddata) |
| `systemShare.SharedRecord` | 分享数据记录（utd、content/uri、title、description、thumbnail） | [06-share.md](06-share.md#sharedrecord) |
| `systemShare.getSharedData` | 从目标应用 want 中解析分享数据 | [06-share.md](06-share.md#getshareddata) |
| `harmonyShare.on('knockShare')` | 碰一碰分享事件监听 | [06-share.md](06-share.md#onknockshare) |

## Notable Findings

- **Picker 可绕过相册权限**：`photoAccessHelper.PhotoViewPicker` 返回的 URI 授予永久授权，无需声明 `READ_IMAGEVIDEO` — 推荐本应用采用此方式读取会员作品图片
- **RDB 限制**：单条 ≤ 2MB，字符串字段 ≤ 8MB，单次查询 ≤ 5000 行；大查询建议放入 TaskPool
- **Preferences 无多进程保护**：仅单进程使用；GSKV 模式（API 18+）无需手动 flush
- **`@ohos.fileio` 已废弃**（API 9+）：迁移至 `@ohos.file.fs`（导入名 `fileIo`，来自 `@kit.CoreFileKit`）
- **ImageSource.createThumbnailSync**（API 26+）：直接生成缩略图，仅 JPEG/HEIF 格式
- **`@ohos.share` 不存在**：正确导入为 `@kit.ShareKit`，含 `systemShare` 和 `harmonyShare` 两个命名空间
- **SharedData 上限**：最多 500 条记录，总数据 ≤ 200KB（IPC 限制）

## Module Files

| # | 文件 | 内容 | 大小 |
|---|------|------|------|
| 1 | [01-permissions.md](01-permissions.md) | 权限声明与运行时授权 | 5 APIs |
| 2 | [02-relational-database.md](02-relational-database.md) | 关系型数据库 CRUD | 4 APIs |
| 3 | [03-preferences.md](03-preferences.md) | KV 偏好存储 | 40 APIs |
| 4 | [04-album-file.md](04-album-file.md) | 相册选取与文件 IO | 17 APIs |
| 5 | [05-image-processing.md](05-image-processing.md) | 图片解码/编码/缩略图 | 6 APIs |
| 6 | [06-share.md](06-share.md) | 系统分享面板 | 14 APIs |
| **Total** | | | **86 APIs** |
