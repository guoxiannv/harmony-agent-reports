# 03 — Core File Kit (File I/O)

## @ohos.file.fs (文件管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 检查文件/目录是否存在或校验操作权限 | fileIo.access | `import { fileIo } from '@kit.CoreFileKit'` | `access(path: string, mode?: AccessModeType): Promise<boolean>` | `fileIo.access(filePath).then((res) => { if (res) { /* exists */ } })` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md |
| 关闭文件描述符 | fileIo.close | `import { fileIo } from '@kit.CoreFileKit'` | `close(file: number \| File): Promise<void>` | `fileIo.close(file).catch(err => {})` | 同上 |
| 复制文件 | fileIo.copyFile | `import { fileIo } from '@kit.CoreFileKit'` | `copyFile(src: string \| number, dest: string \| number, mode?: number): Promise<void>` | `fileIo.copyFile(srcPath, dstPath, 0)` | 同上 |
| 创建目录 | fileIo.mkdir | `import { fileIo } from '@kit.CoreFileKit'` | `mkdir(path: string, recursion?: boolean): Promise<void>` | `fileIo.mkdir(dirPath, true)` | 同上 |
| 打开文件或目录 | fileIo.open | `import { fileIo } from '@kit.CoreFileKit'` | `open(path: string, mode?: number): Promise<File>` | `fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE)` | 同上 |
| 读取文件数据 | fileIo.read | `import { fileIo } from '@kit.CoreFileKit'` | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `fileIo.read(file.fd, arrayBuf).then((readLen) => {})` | 同上 |
| 将数据写入文件 | fileIo.write | `import { fileIo } from '@kit.CoreFileKit'` | `write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` | `fileIo.write(file.fd, "hello, world", options)` | 同上 |
| 删除目录及其所有子目录和文件 | fileIo.rmdir | `import { fileIo } from '@kit.CoreFileKit'` | `rmdir(path: string): Promise<void>` | `fileIo.rmdir(dirPath)` | 同上 |
| 删除单个文件 | fileIo.unlink | `import { fileIo } from '@kit.CoreFileKit'` | `unlink(path: string): Promise<void>` | `fileIo.unlink(filePath)` | 同上 |
| 获取文件或目录详细属性信息 | fileIo.stat | `import { fileIo } from '@kit.CoreFileKit'` | `stat(file: string \| number): Promise<Stat>` | `fileIo.stat(filePath).then((stat) => { stat.size })` | 同上 |
| 列出目录下所有文件名和目录名 | fileIo.listFile | `import { fileIo } from '@kit.CoreFileKit'` | `listFile(path: string, options?: ListFileOptions): Promise<string[]>` | `fileIo.listFile(pathDir, { recursion: false, filter: { suffix: [".png"] } })` | 同上 |
| 基于文本方式读取文件 | fileIo.readText | `import { fileIo } from '@kit.CoreFileKit'` | `readText(filePath: string, options?: ReadTextOptions): Promise<string>` | `fileIo.readText(filePath).then((str) => {})` | 同上 |
| 基于文件路径创建文件流 | fileIo.createStream | `import { fileIo } from '@kit.CoreFileKit'` | `createStream(path: string, mode: string): Promise<Stream>` | `fileIo.createStream(filePath, "r+").then((stream) => { stream.closeSync() })` | 同上 |
| 创建文件监听器 | fileIo.createWatcher | `import { fileIo } from '@kit.CoreFileKit'` | `createWatcher(path: string, events: number, listener: WatchEventListener): Watcher` | `fileIo.createWatcher(filePath, 0x2 \| 0x10, (watchEvent) => {})` | 同上 |
| 逐行读取文件（ReaderIterator） | fileIo.readLines | `import { fileIo } from '@kit.CoreFileKit'` | `readLines(filePath: string, options?: Options): Promise<ReaderIterator>` | `fileIo.readLines(filePath, { encoding: 'utf-8' }).then((iterator) => { for (let it = iterator.next(); !it.done; it = iterator.next()) {} })` | 同上 |

## @ohos.file.picker (选择器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建文档选择器 | picker.DocumentViewPicker | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)` | `new picker.DocumentViewPicker(context)` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/08_ohos.file.picker (选择器).md |
| 选择文档文件 | DocumentViewPicker.select | `import { picker } from '@kit.CoreFileKit'` | `select(option?: DocumentSelectOptions): Promise<Array<string>>` | `documentPicker.select(documentSelectOptions).then((uris) => {})` | 同上 |
| 保存文档文件 | DocumentViewPicker.save | `import { picker } from '@kit.CoreFileKit'` | `save(option?: DocumentSaveOptions): Promise<Array<string>>` | `documentPicker.save(documentSaveOptions).then((uris) => {})` | 同上 |
| 创建音频选择器 | picker.AudioViewPicker | `import { picker } from '@kit.CoreFileKit'` | `constructor(context: Context)` | `new picker.AudioViewPicker(context)` | 同上 |
| 选择音频文件 | AudioViewPicker.select | `import { picker } from '@kit.CoreFileKit'` | `select(option?: AudioSelectOptions): Promise<Array<string>>` | `audioPicker.select(audioSelectOptions).then((uris) => {})` | 同上 |
| 保存音频文件 | AudioViewPicker.save | `import { picker } from '@kit.CoreFileKit'` | `save(option?: AudioSaveOptions): Promise<Array<string>>` | `audioPicker.save(audioSaveOptions).then((uris) => {})` | 同上 |
| 获取保存成功的文件后缀类型下标 | DocumentViewPicker.getSelectedIndex | `import { picker } from '@kit.CoreFileKit'` | `getSelectedIndex(): number` | `let index = documentPicker.getSelectedIndex()` | 同上 |
| 文档选择选项（最大数量/后缀过滤/选择模式） | DocumentSelectOptions | `import { picker } from '@kit.CoreFileKit'` | 属性：maxSelectNumber, fileSuffixFilters, selectMode, authMode, multiAuthMode, mergeMode, defaultFilePathUri | `documentSelectOptions.fileSuffixFilters = ['文档\|.txt', '.pdf']` | 同上 |
| 文档保存选项（文件名/后缀选项/保存模式） | DocumentSaveOptions | `import { picker } from '@kit.CoreFileKit'` | 属性：newFileNames, fileSuffixChoices, pickerMode, defaultFilePathUri, autoCreateEmptyFile | `documentSaveOptions.newFileNames = ['file.txt']` | 同上 |

## @ohos.file.environment (目录环境能力)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取当前用户预授权下载目录的沙箱路径 | Environment.getUserDownloadDir | `import { Environment } from '@kit.CoreFileKit'` | `getUserDownloadDir(): string` | `let path = Environment.getUserDownloadDir()` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/04_ohos.file.environment (目录环境能力).md |
| 获取当前用户预授权桌面目录的沙箱路径 | Environment.getUserDesktopDir | `import { Environment } from '@kit.CoreFileKit'` | `getUserDesktopDir(): string` | `let path = Environment.getUserDesktopDir()` | 同上 |
| 获取当前用户预授权文档目录的沙箱路径 | Environment.getUserDocumentDir | `import { Environment } from '@kit.CoreFileKit'` | `getUserDocumentDir(): string` | `let path = Environment.getUserDocumentDir()` | 同上 |

## @ohos.file.fileuri (文件URI)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过路径生成 URI | fileUri.getUriFromPath | `import { fileUri } from '@kit.CoreFileKit'` | `getUriFromPath(path: string): string` | `let uri = fileUri.getUriFromPath(filePath)` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/05_ohos.file.fileuri (文件URI).md |
| 创建 FileUri 对象 | fileUri.FileUri | `import { fileUri } from '@kit.CoreFileKit'` | `constructor(uriOrPath: string)` | `let fileUriObject = new fileUri.FileUri(uri)` | 同上 |
| 获取文件名称 | FileUri.name | `import { fileUri } from '@kit.CoreFileKit'` | 属性: string | `let name = fileUriObject.name` | 同上 |
| 将 URI 转换成沙箱路径 | FileUri.path | `import { fileUri } from '@kit.CoreFileKit'` | 属性: string | `let sandboxPath = fileUriObject.path` | 同上 |
| 返回字符串类型 URI | FileUri.toString | `import { fileUri } from '@kit.CoreFileKit'` | `toString(): string` | `fileUriObject.toString()` | 同上 |
| 获取所在路径 URI | FileUri.getFullDirectoryUri | `import { fileUri } from '@kit.CoreFileKit'` | `getFullDirectoryUri(): string` | `fileUriObject.getFullDirectoryUri()` | 同上 |
| 判断当前 URI 是否是远端 URI | FileUri.isRemoteUri | `import { fileUri } from '@kit.CoreFileKit'` | `isRemoteUri(): boolean` | `fileUriObject.isRemoteUri()` | 同上 |

## Module Notes

- `@ohos.file.fs` 使用 `fileIo` 命名空间导入 (`import { fileIo } from '@kit.CoreFileKit'`)，提供完整的基础文件读写管理能力。关键流程：先通过 `context.filesDir` 获取应用沙箱路径，然后进行文件操作。支持 Promise 和 callback 两种异步模式，以及 Sync 同步模式。
- 文件描述符操作后需主动调用 `fileIo.close` 或 `fileIo.closeSync` 释放。
- `@ohos.file.picker` 的 `DocumentViewPicker` 和 `AudioViewPicker` 构造函数需要从 `UIAbilityContext` 获取 context（API 12+），推荐使用带参构造。无参构造（API 12+）已标注不推荐，存在概率性拉起失败问题。
- `PhotoViewPicker` 从 API 12 开始废弃，图片/视频选择请使用 `@kit.MediaLibraryKit` 中的 `photoAccessHelper.PhotoViewPicker`。`PhotoViewPicker.save` 从 API 12 开始废弃，建议使用 `SaveButton` 组件替代。
- `@ohos.file.environment` 在 2in1 设备上可正常调用，在其他设备类型中返回 801 错误码。该模块从 API 11 开始支持。
- picker 的三类 URI（应用沙箱、文档、媒体）使用方式不同，文档类 URI 可通过 `fileUri` 转换后使用 `fileIo` 操作；媒体类 URI 需通过 `photoAccessHelper.getAssets` 使用临时授权访问。
- `@ohos.file.fileuri` 从 API 9 开始支持，其 `FileUri` 类可接收 URI 或路径构造，提供了 `uri <-> path` 的双向转换能力。
