# 05 — Image Processing (Thumbnails)

## image (module)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Image Kit 图片处理模块，提供图片解码、编码、编辑、元数据处理和图片接收能力 | `image` | `import { image } from '@kit.ImageKit'` | 模块包含 ImageSource、ImagePacker、PixelMap、Picture 等基础类 | `import { image } from '@kit.ImageKit';` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/01_模块描述.md` |

## createImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 uri/fd/ArrayBuffer/RawFileDescriptor 创建 ImageSource 实例，用于图片解码 | `image.createImageSource` | `import { image } from '@kit.ImageKit'` | `createImageSource(uri: string): ImageSource` / `createImageSource(fd: number): ImageSource` / `createImageSource(buf: ArrayBuffer): ImageSource` / `createImageSource(rawfile: resourceManager.RawFileDescriptor, options?: SourceOptions): ImageSource` | `let imageSource: image.ImageSource = image.createImageSource(context.filesDir + "/test.jpg");` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## createImagePacker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 ImagePacker 实例，用于图片压缩和编码 | `image.createImagePacker` | `import { image } from '@kit.ImageKit'` | `createImagePacker(): ImagePacker` | `const imagePackerObj: image.ImagePacker = image.createImagePacker();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## ImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片源类，提供获取图片信息、创建 PixelMap/Picture、读写 Exif 等能力 | `ImageSource` | `import { image } from '@kit.ImageKit'` | `interface ImageSource { supportedFormats: Array<string>; getImageInfo(index?: number): Promise<ImageInfo>; createPixelMap(options?: DecodingOptions): Promise<PixelMap>; createThumbnail(options?: DecodingOptionsForThumbnail): Promise<PixelMap | undefined>; release(): Promise<void>; ... }` | `let pixelMap = await imageSource.createPixelMap({ desiredSize: { width: 200, height: 200 } });` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |

## ImagePacker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码器类，提供将 ImageSource/PixelMap/Picture 编码为压缩数据或文件的能力 | `ImagePacker` | `import { image } from '@kit.ImageKit'` | `interface ImagePacker { supportedFormats: Array<string>; packToData(source: ImageSource | PixelMap, options: PackingOption): Promise<ArrayBuffer>; packToFile(source: ImageSource | PixelMap, fd: number, options: PackingOption): Promise<void>; release(): Promise<void>; }` | `let data = await imagePackerObj.packToData(pixelMap, { format: "image/jpeg", quality: 80 });` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## PackingOption
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码选项，指定编码格式、质量等参数 | `PackingOption` | `import { image } from '@kit.ImageKit'` | `interface PackingOption { format: string; quality: number; bufferSize?: number; desiredDynamicRange?: PackingDynamicRange; needsPackProperties?: boolean; }` | `let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98, desiredDynamicRange: image.PackingDynamicRange.AUTO, needsPackProperties: true };` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md` |

## Module Notes

- Import: `import { image } from '@kit.ImageKit';`
- ImageSource 支持解码的格式: png, jpeg, bmp, gif, webp, dng, heic, wbmp, heifs, tiff, svg, ico, avif, avis
- ImagePacker 支持编码的格式: jpeg, webp, png, heic, gif
- `PackingOption.format` 值: "image/jpeg", "image/webp", "image/png", "image/heic"（或 "image/heif"）
- `PackingOption.quality` 取值范围: [0, 100]，仅对 JPEG 和 HEIF 生效
- 所有图片对象使用完毕后应主动调用 `release()` 释放内存
- 缩略图相关: ImageSource 提供 `createThumbnail()` 和 `createThumbnailSync()` 方法（API 26+），支持 JPEG 和 HEIF 格式，优先解码文件中内嵌的缩略图
- `DecodingOptionsForThumbnail` 包含 `generateThumbnailIfAbsent`（是否在无缩略图时生成）和 `maxGeneratedPixelDimension`（生成的最大像素尺寸）
