# API 参考索引

> 为「今天吃什么」应用生成的非通用 ArkTS API 参考文档。
>
> - Spec 路径: `test5/.arkpilot/autopilot/spec.md`
> - Docs 仓库: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
> - 覆盖模块: 4 个 | 关键 API: 7 个

## API 速查表

| API / 组件 | 用途 | 详细文档 |
|---|---|---|
| `@ohos.data.preferences` | 轻量 KV 持久化 — 配置项、用户偏好 | [01-data-persistence.md](#ohos-data-preferences-用户首选项) |
| `@ohos.data.relationalStore` | SQLite 关系型数据库 — 菜品库、食材清单、打卡记录 | [01-data-persistence.md](#ohos-data-relationalstore-关系型数据库) |
| `@ohos.arkui.componentSnapshot` (UIContext) | 组件截图 — 将分享卡片 UI 截取为 PixelMap | [02-component-snapshot.md](#componentsnapshotget-uicontext-promise) |
| `@ohos.multimedia.image` — image.Packer | 图片编码 — 将 PixelMap 编码为 JPEG/PNG/WebP | [03-image-encoding.md](#ohosmultimediaimage--imagepacker-imagepacker) |
| `@ohos.multimedia.image` — image.PixelMap | 位图操作 — 裁剪、缩放、读取/写入像素 | [03-image-encoding.md](#ohosmultimediaimage--pixelmap-imagepixelmap) |
| `@ohos.file.photoAccessHelper` | 相册管理 — 将生成的分享卡片保存到系统相册 | [04-album-file-io.md](#ohosfilephotoaccesshelper-相册管理) |
| `@ohos.file.fs` | 文件 I/O — 临时文件写入、URI 读写 | [04-album-file-io.md](#ohosfilefs-文件管理) |

## 模块概览

| 模块 | 文件 | API 数 | 核心依赖 |
|---|---|---|---|
| 01 — Data Persistence | `01-data-persistence.md` | 2 | `@kit.ArkData` |
| 02 — Component Snapshot | `02-component-snapshot.md` | 20 个方法/类型 | ArkUI 内置 (UIContext) |
| 03 — Image Encoding | `03-image-encoding.md` | 3 | `@kit.ImageKit` |
| 04 — Album Save & File IO | `04-album-file-io.md` | 2 | `@kit.MediaLibraryKit`, `@kit.CoreFileKit` |

## 重要发现

### 01 — Data Persistence
- Preferences 从 API 18 起支持 GSKV 模式（实时落盘），XML 模式需 `flush()`
- RDB 单条数据建议 ≤2MB，单次查询 ≤5000 行
- 两者均导入自 `@kit.ArkData`

### 02 — Component Snapshot
- 顶层 `componentSnapshot.get()` 从 API 18 起废弃，推荐 `UIContext.getComponentSnapshot().get()`
- `getSync` 阻塞主线程（3s 超时），优先用异步 `get`
- `createFromBuilder` 离屏截图不支持动画属性，约 500ms 固有延迟

### 03 — Image Encoding
- 导入 `import { image } from '@kit.ImageKit'`（非旧版 `@ohos.multimedia.image`）
- `packing` 从 API 13 起废弃，推荐 `packToData`
- 编码期间禁止修改输入的 PixelMap/ImageSource，否则返回 401
- 所有 `image` 对象用完后必须调用 `release()` 释放

### 04 — Album Save & File IO
- `photoAccessHelper` 需要 `READ_IMAGEVIDEO` / `WRITE_IMAGEVIDEO` 权限（API 10+）
- 或用 `SaveButton` 安全控件免权限保存
- 创建资源返回 `file://media/Photo/...` URI，可传给 `fileIo.openSync`
- `@ohos.file.fs` 导入自 `@kit.CoreFileKit`

## 使用指引

1. 实现 agent 先读 **INDEX.md**（本文件），了解整体 API 分布
2. 按需加载单个模块文件（如实现分享卡片 → 加载 `02-component-snapshot.md` + `03-image-encoding.md` + `04-album-file-io.md`）
3. 实现数据持久化 → 加载 `01-data-persistence.md`

---

*生成日期: 2026/06/23* | *共 27 个 API/方法/类型条目*
