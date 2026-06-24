# 02 — 相机拍照 (Camera)

## @kit.CameraKit
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Camera Kit 导入模块 | `@kit.CameraKit` | `@kit.CameraKit` | `import { camera } from '@kit.CameraKit';` | `import { camera } from '@kit.CameraKit';` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/01_模块描述.md` |

## camera.getCameraManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相机管理器实例 | `camera.getCameraManager(context)` | `import { camera } from '@kit.CameraKit';` | `getCameraManager(context: Context): CameraManager` | `let cameraManager = camera.getCameraManager(context);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/02_Functions.md` |

## CameraManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机管理器类，提供获取相机设备、创建输入/输出流、创建Session、监听相机状态等能力 | `CameraManager` | `import { camera } from '@kit.CameraKit';` | `interface CameraManager` (通过 `getCameraManager` 获取实例) | `let cameras = cameraManager.getSupportedCameras();` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/10_Interface (CameraManager).md` |

## CameraInput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机设备输入对象，提供开关相机及监听输入流异常的能力 | `CameraInput` | `import { camera } from '@kit.CameraKit';` | `interface CameraInput` (通过 `cameraManager.createCameraInput()` 创建) | `cameraInput.open();` / `cameraInput.close();` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/09_Interface (CameraInput).md` |

## CameraDevice
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机设备信息对象，包含 cameraId、cameraPosition、cameraType、connectionType 等属性 | `CameraDevice` | `import { camera } from '@kit.CameraKit';` | `interface CameraDevice { cameraId: string; cameraPosition: CameraPosition; cameraType: CameraType; connectionType: ConnectionType; ... }` | `let cameras: Array<camera.CameraDevice> = cameraManager.getSupportedCameras();` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/46_Interfaces (其他).md` |

## CameraOutputCapability
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机输出能力项，包含支持的预览/拍照/录像配置和metadata流类型 | `CameraOutputCapability` | `import { camera } from '@kit.CameraKit';` | `interface CameraOutputCapability { previewProfiles: Array<Profile>; photoProfiles: Array<Profile>; videoProfiles: Array<VideoProfile>; supportedMetadataObjectTypes: Array<MetadataObjectType>; }` | `let outputCapability = cameraManager.getSupportedOutputCapability(camera, sceneMode);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/46_Interfaces (其他).md` |

## PreviewOutput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 预览输出类，提供预览流帧率、旋转角度查询和设置能力 | `PreviewOutput` | `import { camera } from '@kit.CameraKit';` | `interface PreviewOutput extends CameraOutput` (通过 `cameraManager.createPreviewOutput()` 创建) | `let previewOutput = cameraManager.createPreviewOutput(profile, surfaceId);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/35_Interface (PreviewOutput).md` |

## PhotoOutput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拍照输出类，提供拍照、动态照片、镜像、画质优先策略等能力 | `PhotoOutput` | `import { camera } from '@kit.CameraKit';` | `interface PhotoOutput extends CameraOutput` (通过 `cameraManager.createPhotoOutput()` 创建) | `photoOutput.capture();` -> 触发拍照 | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/33_Interface (PhotoOutput).md` |

## cameraManager.getSupportedOutputCapability
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 查询相机设备在指定模式下支持的输出能力 | `cameraManager.getSupportedOutputCapability(camera, mode)` | `import { camera } from '@kit.CameraKit';` | `getSupportedOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability` | `let caps = cameraManager.getSupportedOutputCapability(camera, sceneMode);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/10_Interface (CameraManager).md` |

## cameraManager.createPhotoOutput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建拍照输出对象 | `cameraManager.createPhotoOutput(profile?)` | `import { camera } from '@kit.CameraKit';` | `createPhotoOutput(profile?: Profile): PhotoOutput` | `let photoOutput = cameraManager.createPhotoOutput(profile);` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/10_Interface (CameraManager).md` |

## ImageReceiver
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片接收类，用于获取surfaceId、接收最新/下一张图片、释放实例 | `ImageReceiver` | `import { image } from '@kit.ImageKit';` | `interface ImageReceiver` (通过 `image.createImageReceiver()` 创建) | `let surfaceId: string = await receiver.getReceivingSurfaceId();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/07_Interface (ImageReceiver).md` |

## 模块要点
- 所有相机 API 的导入模块均为 `import { camera } from '@kit.CameraKit';`。
- 标准拍照流程：`getCameraManager` -> `getSupportedCameras` -> `createCameraInput` -> `createSession` -> `beginConfig` -> `addInput`/`addOutput` -> `commitConfig` -> `start` -> `photoOutput.capture()`。
- `ImageReceiver` 属于 `@kit.ImageKit`（不是 Camera Kit），用于获取相机预览/拍照所需的 `surfaceId`。
- API 版本 11+ 推荐使用 `createSession(mode)` 替代已废弃的 `createCaptureSession()`。
- `api_list` 中的 `camera.createCameraManager` 实际对应 `camera.getCameraManager`（docs 中无 `createCameraManager`）；`camera.getSupportedOutputCapability` 和 `camera.createPhotoOutput` 是 `CameraManager` 实例方法（写作 `cameraManager.getSupportedOutputCapability` / `cameraManager.createPhotoOutput`）。
