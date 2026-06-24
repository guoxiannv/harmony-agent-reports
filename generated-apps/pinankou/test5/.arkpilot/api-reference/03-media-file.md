# 03 — 媒体文件与图片处理 (Media File & Image)

## @ohos.file.photoAccessHelper (相册管理模块)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 | getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |
| 查询图片/视频资源 | getAssets | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getAssets(options: FetchOptions, callback: AsyncCallback<FetchResult<PhotoAsset>>): void` | `phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => { ... });` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 拉起图库选择器 | PhotoViewPicker.select | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `new photoAccessHelper.PhotoViewPicker().select(photoSelectOptions).then((result) => {...});` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |
| 媒体文件资产 | PhotoAsset | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `属性: uri (只读), photoType (只读), displayName (只读); get(member: string): MemberType` | `photoAsset.displayName; photoAsset.get('title');` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/15_Interface (PhotoAsset).md` |

## @ohos.file.picker (选择器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文档选择器选择文件 | DocumentViewPicker.select | `import { picker } from '@kit.CoreFileKit'` | `select(option?: DocumentSelectOptions): Promise<Array<string>>` | `new picker.DocumentViewPicker(context).select(documentSelectOptions).then((uris) => {...});` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md` |
| 图库选择器(已废弃) | PhotoViewPicker(deprecated) | `import { picker } from '@kit.CoreFileKit'` | (from API 12 deprecated, 建议使用 photoAccessHelper.PhotoViewPicker) | — | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md` |

## @ohos.file.fs (文件管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件 | fileIo.open | `import { fileIo } from '@kit.CoreFileKit'` | `open(path: string, mode?: number): Promise<File>` | `fileIo.open(filePath, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE).then((file) => {...});` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 关闭文件 | fileIo.close | `import { fileIo } from '@kit.CoreFileKit'` | `close(file: number \| File): Promise<void>` | `fileIo.close(file).then(() => {...});` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 写入文件 | fileIo.write | `import { fileIo } from '@kit.CoreFileKit'` | `write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` | `fileIo.write(file.fd, "hello, world").then((writeLen) => {...});` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 读取文件 | fileIo.read | `import { fileIo } from '@kit.CoreFileKit'` | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `fileIo.read(file.fd, arrayBuffer).then((readLen) => {...});` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 创建目录 | fileIo.mkdir | `import { fileIo } from '@kit.CoreFileKit'` | `mkdir(path: string, recursion?: boolean): Promise<void>` | `fileIo.mkdir(dirPath, true).then(() => {...});` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 检查文件/目录 | fileIo.access | `import { fileIo } from '@kit.CoreFileKit'` | `access(path: string, mode?: AccessModeType): Promise<boolean>` | `fileIo.access(filePath).then((res) => {...});` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 列出目录文件 | fileIo.listFile | `import { fileIo } from '@kit.CoreFileKit'` | `listFile(path: string, options?: ListFileOptions): Promise<string[]>` | `fileIo.listFile(pathDir, listFileOption).then((filenames) => {...});` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |

## @ohos.multimedia.image (图片处理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建ImageSource实例 | image.createImageSource | `import { image } from '@kit.ImageKit'` | `createImageSource(uri: string): ImageSource` | `const imageSourceObj: image.ImageSource = image.createImageSource(path);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 创建ImagePacker实例 | image.createImagePacker | `import { image } from '@kit.ImageKit'` | `createImagePacker(): ImagePacker` | `const imagePackerObj: image.ImagePacker = image.createImagePacker();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 图片压缩/编码 | ImagePacker.packToData | `import { image } from '@kit.ImageKit'` | `packToData(source: ImageSource, options: PackingOption): Promise<ArrayBuffer>` | `imagePackerObj.packToData(imageSourceObj, packOpts).then((data) => {...});` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |
| 创建PixelMap | image.createPixelMap | `import { image } from '@kit.ImageKit'` | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` | `image.createPixelMap(color, opts).then((pixelMap) => {...});` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 获取图片信息 | ImageSource.getImageInfo | `import { image } from '@kit.ImageKit'` | `getImageInfo(index: number, callback: AsyncCallback<ImageInfo>): void` | `imageSourceObj.getImageInfo(0, (error, imageInfo) => {...});` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |

## @ohos.file.fileuri (文件URI)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 路径转URI | getUriFromPath | `import { fileUri } from '@kit.CoreFileKit'` | `getUriFromPath(path: string): string` | `let uri = fileUri.getUriFromPath(filePath);` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/05_ohos.file.fileuri (文件URI).md` |

## 模块说明

- `@ohos.file.fs` 所有文件操作基于应用沙箱路径，使用前需通过 `context.filesDir` 获取沙箱路径；从 API 22 开始支持传入 URI。
- `@ohos.file.picker.PhotoViewPicker` 从 API 12 起废弃，统一使用 `photoAccessHelper.PhotoViewPicker`。
- `@ohos.file.photoAccessHelper` 仅支持 Stage 模型。
- `@ohos.multimedia.image` 未找到 `unpackImage` API —— 解码图片使用 `ImageSource.createPixelMap()` 替代。
- `@ohos.multimedia.image.ImagePacker` 和 `ImageSource` 使用完毕后需调用 `release()` 释放内存。
