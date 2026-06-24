# 04 — Album Save & File IO (相册保存与文件操作)

## @ohos.file.photoAccessHelper (相册管理)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 | photoAccessHelper.getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit';` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);` | 04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md |
| 创建图片/视频资源 | PhotoAccessHelper.createAsset | 同上 | `createAsset(photoType: PhotoType, extension: string, options?: CreateOptions): Promise<string>` | `let uri = await phAccessHelper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', { title: 'testPhoto' });` | 04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md |
| 获取图片和视频资源 | PhotoAccessHelper.getAssets | 同上 | `getAssets(options: FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let fetchResult = await phAccessHelper.getAssets(fetchOptions); let photoAsset = await fetchResult.getFirstObject();` | 同上 |
| 获取相册列表 | PhotoAccessHelper.getAlbums | 同上 | `getAlbums(type: AlbumType, subtype: AlbumSubtype, options?: FetchOptions): Promise<FetchResult<Album>>` | `let fetchResult = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions);` | 同上 |
| 注册媒体变更监听 | PhotoAccessHelper.registerChange | 同上 | `registerChange(uri: string, forChildUris: boolean, callback: Callback<ChangeData>): void` | `phAccessHelper.registerChange(photoAsset.uri, false, (changeData) => { console.info(JSON.stringify(changeData)); });` | 同上 |
| 取消媒体变更监听 | PhotoAccessHelper.unRegisterChange | 同上 | `unRegisterChange(uri: string, callback?: Callback<ChangeData>): void` | `phAccessHelper.unRegisterChange(photoAsset.uri, onCallback1);` | 同上 |
| 提交媒体变更请求 | PhotoAccessHelper.applyChanges | 同上 | `applyChanges(mediaChangeRequest: MediaChangeRequest): Promise<void>` | `await phAccessHelper.applyChanges(mediaChangeRequest);` | 同上 |
| 释放PhotoAccessHelper实例 | PhotoAccessHelper.release | 同上 | `release(callback: AsyncCallback<void>): void` | `phAccessHelper.release((err) => { ... });` | 同上 |
| 获取/设置PhotoAsset属性 | PhotoAsset.get / PhotoAsset.set | 同上 | `get(member: string): MemberType` / `set(member: string, value: string): void` | `photoAsset.set(photoAccessHelper.PhotoKeys.TITLE.toString(), 'newTitle');` | 04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/15_Interface (PhotoAsset).md |
| 提交修改（元数据） | PhotoAsset.commitModify | 同上 | `commitModify(callback: AsyncCallback<void>): void` | `photoAsset.commitModify(() => { console.info('modified'); });` | 同上 |

## @ohos.file.fs (文件管理)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件 | fileIo.openSync | `import { fileIo } from '@kit.CoreFileKit';` | `openSync(path: string, mode?: number): File` | `let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE);` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md |
| 关闭文件 | fileIo.closeSync | 同上 | `closeSync(file: number \| File): void` | `fileIo.closeSync(file);` | 同上 |
| 写入文件 | fileIo.writeSync | 同上 | `writeSync(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): number` | `let writeLen = fileIo.writeSync(file.fd, "hello, world");` | 同上 |
| 读取文件(文本) | fileIo.readText | 同上 | `readText(filePath: string, options?: ReadTextOptions): Promise<string>` | `let str = await fileIo.readText(filePath);` | 同上 |
| 获取文件/目录属性 | fileIo.stat | 同上 | `stat(file: string \| number): Promise<Stat>` | `let stat = await fileIo.stat(filePath); console.info(stat.size);` | 同上 |
| 检查文件是否存在 | fileIo.access | 同上 | `access(path: string): Promise<boolean>` | `let exists = await fileIo.access(filePath);` | 同上 |
| 创建目录 | fileIo.mkdir | 同上 | `mkdir(path: string, recursion?: boolean): Promise<void>` | `await fileIo.mkdir(dirPath, true);` | 同上 |
| 删除文件 | fileIo.unlink | 同上 | `unlink(path: string): Promise<void>` | `await fileIo.unlink(filePath);` | 同上 |
| 复制文件 | fileIo.copyFile | 同上 | `copyFile(src: string \| number, dest: string \| number, mode?: number): Promise<void>` | `await fileIo.copyFile(srcPath, destPath);` | 同上 |
| 拷贝文件或目录(支持URI) | fileIo.copy | 同上 | `copy(srcUri: string, destUri: string, options?: CopyOptions): Promise<void>` | `await fileIo.copy(srcUri, destUri, { progressListener: listener });` | 同上 |
| 重命名/移动文件 | fileIo.rename | 同上 | `rename(oldPath: string, newPath: string): Promise<void>` | `await fileIo.rename(oldPath, newPath);` | 同上 |
| 列出目录内容 | fileIo.listFile | 同上 | `listFile(path: string, options?: ListFileOptions): Promise<string[]>` | `let files = await fileIo.listFile(pathDir, { recursion: false });` | 同上 |
| 截断文件 | fileIo.truncate | 同上 | `truncate(file: string \| number, len?: number): Promise<void>` | `await fileIo.truncate(filePath, 0);` | 同上 |
| 读取文件(二进制) | fileIo.read | 同上 | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `await fileIo.read(file.fd, buf);` | 同上 |
| 读取文件文本行 | fileIo.readLines | 同上 | `readLines(filePath: string): Promise<Array<string>>` | `let lines = await fileIo.readLines(filePath);` | 同上 |
| 复制目录 | fileIo.copyDir | 同上 | `copyDir(src: string, dest: string, options?: CopyDirOptions): Promise<void>` | `await fileIo.copyDir(srcPath, destPath);` | 同上 |

## 模块说明

- `@ohos.file.photoAccessHelper` 需要权限 `ohos.permission.READ_IMAGEVIDEO`（读）和 `ohos.permission.WRITE_IMAGEVIDEO`（写），从 API version 10 开始支持。也可通过安全控件（SaveButton）免权限创建媒体资源。
- `@ohos.file.fs` 从 API version 9 开始支持，操作前需获取应用沙箱路径（通过 `context.filesDir`）。
- photoAccessHelper 创建的媒体文件 URI 格式为 `file://media/Photo/1/IMG_datetime_0001/displayName.jpg`。将该 URI 传递给 fileIo.openSync 即可使用 fileIo 读取/写入二进制数据。
