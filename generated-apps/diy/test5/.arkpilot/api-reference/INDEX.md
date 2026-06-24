# 手作·印记 API 参考索引

> **规格**: `test5/.arkpilot/autopilot/spec.md`
> **文档源**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
> **模块数**: 6 | **API 总数**: 56（52 个已确认, 4 个归属权限列表文档）
> 实现 agent 请先读此索引，再按需加载各模块文件。

## API 速查表

| API / 组件 | 用途 | 详细文档 |
|-----------|------|----------|
| **关系型数据库** | | [01-relational-store.md](01-relational-store.md) |
| `relationalStore.getRdbStore` | 创建/打开 RDB 数据库 | [[getRdbStore]](01-relational-store.md#relationalstoregetrdbstore) |
| `RdbStore.insert` | 插入数据行 | [[insert]](01-relational-store.md#rdbstoreinsert) |
| `RdbStore.update` | 按条件更新数据 | [[update]](01-relational-store.md#rdbstoreupdate) |
| `RdbStore.delete` | 按条件删除数据 | [[delete]](01-relational-store.md#rdbstoredelete) |
| `RdbStore.query` / `querySql` | 查询数据 → `ResultSet` | [[query]](01-relational-store.md#rdbstorequery) |
| `RdbStore.executeSql` | 执行非查询 SQL（DDL/INSERT/UPDATE/DELETE） | [[executeSql]](01-relational-store.md#rdbstoreexecutesql) |
| `ValuesBucket` | 数据行键值对类型 | [[ValuesBucket]](01-relational-store.md#valuesbucket) |
| `ResultSet` | 查询结果游标，需 `close()` | [[ResultSet]](01-relational-store.md#resultset) |
| `ValueType` | 支持的数据字段类型联合 | [[ValueType]](01-relational-store.md#valuetype) |
| **用户首选项** | | [02-preferences.md](02-preferences.md) |
| `getPreferences` | 获取 Preferences 实例 | [[getPreferences]](02-preferences.md#preferencesgetpreferences) |
| `Preferences.put` / `get` / `delete` | 键值对读写删 | [[put]](02-preferences.md#put) |
| `Preferences.flush` | 持久化到首选项文件 | [[flush]](02-preferences.md#flush) |
| `Preferences.getAll` | 获取所有键值数据 | [[getAll]](02-preferences.md#getall) |
| `Preferences.on` | 订阅数据变更通知 | [[on('change')]](02-preferences.md#onchange) |
| **文件选择器** | | [03-file-picker.md](03-file-picker.md) |
| `PhotoViewPicker` | ⚠️ 已废弃 — 图库图片选择 | [[PhotoViewPicker]](03-file-picker.md#photoviewpickerdeprecated) |
| `PhotoViewPicker.select` | ⚠️ 已废弃 — 拉起图库选图 | [[select]](03-file-picker.md#selectdeprecated-0) |
| `DocumentViewPicker` | 文档/文件选择器 | [[DocumentViewPicker]](03-file-picker.md#documentviewpicker) |
| `DocumentViewPicker.select` | 拉起文件选择界面 | [[select]](03-file-picker.md#select) |
| **图片处理** | | [04-image-processing.md](04-image-processing.md) |
| `image.createImageSource` | 创建图片解码源（URI/fd/ArrayBuffer） | [[createImageSource]](04-image-processing.md#imagecreateimagesource) |
| `ImageSource.createPixelMap` | 解码为 PixelMap 位图 | [[createPixelMap]](04-image-processing.md#imagesourcecreatepixelmap7) |
| `PixelMap` | 位图对象，支持裁剪/缩放/旋转 | [[PixelMap]](04-image-processing.md#pixelmap) |
| `image.createImagePacker` | 创建图片编码器 | [[createImagePacker]](04-image-processing.md#imagecreateimagepacker) |
| `ImagePacker.packing` | ⚠️ 已废弃（API 13）— 用 `packToData()` | [[packing]](04-image-processing.md#imagepackerpackingdeprecated) |
| **沙箱文件管理** | | [05-file-management.md](05-file-management.md) |
| `fileIo.open` | 打开文件，获取 File 对象 | [[open]](05-file-management.md#fsopen) |
| `fileIo.read` / `write` | 文件流式读写 | [[read]](05-file-management.md#fsread) |
| `fileIo.mkdir` | 创建目录（API 11+ 支持递归） | [[mkdir]](05-file-management.md#fsmkdir) |
| `fileIo.copyFile` | 复制文件 | [[copyFile]](05-file-management.md#fscopyfile) |
| `fileIo.access` | 检查文件/目录是否存在 | [[access]](05-file-management.md#fsaccess) |
| `fileIo.unlink` | 删除文件 | [[unlink]](05-file-management.md#fsunlink) |
| `fileIo.listFile` | 列出目录下文件 | [[listFile]](05-file-management.md#fslistfile) |
| `fileIo.stat` | 获取文件/目录属性 | [[stat]](05-file-management.md#fsstat) |
| `fileIo.moveDir` | 移动目录 | [[moveDir]](05-file-management.md#fsmovedir) |
| **权限管理** | | [06-permissions.md](06-permissions.md) |
| `AtManager.requestPermissionsFromUser` | 动态申请用户授权 | [[requestPermissionsFromUser]](06-permissions.md#requestpermissionsfromuser9) |
| `AtManager.checkAccessTokenSync` | 查询权限状态 | [[ATManager]](06-permissions.md#atmanager) |
| `ohos.permission.READ_IMAGEVIDEO` | 读取媒体图片/视频（声明在 app-permissions 指南） | — |
| `ohos.permission.WRITE_IMAGEVIDEO` | 写入媒体图片/视频（声明在 app-permissions 指南） | — |

## 关键发现

1. **导入路径变化**: 新版 HarmonyOS 推荐 `@kit.*` 导入路径而非旧版 `@ohos.*`（例如 `@kit.ArkData`、`@kit.CoreFileKit`、`@kit.ImageKit`、`@kit.AbilityKit`），但仍兼容旧路径。
2. **RDB 限制**: 单条数据建议不超过 2MB（共享内存限制），`ResultSet` 使用后必须 `close()`。
3. **PhotoViewPicker 已废弃**: 自 API 12 起 `@ohos.file.picker` 中已废弃，推荐迁移至 `photoAccessHelper`（`@kit.MediaLibraryKit`），返回永久授权 URI。
4. **ImagePacker.packing() 废弃**: 自 API 13 起废弃，应使用 `packToData()`。
5. **fileIo 命名**: 沙箱文件管理模块导入名为 `fileIo` 而非 `fs`。
6. **权限声明**: `ohos.permission.READ_IMAGEVIDEO` / `WRITE_IMAGEVIDEO` 属于 app-permissions 指南范畴，不在 API reference 中；若使用 PhotoViewPicker（而非 photoAccessHelper）则无需声明。

## 使用指引

- 实现 **数据层** → 加载 [01-relational-store](01-relational-store.md) + [02-preferences](02-preferences.md)
- 实现 **图片选择** → 加载 [03-file-picker](03-file-picker.md) + [06-permissions](06-permissions.md)（若用 photoAccessHelper）
- 实现 **图片存储/缩略图** → 加载 [04-image-processing](04-image-processing.md) + [05-file-management](05-file-management.md)
