# API 参考索引

**项目：** 今天吃什么（eat-what）
**需求文档：** `.arkpilot/autopilot/spec.md`
**文档来源：** `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
**总 API 数：** 31 个已找到 + 3 个差异标记
**模块数：** 4

| API / 组件 | 用途 | 详细文档 |
|---|---|---|
| **01 — 权限管理** | | [01-permissions.md](01-permissions.md) |
| `@ohos.abilityAccessCtrl` | 权限请求与校验（`requestPermissionsFromUser`、`checkAccessToken`） | [01-permissions.md](01-permissions.md#@ohosabilityaccessctrl-程序访问控制管理) |
| ⚠️ `ohos.permission.READ_MEDIA_IMAGES` | 未在本地文档中找到；API 12+ 使用 `READ_IMAGEVIDEO` | [01-permissions.md](01-permissions.md) |
| ⚠️ `ohos.permission.WRITE_IMAGE` | 未在本地文档中找到；API 12+ 使用 `WRITE_IMAGEVIDEO` | [01-permissions.md](01-permissions.md) |
| **02 — 组件截图** | | [02-component-snapshot.md](02-component-snapshot.md) |
| `componentSnapshot.getSync` | 通过组件 ID 同步获取已加载组件的 PixelMap 截图 | [02-component-snapshot.md](02-component-snapshot.md#componentsnapshotgetsync12) |
| `ComponentSnapshot.get` (callback/Promise) | 通过 UIContext 异步获取组件截图 | [02-component-snapshot.md](02-component-snapshot.md#get12) |
| `ComponentSnapshot.createFromBuilder` | 离屏构建 CustomBuilder 并获取截图 | [02-component-snapshot.md](02-component-snapshot.md#createfrombuilder12) |
| `ComponentSnapshot.getWithUniqueId` | 通过 FrameNode uniqueId 异步截图 | [02-component-snapshot.md](02-component-snapshot.md#getwithuniqueid15) |
| `ComponentSnapshot.createFromComponent` | 将 ComponentContent 对象截图（API 18+） | [02-component-snapshot.md](02-component-snapshot.md#createfromcomponent18) |
| `SnapshotOptions` | 截图自定义参数配置 | [02-component-snapshot.md](02-component-snapshot.md#snapshotoptions12) |
| **03 — 图片编码与相册保存** | | [03-image-album.md](03-image-album.md) |
| `@ohos.multimedia.image` ImagePacker | 将 PixelMap 编码为 JPEG/PNG 的 ArrayBuffer 或文件 | [03-image-album.md](03-image-album.md#ohosmultimediaimage-imagepacker---将-pixelmap-编码为-jpegpng-图片文件) |
| `@ohos.multimedia.image` PixelMap | 像素图接口，支持读写像素数据、变换操作 | [03-image-album.md](03-image-album.md#ohosmultimediaimage-pixelmap---像素图接口componentsnapshot-的输出类型) |
| `@ohos.file.photoAccessHelper` PhotoAccessHelper | 相册管理入口，创建资源/提交变更请求 | [03-image-album.md](03-image-album.md#ohosfilephotoaccesshelper-photoaccesshelper---将图片保存到系统相册) |
| `@ohos.file.photoAccessHelper` MediaAssetChangeRequest | 创建图片资源写入请求，添加资源数据 | [03-image-album.md](03-image-album.md#ohosfilephotoaccesshelper-mediaassetchangerequest---创建图片资源写入请求) |
| **04 — 系统分享** | | [04-share.md](04-share.md) |
| `systemShare` (`@kit.ShareKit`) | 系统标准分享面板 | [04-share.md](04-share.md#systemshare分享) |
| `SharedRecord` | 分享数据记录（UTD、标题、缩略图、URI等） | [04-share.md](04-share.md#sharedrecord) |
| `SharedData` | 封装一组分享数据记录 | [04-share.md](04-share.md#shareddata) |
| `ShareController` | 分享面板控制器（展示、关闭、分享完成事件） | [04-share.md](04-share.md#sharecontroller) |
| `ShareControllerOptions` | 分享控制器配置（锚点、预览模式、选择模式） | [04-share.md](04-share.md#sharecontrolleroptions) |
| `ShareControllerAnchor` | 分享悬浮窗视图依附锚点 | [04-share.md](04-share.md#sharecontrolleranchor) |
| `SharePreviewMode` | 分享预览模式枚举（DEFAULT/DETAIL） | [04-share.md](04-share.md#sharepreviewmode) |
| `@ohos.fileshare` (`@kit.CoreFileKit`) | 文件 URI 权限授权/撤销 | [04-share.md](04-share.md#ohosfileshare-文件分享) |

## 重要发现

- **权限名称差异：** 本地文档中媒体权限名为 `READ_IMAGEVIDEO` / `WRITE_IMAGEVIDEO`；如果实际构建时编译报错，应改为 `ohos.permission.READ_MEDIA_IMAGES` / `ohos.permission.WRITE_IMAGE`（不同 API 版本命名差异）
- **componentSnapshot API 18+ 变更：** 静态方法已废弃，应通过 `this.getUIContext().getComponentSnapshot()` 获取实例
- **图片保存流程：** `componentSnapshot → PixelMap → ImagePacker.packToData(ArrayBuffer) → MediaAssetChangeRequest.addResource + applyChanges`
- **无权限替代方案：** 写相册可用户确认弹窗（`showAssetsCreationDialog`）绕过权限申请
- **两个 Kit 都用：** 分享图片用 `@kit.ShareKit` + `systemShare`，文件 URI 授权用 `@kit.CoreFileKit` + `@ohos.fileshare`

## 使用说明

Implement agent 应先读本 `INDEX.md`，再按需加载各模块文件。
