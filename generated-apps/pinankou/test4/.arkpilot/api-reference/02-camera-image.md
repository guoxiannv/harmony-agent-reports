# 02 -- Camera & Image (拍照与图片)

## @ohos.multimedia.camera (相机管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相机管理器实例 | camera.getCameraManager | `import { camera } from '@kit.CameraKit';` | `getCameraManager(context: Context): CameraManager` | `let cameraManager = camera.getCameraManager(context);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/02_Functions.md` |
| 创建拍照会话 | cameraManager.createSession | 同上 | `createSession<T extends Session>(mode: SceneMode): T` | `let photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/10_Interface (CameraManager).md` |
| 查询支持的模式 | cameraManager.getSupportedSceneModes | 同上 | `getSupportedSceneModes(camera: CameraDevice): Array<SceneMode>` | `let modes = cameraManager.getSupportedSceneModes(cameraDevice);` | 同上 |
| 查询输出能力 | cameraManager.getSupportedOutputCapability | 同上 | `getSupportedOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability` | `let cap = cameraManager.getSupportedOutputCapability(cameraDevice, sceneMode);` | 同上 |
| 查询完整输出能力 | cameraManager.getSupportedFullOutputCapability (23+) | 同上 | `getSupportedFullOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability` | `let cap = cameraManager.getSupportedFullOutputCapability(cameraDevice, sceneMode);` | 同上 |
| 获取支持的相机设备 | cameraManager.getSupportedCameras | 同上 | `getSupportedCameras(): Array<CameraDevice>` | `let cameras = cameraManager.getSupportedCameras();` | 同上 |
| 创建相机输入 | cameraManager.createCameraInput | 同上 | `createCameraInput(camera: CameraDevice): CameraInput` | `let cameraInput = cameraManager.createCameraInput(cameraDevice);` | 同上 |
| 创建预览输出 | cameraManager.createPreviewOutput | 同上 | `createPreviewOutput(profile: Profile, surfaceId: string): PreviewOutput` | `let previewOutput = cameraManager.createPreviewOutput(profile, surfaceId);` | 同上 |
| 创建拍照输出 | cameraManager.createPhotoOutput (11+) | 同上 | `createPhotoOutput(profile?: Profile): PhotoOutput` | `let photoOutput = cameraManager.createPhotoOutput(profile);` | 同上 |

## CameraManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机管理器类，提供相机设备查询、创建输入/输出流及会话等能力 | camera.CameraManager | `import { camera } from '@kit.CameraKit';` | 通过 `camera.getCameraManager(context)` 获取实例 | `let cameraManager = camera.getCameraManager(context);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/10_Interface (CameraManager).md` |
| 注册相机状态变化监听 | cameraManager.on('cameraStatus') | 同上 | `on(type: 'cameraStatus', callback: AsyncCallback<CameraStatusInfo>): void` | `cameraManager.on('cameraStatus', (err, info) => {});` | 同上 |
| 手电筒模式设置 | cameraManager.setTorchMode | 同上 | `setTorchMode(mode: TorchMode): void` | `cameraManager.setTorchMode(camera.TorchMode.OFF);` | 同上 |

## CameraInput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机设备输入对象，提供开关相机以及监听输入流异常的能力 | camera.CameraInput | `import { camera } from '@kit.CameraKit';` | 通过 `cameraManager.createCameraInput(cameraDevice)` 获取实例 | `let cameraInput = cameraManager.createCameraInput(cameraDevice);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/09_Interface (CameraInput).md` |
| 打开相机 | cameraInput.open | 同上 | `open(callback: AsyncCallback<void>): void` | `cameraInput.open((err) => { /* handle */ });` | 同上 |
| 安全模式打开相机 (12+) | cameraInput.open (12+) | 同上 | `open(isSecureEnabled: boolean): Promise<bigint>` | `cameraInput.open(true).then((secureSeqId) => {});` | 同上 |

## PhotoOutput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拍照会话的输出信息，提供拍照相关能力 | camera.PhotoOutput | `import { camera } from '@kit.CameraKit';` | 通过 `cameraManager.createPhotoOutput(profile)` 获取实例 | `let photoOutput = cameraManager.createPhotoOutput(profile);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/33_Interface (PhotoOutput).md` |
| 以默认设置触发拍照 | photoOutput.capture | 同上 | `capture(): Promise<void>` | `await photoOutput.capture();` | 同上 |
| 以指定参数触发拍照 | photoOutput.capture | 同上 | `capture(setting: PhotoCaptureSetting, callback: AsyncCallback<void>): void` | `photoOutput.capture({ quality: camera.QualityLevel.QUALITY_LEVEL_HIGH }, (err) => {});` | 同上 |

## @ohos.multimedia.cameraPicker (相机选择器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起系统相机选择器，拍照或录制 | cameraPicker.pick | `import { cameraPicker } from '@kit.CameraKit';` | `pick(context: Context, mediaTypes: Array<PickerMediaType>, pickerProfile: PickerProfile): Promise<PickerResult>` | `let result = await cameraPicker.pick(context, [cameraPicker.PickerMediaType.PHOTO], { cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK });` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/02_ohos.multimedia.cameraPicker (相机选择器).md` |
| 媒体类型枚举 | cameraPicker.PickerMediaType | 同上 | `PHOTO = 'photo' / VIDEO = 'video'` | `[cameraPicker.PickerMediaType.PHOTO, cameraPicker.PickerMediaType.VIDEO]` | 同上 |
| 选择器配置信息 | cameraPicker.PickerProfile | 同上 | `{ cameraPosition, saveUri?, videoDuration? }` | `{ cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK }` | 同上 |
| 选择结果 | cameraPicker.PickerResult | 同上 | `{ resultCode, resultUri, mediaType }` | `result.resultUri // 媒体文件uri` | 同上 |

## @ohos.multimedia.image (图片处理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 URI 创建 ImageSource | image.createImageSource | `import { image } from '@kit.ImageKit';` | `createImageSource(uri: string): ImageSource` | `let imageSource = image.createImageSource(context.filesDir + "/test.jpg");` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 通过缓冲区创建 ImageSource | image.createImageSource (9+) | 同上 | `createImageSource(buf: ArrayBuffer): ImageSource` | `let imageSource = image.createImageSource(arrayBuffer);` | 同上 |
| 通过文件描述符创建 ImageSource | image.createImageSource (7+) | 同上 | `createImageSource(fd: number, options?: SourceOptions): ImageSource` | `let imageSource = image.createImageSource(file.fd);` | 同上 |
| 通过 RawFileDescriptor 创建 ImageSource (11+) | image.createImageSource (11+) | 同上 | `createImageSource(rawfile: resourceManager.RawFileDescriptor, options?: SourceOptions): ImageSource` | `let imageSource = image.createImageSource(rawFileDescriptor);` | 同上 |
| 增量创建 ImageSource (9+) | image.CreateIncrementalSource | 同上 | `CreateIncrementalSource(buf: ArrayBuffer, options?: SourceOptions): ImageSource` | `let incSrc = image.CreateIncrementalSource(new ArrayBuffer(size));` | 同上 |
| 创建 PixelMap | image.createPixelMap (8+) | 同上 | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` | `let pixelMap = await image.createPixelMap(color, opts);` | 同上 |
| 从像素数据创建 PixelMap (26+) | image.createPixelMapFromPixels | 同上 | `createPixelMapFromPixels(pixels: ArrayBuffer, param: InitializationOptions): Promise<PixelMap>` | `let pixelMap = await image.createPixelMapFromPixels(pixels, config);` | 同上 |
| 创建空白 PixelMap (26+) | image.createEmptyPixelMap | 同上 | `createEmptyPixelMap(param: InitializationOptions): PixelMap` | `let pixelMap = image.createEmptyPixelMap(config);` | 同上 |
| 创建 ImagePacker | image.createImagePacker | 同上 | `createImagePacker(): ImagePacker` | `let packer = image.createImagePacker();` | 同上 |
| 创建 Picture (13+) | image.createPicture | 同上 | `createPicture(mainPixelmap: PixelMap): Picture` | `let picture = image.createPicture(pixelMap);` | 同上 |
| 创建 ImageReceiver (11+) | image.createImageReceiver | 同上 | `createImageReceiver(size: Size, format: ImageFormat, capacity: number): ImageReceiver` | `let receiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);` | 同上 |
| 创建 ImageCreator (11+) | image.createImageCreator | 同上 | `createImageCreator(size: Size, format: ImageFormat, capacity: number): ImageCreator` | `let creator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);` | 同上 |
| 从 Surface 创建 PixelMap (11+) | image.createPixelMapFromSurface | 同上 | `createPixelMapFromSurface(surfaceId: string, region: Region): Promise<PixelMap>` | `let pixelMap = await image.createPixelMapFromSurface(surfaceId, region);` | 同上 |
| 从 Surface 创建 PixelMap (15+) | image.createPixelMapFromSurface (15+) | 同上 | `createPixelMapFromSurface(surfaceId: string): Promise<PixelMap>` | `let pixelMap = await image.createPixelMapFromSurface(surfaceId);` | 同上 |
| 获取支持解码的图片格式 (20+) | image.getImageSourceSupportedFormats | 同上 | `getImageSourceSupportedFormats(): string[]` | `let formats = image.getImageSourceSupportedFormats();` | 同上 |
| 获取支持编码的图片格式 (20+) | image.getImagePackerSupportedFormats | 同上 | `getImagePackerSupportedFormats(): string[]` | `let formats = image.getImagePackerSupportedFormats();` | 同上 |

## @ohos.file.photoAccessHelper (相册管理模块)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理模块实例 | photoAccessHelper.getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |
| 查询图片和视频资源 | PhotoAccessHelper.getAssets | 同上 | `getAssets(options: FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let assets = await phAccessHelper.getAssets({ predicates });` | 同上 |

## @ohos.file.sendablePhotoAccessHelper (基于Sendable对象的相册管理模块)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取基于 Sendable 的相册管理实例 | sendablePhotoAccessHelper.getPhotoAccessHelper | `import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/02_ohos.file.sendablePhotoAccessHelper (基于Sendable对象的相册管理模块).md` |
| 查询图片和视频资源 | PhotoAccessHelper.getAssets | 同上 | `getAssets(options: photoAccessHelper.FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let assets = await phAccessHelper.getAssets({ fetchColumns, predicates });` | 同上 |

## @ohos.file.PhotoPickerComponent (PhotoPicker组件)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 嵌入页面中的图片/视频选择组件，无需权限即可访问媒体文件 | PhotoPickerComponent | `import { PhotoPickerComponent, PickerController } from '@kit.MediaLibraryKit';` | `PhotoPickerComponent({ pickerOptions?, onSelect?, onDeselect?, onItemClicked?, onEnterPhotoBrowser?, onExitPhotoBrowser?, pickerController })` | `PhotoPickerComponent({ onSelect: (uri) => {}, pickerController: this.controller })` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/02_ArkTS组件/02_ohos.file.PhotoPickerComponent (PhotoPicker组件).md` |

## 模块说明

- 相机 API (`@kit.CameraKit`) 从 API version 10 开始支持，核心流程为：`getCameraManager` -> `getSupportedCameras` -> `createCameraInput` -> `createSession`(指定 SceneMode) -> 配置输入输出 -> `session.start()` -> `photoOutput.capture()`。
- 图片 API (`@kit.ImageKit`) 从 API version 6 开始支持，核心类包括 `ImageSource`、`PixelMap`、`ImagePacker`、`ImageReceiver`、`ImageCreator`、`Picture`。解码后的 PixelMap/Picture 对象使用完毕后应主动调用 `release()` 释放内存。
- 相册管理 (`@kit.MediaLibraryKit`) 从 API version 10 开始支持，`sendablePhotoAccessHelper` 为 API 12 新增的基于 Sendable 对象的版本，支持跨并发实例共享。`PhotoPickerComponent` 为 API 12 新增的无权限选择组件。
- `cameraPicker.pick` 仅在界面 UIAbility 中调用有效，从 API version 11 开始支持。
- 权限要求：`CameraManager`、`CameraInput.open` 等相机核心操作需要 `ohos.permission.CAMERA` 权限；`PhotoAccessHelper.getAssets` 需要 `ohos.permission.READ_IMAGEVIDEO` 权限。
