# 03 — PhotoViewPicker / DocumentViewPicker 文件选择器

## @ohos.file.picker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 选择器模块，封装 DocumentViewPicker、AudioViewPicker、PhotoViewPicker | `picker` | `import { picker } from '@kit.CoreFileKit'` | 模块级命名空间，从 API 9 开始支持 | `let documentPicker = new picker.DocumentViewPicker(context);` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md` |

## DocumentViewPicker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文件选择器对象，选择和保存文档 | `picker.DocumentViewPicker` | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)` (推荐，API 12+) / `constructor()` (不推荐) / `constructor(context: Context, window: window.Window)` (API 13+) | `let documentPicker = new picker.DocumentViewPicker(context);` | `08_ohos.file.picker (选择器).md` |

## DocumentViewPicker.select

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起文件选择界面，选择一个或多个文件 | `picker.DocumentViewPicker.select` | `import { picker } from '@kit.CoreFileKit'` | `select(option?: DocumentSelectOptions): Promise<Array<string>>` | `documentPicker.select(documentSelectOptions).then(...)` | `08_ohos.file.picker (选择器).md` |

## PhotoViewPicker（已废弃）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择器（已废弃，API 12 起废弃，API 18 起 constructor 废弃） | `picker.PhotoViewPicker` | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)`（API 9-17）/ `constructor()`（API 12-17） | `let photoPicker = new picker.PhotoViewPicker(context);` | `08_ohos.file.picker (选择器).md` |
| 当前推荐：图库选择器对象（API 10+） | `photoAccessHelper.PhotoViewPicker` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `let photoPicker = new photoAccessHelper.PhotoViewPicker();` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |

## PhotoViewPicker.select（已废弃）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起图库选择界面（已废弃，API 12 起废弃） | `picker.PhotoViewPicker.select` | `import { picker } from '@kit.CoreFileKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `photoPicker.select(photoSelectOptions).then(...)` | `08_ohos.file.picker (选择器).md` |
| 当前推荐：拉起图库选择界面（API 10+） | `photoAccessHelper.PhotoViewPicker.select` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` — photoUris 具有永久授权 | `photoPicker.select(photoSelectOptions).then(...)` | `06_Class (PhotoViewPicker).md` |

## PhotoSelectOptions（已废弃）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择选项（已废弃，API 12 起） | `picker.PhotoSelectOptions` | `import { picker } from '@kit.CoreFileKit'` | `{ MIMEType: PhotoViewMIMETypes; maxSelectNumber: number }` — 默认 IMAGE_VIDEO_TYPE, 最多 500 | `new picker.PhotoSelectOptions()` | `08_ohos.file.picker (选择器).md` |
| 当前推荐：图库选择选项子类（API 10+） | `photoAccessHelper.PhotoSelectOptions` extends `BaseSelectOptions` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `{ MIMEType, maxSelectNumber, isEditSupported, isOriginalSupported, ... }` | `new photoAccessHelper.PhotoSelectOptions()` | `07_Classes (其他).md` |

## PhotoSelectResult（已废弃）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择结果（已废弃，API 12 起） | `picker.PhotoSelectResult` | `import { picker } from '@kit.CoreFileKit'` | `{ photoUris: Array<string>; isOriginalPhoto: boolean }` — 仅临时授权 | `photoSelectResult.photoUris` | `08_ohos.file.picker (选择器).md` |
| 当前推荐：图库选择结果（API 10+） | `photoAccessHelper.PhotoSelectResult` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `{ photoUris: Array<string>; isOriginalPhoto: boolean; contextRecoveryInfo?; movingPhotoBadgeStates? }` — 永久授权 | `photoSelectResult.photoUris` | `07_Classes (其他).md` |

## 模块说明

- **PhotoViewPicker 已废弃**：`picker.PhotoViewPicker` 从 API 12 开始废弃，建议迁移到 `photoAccessHelper.PhotoViewPicker`（`@kit.MediaLibraryKit`），后者返回的 `photoUris` 具有永久授权而非临时授权。
- **DocumentViewPicker 推荐有参构造**：`picker.DocumentViewPicker(context)` 是推荐构造函数（API 12+），无参构造会出现概率性拉起失败。
- **ACL 支持**：`picker.PhotoSelectOptions`（picker 模块）中的 `MIMEType` 从 API 18 开始废弃，统一使用 `photoAccessHelper.PhotoSelectOptions`。
- **save 方法**：`DocumentViewPicker.save` 和 `AudioViewPicker.save` 均有效；`PhotoViewPicker.save`（picker 模块）已废弃，推荐使用 `SaveButton` 组件。
