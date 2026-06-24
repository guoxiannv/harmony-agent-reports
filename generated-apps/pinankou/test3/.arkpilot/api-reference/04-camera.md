# 04 -- Camera 拍照/相机

## @ohos.multimedia.camera
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机模块基础入口，提供相机管理、输入输出、会话等全部相机能力 | @ohos.multimedia.camera | `import { camera } from '@kit.CameraKit';` | 模块声明 (API 10+) | `import { camera } from '@kit.CameraKit';` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/01_模块描述.md` |

## CameraManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机管理器，用于获取相机设备、创建输入/输出流及会话、注册相机状态监听 | CameraManager | `import { camera } from '@kit.CameraKit';` | `getSupportedCameras(): Array<CameraDevice>` | `let cameras = cameraManager.getSupportedCameras();` | `10_Interface (CameraManager).md` |

## camera.getCameraManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相机管理器实例，同步返回 | camera.getCameraManager | `import { camera } from '@kit.CameraKit';` | `getCameraManager(context: Context): CameraManager` | `let cameraManager = camera.getCameraManager(context);` | `02_Functions.md` |

## CameraInput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机输入设备对象，提供打开/关闭相机、监听输入流异常的能力 | CameraInput | `import { camera } from '@kit.CameraKit';` | `open(): Promise<void>` / `close(): Promise<void>` | `cameraInput.open().then(() => { console.info('Camera opened'); });` | `09_Interface (CameraInput).md` |

## CameraInput.open
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 打开相机设备 | CameraInput.open | `import { camera } from '@kit.CameraKit';` | `open(callback: AsyncCallback<void>): void` / `open(): Promise<void>` | `cameraInput.open((err) => { if (err) return; });` | `09_Interface (CameraInput).md` |

## PhotoSession
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 普通拍照模式会话类，继承自Session、Flash、AutoExposure等，提供预配置及会话状态监听 | PhotoSession | `import { camera } from '@kit.CameraKit';` | `createSession(mode: SceneMode): T` (由CameraManager.createSession创建) | `let photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;` | `34_Interface (PhotoSession).md` |

## CaptureSession (deprecated)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 废弃的拍照会话类，自API 11起被PhotoSession/VideoSession替代 | CaptureSession | `import { camera } from '@kit.CameraKit';` | `createCaptureSession(): CaptureSession` (已废弃) | `let session = cameraManager.createCaptureSession();` | `49_废弃的Interface (CaptureSession, deprecated).md` |

## ImageReceiver
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片接收器，从相机获取surfaceId用于预览/拍照输出（Image Kit模块） | ImageReceiver | `import { image } from '@kit.ImageKit';` | `image.createImageReceiver(size, format, capacity): ImageReceiver` | `let receiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/` 及相关文件 |

## Profile
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机配置信息项，包含输出格式和分辨率 | Profile | `import { camera } from '@kit.CameraKit';` | `interface Profile { format: CameraFormat; size: Size; }` | `let profile: camera.Profile = cameraOutputCapability.photoProfiles[0];` | `46_Interfaces (其他).md` (`#profile`) |

## Size
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图像尺寸参数，包含宽高 | Size | `import { camera } from '@kit.CameraKit';` | `interface Size { height: number; width: number; }` | `const size: camera.Size = { width: 1920, height: 1080 };` | `46_Interfaces (其他).md` (`#size`) |

## camera.CameraArea
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机对焦/测光区域（未在本地文档中找到，使用Point替代） | (camera.CameraArea) | -- | -- 未在本地文档中找到 -- | -- | -- |

## 模块要点

- `camera.CameraArea` 类型在本地 HarmonyOS 参考资料中未找到。对焦和测光区域通过 `Point` 接口（`{x: number, y: number}`）表示 0-1 归一化坐标系中的点，配合 `Focus.setFocusPoint()` 和 `AutoExposure.setMeteringPoint()` 使用。
- `CaptureSession` 自 API 11 起废弃，应使用 `PhotoSession`（通过 `CameraManager.createSession(SceneMode.NORMAL_PHOTO)` 创建）。
- `ImageReceiver` 属于 `@kit.ImageKit`（`import { image } from '@kit.ImageKit'`），非 Camera Kit 自有类型，从它获取 `surfaceId` 后传入 `createPreviewOutput()`。
- `CameraManager.createCameraInput` 需要 `ohos.permission.CAMERA` 权限。
