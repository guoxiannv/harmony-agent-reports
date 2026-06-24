# 04 — Album Access & File Picker

## PhotoViewPicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择器（图片/视频选取） | `photoAccessHelper.PhotoViewPicker` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>`<br>`select(option: PhotoSelectOptions, callback: AsyncCallback<PhotoSelectResult>): void`<br>`select(callback: AsyncCallback<PhotoSelectResult>): void` | `let picker = new photoAccessHelper.PhotoViewPicker(); picker.select(options).then(...)` | `04_媒体/.../01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |

## file.picker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文档选择器（选择/保存任意文档） | `picker.DocumentViewPicker` | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)`<br>`select(option?: DocumentSelectOptions): Promise<Array<string>>`<br>`save(option?: DocumentSaveOptions): Promise<Array<string>>` | `let docPicker = new picker.DocumentViewPicker(context); docPicker.select(options).then(...)` | `02_应用框架/.../08_ohos.file.picker (选择器).md` |
| 音频选择器（选择/保存音频文件） | `picker.AudioViewPicker` | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)`<br>`select(option?: AudioSelectOptions): Promise<Array<string>>`<br>`save(option?: AudioSaveOptions): Promise<Array<string>>` | `let audioPicker = new picker.AudioViewPicker(context); audioPicker.select(options).then(...)` | `02_应用框架/.../08_ohos.file.picker (选择器).md` |
| PhotoViewPicker（已废弃，API 12+） | `picker.PhotoViewPicker` | `import { picker } from '@kit.CoreFileKit'` | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `let pPicker = new picker.PhotoViewPicker(context);` | `02_应用框架/.../08_ohos.file.picker (选择器).md` |

## file.fs
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取文件/目录属性 | `fileIo.stat` | `import { fileIo } from '@kit.CoreFileKit'` | `stat(file: string \| number): Promise<Stat>` | `fileIo.stat(path).then(stat => { stat.size })` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |
| 同步打开文件 | `fileIo.openSync` | `import { fileIo } from '@kit.CoreFileKit'` | `openSync(path: string, mode?: number): File` | `let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE)` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |
| 读取文件数据 | `fileIo.read` | `import { fileIo } from '@kit.CoreFileKit'` | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `let buf = new ArrayBuffer(4096); fileIo.read(fd, buf).then(readLen => {...})` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |
| 写入文件数据 | `fileIo.write` | `import { fileIo } from '@kit.CoreFileKit'` | `write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` | `fileIo.write(fd, "data").then(written => {...})` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |
| 同步关闭文件 | `fileIo.closeSync` | `import { fileIo } from '@kit.CoreFileKit'` | `closeSync(file: File \| number): void` | `fileIo.closeSync(file);` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |
| 创建目录 | `fileIo.mkdir` | `import { fileIo } from '@kit.CoreFileKit'` | `mkdir(path: string): Promise<void>` | `fileIo.mkdir(dirPath).then(() => {...})` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |
| 删除文件 | `fileIo.unlink` | `import { fileIo } from '@kit.CoreFileKit'` | `unlink(path: string): Promise<void>` | `fileIo.unlink(filePath).then(() => {...})` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |
| 复制文件 | `fileIo.copyFile` | `import { fileIo } from '@kit.CoreFileKit'` | `copyFile(src: string \| number, dest: string \| number): Promise<void>` | `fileIo.copyFile(src, dest).then(() => {...})` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |
| 读取文本文件 | `fileIo.readText` | `import { fileIo } from '@kit.CoreFileKit'` | `readText(filePath: string): Promise<string>` | `fileIo.readText(path).then(text => {...})` | `02_应用框架/.../06_ohos.file.fs (文件管理).md` |

## fileio (deprecated)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取文件信息（已废弃） | `fileio.stat` | `import fileio from '@ohos.fileio'` | `stat(path: string): Promise<Stat>` | `fileio.stat(filePath).then(stat => {...})` | `02_应用框架/.../14_已停止维护的接口/02_ohos.fileio (文件管理).md` |

## photoAccessHelper
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理模块实例 | `photoAccessHelper.getPhotoAccessHelper` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let helper = photoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/.../01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |
| 获取图片/视频资源 | `phAccessHelper.getAssets` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getAssets(options: FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let fetchResult = await helper.getAssets(fetchOptions);` | `04_媒体/.../01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 创建媒体资源 | `phAccessHelper.createAsset` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `createAsset(photoType: PhotoType, extension: string, options?: CreateOptions): Promise<string>` | `let uri = await helper.createAsset(PhotoType.IMAGE, 'jpg', {title: 'test'});` | `04_媒体/.../01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 获取相册列表 | `phAccessHelper.getAlbums` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getAlbums(type: AlbumType, subtype: AlbumSubtype, options?: FetchOptions): Promise<FetchResult<Album>>` | `let albums = await helper.getAlbums(AlbumType.USER, AlbumSubtype.USER_GENERIC);` | `04_媒体/.../01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 注册URI变更监听 | `phAccessHelper.registerChange` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `registerChange(uri: string, forChildUris: boolean, callback: Callback<ChangeData>): void` | `helper.registerChange(photoAsset.uri, false, onCallback);` | `04_媒体/.../01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 提交媒体变更请求 | `phAccessHelper.applyChanges` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `applyChanges(mediaChangeRequest: MediaChangeRequest): Promise<void>` | `await helper.applyChanges(changeRequest);` | `04_媒体/.../01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |
| 释放PhotoAccessHelper实例 | `phAccessHelper.release` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `release(): Promise<void>` | `await helper.release();` | `04_媒体/.../01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

## 模块备注

- **PhotoViewPicker**: `picker.PhotoViewPicker` (from `@kit.CoreFileKit`) 从 API 12 起废弃，推荐使用 `photoAccessHelper.PhotoViewPicker` (from `@kit.MediaLibraryKit`)。新版 PhotoViewPicker 返回的 `photoUris` 具有**永久授权**，而旧版仅有临时授权。
- **fileio**: `@ohos.fileio` 从 API 9 起废弃，统一迁移至 `@ohos.file.fs`（导入名为 `fileIo`）。两个模块签名相似（stat、openSync、read、write 等），但 file.fs 支持 URI 直接传参（API 22+）。
- **file.picker**: 选择器类（DocumentViewPicker/AudioViewPicker）推荐使用带 context 的构造函数（API 12+），无参构造有概率拉起失败。API 9 开始支持。
- **photoAccessHelper**: 获取相册资源需要声明 `ohos.permission.READ_IMAGEVIDEO` 权限；通过 PhotoViewPicker 返回的 URI 调用 getAssets 无需该权限。
