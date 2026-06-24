# 03 — Media Library (相册写入)

## @ohos.file.photoAccessHelper (相册管理模块)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 | getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |
| 创建图片/视频资源 (Promise) | createAsset | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `createAsset(photoType: PhotoType, extension: string, options?: CreateOptions): Promise<string>` | `let uri = await phAccessHelper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', { title: 'shareCard' });` | `01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 创建图片/视频资源 (API 23+) | createPhotoAsset | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `createPhotoAsset(photoType: PhotoType, extension: string, title?: string): Promise<string>` | `let uri = await phAccessHelper.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', 'shareCard');` | `01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 创建资产变更请求 (MediaAssetChangeRequest) | createAssetRequest | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `static createAssetRequest(context: Context, photoType: PhotoType, extension: string, options?: CreateOptions): MediaAssetChangeRequest` | `let req = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, { title: 'testPhoto' });` | `01_ohos.file.photoAccessHelper (相册管理模块)/04_Class (MediaAssetChangeRequest).md` |
| 通过ArrayBuffer添加资源数据 | addResource | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `addResource(type: ResourceType, data: ArrayBuffer): void` | `req.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, buffer);` | `01_ohos.file.photoAccessHelper (相册管理模块)/04_Class (MediaAssetChangeRequest).md` |
| 通过文件URI添加资源 | addResource | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `addResource(type: ResourceType, fileUri: string): void` | `req.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);` | `01_ohos.file.photoAccessHelper (相册管理模块)/04_Class (MediaAssetChangeRequest).md` |
| 提交媒体变更请求 | applyChanges | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `applyChanges(mediaChangeRequest: MediaChangeRequest): Promise<void>` | `await phAccessHelper.applyChanges(assetChangeRequest);` | `01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 通过沙箱URI+弹窗保存多张图片 | showAssetsCreationDialog | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `showAssetsCreationDialog(srcFileUris: Array<string>, photoCreationConfigs: Array<PhotoCreationConfig>): Promise<Array<string>>` | `let desUris = await phAccessHelper.showAssetsCreationDialog(uris, configs);` | `01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 短期权限创建资源 (带弹窗, 5min免弹窗) | createAssetWithShortTermPermission | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `createAssetWithShortTermPermission(photoCreationConfig: PhotoCreationConfig): Promise<string>` | `let uri = await phAccessHelper.createAssetWithShortTermPermission(config);` | `01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 获取临时文件写句柄 | getWriteCacheHandler | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getWriteCacheHandler(): Promise<number>` | `let fd = await assetChangeRequest.getWriteCacheHandler();` | `01_ohos.file.photoAccessHelper (相册管理模块)/04_Class (MediaAssetChangeRequest).md` |
| PhotoType 枚举 (图片类型) | PhotoType | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `enum PhotoType { IMAGE = 1, VIDEO = 2 }` | `photoAccessHelper.PhotoType.IMAGE` | `01_ohos.file.photoAccessHelper (相册管理模块)/18_Enums.md` |
| ResourceType 枚举 (资源类型) | ResourceType | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `enum ResourceType` | `photoAccessHelper.ResourceType.IMAGE_RESOURCE` | `01_ohos.file.photoAccessHelper (相册管理模块)/18_Enums.md` |

## @ohos.file.sendablePhotoAccessHelper (基于Sendable对象的相册管理模块)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 (Sendable) | getPhotoAccessHelper | `import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(context);` | `02_ohos.file.sendablePhotoAccessHelper (基于Sendable对象的相册管理模块).md` |
| 获取图片/视频资源 (Sendable, Promise) | getAssets | `import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';` | `getAssets(options: photoAccessHelper.FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let fetchResult = await phAccessHelper.getAssets(fetchOptions);` | `02_ohos.file.sendablePhotoAccessHelper (基于Sendable对象的相册管理模块).md` |

## 模块要点

1. **导入路径**: 统一使用 `import { photoAccessHelper } from '@kit.MediaLibraryKit';`（非 `@ohos.file.photoAccessHelper`，已弃用顶级导入）。
2. **权限**: 使用 `createAsset` 需要申请 `ohos.permission.WRITE_IMAGEVIDEO` 权限；如果不想申请该权限，可使用 `showAssetsCreationDialog`（基于弹窗）或 `createAssetWithShortTermPermission`（基于短期权限，需 `ohos.permission.SHORT_TERM_WRITE_IMAGEVIDEO`）。
3. **写数据路径**: 推荐使用 `MediaAssetChangeRequest.createAssetRequest()` + `addResource(ResourceType.IMAGE_RESOURCE, arrayBuffer)` + `phAccessHelper.applyChanges()` 组合直接将 PixelMap/ArrayBuffer 数据写入相册。
4. **文件命名**: `createAsset` 的 `CreateOptions` 当前仅支持 `title` 参数，文件名中不允许出现非法字符：`. .. \ / : * ? " '` < > | { } [ ]`。
5. **Stage 模型约束**: 所有接口仅可在 Stage 模型下使用，需通过 `this.getUIContext().getHostContext()` 获取 context。
6. **元服务支持**: 从 API 11 开始，`createAsset`、`createAssetRequest`、`applyChanges` 等核心接口支持在元服务中使用。
7. **`sendablePhotoAccessHelper` 的 createAsset**: 当前文档版本中，sendablePhotoAccessHelper 模块的 PhotoAccessHelper 接口**不包含** `createAsset` 方法。需要创建资源的场景请使用 `photoAccessHelper` 模块。
