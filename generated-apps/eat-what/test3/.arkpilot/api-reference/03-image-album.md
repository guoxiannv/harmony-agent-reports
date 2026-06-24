# 03 — 图片编码与相册保存

## @ohos.multimedia.image ImagePacker - 将 PixelMap 编码为 JPEG/PNG 图片文件
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建 ImagePacker 编码器实例 | image.createImagePacker | `import { image } from '@kit.ImageKit';` | `createImagePacker(): ImagePacker` | `const imagePackerObj: image.ImagePacker = image.createImagePacker();` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md |
| 将 PixelMap 编码为 ArrayBuffer（推荐） | image.ImagePacker.packToData | `import { image } from '@kit.ImageKit';` | `packToData(source: PixelMap, options: PackingOption): Promise<ArrayBuffer>` | `imagePackerObj.packToData(pixelMap, { format: "image/jpeg", quality: 98 })` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md |
| 将 PixelMap 直接编码到文件 fd | image.ImagePacker.packToFile | `import { image } from '@kit.ImageKit';` | `packToFile(source: PixelMap, fd: number, options: PackingOption): Promise<void>` | `imagePackerObj.packToFile(pixelMap, file.fd, { format: "image/jpeg", quality: 98 })` | 同上 |
| 释放编码器实例 | image.ImagePacker.release | `import { image } from '@kit.ImageKit';` | `release(): Promise<void>` | `imagePackerObj.release()` | 同上 |

## @ohos.multimedia.image PixelMap - 像素图接口，componentSnapshot 的输出类型
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建空 PixelMap | image.createPixelMapSync / image.createPixelMap | `import { image } from '@kit.ImageKit';` | `createPixelMapSync(colors: ArrayBuffer, options: InitializationOptions): PixelMap` | `let pixelMap = image.createPixelMapSync(color, { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } })` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md |
| 读取像素数据到 ArrayBuffer | PixelMap.readPixelsToBuffer | `import { image } from '@kit.ImageKit';` | `readPixelsToBuffer(dst: ArrayBuffer): Promise<void>` | `pixelMap.readPixelsToBuffer(readBuffer)` | 04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/15_Interface (PixelMap).md |
| 将 ArrayBuffer 数据写入 PixelMap | PixelMap.writeBufferToPixels | `import { image } from '@kit.ImageKit';` | `writeBufferToPixels(src: ArrayBuffer): Promise<void>` | `pixelMap.writeBufferToPixels(color)` | 同上 |
| 释放 PixelMap 内存 | PixelMap.release | `import { image } from '@kit.ImageKit';` | `release(): Promise<void>` | `pixelMap.release()` | 同上 |
| 获取图片信息 | PixelMap.getImageInfo | `import { image } from '@kit.ImageKit';` | `getImageInfo(): Promise<ImageInfo>` | `pixelMap.getImageInfo().then(info => { ... })` | 同上 |
| 缩放 | PixelMap.scale | `import { image } from '@kit.ImageKit';` | `scale(x: number, y: number): Promise<void>` | `pixelMap.scale(2.0, 1.0)` | 同上 |
| 裁剪 | PixelMap.crop | `import { image } from '@kit.ImageKit';` | `crop(region: Region): Promise<void>` | `pixelMap.crop({ x: 0, y: 0, size: { height: 100, width: 100 } })` | 同上 |
| 旋转 | PixelMap.rotate | `import { image } from '@kit.ImageKit';` | `rotate(angle: number): Promise<void>` | `pixelMap.rotate(90.0)` | 同上 |
| 翻转 | PixelMap.flip | `import { image } from '@kit.ImageKit';` | `flip(horizontal: boolean, vertical: boolean): Promise<void>` | `pixelMap.flip(true, false)` | 同上 |
| 获取像素总字节数 | PixelMap.getPixelBytesNumber | `import { image } from '@kit.ImageKit';` | `getPixelBytesNumber(): number` | `let bytes = pixelMap.getPixelBytesNumber()` | 同上 |

## @ohos.file.photoAccessHelper PhotoAccessHelper - 将图片保存到系统相册
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 | photoAccessHelper.getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | 04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md |
| 创建图片/视频资源 | PhotoAccessHelper.createAsset | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `createAsset(photoType: PhotoType, extension: string, options?: CreateOptions): Promise<string>` | `let uri = await phAccessHelper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', { title: 'testPhoto' })` | 04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md |
| 提交媒体变更请求 | PhotoAccessHelper.applyChanges | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `applyChanges(mediaChangeRequest: MediaChangeRequest): Promise<void>` | `await phAccessHelper.applyChanges(assetChangeRequest)` | 同上 |
| 获取图片和视频资源 | PhotoAccessHelper.getAssets | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getAssets(options: FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let fetchResult = await phAccessHelper.getAssets(fetchOptions)` | 同上 |
| 保存确认弹窗（无权限方案） | PhotoAccessHelper.showAssetsCreationDialog | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `showAssetsCreationDialog(srcFileUris: Array<string>, photoCreationConfigs: Array<PhotoCreationConfig>): Promise<Array<string>>` | `let desFileUris = await phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs)` | 同上 |
| 释放相册管理实例 | PhotoAccessHelper.release | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `release(): Promise<void>` | `await phAccessHelper.release()` | 同上 |

## @ohos.file.photoAccessHelper MediaAssetChangeRequest - 创建图片资源写入请求
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建图片资产变更请求（通过沙箱文件 URI） | MediaAssetChangeRequest.createImageAssetRequest | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `static createImageAssetRequest(context: Context, fileUri: string): MediaAssetChangeRequest` | `let req = photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(context, fileUri)` | 04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/04_Class (MediaAssetChangeRequest).md |
| 创建空资产变更请求（指定类型和扩展名） | MediaAssetChangeRequest.createAssetRequest | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `static createAssetRequest(context: Context, photoType: PhotoType, extension: string, options?: CreateOptions): MediaAssetChangeRequest` | `let req = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoAccessHelper.PhotoType.IMAGE, 'jpg', { title: 'testPhoto' })` | 同上 |
| 通过沙箱文件 URI 添加资源 | MediaAssetChangeRequest.addResource | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `addResource(type: ResourceType, fileUri: string): void` | `assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri)` | 同上 |
| 通过 ArrayBuffer 数据添加资源 | MediaAssetChangeRequest.addResource | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `addResource(type: ResourceType, data: ArrayBuffer): void` | `assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, buffer)` | 同上 |
| 获取临时文件写句柄 | MediaAssetChangeRequest.getWriteCacheHandler | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getWriteCacheHandler(): Promise<number>` | `let fd = await assetChangeRequest.getWriteCacheHandler()` | 同上 |
| 删除媒体文件 | MediaAssetChangeRequest.deleteAssets | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `static deleteAssets(context: Context, uriList: Array<string>): Promise<void>` | `await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, [asset.uri])` | 同上 |
| 获取资产变更请求中的资产 | MediaAssetChangeRequest.getAsset | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getAsset(): PhotoAsset` | `let asset = assetChangeRequest.getAsset()` | 同上 |

## 模块要点

- **图片编码保存流程**：componentSnapshot 返回 PixelMap → ImagePacker.packToData 编码为 JPEG/PNG 的 ArrayBuffer → MediaAssetChangeRequest.createAssetRequest + addResource(ArrayBuffer) + applyChanges 保存到系统相册。
- **权限**：直接写入相册需 `ohos.permission.WRITE_IMAGEVIDEO` 权限。无权限时可使用 `showAssetsCreationDialog`（用户确认弹窗）或 `createAssetWithShortTermPermission`（短期授权）。
- **ImagePacker 释放**：packToData/packToFile 完成后必须调用 `release()` 释放编码器内存。
- **PixelMap 释放**：使用完成后必须调用 `release()` 释放内存。跨线程传输后原线程的 PixelMap 不可再用。
- **PackingOption 格式**：使用 MIME type 值，如 `"image/jpeg"`、`"image/png"`；质量参数 `quality` 取值范围 0-100。
