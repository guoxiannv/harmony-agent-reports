# 04 — Image Picker (图片选择)

## @ohos.file.photoAccessHelper (PhotoAccessHelper)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相册管理模块入口。提供创建相册、访问和修改相册中的媒体数据的能力。 | `@ohos.file.photoAccessHelper` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | 模块级导入 | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/01_模块描述.md` |

## photoAccessHelper.getPhotoAccessHelper()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理模块实例，用于访问和修改相册中的媒体文件。仅Stage模型可用。 | `photoAccessHelper.getPhotoAccessHelper` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |

## PhotoViewPicker (photoAccessHelper)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择器对象，用于选择图片/视频。通过拉起photoPicker界面让用户选择。 | `photoAccessHelper.PhotoViewPicker` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `class PhotoViewPicker` | `let photoPicker = new photoAccessHelper.PhotoViewPicker();` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |

## @ohos.file.picker (PhotoViewPicker, deprecated)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择器对象（已废弃），选择文件推荐使用photoAccessHelper.PhotoViewPicker。 | `picker.PhotoViewPicker` | `import { picker } from '@kit.CoreFileKit'` | `class PhotoViewPicker` (deprecated since API 12) | `let photoPicker = new picker.PhotoViewPicker(context);` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md` |

## PhotoViewPicker.select()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过选择模式拉起photoPicker界面，用户选择一个或多个图片/视频。返回的photoUris具有永久授权。 | `PhotoViewPicker.select` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option?: PhotoSelectOptions) : Promise<PhotoSelectResult>` | `photoPicker.select(photoSelectOptions).then((result) => { ... });` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |

## PhotoSelectOptions (对应 PhotoPickOptions)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择选项。继承自BaseSelectOptions，配置MIME类型、最大选择数等。 | `photoAccessHelper.PhotoSelectOptions` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `class PhotoSelectOptions extends BaseSelectOptions` | `let options = new photoAccessHelper.PhotoSelectOptions(); options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE; options.maxSelectNumber = 5;` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/07_Classes (其他).md` |

## photoAccessHelper.PhotoAsset (对应 MediaAsset)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供封装文件属性的方法，包含uri、photoType、displayName等属性，以及get/set/commitModify/getThumbnail等方法。 | `photoAccessHelper.PhotoAsset` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `interface PhotoAsset` | `let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject(); let title = photoAsset.get(photoAccessHelper.PhotoKeys.TITLE.toString());` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/15_Interface (PhotoAsset).md` |

## photoAccessHelper.Album
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 实体相册接口，继承自AbsAlbum。提供imageCount、videoCount属性，以及commitModify等方法。 | `photoAccessHelper.Album` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `interface Album extends AbsAlbum` | `let album: photoAccessHelper.Album = await albumList.getFirstObject(); album.albumName = 'hello'; album.commitModify();` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/09_Interface (Album).md` |

## photoAccessHelper.PhotoKeys
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片和视频文件关键信息枚举。包含URI、PHOTO_TYPE、DISPLAY_NAME、SIZE、TITLE等字段。 | `photoAccessHelper.PhotoKeys` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `enum PhotoKeys` | `let title: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.TITLE;` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/18_Enums.md` |

## 模块说明

- **模块名修正**：`@ohos.multimedia.photoAccessHelper` 在官方文档中为 `@ohos.file.photoAccessHelper`，导入语句为 `import { photoAccessHelper } from '@kit.MediaLibraryKit'`。
- **`MediaAsset` 修正**：官方接口名称为 `PhotoAsset` 而非 `MediaAsset`。`PhotoAsset` 提供 uri、photoType、displayName 属性以及 get/set/commitModify/getThumbnail 等方法。
- **`PhotoPickOptions` 修正**：官方类名为 `PhotoSelectOptions`（继承自 `BaseSelectOptions`）。包含 MIMEType、maxSelectNumber（最大500，默认50）等核心配置。
- **`@ohos.file.picker` 已废弃**：该模块中的 `PhotoViewPicker` 自 API 12 起废弃，应使用 `photoAccessHelper.PhotoViewPicker` 替代。
- **权限**：使用 `photoAccessHelper.getPhotoAccessHelper` 无需申请权限；通过 picker 方式调用 `getAssets` 查询 picker 返回的 URI 不需要 `ohos.permission.READ_IMAGEVIDEO` 权限。修改操作（如 `commitModify`）需要 `ohos.permission.WRITE_IMAGEVIDEO`。
- **永久授权**：`PhotoViewPicker.select()` 返回的 `PhotoSelectResult.photoUris` 具有永久授权，可通过 `photoAccessHelper.getAssets()` 使用。
- **元服务支持**：从 API 11 开始，photoPicker 相关接口支持在元服务中使用。
