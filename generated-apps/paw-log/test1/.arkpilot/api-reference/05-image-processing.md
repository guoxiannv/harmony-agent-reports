# 05 — Image Processing (图片处理)

## @ohos.multimedia.image (Image Kit)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Image Kit 模块入口，提供图片解码、编码、编辑、元数据处理等能力 | @ohos.multimedia.image | `import { image } from '@kit.ImageKit';` | 模块描述：图片处理服务，包含 ImageSource、ImagePacker、PixelMap、Picture 等基础类 | `import { image } from '@kit.ImageKit';` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/01_模块描述.md` |

## image.createImageSource()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 uri/fd/ArrayBuffer/RawFileDescriptor 创建 ImageSource 实例 | image.createImageSource() | `import { image } from '@kit.ImageKit';` | `createImageSource(uri: string): ImageSource` | `const imageSourceObj: image.ImageSource = image.createImageSource(path);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## image.ImageSource
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| ImageSource 类，用于获取图片相关信息、解码为 PixelMap、读写 Exif 属性 | image.ImageSource | `import { image } from '@kit.ImageKit';` | `class ImageSource` 支持 `createPixelMap()`、`getImageInfo()`、`getImageProperty()`、`release()` | `let pixelMap = await imageSource.createPixelMap();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md` |

## image.createImagePacker()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 ImagePacker 实例，用于图片压缩和编码 | image.createImagePacker() | `import { image } from '@kit.ImageKit';` | `createImagePacker(): ImagePacker` | `const imagePackerObj: image.ImagePacker = image.createImagePacker();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## image.ImagePacker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| ImagePacker 类，支持将 ImageSource/PixelMap/Picture 编码为压缩数据流或写入文件 | image.ImagePacker | `import { image } from '@kit.ImageKit';` | `class ImagePacker` 支持 `packToData()`、`packToFile()`、`release()` | `data = await imagePackerObj.packToData(imageSourceObj, packOpts);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## image.PackingOption
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片编码选项，指定格式、质量等参数 | PackingOption | `import { image } from '@kit.ImageKit';` | `interface PackingOption { format: string; quality: number; bufferSize?: number; desiredDynamicRange?: PackingDynamicRange; needsPackProperties?: boolean; }` | `{ format: "image/jpeg", quality: 98 }` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md` |

## image.ImageDecoder
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 未在当前文档中找到 `image.ImageDecoder` 类 | image.ImageDecoder | — | — | — | 本地文档未收录此 API |

## image.createPixelMap()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过像素数据和图像属性创建 PixelMap | image.createPixelMap() | `import { image } from '@kit.ImageKit';` | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` | `image.createPixelMap(color, opts).then((pixelMap) => { ... })` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## image.PixelMap
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位图对象，包含像素数据及图片信息，支持读取/写入像素、裁剪、缩放、旋转、翻转等操作 | PixelMap | `import { image } from '@kit.ImageKit';` | `interface PixelMap` 支持 `readPixelsToBuffer()`、`writePixels()`、`scale()`、`rotate()`、`crop()`、`release()` 等 | `pixelMap.scale(2.0, 1.0).then(() => { console.info('scaled'); })` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/15_Interface (PixelMap).md` |

## image.DecodingOptions
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图像解码设置选项，包括缩放、旋转、像素格式、动态范围等 | DecodingOptions | `import { image } from '@kit.ImageKit';` | `interface DecodingOptions { sampleSize?: number; rotate?: number; editable?: boolean; desiredSize?: Size; desiredRegion?: Region; desiredPixelFormat?: PixelMapFormat; index?: number; desiredDynamicRange?: DecodingDynamicRange; ... }` | `{ sampleSize: 1, editable: true, desiredSize: { width: 1, height: 2 }, desiredPixelFormat: image.PixelMapFormat.RGBA_8888 }` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md` |

## image.Size
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片尺寸，包含宽和高 | Size | `import { image } from '@kit.ImageKit';` | `interface Size { height: number; width: number; }` | `const size: image.Size = { width: 6, height: 4 };` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md` |

## image.createIncrementalSource()
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 以增量方式通过缓冲区创建 ImageSource 实例（实际接口名为 `CreateIncrementalSource`，首字母大写） | image.CreateIncrementalSource() | `import { image } from '@kit.ImageKit';` | `CreateIncrementalSource(buf: ArrayBuffer): ImageSource` | `const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(new ArrayBuffer(imageArray.byteLength));` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## image.ImageInfo
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片信息，包含大小、像素密度、像素格式、透明度类型、MIME 类型、HDR 标识 | ImageInfo | `import { image } from '@kit.ImageKit';` | `interface ImageInfo { size: Size; density?: number; stride?: number; pixelFormat?: PixelMapFormat; alphaType?: AlphaType; mimeType?: string; isHdr?: boolean; }` | `imageInfo.size.height; imageInfo.size.width;` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/16_Interfaces (其他).md` |

## 模块备注

- `image.createIncrementalSource()` 在 HarmonyOS API 中的实际命名为 `image.CreateIncrementalSource()`（首字母大写 C）。
- `image.ImageDecoder` 在当前本地文档中未找到对应类定义。图片解码能力由 `image.ImageSource` 提供。
- 从 API version 6 开始支持，最新文档版本 V172。所有资源和类使用完毕必须调用 `release()` 释放内存。
