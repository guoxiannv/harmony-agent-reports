# 03 — File I/O (fs)

## @ohos.file.fs / fileIo

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件（支持URI） | fileIo.open | import { fileIo } from '@kit.CoreFileKit' | open(path: string, mode?: number): Promise\<File> | `fileIo.open(uri, fileIo.OpenMode.READ_ONLY).then(file => { ... })` | 06_ohos.file.fs (文件管理).md |
| 同步打开文件 | fileIo.openSync | import { fileIo } from '@kit.CoreFileKit' | openSync(path: string, mode?: number): File | `let file = fileIo.openSync(sandboxPath, fileIo.OpenMode.READ_ONLY)` | 06_ohos.file.fs (文件管理).md |
| 复制文件（路径或fd） | fileIo.copyFile | import { fileIo } from '@kit.CoreFileKit' | copyFile(src: string \| number, dest: string \| number, mode?: number): Promise\<void> | `fileIo.copyFile(srcPath, dstPath, 0)` | 06_ohos.file.fs (文件管理).md |
| 同步复制文件 | fileIo.copyFileSync | import { fileIo } from '@kit.CoreFileKit' | copyFileSync(src: string \| number, dest: string \| number, mode?: number): void | `fileIo.copyFileSync(srcPath, dstPath)` | 06_ohos.file.fs (文件管理).md |
| 复制文件/目录（URI） API 11+ | fileIo.copy | import { fileIo } from '@kit.CoreFileKit' | copy(srcUri: string, destUri: string, options?: CopyOptions): Promise\<void> | `fileIo.copy(srcUri, destUri)` | 06_ohos.file.fs (文件管理).md |
| 创建目录 | fileIo.mkdir | import { fileIo } from '@kit.CoreFileKit' | mkdir(path: string): Promise\<void> | `fileIo.mkdir(dirPath)` | 06_ohos.file.fs (文件管理).md |
| 递归创建目录 API 11+ | fileIo.mkdir | import { fileIo } from '@kit.CoreFileKit' | mkdir(path: string, recursion: boolean): Promise\<void> | `fileIo.mkdir(dirPath, true)` | 06_ohos.file.fs (文件管理).md |
| 同步创建目录 | fileIo.mkdirSync | import { fileIo } from '@kit.CoreFileKit' | mkdirSync(path: string): void | `fileIo.mkdirSync(dirPath)` | 06_ohos.file.fs (文件管理).md |
| 同步递归创建目录 API 11+ | fileIo.mkdirSync | import { fileIo } from '@kit.CoreFileKit' | mkdirSync(path: string, recursion: boolean): void | `fileIo.mkdirSync(dirPath, true)` | 06_ohos.file.fs (文件管理).md |
| 读取文件数据 | fileIo.read | import { fileIo } from '@kit.CoreFileKit' | read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise\<number> | `fileIo.read(file.fd, arrayBuffer)` | 06_ohos.file.fs (文件管理).md |
| 同步读取文件数据 | fileIo.readSync | import { fileIo } from '@kit.CoreFileKit' | readSync(fd: number, buffer: ArrayBuffer, options?: ReadOptions): number | `fileIo.readSync(file.fd, buf)` | 06_ohos.file.fs (文件管理).md |
| 写入文件数据 | fileIo.write | import { fileIo } from '@kit.CoreFileKit' | write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise\<number> | `fileIo.write(file.fd, str)` | 06_ohos.file.fs (文件管理).md |
| 同步写入文件数据 | fileIo.writeSync | import { fileIo } from '@kit.CoreFileKit' | writeSync(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): number | `fileIo.writeSync(file.fd, str)` | 06_ohos.file.fs (文件管理).md |
| 获取文件/目录属性 | fileIo.stat | import { fileIo } from '@kit.CoreFileKit' | stat(file: string \| number): Promise\<Stat> | `fileIo.stat(filePath).then(stat => stat.size)` | 06_ohos.file.fs (文件管理).md |
| 同步获取文件/目录属性 | fileIo.statSync | import { fileIo } from '@kit.CoreFileKit' | statSync(file: string \| number): Stat | `let stat = fileIo.statSync(pathDir)` | 06_ohos.file.fs (文件管理).md |
| 检查文件是否存在 | fileIo.access | import { fileIo } from '@kit.CoreFileKit' | access(path: string, mode?: AccessModeType): Promise\<boolean> | `fileIo.access(filePath).then(exists => ...)` | 06_ohos.file.fs (文件管理).md |
| 同步检查文件是否存在 | fileIo.accessSync | import { fileIo } from '@kit.CoreFileKit' | accessSync(path: string, mode?: AccessModeType): boolean | `fileIo.accessSync(filePath)` | 06_ohos.file.fs (文件管理).md |
| 关闭文件 | fileIo.close | import { fileIo } from '@kit.CoreFileKit' | close(file: number \| File): Promise\<void> | `fileIo.close(file)` | 06_ohos.file.fs (文件管理).md |
| 同步关闭文件 | fileIo.closeSync | import { fileIo } from '@kit.CoreFileKit' | closeSync(file: number \| File): void | `fileIo.closeSync(file)` | 06_ohos.file.fs (文件管理).md |
| 列出目录文件 | fileIo.listFile | import { fileIo } from '@kit.CoreFileKit' | listFile(path: string, filter?: FileFilter): Promise\<string[]> | `fileIo.listFile(dirPath).then(files => ...)` | 06_ohos.file.fs (文件管理).md |
| 移动文件 | fileIo.moveFile | import { fileIo } from '@kit.CoreFileKit' | moveFile(src: string, dest: string): Promise\<void> | `fileIo.moveFile(src, dest)` | 06_ohos.file.fs (文件管理).md |
| 删除文件 | fileIo.unlink | import { fileIo } from '@kit.CoreFileKit' | unlink(path: string): Promise\<void> | `fileIo.unlink(filePath)` | 06_ohos.file.fs (文件管理).md |
| 删除目录 | fileIo.rmdir | import { fileIo } from '@kit.CoreFileKit' | rmdir(path: string): Promise\<void> | `fileIo.rmdir(dirPath)` | 06_ohos.file.fs (文件管理).md |
| 创建读流 API 12+ | fileIo.createReadStream | import { fileIo } from '@kit.CoreFileKit' | createReadStream(path: string): ReadStream | `let rs = fileIo.createReadStream(path)` | 06_ohos.file.fs (文件管理).md |
| 创建写流 API 12+ | fileIo.createWriteStream | import { fileIo } from '@kit.CoreFileKit' | createWriteStream(path: string): WriteStream | `let ws = fileIo.createWriteStream(path)` | 06_ohos.file.fs (文件管理).md |
| 创建读写流 | fileIo.createStream | import { fileIo } from '@kit.CoreFileKit' | createStream(path: string, mode: string): Promise\<Stream> | `fileIo.createStream(path, "r+")` | 06_ohos.file.fs (文件管理).md |
| 截断文件 | fileIo.truncate | import { fileIo } from '@kit.CoreFileKit' | truncate(file: string \| number, len?: number): Promise\<void> | `fileIo.truncate(filePath, len)` | 06_ohos.file.fs (文件管理).md |

## 类型定义

| 类型 | 说明 | 关键属性 | 来源文件 |
|------|------|----------|----------|
| Stat | 文件/目录属性信息 | size, mode, ctime, mtime, isFile(), isDirectory() | 06_ohos.file.fs (文件管理).md |
| File | 打开的文件对象 | fd: number | 06_ohos.file.fs (文件管理).md |
| OpenMode | 打开模式枚举 | READ_ONLY(0o0), WRITE_ONLY(0o1), READ_WRITE(0o2), CREATE(0o100), TRUNC(0o1000), APPEND(0o2000) | 06_ohos.file.fs (文件管理).md |
| CopyOptions API 11+ | 复制选项 | progressListener: ProgressListener | 06_ohos.file.fs (文件管理).md |
| ReadOptions API 11+ | 读选项 | offset?: number, length?: number | 06_ohos.file.fs (文件管理).md |
| WriteOptions API 11+ | 写选项 | offset?: number, length?: number, encoding?: string | 06_ohos.file.fs (文件管理).md |
| AccessModeType API 12+ | 访问权限类型 | EXIST, READ, WRITE, READ_WRITE | 06_ohos.file.fs (文件管理).md |
| AccessFlagType API 12+ | 访问位置类型 | LOCAL, LOCAL_AND_CLOUD | 06_ohos.file.fs (文件管理).md |
| Stream | 文件流 | read(), write(), flush(), close() | 06_ohos.file.fs (文件管理).md |

## 模块说明

- **导入**: `import { fileIo } from '@kit.CoreFileKit'`
- `@ohos.file.fs` 和 `fileIo` 是同一模块：该模块 HarmonyOS 文件基础操作 API，在 ArkTS 中以 `fileIo` 命名空间使用
- 从 API version 22 开始，`stat`、`copy`、`open` 等函数支持传入 URI 作为 path 参数
- 获取应用沙箱路径：`let pathDir = context.filesDir`（从 Ability 的 context 获取）
- URI 转沙箱路径：使用 `@ohos.file.fileuri` 模块的 `fileUri.getPathFromUri(uri)` 或 `fileUri` 构造
- 系统能力：`SystemCapability.FileManagement.File.FileIO`
- 错误码参考：基础文件 IO 错误码（139000xx 系列）
- 对于从 picker URI 拷贝图片到沙箱的场景：推荐先 `mkdirSync(dirPath, true)` 创建目标目录，再用 `copyFileSync(srcPath, destPath)` 或 `copy(srcUri, destUri)`（API 11+）完成拷贝
