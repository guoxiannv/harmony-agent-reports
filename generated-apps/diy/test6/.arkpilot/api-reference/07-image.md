# 07 — Image & Media

## Image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示图片，支持本地/网络/PixelMap/DrawableDescriptor | Image | 内置组件，无需导入 | `Image(src: PixelMap \| ResourceStr \| DrawableDescriptor)` (API 7+) | `Image($r('app.media.icon')).width(100).height(100)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md |

## ImageAnimator
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 逐帧播放图片动画 | ImageAnimator | 内置组件，无需导入 | `ImageAnimator()` (API 7+) | `.images([{src:$r('app.media.img1')},{src:$r('app.media.img2')}])` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/02_ImageAnimator.md |

## photoAccessHelper (PhotoViewPicker)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择器，选择图片/视频 | `photoAccessHelper.PhotoViewPicker` | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `new photoAccessHelper.PhotoViewPicker().select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` (API 10+) | `photoPicker.select(photoSelectOptions).then(...)` | 04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md |

## picker (DocumentViewPicker)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文档选择器，选择/保存文件 | `picker.DocumentViewPicker` | `import { picker } from '@kit.CoreFileKit';` | `new picker.DocumentViewPicker(context).select(option?: DocumentSelectOptions): Promise<Array<string>>` (API 9+) | `documentPicker.select(documentSelectOptions).then(...)` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md |

## fileIo (file management)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基础文件操作：文件管理、目录管理、文件信息、流式读写 | `fileIo` | `import { fileIo } from '@kit.CoreFileKit';` | `fileIo.stat(file: string \| number): Promise<Stat>` (API 9+) | `let stat = await fileIo.stat(pathDir);` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md |

## image (ImageSource, ImagePacker, PixelMap)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建图片源，解码图片 | `image.createImageSource` | `import { image } from '@kit.ImageKit';` | `createImageSource(uri: string): ImageSource` (API 6+) | `let imgSrc = image.createImageSource(uri);` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md |
| 创建PixelMap（像素图） | `ImageSource.createPixelMap` | `import { image } from '@kit.ImageKit';` | `createPixelMap(options?: DecodingOptions): Promise<PixelMap>` (API 6+) | `let pixelMap = await imgSrc.createPixelMap();` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/08_Interface (ImageSource).md |
| 创建ImagePacker，图片压缩编码 | `image.createImagePacker` | `import { image } from '@kit.ImageKit';` | `createImagePacker(): ImagePacker` (API 6+) | `let packer = image.createImagePacker();` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md |
| 打包编码图片 | `ImagePacker.packToData` | `import { image } from '@kit.ImageKit';` | `packToData(source: ImageSource, options: PackingOption): Promise<ArrayBuffer>` (API 13+) | `let data = await packer.packToData(imgSrc, opts);` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md |

## camera (Camera Kit)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相机管理器实例 | `camera.getCameraManager` | `import { camera } from '@kit.CameraKit';` | `getCameraManager(context: Context): CameraManager` (API 10+) | `let camMgr = camera.getCameraManager(context);` | 04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/02_Functions.md |

## Module Notes
- **Image 组件** 支持 `PixelMap`, `ResourceStr`, `DrawableDescriptor` 三种输入，从 API 12 开始支持 `ImageContent`。网络图片需 `ohos.permission.INTERNET` 权限。支持 png/jpg/bmp/svg/webp/gif/heif/tiff 格式。
- **ImageAnimator** 提供逐帧动画播放，`images` 属性为 `Array<ImageFrameInfo>`，每帧可独立控制 src/width/height/top/left/duration。从 API 12 开始支持 PixelMap 帧源。
- **photoAccessHelper.PhotoViewPicker** 从 API 10 开始，返回的 `photoUris` 具有永久授权，可通过 `photoAccessHelper.getAssets` 访问。需配合 `@kit.MediaLibraryKit` 使用。
- **picker.DocumentViewPicker** 从 API 9 开始，从 API 12 推荐使用带 Context 的构造函数。URI 中的中文及特殊字符会被编码。
- **fileIo** 是 `@ohos.file.fs` 模块的实践命名，官方导入为 `import { fileIo } from '@kit.CoreFileKit'`。
- **image (Image Kit)** 模块从 API 6 开始支持。`ImagePacker` 支持编码格式：jpeg/webp/png/heic/gif。`ImageSource` 支持的解码格式包括：PNG/JPEG/BMP/GIF/WebP/DNG/HEIC。
- **camera** 从 API 10 开始支持。核心流程：`getCameraManager` -> `getSupportedCameras` -> `createInput` -> `createSession` -> `createOutput` -> `session.start`。
- 未在当前目标目录中找到 `ImageAnimator` `monitorInvisibleArea` 之外的显式 `mediaUtils` 或独立 `Media Kit` 图片选择组件。`PhotoPickerComponent` 和 `AlbumPickerComponent` 在 Media Library Kit 的 ArkTS 组件目录下，可另行调研。
