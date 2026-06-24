# 02 — File Picker (PhotoViewPicker)

## @ohos.file.picker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 选择器模块入口 | `picker` | `import { picker } from '@kit.CoreFileKit'` | 封装 DocumentViewPicker、AudioViewPicker、PhotoViewPicker 的模块 | `let dp = new picker.DocumentViewPicker(context)` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md` |

## DocumentViewPicker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建文档选择器 | `picker.DocumentViewPicker.constructor` | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)` | `let picker = new picker.DocumentViewPicker(context)` | 同上 |
| 选择文档文件 | `picker.DocumentViewPicker.select` | 同上 | `select(option?: DocumentSelectOptions): Promise<Array<string>>` | `picker.select(options).then(uris => {})` | 同上 |
| 保存文档文件 | `picker.DocumentViewPicker.save` | 同上 | `save(option?: DocumentSaveOptions): Promise<Array<string>>` | `picker.save(saveOpts).then(uris => {})` | 同上 |
| 文档选择选项 | `picker.DocumentSelectOptions` | 同上 | `{ maxSelectNumber?: number, fileSuffixFilters?: Array<string>, defaultFilePathUri?: string }` | `new picker.DocumentSelectOptions()` | 同上 |
| 文档保存选项 | `picker.DocumentSaveOptions` | 同上 | `{ newFileNames?: Array<string>, fileSuffixChoices?: Array<string> }` | `new picker.DocumentSaveOptions()` | 同上 |

## PhotoViewPicker (photoAccessHelper)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建图库选择器 | `photoAccessHelper.PhotoViewPicker` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `class PhotoViewPicker { constructor() }` | `let picker = new photoAccessHelper.PhotoViewPicker()` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |
| 选择图片/视频 | `photoAccessHelper.PhotoViewPicker.select` | 同上 | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `picker.select(options).then(result => { result.photoUris })` | 同上 |
| 选择选项 | `photoAccessHelper.PhotoSelectOptions` | 同上 | `extends BaseSelectOptions { isEditSupported?: boolean, isOriginalSupported?: boolean }` | `new photoAccessHelper.PhotoSelectOptions()` | `07_Classes (其他).md` |
| 选择结果 | `photoAccessHelper.PhotoSelectResult` | 同上 | `{ photoUris: Array<string>, isOriginalPhoto: boolean }` | — | 同上 |
| 媒体类型枚举 | `photoAccessHelper.PhotoViewMIMETypes` | 同上 | `{ IMAGE_TYPE: 'image/*', VIDEO_TYPE: 'video/*', IMAGE_VIDEO_TYPE: '*/*' }` | `photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE` | `18_Enums.md` |

## PhotoViewPicker (picker.deprecated)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 已废弃的图库选择器 | `picker.PhotoViewPicker` (deprecated since API 12) | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)` | `new picker.PhotoViewPicker(context)` | 同上 |

## Module Notes

- **PhotoViewPicker 已废弃**: `picker.PhotoViewPicker` 从 API version 12 起废弃，请使用 `photoAccessHelper.PhotoViewPicker` 替代。两者的导入模块（`@kit.CoreFileKit` vs `@kit.MediaLibraryKit`）和构造函数签名不同：废弃版需要 `Context` 参数，新版无参构造函数。
- **永久授权差异**: 新版 `photoAccessHelper.PhotoViewPicker.select` 返回的 `photoUris` 具有永久授权，可通过 `photoAccessHelper.getAssets` 使用；废弃版 `picker.PhotoViewPicker.select` 返回的 `photoUris` 仅为临时授权。
- **医疗附件选择**: 使用 `picker.DocumentViewPicker` 配合 `fileSuffixFilters` 过滤文件类型（如 `['图片(.png, .jpg)|.png,.jpg', '文档|.pdf']`），支持选择 PDF 文档和图片附件。
- **宠物头像选择**: 使用 `photoAccessHelper.PhotoViewPicker` 并设置 `MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE` 和 `maxSelectNumber = 1` 来选择单张图片。
- **Context 要求**: 所有 Picker API 需在 UIAbility 中调用（传入 `UIAbilityContext`），否则无法拉起选择界面。使用 `this.getUIContext().getHostContext() as common.UIAbilityContext` 在组件中获取。
