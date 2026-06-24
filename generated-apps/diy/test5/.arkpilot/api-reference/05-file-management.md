# 05 -- File FS 沙箱文件管理

## @ohos.file.fs
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基础文件操作模块，提供文件管理、目录管理、信息统计、流式读写等功能 | @ohos.file.fs | `import { fileIo } from '@kit.CoreFileKit';` | 模块，API version 9 起支持，后续新增接口标记起始版本 | `let pathDir = context.filesDir;` | 06_ohos.file.fs (文件管理).md |

## fs.stat
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取文件或目录详细属性信息 | fileIo.stat | `import { fileIo } from '@kit.CoreFileKit';` | `stat(file: string \| number): Promise<Stat>` | `fileIo.stat(pathDir + "/test.txt").then((stat) => { console.info(stat.size); })` | 06_ohos.file.fs (文件管理).md |

## fs.open
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开文件或目录，返回 File 对象 | fileIo.open | `import { fileIo } from '@kit.CoreFileKit';` | `open(path: string, mode?: number): Promise<File>` | `fileIo.open(filePath, fileIo.OpenMode.READ_WRITE \| fileIo.OpenMode.CREATE).then((file) => { ... })` | 06_ohos.file.fs (文件管理).md |

## fs.read
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 从已打开的文件描述符读取数据 | fileIo.read | `import { fileIo } from '@kit.CoreFileKit';` | `read(fd: number, buffer: ArrayBuffer, options?: ReadOptions): Promise<number>` | `fileIo.read(file.fd, new ArrayBuffer(4096)).then((readLen) => { ... })` | 06_ohos.file.fs (文件管理).md |

## fs.write
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 将数据写入文件 | fileIo.write | `import { fileIo } from '@kit.CoreFileKit';` | `write(fd: number, buffer: ArrayBuffer \| string, options?: WriteOptions): Promise<number>` | `fileIo.write(file.fd, "hello, world").then((writeLen) => { ... })` | 06_ohos.file.fs (文件管理).md |

## fs.mkdir
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建目录 | fileIo.mkdir | `import { fileIo } from '@kit.CoreFileKit';` | `mkdir(path: string): Promise<void>` | `fileIo.mkdir(pathDir + "/testDir").then(() => { ... })` | 06_ohos.file.fs (文件管理).md |

## fs.copyFile
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 复制文件 | fileIo.copyFile | `import { fileIo } from '@kit.CoreFileKit';` | `copyFile(src: string \| number, dest: string \| number, mode?: number): Promise<void>` | `fileIo.copyFile(srcPath, dstPath, 0).then(() => { ... })` | 06_ohos.file.fs (文件管理).md |

## fs.access
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 检查文件或目录是否存在 | fileIo.access | `import { fileIo } from '@kit.CoreFileKit';` | `access(path: string, callback: AsyncCallback<boolean>): void` | `fileIo.access(filePath, (err, res) => { if (res) { ... } })` | 06_ohos.file.fs (文件管理).md |

## fs.unlink
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 删除单个文件 | fileIo.unlink | `import { fileIo } from '@kit.CoreFileKit';` | `unlink(path: string): Promise<void>` | `fileIo.unlink(filePath).then(() => { ... })` | 06_ohos.file.fs (文件管理).md |

## fs.listFile
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列出目录下所有文件名和目录名，支持过滤与递归 | fileIo.listFile | `import { fileIo } from '@kit.CoreFileKit';` | `listFile(path: string, options?: ListFileOptions): Promise<string[]>` | `fileIo.listFile(pathDir, { recursion: false, listNum: 0 }).then((filenames) => { ... })` | 06_ohos.file.fs (文件管理).md |

## fs.moveDir
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 移动源目录至目标路径下，支持多种冲突处理模式 | fileIo.moveDir | `import { fileIo } from '@kit.CoreFileKit';` | `moveDir(src: string, dest: string, mode?: number): Promise<void>` | `fileIo.moveDir(srcPath, destPath, 1).then(() => { ... })` | 06_ohos.file.fs (文件管理).md |

## 模块备注

- 所有文件操作均需在应用的沙箱路径下进行，沙箱路径通过 `context.filesDir` 获取。
- 导入模块名称为 `fileIo`（而非 `fs`），来源为 `@kit.CoreFileKit`。
- `fs.open` 的 mode 参数默认为 `OpenMode.READ_ONLY(0o0)`，可通过按位或组合 `OpenMode.CREATE`、`OpenMode.TRUNC`、`OpenMode.APPEND` 等。
- `fs.read`/`fs.write` 需传入已打开的文件描述符 fd，而非路径。
- `fs.moveDir` 不支持在分布式文件路径下操作（API 10+）。
- `fs.copyFile` 的 mode 参数当前仅支持 0（完全覆盖）。
- `fs.mkdir` 从 API 11 起支持 `recursion: boolean` 参数实现递归创建目录。
- `fs.access` 从 API 12 起新增 `AccessModeType` 和 `AccessFlagType` 参数以校验操作权限。
