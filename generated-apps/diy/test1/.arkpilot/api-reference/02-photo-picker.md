# 02 — 相册选择 (Photo Picker)

## photoAccessHelper

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理模块实例 | photoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `photoAccessHelper.getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `01_模块描述.md`, `02_Functions.md` |

仅可在 Stage 模型下使用。从 API version 10 开始支持。返回的 `PhotoAccessHelper` 实例用于访问和修改相册中的媒体文件。

## PhotoViewPicker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起系统相册选择器选择图片/视频 | PhotoViewPicker | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `let photoPicker = new photoAccessHelper.PhotoViewPicker(); photoPicker.select(photoSelectOptions).then(...)` | `06_Class (PhotoViewPicker).md` |

`select` 方法有三种重载：Promise 形式（可选参数）、Callback 形式（必选参数+callback）、Callback 形式（仅有 callback）。返回的 `PhotoSelectResult.photoUris` 具有永久授权，可通过 `photoAccessHelper.getAssets` 使用。创建 `PhotoViewPicker` 实例后需注意：如果需要重复拉起 Picker，需要先通过 NavDestination 或跟随进程销毁前一个实例。

## PhotoSelectOptions

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择选项，继承 BaseSelectOptions | PhotoSelectOptions | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `class PhotoSelectOptions extends BaseSelectOptions` | `let photoSelectOptions = new photoAccessHelper.PhotoSelectOptions(); photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE; photoSelectOptions.maxSelectNumber = 5;` | `07_Classes (其他).md` |

`BaseSelectOptions` 属性：`MIMEType` (`PhotoViewMIMETypes`，默认 `IMAGE_VIDEO_TYPE`)、`maxSelectNumber`（最大 500，默认 50）、`isPhotoTakingSupported`、`isSearchSupported`、`preselectedUris`、`mimeTypeFilter`、`fileSizeFilter`、`videoDurationFilter` 等。`PhotoSelectOptions` 额外属性：`isEditSupported`、`isOriginalSupported`、`completeButtonText`、`maxPhotoSelectNumber`、`maxVideoSelectNumber` 等。

**关键枚举 `PhotoViewMIMETypes`**：`IMAGE_TYPE` (`'image/*'`)、`VIDEO_TYPE` (`'video/*'`)、`IMAGE_VIDEO_TYPE` (`'*/*'`)、`MOVING_PHOTO_IMAGE_TYPE` (`'image/movingPhoto'`, 12+)。

## PhotoSelectResult

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择后的结果集 | PhotoSelectResult | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `class PhotoSelectResult` | `let result: photoAccessHelper.PhotoSelectResult = await photoPicker.select(options);` | `07_Classes (其他).md` |

属性：`photoUris` (`Array<string>`, 必填不可选)、`isOriginalPhoto` (`boolean`)、`contextRecoveryInfo` (21+, 用于恢复现场)、`movingPhotoBadgeStates` (22+, 动态照片状态数组)。`photoUris` 中的 URI 需要通过 `photoAccessHelper.getAssets` 接口使用。

## phAccessHelper

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相册管理模块实例（变量名） | phAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `photoAccessHelper.getPhotoAccessHelper(context)` 返回 `PhotoAccessHelper` 实例 | `02_Functions.md` |

`phAccessHelper` 是示例中使用的变量名，指代 `photoAccessHelper.getPhotoAccessHelper(context)` 返回的 `PhotoAccessHelper` 接口实例。该实例提供 `getAssets`、`createAsset`、`getAlbums`、`registerChange`、`release` 等相册管理方法。

## 模块备注

- 所有相关 API 同属 `@kit.MediaLibraryKit` 包，导入方式统一为 `import { photoAccessHelper } from '@kit.MediaLibraryKit';`
- Picker 返回的 `photoUris` 具有**永久授权**，可通过 `photoAccessHelper.getAssets` 使用，无需额外权限
- 重复拉起 PhotoViewPicker 时需要先销毁前一个实例，建议通过 NavDestination 管理生命周期
- `BaseSelectOptions` 的 `mimeTypeFilter` 配置时会使 `MIMEType` 自动失效；同理 `combinedMediaTypeFilter` 配置时会使 `MIMEType` 和 `mimeTypeFilter` 自动失效
- `PhotoSelectOptions.isOriginalSupported` 控制是否显示"选择原图"按钮
- 动态照片相关功能（`isMovingPhotoBadgeShown`、`globalMovingPhotoState` 等）需 API version 22+/23+
