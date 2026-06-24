# 05 — Image Kit (Image Processing)

## @ohos.multimedia.image (图片处理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片解码、编码、编辑、元数据处理的统一模块入口 | `@ohos.multimedia.image` | `import { image } from '@kit.ImageKit';` | 模块提供 ImageSource、ImagePacker、PixelMap、Picture、AuxiliaryPicture 等基础类 | `import { image } from '@kit.ImageKit';` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/01_模块描述.md |

## image.createImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 uri/fd/buffer/rawfile 创建 ImageSource 实例 | `image.createImageSource` | `import { image } from '@kit.ImageKit';` | `createImageSource(uri: string): ImageSource` / `createImageSource(fd: number): ImageSource` / `createImageSource(buf: ArrayBuffer, options?: SourceOptions): ImageSource` / `createImageSource(rawfile: resourceManager.RawFileDescriptor, options?: SourceOptions): ImageSource` | `let imageSourceObj: image.ImageSource = image.createImageSource(path);` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md |

## image.createPixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过像素数据和图像属性创建 PixelMap | `image.createPixelMap` | `import { image } from '@kit.ImageKit';` | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` / `createPixelMap(colors: ArrayBuffer, options: InitializationOptions, callback: AsyncCallback<PixelMap>): void` | `image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => { ... })` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md |

## PixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位图对象，用于读取/写入像素数据、裁剪、缩放、旋转、翻转等操作 | `PixelMap` | `import { image } from '@kit.ImageKit';` | 属性: `isEditable: boolean`, `isStrideAlignment: boolean` 方法: `readPixelsToBuffer(dst): Promise<void>`, `readPixels(area): Promise<void>`, `writePixels(area): Promise<void>`, `writeBufferToPixels(src): Promise<void>`, `getImageInfo(): Promise<ImageInfo>`, `getDensity(): number`, `getPixelBytesNumber(): number`, `scale(x, y): Promise<void>`, `translate(x, y): Promise<void>`, `rotate(angle): Promise<void>`, `flip(horizontal, vertical): Promise<void>`, `crop(region): Promise<void>`, `release(): Promise<void>`, `clone(): Promise<PixelMap>`, `convertPixelFormat(targetPixelFormat): Promise<void>`, `getColorSpace(): colorSpaceManager.ColorSpaceManager`, `applyColorSpace(targetColorSpace): Promise<void>`, `toSdr(): Promise<void>`, `getMetadata(key): HdrMetadataValue`, `setMetadata(key, value): Promise<void>` | `pixelMap.readPixelsToBuffer(readBuffer).then(() => { ... })` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/15_Interface (PixelMap).md |

## ImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片源，用于获取图片信息、解码为 PixelMap/Picture、读写 Exif 属性 | `ImageSource` | `import { image } from '@kit.ImageKit';` | 属性: `supportedFormats: Array<string>` 方法: `createPixelMap(options?): Promise<PixelMap>`, `createPixelMapList(options?): Promise<Array<PixelMap>>`, `getImageInfo(index?): Promise<ImageInfo>`, `getImageProperty(key, options?): Promise<string>`, `modifyImageProperty(key, value): Promise<void>`, `getFrameCount(): Promise<number>`, `createPicture(options?): Promise<Picture>`, `release(): Promise<void>` | `imageSource.createPixelMap().then((pixelMap: image.PixelMap) => { ... })` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md |

## ImagePacker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片压缩编码，将 ImageSource/PixelMap/Picture 编码为压缩数据流或文件 | `ImagePacker` | `import { image } from '@kit.ImageKit';` | 属性: `supportedFormats: Array<string>` 方法: `packToData(source: ImageSource, options: PackingOption): Promise<ArrayBuffer>`, `packToData(source: PixelMap, options: PackingOption): Promise<ArrayBuffer>`, `packing(picture, options): Promise<ArrayBuffer>`, `packToFile(source, fd, options): Promise<void>`, `release(): Promise<void>` | `imagePackerObj.packToData(imageSourceObj, packOpts).then((data: ArrayBuffer) => { ... })` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md |

## image.PackingOption
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码选项，指定格式、质量、缓冲区大小等 | `PackingOption` | `import { image } from '@kit.ImageKit';` | `{ format: string, quality: number, bufferSize?: number, desiredDynamicRange?: PackingDynamicRange, needsPackProperties?: boolean }` | `let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md |

## 模块要点

- **导入方式**：`import { image } from '@kit.ImageKit';`，而不是 `@kit.ImageKit` 的子路径。
- **图片解码流程**：`createImageSource` (uri/fd/buffer/rawfile) -> `ImageSource.createPixelMap()` (得到 PixelMap) -> 可进行裁剪/缩放/旋转等编辑操作。
- **图片编码流程**：创建 `ImagePacker` (`createImagePacker()`) -> 调用 `packToData(source, options)` 编码为 ArrayBuffer 或 `packToFile(source, fd, options)` 写入文件。
- **PixelMap 必须主动释放**：PixelMap/ImageSource/ImagePacker 使用完成后需调用 `release()` 释放 native 内存，且需确保所有异步方法执行完成。
- **PixelMap 序列化限制**：最大 128MB，大小计算方式为 `宽 * 高 * 每像素字节数`。
- **推荐的现代 API**：`createPixelMapFromPixels`（替代 `createPixelMap`）、`createEmptyPixelMap`（替代 `createPixelMapSync`）、`packToData`（替代 `packing`）、`createPixelMapUsingAllocator`（支持指定内存类型）。
- **HDR 支持**：通过 `DecodingOptions.desiredDynamicRange` 解码 HDR 内容，`PackingOption.desiredDynamicRange` 编码 HDR 内容，PixelMap 可通过 `toSdr()` 将 HDR 转为 SDR。
- **元数据**：ImageSource 支持读写 Exif 属性（`getImageProperty`/`modifyImageProperty`），以及批量读写元数据（`readImageMetadata`/`writeImageMetadata`）。
- **编码格式**：`packToData` 支持 jpeg/webp/png/heic/gif；`packToFile` 支持直接写入文件 fd。
