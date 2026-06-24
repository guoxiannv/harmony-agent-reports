# API 参考索引

> **生成自**：产品规格 → API 文档调研  
> **规格文件**：`generated-apps/eat-what/test1/.arkpilot/autopilot/spec.md`  
> **文档根目录**：`vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`  
> **总计 API 数**：34（覆盖 4 个模块，缺失 0）

**Implement Agent 使用指引**：先读本 INDEX.md 了解全貌，再按需加载单个模块文件。

---

## 模块总览

| 模块 | 文件名 | API 数 | 用途 |
|------|--------|--------|------|
| 01 — Data Persistence | `01-data-persistence.md` | 3 | 用户偏好、签到记录、食材清单、内置菜品数据集的持久化 |
| 02 — Share Kit | `02-share-kit.md` | 15 | 打卡卡片系统分享到社交平台/即时通讯 |
| 03 — Media Library | `03-media-library.md` | 12 | 生成卡片保存到系统相册 |
| 04 — Permissions & Lifecycle | `04-permissions-lifecycle.md` | 4 | 运行时权限申请、相册写入授权、UIAbility 生命周期初始化 |

---

## API / 组件清单

### 01 — Data Persistence（数据持久化）

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| [@ohos.data.preferences] | 轻量级键值对存储：主题、转盘设置 | [01-data-persistence.md#ohosdata-preferences-用户首选项](01-data-persistence.md#ohosdata-preferences-用户首选项) |
| [@ohos.data.relationalStore] | 结构化数据存储：签到记录、食材清单、菜品库 | [01-data-persistence.md#ohosdata-relationalstore-关系型数据库](01-data-persistence.md#ohosdata-relationalstore-关系型数据库) |
| [@ohos.data.sendablePreferences] | 跨线程键值对存储（可选） | [01-data-persistence.md#ohosdata-sendablepreferences-共享用户首选项](01-data-persistence.md#ohosdata-sendablepreferences-共享用户首选项) |

### 02 — Share Kit（系统分享）

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| [systemShare.SharedData] | 创建分享数据对象 | [02-share-kit.md#systemshare分享](02-share-kit.md#systemshare分享) |
| [sharedData.addRecord] | 追加分享记录 | [02-share-kit.md#shareddataaddrecord](02-share-kit.md#shareddataaddrecord) |
| [systemShare.ShareController] | 分享面板控制器 | [02-share-kit.md#systemshare-sharecontroller](02-share-kit.md#systemshare-sharecontroller) |
| [controller.show] | 显示系统分享面板 | [02-share-kit.md#controllershow](02-share-kit.md#controllershow) |
| [controller.on('dismiss')] | 监听分享面板关闭 | [02-share-kit.md#controllerondismiss](02-share-kit.md#controllerondismiss) |
| [controller.on('shareCompleted')] | 监听分享完成事件 | [02-share-kit.md#controlleronsharecompleted](02-share-kit.md#controlleronsharecompleted) |
| [systemShare.getSharedData] | 解析接收到的分享数据 | [02-share-kit.md#systemshare-getshareddata](02-share-kit.md#systemshare-getshareddata) |
| [systemShare.getContactInfo] | 解析联系人信息 | [02-share-kit.md#systemshare-getcontactinfo](02-share-kit.md#systemshare-getcontactinfo) |
| [systemShare.getWant] | 构造分享 Want 数据 | [02-share-kit.md#systemshare-getwant](02-share-kit.md#systemshare-getwant) |

> **注意**：本 app 只需要 `systemShare`；`harmonyShare` 为华为设备间近场分享，本次不需要。

### 03 — Media Library（相册写入）

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| [photoAccessHelper.getPhotoAccessHelper] | 获取相册管理实例 | [03-media-library.md#photoaccesshelpergetphotoaccesshelper](03-media-library.md#photoaccesshelpergetphotoaccesshelper) |
| [PhotoAccessHelper.createAsset] | 创建图片资源（传统方式） | [03-media-library.md#createasset](03-media-library.md#createasset) |
| [PhotoAccessHelper.createPhotoAsset] | 创建图片资源（API 23+ 简化版） | [03-media-library.md#createphotoasset23](03-media-library.md#createphotoasset23) |
| [MediaAssetChangeRequest.createAssetRequest] | 创建资产变更请求（推荐） | [03-media-library.md#createassetrequest11](03-media-library.md#createassetrequest11) |
| [MediaAssetChangeRequest.addResource] | 通过 ArrayBuffer 添加资源数据 | [03-media-library.md#addresource11](03-media-library.md#addresource11) |
| [PhotoAccessHelper.applyChanges] | 提交媒体变更请求 | [03-media-library.md#applychanges11](03-media-library.md#applychanges11) |
| [showAssetsCreationDialog] | 无权限保存弹窗（免 WRITE_IMAGEVIDEO） | [03-media-library.md#showassetscreationdialog12](03-media-library.md#showassetscreationdialog12) |
| [createAssetWithShortTermPermission] | 短期权限创建资源 | [03-media-library.md#createassetshorttermpermission12](03-media-library.md#createassetshorttermpermission12) |
| [PhotoType] | 媒体文件类型枚举 | [03-media-library.md#phototype](03-media-library.md#phototype) |
| [ResourceType] | 资源类型枚举 | [03-media-library.md#resourcetype11](03-media-library.md#resourcetype11) |

### 04 — Permissions & Lifecycle（权限与生命周期）

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| [@ohos.abilityAccessCtrl] | 运行时权限检查与申请 | [04-permissions-lifecycle.md#ohosabilityaccessctrl-程序访问控制管理](04-permissions-lifecycle.md#ohosabilityaccessctrl-程序访问控制管理) |
| [ohos.permission.WRITE_IMAGEVIDEO] | 写入相册权限（user_grant，需运行时申请） | [04-permissions-lifecycle.md#ohospermissionwrite_imagevideo-写入图片视频权限](04-permissions-lifecycle.md#ohospermissionwrite_imagevideo-写入图片视频权限) |
| [ohos.permission.READ_IMAGEVIDEO] | 读取相册权限（user_grant） | [04-permissions-lifecycle.md#ohospermissionread_imagevideo-读取图片视频权限](04-permissions-lifecycle.md#ohospermissionread_imagevideo-读取图片视频权限) |
| [@ohos.app.ability.UIAbility] | UIAbility 生命周期管理 | [04-permissions-lifecycle.md#ohosappabilityuiability-uiability生命周期](04-permissions-lifecycle.md#ohosappabilityuiability-uiability生命周期) |

---

## 关键发现

| 模块 | 发现 |
|------|------|
| Data Persistence | preferences 用 XML 模式需要 `flush()` 落盘，GSKV 模式（API 18+）实时落盘；内置菜品建议首次启动通过 `executeSql` + `insert` 预填充到 RDB |
| Share Kit | systemShare 从 `@kit.ShareKit` 导入（非 `@ohos.share`）；缩略图限制 32KB 以下，超限需用 `ImagePacker.packToData()` 压缩 |
| Media Library | **重要**：`sendablePhotoAccessHelper` 不支持写入，必须用 `photoAccessHelper`；推荐写入路径：`createAssetRequest` + `addResource(ArrayBuffer)` + `applyChanges` |
| Permissions | `WRITE_IMAGEVIDEO` 为 `user_grant` 类型，需在 `module.json5` 声明 + 运行时 `requestPermissionsFromUser`；`showAssetsCreationDialog` 可在无权限时使用弹窗保存 |

---

*Implement Agent 应先读本 INDEX.md，再按需加载 `01-*.md`~`04-*.md` 模块文件。*
