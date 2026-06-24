# 02 — Image Picker & Album Access

## PhotoViewPicker (照片选择器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 照片/视频选择器，拉起系统相册供用户选择媒体文件 | `photoAccessHelper.PhotoViewPicker` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `new photoAccessHelper.PhotoViewPicker()`; `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | ```ts let photoSelectOptions = new photoAccessHelper.PhotoSelectOptions(); photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE; photoSelectOptions.maxSelectNumber = 5; let photoPicker = new photoAccessHelper.PhotoViewPicker(); let result = await photoPicker.select(photoSelectOptions); ``` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |
| 获取相册管理实例 | `photoAccessHelper.getPhotoAccessHelper` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | ```ts let context = this.getUIContext().getHostContext() as common.UIAbilityContext; let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context); ``` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |
| 查询相册中的媒体资源 | `PhotoAccessHelper.getAssets` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getAssets(options: FetchOptions): Promise<FetchResult<PhotoAsset>>` | ```ts let predicates = new dataSharePredicates.DataSharePredicates(); let fetchOptions: photoAccessHelper.FetchOptions = { fetchColumns: [], predicates: predicates }; let fetchResult = await phAccessHelper.getAssets(fetchOptions); ``` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 创建新的媒体资源 | `PhotoAccessHelper.createAsset` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `createAsset(photoType: PhotoType, extension: string, options?: CreateOptions): Promise<string>` | ```ts let photoType = photoAccessHelper.PhotoType.IMAGE; let uri = await phAccessHelper.createAsset(photoType, 'jpg', { title: 'testPhoto' }); ``` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

## file.picker (文件选择器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通用文件选择器（文档选择），拉起系统文件选择界面 | `picker.DocumentViewPicker` | `import { picker } from '@kit.CoreFileKit'` | `new picker.DocumentViewPicker(context: Context)`; `select(option?: DocumentSelectOptions): Promise<Array<string>>` | ```ts let documentSelectOptions = new picker.DocumentSelectOptions(); let documentPicker = new picker.DocumentViewPicker(context); documentPicker.select(documentSelectOptions).then((uris: Array<string>) => { console.info('selected: ' + JSON.stringify(uris)); }); ``` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md` |
| 文件保存模式，将文件保存到用户选择的位置 | `DocumentViewPicker.save` | `import { picker } from '@kit.CoreFileKit'` | `save(option?: DocumentSaveOptions): Promise<Array<string>>` | ```ts let documentSaveOptions = new picker.DocumentSaveOptions(); documentSaveOptions.newFileNames = ['myfile.txt']; let documentPicker = new picker.DocumentViewPicker(context); documentPicker.save(documentSaveOptions).then((uris: Array<string>) => { ... }); ``` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md` |

## image.createImagePacker (图片编码)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 ImagePacker 实例，用于图片编码/压缩 | `image.createImagePacker` | `import { image } from '@kit.ImageKit'` | `createImagePacker(): ImagePacker` | ```ts const imagePackerObj: image.ImagePacker = image.createImagePacker(); ``` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## image.Packer (图片打包)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将 ImageSource 或 PixelMap 编码为 ArrayBuffer | `ImagePacker.packToData` | `import { image } from '@kit.ImageKit'` | `packToData(source: ImageSource, options: PackingOption): Promise<ArrayBuffer>`; `packToData(source: PixelMap, options: PackingOption): Promise<ArrayBuffer>` | ```ts let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }; imagePackerObj.packToData(imageSourceObj, packOpts).then((data: ArrayBuffer) => {}); ``` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |
| 将图片编码并直接写入文件（通过 fd） | `ImagePacker.packToFile` | `import { image } from '@kit.ImageKit'` | `packToFile(source: ImageSource, fd: number, options: PackingOption): Promise<void>` | ```ts packOpts = { format: "image/jpeg", quality: 98 }; let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE); imagePackerObj.packToFile(imageSourceObj, file.fd, packOpts); ``` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## image.createImageSource (图片解码)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从 URI/fd/ArrayBuffer 创建 ImageSource 用于解码 | `image.createImageSource` | `import { image } from '@kit.ImageKit'` | `createImageSource(uri: string): ImageSource`; `createImageSource(fd: number): ImageSource`; `createImageSource(buf: ArrayBuffer): ImageSource` | ```ts const imageSourceObj = image.createImageSource(context.filesDir + "/test.jpg"); ``` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 从 ImageSource 解码为 PixelMap | `ImageSource.createPixelMap` | `import { image } from '@kit.ImageKit'` | `createPixelMap(options?: DecodingOptions): Promise<PixelMap>` | ```ts imageSourceObj.createPixelMap().then((pixelMap: image.PixelMap) => { console.info('decoded pixelMap'); }); ``` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |

## @ohos.file.fs (文件IO操作)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件（同步） | `fileIo.openSync` | `import { fileIo } from '@kit.CoreFileKit'` | `openSync(path: string, mode?: number): File` | ```ts let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE); ``` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 读取文本文件（同步） | `fileIo.readTextSync` | `import { fileIo } from '@kit.CoreFileKit'` | `readTextSync(filePath: string, options?: ReadTextOptions): string` | ```ts let str = fileIo.readTextSync(filePath); ``` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 读取二进制数据 | `fileIo.read` | `import { fileIo } from '@kit.CoreFileKit'` | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | ```ts let arrayBuffer = new ArrayBuffer(1024); fileIo.read(file.fd, arrayBuffer).then((readLen: number) => {}); ``` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 写入文件 | `fileIo.write` | `import { fileIo } from '@kit.CoreFileKit'` | `write(fd: number, buffer: ArrayBuffer | string, options?: WriteOptions): Promise<number>` | ```ts fileIo.write(file.fd, "Hello").then((writeLen: number) => {}); ``` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 关闭文件（同步） | `fileIo.closeSync` | `import { fileIo } from '@kit.CoreFileKit'` | `closeSync(file: File): void` | ```ts fileIo.closeSync(file); ``` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |

## Image组件 (显示图片/加载本地沙箱路径)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示图片的 ArkUI 组件 | `Image` | 无需导入（ArkUI 内置组件） | `Image(src: PixelMap | ResourceStr | DrawableDescriptor)` | ```ts Image($r('app.media.my_image')) ``` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md` |
| 加载本地沙箱文件路径图片 | `Image` + `fileUri.getUriFromPath` | `import { fileUri } from '@kit.CoreFileKit'` | `fileUri.getUriFromPath(path: string): string` | ```ts let uri = fileUri.getUriFromPath(context.filesDir + "/image.png"); Image(uri) ``` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md` |
| 加载 PixelMap（从相册/解码得到） | `Image` | 无需导入 | `Image(src: PixelMap)` | ```ts Image(pixelMap) ``` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md` |

## 模块备注

- **@ohos.multimedia.mediaLibrary 已废弃**: 旧的 `@ohos.multimedia.mediaLibrary` API（媒体库模块）已废弃，全部替换为 `@ohos.file.photoAccessHelper`（相册管理模块）。不要在新代码中使用 `@ohos.multimedia.mediaLibrary`。
- **PhotoViewPicker 返回的 URI 具有永久授权**: `PhotoViewPicker.select()` 返回的 `photoUris` 带有永久文件访问权限，可直接用于 `photoAccessHelper.getAssets()` 以及 `Image` 组件的 `src` 属性。无需额外申请 `ohos.permission.READ_IMAGEVIDEO` 权限。
- **`image.Packer` 中的 `packing()` 方法已废弃**（API 13+），应使用 `packToData()` 替代。
- **import 命名差异**: 旧的 HarmonyOS 5.0 之前导入为 `import { image } from '@ohos.multimedia.image'`，新版本统一为 `import { image } from '@kit.ImageKit'`。`photoAccessHelper` 导入为 `@kit.MediaLibraryKit`，`picker` 和 `fileIo` 导入为 `@kit.CoreFileKit`。
- **Image 组件加载沙箱路径**: 沙箱文件路径不能直接传入 Image 的 `src`，需通过 `fileUri.getUriFromPath(path)` 转换为 `file://` URI 格式。
