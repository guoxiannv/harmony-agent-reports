# 06 — Camera & Image

## @ohos.multimedia.camera
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相机管理器实例，用于管理相机设备、创建输入/输出流及会话 | camera.getCameraManager | `import { camera } from '@kit.CameraKit';` | `getCameraManager(context: Context): CameraManager` | `let cameraManager = camera.getCameraManager(context);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/02_Functions.md` |
| 获取支持的相机设备列表 | CameraManager.getSupportedCameras | `import { camera } from '@kit.CameraKit';` | `getSupportedCameras(): Array<CameraDevice>` | `let cameras = cameraManager.getSupportedCameras();` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/10_Interface (CameraManager).md` |

## @ohos.multimedia.cameraPicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起相机选择器进行拍照或录制 | cameraPicker.pick | `import { cameraPicker } from '@kit.CameraKit';` | `pick(context: Context, mediaTypes: Array<PickerMediaType>, pickerProfile: PickerProfile): Promise<PickerResult>` | `let result = await cameraPicker.pick(context, [cameraPicker.PickerMediaType.PHOTO], profile);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/02_ohos.multimedia.cameraPicker (相机选择器).md` |

## @ohos.multimedia.image
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过URI创建图片源实例，用于解码 | image.createImageSource | `import { image } from '@kit.ImageKit';` | `createImageSource(uri: string): ImageSource` | `let imageSource = image.createImageSource(path);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 创建ImagePacker实例，用于图片编码 | image.createImagePacker | `import { image } from '@kit.ImageKit';` | `createImagePacker(): ImagePacker` | `let packer = image.createImagePacker();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 通过像素数据创建PixelMap | image.createPixelMap | `import { image } from '@kit.ImageKit';` | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` | `let pixelMap = await image.createPixelMap(color, opts);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |

## photoPicker (PhotoViewPicker)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起图库选择器选择图片/视频 | PhotoViewPicker.select | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `let picker = new photoAccessHelper.PhotoViewPicker(); let result = await picker.select(options);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |

## photoAccessHelper
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理模块实例 | photoAccessHelper.getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |

## @ohos.file.fs
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取文件或目录详细属性信息 | fileIo.stat | `import { fileIo } from '@kit.CoreFileKit';` | `stat(file: string | number): Promise<Stat>` | `fileIo.stat(filePath).then((stat) => { console.info(`size: ${stat.size}`); });` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 打开文件（返回文件描述符） | fileIo.openSync | `import { fileIo } from '@kit.CoreFileKit';` | `openSync(path: string, mode?: number): File` | `let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE);` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |

## 模块笔记

- `@ohos.multimedia.camera` 从 API version 10 开始支持，`cameraPicker.pick` 从 API version 11 开始支持；均通过 `@kit.CameraKit` 导入。
- `@ohos.multimedia.image` 从 API version 6 开始支持，通过 `@kit.ImageKit` 导入；PixelMap 对象使用后需主动调用 `release()` 释放内存。
- `photoPicker` 对应 `photoAccessHelper.PhotoViewPicker`；选择结果中的 `photoUris` 具有永久授权，可通过 `photoAccessHelper.getAssets()` 使用。从 API version 10 开始支持。
- `photoAccessHelper` 从 API version 10 开始支持，通过 `@kit.MediaLibraryKit` 导入；仅限 Stage 模型使用。
- `@ohos.file.fs` 从 API version 9 开始支持，通过 `@kit.CoreFileKit` 导入（导入名为 `fileIo`）；操作需使用应用沙箱路径。
