# 04 — Image 图片解码/编码/缩略图

## @ohos.multimedia.image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片处理模块，提供解码、编码、编辑、元数据处理能力 | @ohos.multimedia.image | `import { image } from '@kit.ImageKit'` | 模块API version 6起支持 | `image.createImageSource(uri)` | `01_ohos.multimedia.image (图片处理)/01_模块描述.md` |

## createImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过URI创建ImageSource解码实例 | image.createImageSource | `import { image } from '@kit.ImageKit'` | `createImageSource(uri: string): ImageSource` | `const imageSourceObj = image.createImageSource(context.filesDir + "/test.jpg")` | `01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 通过文件描述符创建ImageSource实例 | image.createImageSource | `import { image } from '@kit.ImageKit'` | `createImageSource(fd: number): ImageSource` | `const imageSourceObj = image.createImageSource(file.fd)` | `01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 通过ArrayBuffer创建ImageSource实例 | image.createImageSource | `import { image } from '@kit.ImageKit'` | `createImageSource(buf: ArrayBuffer): ImageSource` | `const imageSourceObj = image.createImageSource(rawFile.buffer as ArrayBuffer)` | `01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 通过RawFileDescriptor创建ImageSource实例 | image.createImageSource | `import { image } from '@kit.ImageKit'` | `createImageSource(rawfile: resourceManager.RawFileDescriptor, options?: SourceOptions): ImageSource` | `const imageSourceObj = image.createImageSource(rawFileDescriptor)` | `01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## createImagePacker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建ImagePacker编码实例 | image.createImagePacker | `import { image } from '@kit.ImageKit'` | `createImagePacker(): ImagePacker` | `const imagePackerObj: image.ImagePacker = image.createImagePacker()` | `01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## ImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片解码类，用于获取图片信息、解码为PixelMap/Picture | ImageSource | `import { image } from '@kit.ImageKit'` | 通过`image.createImageSource(...)`构造 | `let imageSource: image.ImageSource = image.createImageSource(path)` | `01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |

## ImageSource.createPixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过图片解码参数异步创建PixelMap（Promise） | ImageSource.createPixelMap | `import { image } from '@kit.ImageKit'` | `createPixelMap(options?: DecodingOptions): Promise<PixelMap>` | `imageSource.createPixelMap().then((pixelMap) => { ... })` | `01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |
| 通过默认参数异步创建PixelMap（callback） | ImageSource.createPixelMap | `import { image } from '@kit.ImageKit'` | `createPixelMap(callback: AsyncCallback<PixelMap>): void` | `imageSource.createPixelMap((err, pixelMap) => { ... })` | `01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |
| 同步创建PixelMap | ImageSource.createPixelMapSync | `import { image } from '@kit.ImageKit'` | `createPixelMapSync(options?: DecodingOptions): PixelMap` | `let pixelmap = imageSource.createPixelMapSync(decodingOptions)` | `01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |
| 使用指定分配器异步创建PixelMap | ImageSource.createPixelMapUsingAllocator | `import { image } from '@kit.ImageKit'` | `createPixelMapUsingAllocator(options?: DecodingOptions, allocatorType?: AllocatorType): Promise<PixelMap>` | `imageSource.createPixelMapUsingAllocator(opts, image.AllocatorType.AUTO)` | `01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |

## PixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位图对象，包含像素数据及图片信息，支持裁剪/缩放/旋转 | PixelMap | `import { image } from '@kit.ImageKit'` | 通过`ImageSource.createPixelMap()`或`image.createPixelMapFromPixels()`获取 | `let pixelMap: image.PixelMap = await imageSource.createPixelMap()` | `01_ohos.multimedia.image (图片处理)/15_Interface (PixelMap).md` |

## ImagePacker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码类，用于将图片压缩编码为数据流或文件 | ImagePacker | `import { image } from '@kit.ImageKit'` | 通过`image.createImagePacker()`构造 | `const imagePackerObj: image.ImagePacker = image.createImagePacker()` | `01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## ImagePacker.packing
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片压缩编码为ArrayBuffer（已废弃，建议用packToData） | ImagePacker.packing | `import { image } from '@kit.ImageKit'` | `packing(source: PixelMap, option: PackingOption): Promise<ArrayBuffer>` | `imagePackerObj.packing(pixelMap, packOpts).then((data) => {...})` | `01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## ImagePacker.packToData
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将ImageSource编码为ArrayBuffer（推荐替代packing） | ImagePacker.packToData | `import { image } from '@kit.ImageKit'` | `packToData(source: ImageSource, options: PackingOption): Promise<ArrayBuffer>` | `imagePackerObj.packToData(imageSourceObj, packOpts).then((data) => {...})` | `01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |
| 将PixelMap编码为ArrayBuffer | ImagePacker.packToData | `import { image } from '@kit.ImageKit'` | `packToData(source: PixelMap, options: PackingOption): Promise<ArrayBuffer>` | `imagePackerObj.packToData(pixelMap, packOpts).then((data) => {...})` | `01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## Module Notes

- **Import**: All APIs use `import { image } from '@kit.ImageKit'`. The module was originally `@ohos.multimedia.image` but the package is accessed via `@kit.ImageKit`.
- **Memory**: All image objects (ImageSource, PixelMap, ImagePacker, Picture) must call `release()` after use to free memory. Ensure all async methods complete before release.
- **Deprecation**: `ImagePacker.packing()` is deprecated from API 13. Use `ImagePacker.packToData()` instead.
- **PixelMap creation**: From API 15+, prefer `createPixelMapUsingAllocator` / `createPixelMapUsingAllocatorSync` which allow specifying memory type (DMA/SHARED/AUTO) for optimized memory use.
- **Decoding quality**: Use `DecodingOptions` with `desiredSize`, `desiredRegion`, `sampleSize`, `rotate`, and `desiredPixelFormat` to control output quality and performance.
- **SystemCapabilities**: ImageSource requires `SystemCapability.Multimedia.Image.ImageSource`; PixelMap creation requires `SystemCapability.Multimedia.Image.Core`; ImagePacker requires `SystemCapability.Multimedia.Image.ImagePacker`.
