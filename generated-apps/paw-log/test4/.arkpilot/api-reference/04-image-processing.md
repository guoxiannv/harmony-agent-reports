# 04 — Image Processing

## @ohos.multimedia.image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片处理（解码、编码、编辑、元数据）模块入口 | @ohos.multimedia.image | `import { image } from '@kit.ImageKit';` | 模块描述/导入语句 | `image.createImageSource(...)` -> `imageSource.createPixelMap()` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/01_模块描述.md` |

## ImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片解码源，支持从 uri/fd/ArrayBuffer/RawFileDescriptor 创建，解码为 PixelMap 或 Picture | ImageSource | `import { image } from '@kit.ImageKit';` | `image.createImageSource(uri: string): ImageSource` | `let imageSource: image.ImageSource = image.createImageSource(path);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |
| 通过缓冲区创建 ImageSource | createImageSource (buf 重载) | 同上 | `createImageSource(buf: ArrayBuffer): ImageSource` | `let imageSource = image.createImageSource(rawFile.buffer as ArrayBuffer);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 获取图片信息（宽高/格式） | getImageInfo | 同上 | `getImageInfo(index?: number): Promise<ImageInfo>` | `let info = await imageSource.getImageInfo(0); console.info(info.size.width, info.size.height);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |
| 同步获取图片信息 | getImageInfoSync | 同上 | `getImageInfoSync(index?: number): ImageInfo` | `let info = imageSource.getImageInfoSync(0);` | 同上 |
| 解码为 PixelMap（异步，支持缩放/裁剪/旋转） | createPixelMap (ImageSource 方法) | 同上 | `createPixelMap(options?: DecodingOptions): Promise<PixelMap>` | `let pixelMap = await imageSource.createPixelMap({ desiredSize: { width: 100, height: 100 } });` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |
| 创建缩略图 PixelMap（优先使用嵌入缩略图） | createThumbnail | 同上 | `createThumbnail(options?: DecodingOptionsForThumbnail): Promise<PixelMap \| undefined>` | `let thumb = await imageSource.createThumbnail({ generateThumbnailIfAbsent: true, maxGeneratedPixelDimension: 200 });` | 同上 |

## PixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位图对象，含像素数据和图片信息，支持编辑操作 | PixelMap | `import { image } from '@kit.ImageKit';` | `class PixelMap` — 属性: `isEditable: boolean` | `pixelMap.getImageInfo().then(info => { ... })` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/15_Interface (PixelMap).md` |
| 获取 PixelMap 图片信息（宽高） | getImageInfo (PixelMap 方法) | 同上 | `getImageInfo(): Promise<ImageInfo>` | `let info = await pixelMap.getImageInfo(); let { width, height } = info.size;` | 同上 |
| 同步获取 PixelMap 图片信息 | getImageInfoSync | 同上 | `getImageInfoSync(): ImageInfo` | `let info = pixelMap.getImageInfoSync();` | 同上 |
| 缩放 PixelMap | scale | 同上 | `scale(x: number, y: number): Promise<void>` | `pixelMap.scale(0.5, 0.5); // 缩小为一半` | 同上 |
| 指定算法的缩放 | scale (带 level) | 同上 | `scale(x: number, y: number, level: AntiAliasingLevel): Promise<void>` | `pixelMap.scale(0.5, 0.5, image.AntiAliasingLevel.HIGH);` | 同上 |
| 创建缩放后的新 PixelMap（不可编辑） | createScaledPixelMap | 同上 | `createScaledPixelMap(x: number, y: number, level?: AntiAliasingLevel): Promise<PixelMap>` | `let scaled = await pixelMap.createScaledPixelMap(0.5, 0.5);` | 同上 |
| 裁剪 PixelMap | crop | 同上 | `crop(region: Region): Promise<void>` | `pixelMap.crop({ x: 0, y: 0, size: { width: 100, height: 100 } });` | 同上 |
| 释放 PixelMap 内存 | release | 同上 | `release(): Promise<void>` | `await pixelMap.release();` | 同上 |

## createPixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从像素数据创建 PixelMap（推荐 API 26+） | createPixelMapFromPixels | `import { image } from '@kit.ImageKit';` | `image.createPixelMapFromPixels(pixels: ArrayBuffer, param: InitializationOptions): Promise<PixelMap>` | `image.createPixelMapFromPixels(pixels, { size, pixelFormat: image.PixelMapFormat.RGBA_8888, editable: true })` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 从像素数据同步创建 PixelMap | createPixelMapFromPixelsSync | 同上 | `createPixelMapFromPixelsSync(pixels: ArrayBuffer, param: InitializationOptions): PixelMap` | `let pm = image.createPixelMapFromPixelsSync(pixels, config);` | 同上 |
| 从像素数据创建 PixelMap（旧 API，推荐替换） | createPixelMap (全局函数) | 同上 | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` | `image.createPixelMap(color, opts).then(pm => ...)` | 同上 |
| 解码 ImageSource 为 PixelMap（指定尺寸） | ImageSource.createPixelMap | 同上 | `createPixelMap(options?: DecodingOptions): Promise<PixelMap>` | `let pm = await imageSource.createPixelMap({ desiredSize: { width: 200, height: 200 } });` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |

## getImageInfo
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从 ImageSource 获取图片元信息 | ImageSource.getImageInfo | `import { image } from '@kit.ImageKit';` | `getImageInfo(index?: number): Promise<ImageInfo>` | `let info = await imageSource.getImageInfo();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |
| 从 PixelMap 获取图片元信息 | PixelMap.getImageInfo | 同上 | `getImageInfo(): Promise<ImageInfo>` | `let info = await pixelMap.getImageInfo();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/15_Interface (PixelMap).md` |

## Module Notes

- **Avatar thumbnail flow**: Use `image.createImageSource(buf)` with raw image data, then `imageSource.getImageInfo()` to check dimensions, then `imageSource.createPixelMap({ desiredSize: { width: targetSize, height: targetSize } })` to decode at the target avatar size, then optionally use `pixelMap.crop()` or `createCroppedAndScaledPixelMap()` for precise center-crop. The `createThumbnail()` method can also be used for JPEG/HEIF sources and will prefer embedded thumbnails if available.
- **Image resize flow**: Decode via `ImageSource.createPixelMap()` with a `desiredSize` in `DecodingOptions` to downscale during decode (more memory-efficient). For upscaling or further resize, use `pixelMap.scale()` or `createScaledPixelMap()` on the decoded PixelMap. For encode output, use `image.createImagePacker().packing()`.
- **Memory**: Always call `.release()` on ImageSource and PixelMap objects when done. Large images can cause OOM.
- **PixelMap serialization limit**: Max 128MB. Calculation: width * height * bytes-per-pixel.
- **Import**: All APIs use `import { image } from '@kit.ImageKit';`.
- **`@ohos.multimedia.image` is NOT deprecated**: The old `@ohos.multimedia.image` reference is replaced by `@kit.ImageKit` in the import, but the API surface is identical.
