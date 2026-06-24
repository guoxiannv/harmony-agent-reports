# 03 — 文件存储 (File IO & Backup)

## @ohos.file.fs (文件管理) — fileIo/fs

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基础文件操作（stat/access/open/close/read/write/mkdir/rmdir/listFile/copy/move/rename等） | fileIo | `import { fileIo } from '@kit.CoreFileKit';` | 模块内包含 stat / access / open / close / read / write / mkdir / rmdir / unlink / readText / write / copyFile / copyDir / moveFile / moveDir / rename / listFile / createStream 等方法 | `let stat = fileIo.statSync(path);` / `let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);` / `fileIo.closeSync(file);` / `let str = fileIo.readTextSync(filePath);` / `fileIo.writeSync(file.fd, "hello");` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md |
| 获取文件或目录属性信息 | fileIo.stat | 同上 | `stat(file: string \| number): Promise<Stat>` / `statSync(file: string \| number): Stat` | `fileIo.stat(filePath).then((stat) => { console.info(\`size: ${stat.size}\`); });` | 同上 |
| 检查文件/目录是否存在或校验权限 | fileIo.access | 同上 | `access(path: string, mode?: AccessModeType): Promise<boolean>` / `accessSync(path: string, mode?: AccessModeType): boolean` | `fileIo.access(filePath).then((res) => { if (res) { /* exists */ } });` | 同上 |
| 创建目录（可递归） | fileIo.mkdir | 同上 | `mkdir(path: string, recursion?: boolean): Promise<void>` / `mkdirSync(path: string, recursion?: boolean): void` | `fileIo.mkdir(dirPath, true).then(() => { console.info("mkdir ok"); });` | 同上 |
| 读取文件文本内容 | fileIo.readText | 同上 | `readText(filePath: string, options?: ReadTextOptions): Promise<string>` / `readTextSync(filePath: string, options?: ReadTextOptions): string` | `let str = fileIo.readTextSync(filePath);` | 同上 |
| 读取二进制数据 | fileIo.read | 同上 | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` / `readSync(fd: number, buffer: ArrayBuffer, options?: ReadOptions): number` | `fileIo.read(file.fd, arrayBuffer).then((readLen) => { ... });` | 同上 |
| 写入数据 | fileIo.write | 同上 | `write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` / `writeSync(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): number` | `let writeLen = fileIo.writeSync(file.fd, "hello");` | 同上 |
| 打开文件 | fileIo.open | 同上 | `open(path: string, mode?: number): Promise<File>` / `openSync(path: string, mode?: number): File` | `let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE);` | 同上 |
| 关闭文件 | fileIo.close | 同上 | `close(file: number \| File): Promise<void>` / `closeSync(file: number \| File): void` | `fileIo.closeSync(file);` | 同上 |
| 列出目录内容 | fileIo.listFile | 同上 | `listFile(path: string, options?: ListFileOptions): Promise<string[]>` / `listFileSync(path: string, options?: ListFileOptions): string[]` | `fileIo.listFile(pathDir, {recursion: false}).then((names) => { ... });` | 同上 |
| 复制文件 | fileIo.copyFile | 同上 | `copyFile(src: string \| number, dest: string \| number, mode?: number): Promise<void>` / `copyFileSync(src: string \| number, dest: string \| number, mode?: number): void` | `fileIo.copyFile(srcPath, dstPath, 0).then(() => { ... });` | 同上 |
| 复制目录（支持进度回调） | fileIo.copy | 同上 | `copy(srcUri: string, destUri: string, options?: CopyOptions): Promise<void>` (API 11+) | `fileIo.copy(srcDirUriLocal, dstDirUriLocal, copyOption).then(() => { ... });` | 同上 |
| 复制目录 | fileIo.copyDir | 同上 | `copyDir(src: string, dest: string, mode?: number): Promise<void>` (API 10+) / `copyDirSync(src: string, dest: string, mode?: number): void` | `fileIo.copyDir(srcPath, destPath, 0).then(() => { ... });` | 同上 |
| 移动文件 | fileIo.moveFile | 同上 | `moveFile(src: string, dest: string): Promise<void>` / `moveFileSync(src: string, dest: string): void` | `fileIo.moveFile(srcPath, destPath).then(() => { ... });` | 同上 |
| 移动目录 | fileIo.moveDir | 同上 | `moveDir(src: string, dest: string): Promise<void>` / `moveDirSync(src: string, dest: string): void` (API 10+) | `fileIo.moveDir(srcPath, destPath).then(() => { ... });` | 同上 |
| 重命名 | fileIo.rename | 同上 | `rename(oldPath: string, newPath: string): Promise<void>` / `renameSync(oldPath: string, newPath: string): void` | `fileIo.rename(oldPath, newPath).then(() => { ... });` | 同上 |
| 删除文件 | fileIo.unlink | 同上 | `unlink(path: string): Promise<void>` / `unlinkSync(path: string): void` | `fileIo.unlink(filePath).then(() => { ... });` | 同上 |
| 删除目录 | fileIo.rmdir | 同上 | `rmdir(path: string): Promise<void>` / `rmdirSync(path: string): void` | `fileIo.rmdir(dirPath).then(() => { ... });` | 同上 |
| 截断文件 | fileIo.truncate | 同上 | `truncate(file: string \| number, len?: number): Promise<void>` / `truncateSync(file: string \| number, len?: number): void` | `fileIo.truncate(filePath, 5).then(() => { ... });` | 同上 |
| 创建文件流 | fileIo.createStream | 同上 | `createStream(path: string, mode: string): Promise<Stream>` / `createStreamSync(path: string, mode: string): Stream` | `let ss = fileIo.createStreamSync(filePath, "r+");` | 同上 |
| 创建临时目录 | fileIo.mkdtemp | 同上 | `mkdtemp(prefix: string): Promise<string>` / `mkdtempSync(prefix: string): string` | `let tempDir = fileIo.mkdtempSync(pathDir + "/XXXX");` | 同上 |
| Stat — 文件详细信息 | Stat | 同上（由 stat 返回） | 属性: ino, mode, uid, gid, size, atime, mtime, ctime, location; 方法: isDirectory(), isFile(), isBlockDevice(), isCharacterDevice(), isFIFO(), isSocket(), isSymbolicLink() | `if (stat.isDirectory()) { ... }` | 同上 |
| File — 已打开的文件句柄 | File | 同上（由 openSync 返回） | 属性: fd, path, name; 方法: getParent(), lock(), unlock() | `console.info(\`fd: ${file.fd}\`);` | 同上 |

## @ohos.file.environment (目录环境能力)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 预授权目录获取（下载/桌面/文档） | Environment | `import { Environment } from '@kit.CoreFileKit';` | 模块内包含 getUserDownloadDir / getUserDesktopDir / getUserDocumentDir 三个静态方法 | `let downloadDir = Environment.getUserDownloadDir();` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/04_ohos.file.environment (目录环境能力).md |
| 获取用户下载目录沙箱路径 | Environment.getUserDownloadDir | 同上 | `getUserDownloadDir(): string` (API 11+) | `try { let path = Environment.getUserDownloadDir(); } catch (err) { ... }` | 同上 |
| 获取用户桌面目录沙箱路径 | Environment.getUserDesktopDir | 同上 | `getUserDesktopDir(): string` (API 11+) | `let path = Environment.getUserDesktopDir();` | 同上 |
| 获取用户文档目录沙箱路径 | Environment.getUserDocumentDir | 同上 | `getUserDocumentDir(): string` (API 11+) | `let path = Environment.getUserDocumentDir();` | 同上 |

## @ohos.application.BackupExtensionAbility (备份恢复扩展能力)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 备份恢复扩展能力基类 | BackupExtensionAbility | `import { BackupExtensionAbility, BundleVersion } from '@kit.CoreFileKit';` | `class BackupExtensionAbility extends ExtensionAbility` | `class BackupExt extends BackupExtensionAbility { async onBackup() { ... } }` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/01_ohos.application.BackupExtensionAbility (备份恢复扩展能力).md |
| 备份数据回调 | onBackup | 同上 | `onBackup(): void` | `async onBackup() { console.info('onBackup'); }` | 同上 |
| 恢复数据回调 | onRestore | 同上 | `onRestore(bundleVersion: BundleVersion): void` | `async onRestore(bundleVersion: BundleVersion) { ... }` | 同上 |
| 带扩展参数的备份回调（与 onBackup 互斥） | onBackupEx | 同上 | `onBackupEx(backupInfo: string): string \| Promise<string>` (API 12+) | `onBackupEx(backupInfo: string): string { return JSON.stringify(errorInfo); }` | 同上 |
| 带扩展参数的恢复回调（与 onRestore 互斥） | onRestoreEx | 同上 | `onRestoreEx(bundleVersion: BundleVersion, restoreInfo: string): string \| Promise<string>` (API 12+) | `onRestoreEx(bundleVersion, restoreInfo) { ... }` | 同上 |
| 备份版本信息 | BundleVersion | 同上 | 属性: `code: number`, `name: string` | `{ code: 1, name: "1.0.0" }` | 同上 |

## @ohos.file.BackupExtensionContext (备份恢复扩展能力上下文)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 备份扩展上下文（获取备份恢复临时路径） | BackupExtensionContext | `import { BackupExtensionContext } from '@kit.CoreFileKit';` | 继承自 ExtensionContext，属性 backupDir: string (API 12+) | `let dir = this.context.backupDir;` | 02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/13_ohos.file.BackupExtensionContext (备份恢复扩展能力).md |

## 模块说明

- **fileIo vs fs**: `@ohos.file.fs` 导出的命名空间为 `fileIo`（`import { fileIo } from '@kit.CoreFileKit'`）。旧的 `@ohos.fileio` 模块从 API version 9 开始废弃，建议迁移至 `@kit.CoreFileKit` 中的 `fileIo`。
- **fileAccess**: 未找到独立的 `@ohos.file.access` 模块或 `fileAccess` API。文件访问权限检查功能由 `fileIo.access()` / `fileIo.accessSync()` 方法提供（AccessModeType: EXIST/READ/WRITE/READ_WRITE）。
- **沙箱路径**: 所有文件操作需要先通过 `context.filesDir` 获取应用沙箱路径。URI 支持从 API 22 开始加入。
- **Environment 限制**: `getUserDownloadDir`、`getUserDesktopDir`、`getUserDocumentDir` 仅在 2in1 设备上可用，其他设备返回 801 错误。
- **BackupExtensionAbility**: 仅在 Stage 模型下使用。onBackupEx/onRestoreEx（API 12+）与 onBackup/onRestore 互斥，若同时重写，优先调用带 Ex 后缀的版本。
