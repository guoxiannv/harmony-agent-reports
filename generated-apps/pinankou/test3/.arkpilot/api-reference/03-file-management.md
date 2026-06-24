# 03 — File Management 文件/图片附件管理

## @ohos.file.fs (fileIo)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取文件/目录详细信息 | fileIo.stat | `import { fileIo } from '@kit.CoreFileKit'` | `stat(file: string \| number): Promise<Stat>` | `fileIo.stat(filePath).then((stat) => { stat.size })` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |
| 检查文件/目录是否存在 | fileIo.access | 同上 | `access(path: string, mode?: AccessModeType): Promise<boolean>` | `fileIo.access(filePath).then((res) => { ... })` | 同上 |
| 创建目录 | fileIo.mkdir | 同上 | `mkdir(path: string): Promise<void>` | `fileIo.mkdir(dirPath)` | 同上 |
| 打开文件 | fileIo.openSync | 同上 | `openSync(path: string, mode?: number): File` | `let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_ONLY)` | 同上 |
| 关闭文件 | fileIo.close | 同上 | `close(file: number \| File): Promise<void>` | `fileIo.close(file)` | 同上 |
| 写入文件 | fileIo.write | 同上 | `write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` | `fileIo.write(fd, "data")` | 同上 |
| 写入文件(同步) | fileIo.writeSync | 同上 | `writeSync(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): number` | `let len = fileIo.writeSync(fd, "data")` | 同上 |
| 读取文件(同步) | fileIo.readSync | 同上 | `readSync(fd: number, buffer: ArrayBuffer, options?: ReadOptions): number` | `fileIo.readSync(fd, arrayBuffer)` | 同上 |
| 读取文本文件 | fileIo.readText | 同上 | `readText(filePath: string, options?: ReadTextOptions): Promise<string>` | `fileIo.readText(filePath).then((str) => { ... })` | 同上 |
| 读取文本文件(同步) | fileIo.readTextSync | 同上 | `readTextSync(filePath: string, options?: ReadTextOptions): string` | `let str = fileIo.readTextSync(filePath)` | 同上 |
| 列出目录文件 | fileIo.listFile | 同上 | `listFile(path: string, options?: ListFileOptions): Promise<string[]>` | `fileIo.listFile(pathDir, { filter: { suffix: [".png"] } })` | 同上 |
| 删除文件 | fileIo.unlink | 同上 | `unlink(path: string): Promise<void>` | `fileIo.unlink(filePath)` | 同上 |
| 重命名/移动 | fileIo.rename | 同上 | `rename(oldPath: string, newPath: string): Promise<void>` | `fileIo.rename(oldPath, newPath)` | 同上 |
| 移动文件 | fileIo.moveFile | 同上 | `moveFile(oldPath: string, newPath: string): Promise<void>` | `fileIo.moveFile(src, dest)` | 同上 |
| 移动目录 | fileIo.moveDir | 同上 | `moveDir(oldPath: string, newPath: string): Promise<void>` | `fileIo.moveDir(src, dest)` | 同上 |
| 复制文件 | fileIo.copyFile | 同上 | `copyFile(src: string \| number, dest: string \| number, mode?: number): Promise<void>` | `fileIo.copyFile(srcPath, destPath)` | 同上 |
| 文件流式写入 | fileIo.Stream.write | 同上 | `write(buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` | `stream.write("data")` | 同上 |
| 文件流式读取 | fileIo.Stream.read | 同上 | `read(buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `stream.read(arrayBuffer)` | 同上 |

## Context.filesDir / Context.cacheDir
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取应用文件目录(path) | filesDir | `import { common } from '@kit.AbilityKit'` | `Context.filesDir: string` | `let pathDir = context.filesDir` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/02_application/15_Context (Stage模型的上下文基类).md` |
| 获取应用缓存目录(path) | cacheDir | 同上 | `Context.cacheDir: string` | `let cacheDir = context.cacheDir` | 同上 |
| 获取临时目录(path) | tempDir | 同上 | `Context.tempDir: string` | `let tempDir = context.tempDir` | 同上 |
| 获取分布式文件目录(path) | distributedFilesDir | 同上 | `Context.distributedFilesDir: string` | `let distDir = context.distributedFilesDir` | 同上 |
| 获取数据库目录(path) | databaseDir | 同上 | `Context.databaseDir: string` | `let dbDir = context.databaseDir` | 同上 |

> 使用说明：在UIAbility中通过 `this.context.filesDir` 获取沙箱路径。在 @Component 中通过 `this.getUIContext().getHostContext()` 获取 context。所有文件操作API均需传入应用沙箱路径。

## @ohos.file.picker (DocumentViewPicker)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建文档选择器 | DocumentViewPicker | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)` | `let documentPicker = new picker.DocumentViewPicker(context)` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md` |
| 选择文档 | DocumentViewPicker.select | 同上 | `select(option?: DocumentSelectOptions): Promise<Array<string>>` | `documentPicker.select(options).then((uris) => { ... })` | 同上 |
| 保存文档 | DocumentViewPicker.save | 同上 | `save(option?: DocumentSaveOptions): Promise<Array<string>>` | `documentPicker.save({newFileNames: ['file.txt']})` | 同上 |

## @ohos.file.photoAccessHelper (photoAccessHelper)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相册管理实例 | getPhotoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `getPhotoAccessHelper(context: Context): PhotoAccessHelper` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context)` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/02_Functions.md` |
| 获取图片/视频资源 | PhotoAccessHelper.getAssets | 同上 | `getAssets(options: FetchOptions, callback: AsyncCallback<FetchResult<PhotoAsset>>): void` | `phAccessHelper.getAssets(fetchOptions, callback)` | 同上, `14_Interface (PhotoAccessHelper).md` |
| 创建媒体资源 | PhotoAccessHelper.createAsset | 同上 | `createAsset(uri: string): Promise<string>` | `phAccessHelper.createAsset(photoUri)` | 同上 |
| 注册变更监听 | PhotoAccessHelper.registerChange | 同上 | `registerChange(uri: string, callback: Callback<void>): void` | `phAccessHelper.registerChange(uri, callback)` | 同上 |
| 注销变更监听 | PhotoAccessHelper.unRegisterChange | 同上 | `unRegisterChange(uri: string, callback?: Callback<void>): void` | `phAccessHelper.unRegisterChange(uri)` | 同上 |
| 释放实例 | PhotoAccessHelper.release | 同上 | `release(): Promise<void>` | `phAccessHelper.release()` | 同上 |

## PhotoViewPicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建图片/视频选择器 | PhotoViewPicker | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `constructor()` | `let photoPicker = new photoAccessHelper.PhotoViewPicker()` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |
| 选择图片/视频 | PhotoViewPicker.select | 同上 | `select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `photoPicker.select({MIMEType: IMAGE_TYPE, maxSelectNumber: 5})` | 同上 |

> 注意：PhotoViewPicker 返回的 photoUris 具有永久授权，可通过 `photoAccessHelper.getAssets` 查询使用。如果重复拉取界面，需先通过 NavDestination 销毁前一个实例。

## @ohos.multimedia.image (image)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建图片源(从文件) | image.createImageSource | `import { image } from '@kit.ImageKit'` | `createImageSource(uri: string): ImageSource` | `let imageSource = image.createImageSource(context.filesDir + "/test.jpg")` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 创建图片源(从buffer) | image.createImageSource | 同上 | `createImageSource(buf: ArrayBuffer, options?: SourceOptions): ImageSource` | `image.createImageSource(rawFile.buffer as ArrayBuffer)` | 同上 |
| 解码为PixelMap | ImageSource.createPixelMap | 同上 | `createPixelMap(options?: DecodeOptions): Promise<PixelMap>` | `let pixelMap = await imageSource.createPixelMap()` | 同上 |
| 编码为文件 | ImagePacker.packing | 同上 | `packing(source: ImageSource, options?: PackingOption): Promise<ArrayBuffer>` | `imagePacker.packing(imageSource)` | 同上 |
| 创建个空PixelMap | image.createPixelMap | 同上 | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` | `image.createPixelMap(colorBuffer, initOpts)` | 同上 |
| 创建空PixelMap(同步) | image.createPixelMapSync | 同上 | `createPixelMapSync(colors: ArrayBuffer, options: InitializationOptions): PixelMap` | `image.createPixelMapSync(buf, opts)` | 同上 |
| Picture创建 | image.createPicture | 同上 | `createPicture(mainPixelmap: PixelMap): Picture` | `image.createPicture(pixelMap)` | 同上 |

## 模块说明
- `fileIo` 的操作路径必须使用应用沙箱路径（通过 `context.filesDir` / `context.cacheDir` 等获取）。
- 文件选择器 (`DocumentViewPicker`, `PhotoViewPicker`) 需在 UIAbility 组件中调用；返回的 URI 可通过 `fileUri` 模块或沙箱路径 API 使用。
- `photoAccessHelper` 使用了 `@kit.MediaLibraryKit` 而非 `@kit.CoreFileKit`。从 picker 返回的 URI 可免权限使用 `photoAccessHelper.getAssets` 查询。
- `@ohos.multimedia.image` 属于 `@kit.ImageKit`，支持常见的图片解码/编码/编辑操作。
