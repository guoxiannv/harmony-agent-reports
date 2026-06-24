# 04 — Photo Access (Media Library)

## @ohos.file.photoAccessHelper (相册管理模块)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 | getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `photoAccessHelper.getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |
| 查询图片和视频资源 | getAssets | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getAssets(options: FetchOptions, callback: AsyncCallback<FetchResult<PhotoAsset>>): void` | `phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => { ... })` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 查询图片和视频资源 (Promise) | getAssets | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getAssets(options: FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let fetchResult = await phAccessHelper.getAssets(fetchOptions);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

## PhotoViewPicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建图库选择器 | PhotoViewPicker | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `class PhotoViewPicker` | `let photoPicker = new photoAccessHelper.PhotoViewPicker();` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |
| 拉起选择界面 (Promise) | select | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `photoPicker.select(photoSelectOptions).then((result) => { ... })` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |
| 拉起选择界面 (Callback) | select | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option: PhotoSelectOptions, callback: AsyncCallback<PhotoSelectResult>): void` | `photoPicker.select(options, (err, result) => { ... })` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |
| 拉起选择界面 (Callback, 无参数) | select | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(callback: AsyncCallback<PhotoSelectResult>): void` | `photoPicker.select((err, result) => { ... })` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |

## AlbumPickerComponent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 嵌入相册列表组件 (API 12+) | AlbumPickerComponent | `import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo, photoAccessHelper, EmptyAreaClickCallback } from '@kit.MediaLibraryKit'` | `AlbumPickerComponent({albumPickerOptions?: AlbumPickerOptions, onAlbumClick?: (albumInfo: AlbumInfo) => boolean, onEmptyAreaClick?: EmptyAreaClickCallback, albumPickerController?: AlbumPickerController})` | `AlbumPickerComponent({ albumPickerOptions: this.albumPickerOptions, onAlbumClick:(albumInfo: AlbumInfo): boolean => this.onAlbumClick(albumInfo) })` | `02_ArkTS组件/01_ohos.file.AlbumPickerComponent (Album Picker组件).md` |
| Album Picker配置选项 | AlbumPickerOptions | `import { AlbumPickerOptions } from '@kit.MediaLibraryKit'` | `class AlbumPickerOptions` | `new AlbumPickerOptions()` | `02_ArkTS组件/01_ohos.file.AlbumPickerComponent (Album Picker组件).md` |
| 相册信息 | AlbumInfo | `import { AlbumInfo } from '@kit.MediaLibraryKit'` | `interface AlbumInfo { uri: string; albumName: string }` | `albumInfo.uri` | `02_ArkTS组件/01_ohos.file.AlbumPickerComponent (Album Picker组件).md` |
| 相册点击回调 | EmptyAreaClickCallback | `import { EmptyAreaClickCallback } from '@kit.MediaLibraryKit'` | `type EmptyAreaClickCallback = () => void` | `() => this.onEmptyAreaClick()` | `02_ArkTS组件/01_ohos.file.AlbumPickerComponent (Album Picker组件).md` |

## PhotoPickerComponent
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 嵌入媒体文件选择组件 (API 12+) | PhotoPickerComponent | `import { PhotoPickerComponent, PickerController, PickerOptions, ... } from '@kit.MediaLibraryKit'` | `PhotoPickerComponent({ pickerOptions?: PickerOptions, onSelect?: (uri: string) => void, onDeselect?: (uri: string) => void, ... pickerController: PickerController })` | `PhotoPickerComponent({ pickerOptions: this.pickerOptions, pickerController: this.pickerController, onSelect: (uri) => { ... } })` | `02_ArkTS组件/02_ohos.file.PhotoPickerComponent (PhotoPicker组件).md` |
| Picker配置选项 | PickerOptions | `import { PickerOptions } from '@kit.MediaLibraryKit'` | `class PickerOptions` (继承自 `photoAccessHelper.BaseSelectOptions`) | `new PickerOptions()` | `02_ArkTS组件/02_ohos.file.PhotoPickerComponent (PhotoPicker组件).md` |
| 向Picker组件发送数据 | PickerController | `import { PickerController } from '@kit.MediaLibraryKit'` | `class PickerController` (装饰器: @Observed) | `pickerController.setData(DataType.SET_ALBUM_URI, uri)` | `02_ArkTS组件/02_ohos.file.PhotoPickerComponent (PhotoPicker组件).md` |

## FetchResult
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取结果集总数 | getCount | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getCount(): number` | `let count = fetchResult.getCount();` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/10_Interface (FetchResult).md` |
| 获取第一个文件 | getFirstObject | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getFirstObject(): Promise<PhotoAsset>` | `let asset = await fetchResult.getFirstObject();` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/10_Interface (FetchResult).md` |
| 获取下一个文件 | getNextObject | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getNextObject(): Promise<PhotoAsset>` | `let next = await fetchResult.getNextObject();` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/10_Interface (FetchResult).md` |
| 获取最后一个文件 | getLastObject | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getLastObject(): Promise<PhotoAsset>` | `let last = await fetchResult.getLastObject();` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/10_Interface (FetchResult).md` |
| 获取指定索引文件 | getObjectByPosition | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getObjectByPosition(index: number): Promise<PhotoAsset>` | `let asset = await fetchResult.getObjectByPosition(0);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/10_Interface (FetchResult).md` |
| 获取所有文件 | getAllObjects | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getAllObjects(): Promise<Array<PhotoAsset>>` | `let list = await fetchResult.getAllObjects();` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/10_Interface (FetchResult).md` |
| 释放结果集 | close | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `close(): void` | `fetchResult.close();` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/10_Interface (FetchResult).md` |

## PhotoAsset
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取缩略图 (Promise) | getThumbnail | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getThumbnail(size?: image.Size): Promise<image.PixelMap>` | `let pixelMap = await asset.getThumbnail(size);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/15_Interface (PhotoAsset).md` |
| 获取资产属性 | get | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `get(member: string): MemberType` | `let title = asset.get('title');` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/15_Interface (PhotoAsset).md` |
| 修改资产元数据 (Promise) | commitModify | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `commitModify(): Promise<void>` | `await asset.commitModify();` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/15_Interface (PhotoAsset).md` |
| 克隆资产 | clone | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `clone(title: string): Promise<PhotoAsset>` | `let newAsset = await photoAsset.clone('newTitle');` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/15_Interface (PhotoAsset).md` |

## MediaAssetManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 请求图片资源 | requestImage | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `static requestImage(context: Context, asset: PhotoAsset, requestOptions: RequestOptions, dataHandler: MediaAssetDataHandler<image.ImageSource>): Promise<string>` | `await photoAccessHelper.MediaAssetManager.requestImage(context, photoAsset, requestOptions, handler);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/05_Class (MediaAssetManager).md` |
| 请求图片数据 | requestImageData | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `static requestImageData(context: Context, asset: PhotoAsset, requestOptions: RequestOptions, dataHandler: MediaAssetDataHandler<ArrayBuffer>): Promise<string>` | `await photoAccessHelper.MediaAssetManager.requestImageData(context, photoAsset, requestOptions, handler);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/05_Class (MediaAssetManager).md` |
| 请求动态照片 | requestMovingPhoto | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `static requestMovingPhoto(context: Context, asset: PhotoAsset, requestOptions: RequestOptions, dataHandler: MediaAssetDataHandler<MovingPhoto>): Promise<string>` | `await photoAccessHelper.MediaAssetManager.requestMovingPhoto(context, asset, requestOptions, handler);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/05_Class (MediaAssetManager).md` |
| 请求视频资源到沙箱 | requestVideoFile | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `static requestVideoFile(context: Context, asset: PhotoAsset, requestOptions: RequestOptions, fileUri: string, dataHandler: MediaAssetDataHandler<boolean>): Promise<string>` | `await photoAccessHelper.MediaAssetManager.requestVideoFile(context, asset, options, fileUri, handler);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/05_Class (MediaAssetManager).md` |
| 取消资源请求 | cancelRequest | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `static cancelRequest(context: Context, requestId: string): Promise<void>` | `await photoAccessHelper.MediaAssetManager.cancelRequest(context, requestId);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/05_Class (MediaAssetManager).md` |
| 加载动态照片 | loadMovingPhoto | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `static loadMovingPhoto(context: Context, imageFileUri: string, videoFileUri: string): Promise<MovingPhoto>` | `let movingPhoto = await photoAccessHelper.MediaAssetManager.loadMovingPhoto(context, imageUri, videoUri);` | `01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/05_Class (MediaAssetManager).md` |

## Module Notes

- **导入方式**: 所有 API 统一从 `@kit.MediaLibraryKit` 导入。API 23 之前的版本可能需要从 `@ohos.file.PhotoPickerComponent`、`@ohos.file.photoAccessHelper` 等分别导入。API 23 起推荐统一使用 `@kit.MediaLibraryKit`。
- **权限要求**: `getAssets`、`getThumbnail`、`MediaAssetManager` 请求方法需要 `ohos.permission.READ_IMAGEVIDEO`；`commitModify`、`clone` 需要 `ohos.permission.WRITE_IMAGEVIDEO`。
- **Picker 豁免**: 通过 `PhotoViewPicker.select`、`PhotoPickerComponent`、`AlbumPickerComponent` 获取的 URI 拥有临时授权，无需申请 `ohos.permission.READ_IMAGEVIDEO` 即可通过 `getAssets` 或 `MediaAssetManager` 等方法读取。详情参考"指定URI获取图片或视频资源"。
- **API 版本**: 模块基础接口从 API 10 开始支持；`MediaAssetManager` 从 API 11 开始；`PhotoPickerComponent` 和 `AlbumPickerComponent` 从 API 12 开始。
- **PhotoViewPicker 生命周期**: 重复拉起时需先通过 NavDestination 销毁前一个实例，或跟随进程销毁。
- **Stage 模型约束**: `getPhotoAccessHelper` 仅可在 Stage 模型下使用。
