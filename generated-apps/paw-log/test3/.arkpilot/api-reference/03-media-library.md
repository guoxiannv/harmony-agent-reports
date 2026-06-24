# 03 — 相册选择与图片处理 (Media Library & Image)

## PhotoViewPicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择器，拉起系统相册选择图片/视频 | `PhotoViewPicker` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `let photoPicker = new photoAccessHelper.PhotoViewPicker(); photoPicker.select(photoSelectOptions).then(...)` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |

## photoAccessHelper
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 | `getPhotoAccessHelper` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `photoAccessHelper.getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |
| 获取图片/视频资源列表 | `PhotoAccessHelper.getAssets` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getAssets(options: FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let fetchResult = await phAccessHelper.getAssets(fetchOptions);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 创建图片/视频资源 | `PhotoAccessHelper.createAsset` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `createAsset(photoType: PhotoType, extension: string, options?: CreateOptions): Promise<string>` | `let uri = await phAccessHelper.createAsset(PhotoType.IMAGE, 'jpg', {title: 'testPhoto'});` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

## ImagePacker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码器（压缩/编码为数据流） | `ImagePacker.packToData` | `import { image } from '@kit.ImageKit'` | `packToData(source: PixelMap, options: PackingOption): Promise<ArrayBuffer>` | `let data = await packer.packToData(pixelMap, {format: "image/jpeg", quality: 98});` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |
| 图片编码到文件 | `ImagePacker.packToFile` | `import { image } from '@kit.ImageKit'` | `packToFile(source: PixelMap, fd: number, options: PackingOption): Promise<void>` | `packer.packToFile(pixelMap, file.fd, {format: "image/jpeg", quality: 98});` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## image.createImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过沙箱路径创建图片解码源 | `createImageSource(uri)` | `import { image } from '@kit.ImageKit'` | `createImageSource(uri: string): ImageSource` | `let imageSource = image.createImageSource(context.filesDir + "/test.jpg");` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 通过文件描述符创建图片解码源 | `createImageSource(fd)` | `import { image } from '@kit.ImageKit'` | `createImageSource(fd: number): ImageSource` | `let imageSource = image.createImageSource(file.fd);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 通过ArrayBuffer创建图片解码源 | `createImageSource(buf)` | `import { image } from '@kit.ImageKit'` | `createImageSource(buf: ArrayBuffer): ImageSource` | `let imageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## image.createPixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过像素数据创建PixelMap（已弃用，建议用createPixelMapFromPixels） | `createPixelMap(colors, options)` | `import { image } from '@kit.ImageKit'` | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` | `image.createPixelMap(color, opts).then(pixelMap => {...});` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 通过像素数据创建PixelMap（推荐替代） | `createPixelMapFromPixels(pixels, param)` | `import { image } from '@kit.ImageKit'` | `createPixelMapFromPixels(pixels: ArrayBuffer, param: InitializationOptions): Promise<PixelMap>` | `image.createPixelMapFromPixels(pixels, config).then(pixelMap => {...});` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## PixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位图对象，包含像素数据和图片信息 | `PixelMap` | `import { image } from '@kit.ImageKit'` | Interface in `@ohos.multimedia.image` | `image.createPixelMapFromPixels(pixels, config).then((pixelMap: image.PixelMap) => { pixelMap.getImageInfoSync(); });` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/15_Interface (PixelMap).md` |

## ImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片解码源，支持解码为PixelMap | `ImageSource` | `import { image } from '@kit.ImageKit'` | Interface in `@ohos.multimedia.image` | `let imageSource = image.createImageSource(path); let pixelMap = await imageSource.createPixelMap();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |
| 获取图片信息 | `ImageSource.getImageInfo` | `import { image } from '@kit.ImageKit'` | `getImageInfo(index?: number): Promise<ImageInfo>` | `imageSource.getImageInfo(0).then(info => { console.info(info.size); });` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |

## ImageInfo
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片信息（尺寸、密度、步幅、像素格式、透明度） | `ImageInfo` | `import { image } from '@kit.ImageKit'` | `{size: Size, density: number, stride: number, pixelFormat: PixelMapFormat, alphaType: AlphaType}` | `let info: image.ImageInfo = pixelMap.getImageInfoSync(); let w = info.size.width;` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md` |

## packing.PackingOption
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码选项（格式、质量、缓冲区大小、动态范围、是否编码EXIF） | `PackingOption` | `import { image } from '@kit.ImageKit'` | `{format: string, quality: number, bufferSize?: number, desiredDynamicRange?: PackingDynamicRange, needsPackProperties?: boolean}` | `let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md` |

## @ohos.multimedia.image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片处理核心模块（解码、编码、编辑、元数据、PixelMap） | `@ohos.multimedia.image` | `import { image } from '@kit.ImageKit'` | 模块包含ImageSource, ImagePacker, PixelMap, Picture等类 | `import { image } from '@kit.ImageKit';` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/01_模块描述.md` |

## 模块 Notes

- **PhotoSaveButton** 未在本地文档中找到（可能为独立组件或不同命名）。
- **ImageDecoder** 未在本地文档中找到。图片解码统一通过 `ImageSource` + `createPixelMap()` 路径完成，没有单独的 `ImageDecoder` 类。
- `PhotoViewPicker.select()` 返回的 `photoUris` 具有永久授权，可直接通过 `photoAccessHelper.getAssets()` 访问。
- `image.createPixelMap(colors, options)` 从 API 26 起建议用 `createPixelMapFromPixels(pixels, param)` 替代，后者提供更完善的异常处理。
- `ImagePacker.packing()` 方法从 API 13 起废弃，建议用 `packToData()` 替代。
- `@ohos.multimedia.image` 导入路径为 `@kit.ImageKit`，`@ohos.file.photoAccessHelper` 导入路径为 `@kit.MediaLibraryKit`。
