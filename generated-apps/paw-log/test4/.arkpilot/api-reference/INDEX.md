# PawLog — ArkTS API Reference Index

**规格来源**: `test4/.arkpilot/autopilot/spec.md`
**文档根目录**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
**API 总数**: 74 APIs · **模块数**: 5 个模块

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| **01 — Data Persistence (Preferences)** | | [`01-data-persistence.md`](01-data-persistence.md) |
| `import { preferences } from '@kit.ArkData'` | 模块导入（非 `@ohos.data.preferences`） | [#ohosdatapreferences](01-data-persistence.md#ohosdatapreferences) |
| `preferences.getPreferences(name)` | 获取 Preferences 实例 | [#preferencesgetpreferences](01-data-persistence.md#preferencesgetpreferences) |
| `Preferences.put(key, value)` | 写入 key-value 到缓存 | [#h2put](01-data-persistence.md#h2put) |
| `Preferences.get(key, def)` | 读取 key 的 value | [#h2get](01-data-persistence.md#h2get) |
| `Preferences.delete(key)` | 删除指定 key | [#h2delete](01-data-persistence.md#h2delete) |
| `Preferences.flush()` | 持久化缓存到磁盘（XML 模式必需） | [#h2flush](01-data-persistence.md#h2flush) |
| `Preferences.has(key)` | 检查 key 是否存在 | [#h2has](01-data-persistence.md#h2has) |
| `Preferences.on('change')` | 订阅 key 变更事件 | [#h2onchange](01-data-persistence.md#h2onchange) |
| `preferences.Options` | 配置：name, dataGroupId, storageType | [#options10](01-data-persistence.md#options10) |
| `preferences.StorageType` | 存储模式枚举：XML / GSKV | [#storagetype18](01-data-persistence.md#storagetype18) |
| **02 — File Picker (PhotoViewPicker)** | | [`02-file-picker.md`](02-file-picker.md) |
| `photoAccessHelper.PhotoViewPicker` | 图库选择器（API 12 推荐） | [#photoviewpicker-photoaccesshelper](02-file-picker.md#photoviewpicker-photoaccesshelper) |
| `PhotoSelectOptions` | 选择选项：MIMEType, maxSelectNumber | [#photoviewpicker-photoaccesshelper-1](02-file-picker.md#photoviewpicker-photoaccesshelper-1) |
| `PhotoSelectResult.photoUris` | 选择结果 URI（永久授权） | [#photoviewpicker-photoaccesshelper-2](02-file-picker.md#photoviewpicker-photoaccesshelper-2) |
| `PhotoViewMIMETypes.IMAGE_TYPE` | 仅图片类型过滤 | [#photoviewpicker-photoaccesshelper-3](02-file-picker.md#photoviewpicker-photoaccesshelper-3) |
| `picker.DocumentViewPicker` | 文档选择器（医疗附件） | [#documentviewpicker](02-file-picker.md#documentviewpicker) |
| `DocumentSelectOptions` | 文档选项：fileSuffixFilters | [#documentviewpicker-1](02-file-picker.md#documentviewpicker-1) |
| **03 — File I/O (fs)** | | [`03-file-io.md`](03-file-io.md) |
| `import { fileIo } from '@kit.CoreFileKit'` | 模块导入 | [#ohosfilefs](03-file-io.md#ohosfilefs) |
| `fileIo.open(path)` | 打开文件返回 FD | [#fileioopen](03-file-io.md#fileioopen) |
| `fileIo.copyFile(src, dest)` | 复制文件（沙箱路径） | [#fileiocopyfile](03-file-io.md#fileiocopyfile) |
| `fileIo.copy(src, dest)` | URI 模式复制（API 11+） | [#fileiocopy11](03-file-io.md#fileiocopy11) |
| `fileIo.mkdir(path, true)` | 递归创建目录 | [#fileiomkdir](03-file-io.md#fileiomkdir) |
| `fileIo.read(fd, buffer)` | 从文件描述符读取 | [#fileioread](03-file-io.md#fileioread) |
| `fileIo.access(path)` | 检查文件/目录是否存在 | [#fileioaccess](03-file-io.md#fileioaccess) |
| `fileIo.createStream(path)` | 创建文件读写流 | [#fileiocreatestream](03-file-io.md#fileiocreatestream) |
| `context.filesDir` | 沙箱根路径 | [#ohosfilefs](03-file-io.md#ohosfilefs) |
| **04 — Image Processing** | | [`04-image-processing.md`](04-image-processing.md) |
| `import { image } from '@kit.ImageKit'` | 模块导入 | [#ohosmultimediaimage](04-image-processing.md#ohosmultimediaimage) |
| `image.createImageSource(uri)` | 从 URI 创建图片源 | [#imagesource](04-image-processing.md#imagesource) |
| `ImageSource.createPixelMap(opts)` | 解码为 PixelMap（支持 desiredSize） | [#createpixelmap](04-image-processing.md#createpixelmap) |
| `PixelMap.scale(x, y)` | 缩放像素图 | [#pixelmap](04-image-processing.md#pixelmap) |
| `ImageSource.getImageInfo()` | 获取图片宽高/格式信息 | [#getimageinfo](04-image-processing.md#getimageinfo) |
| `.release()` | 释放原生内存（防 OOM） | [#ohosmultimediaimage](04-image-processing.md#ohosmultimediaimage) |
| **05 — Permissions Management** | | [`05-permissions.md`](05-permissions.md) |
| `import { abilityAccessCtrl } from '@kit.AbilityKit'` | 模块导入 | [#ohosabilityaccessctrl-abilityaccessctrl](05-permissions.md#ohosabilityaccessctrl-abilityaccessctrl) |
| `abilityAccessCtrl.createAtManager()` | 创建权限管理器实例 | [#atmanager](05-permissions.md#atmanager) |
| `AtManager.checkAccessToken(token)` | 校验是否已授权 | [#checkaccesstoken9](05-permissions.md#checkaccesstoken9) |
| `context.requestPermissionsFromUser(perms)` | 拉起系统授权弹窗 | [#requestpermissionsfromuser9](05-permissions.md#requestpermissionsfromuser9) |
| `GrantStatus.PERMISSION_GRANTED` | 授权状态常量 | [#grantstatus](05-permissions.md#grantstatus) |
| `module.json5 → requestPermissions` | 声明 `ohos.permission.READ_MEDIA` 等 | [#module.json5-declaration](05-permissions.md#module.json5-declaration) |

## 模块间关联

- **图片选择流程**: `PhotoViewPicker`(02) → `fileIo.copy`(03) + `ImageSource.createPixelMap`(04) → 生成头像缩略图
- **权限前置**: 访问图库前需声明 `READ_MEDIA`(05)，并用 `requestPermissionsFromUser`(05) 运行时申请
- **数据持久化**: 所有宠物档案、事件记录、提醒和病历通过 `Preferences`(01) 存储

> 实现 agent 应先读此 INDEX.md，再按需加载单个模块文件。
