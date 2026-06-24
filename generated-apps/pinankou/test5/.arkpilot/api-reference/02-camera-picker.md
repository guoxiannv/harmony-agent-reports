# 02 — 相机拍照 (Camera & Picker)

## @ohos.multimedia.camera (相机管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取相机管理器实例 | camera.getCameraManager | `import { camera } from '@kit.CameraKit'` | `getCameraManager(context: Context): CameraManager` | `let cameraManager = camera.getCameraManager(context)` | 04_媒体/04_Camera Kit/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/02_Functions.md |
| 获取支持的相机设备列表 | CameraManager.getSupportedCameras | `import { camera } from '@kit.CameraKit'` | `getSupportedCameras(): Array<CameraDevice>` | `let cameras = cameraManager.getSupportedCameras()` | 04_媒体/04_Camera Kit/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/10_Interface (CameraManager).md |
| 获取相机输出能力 | CameraManager.getSupportedOutputCapability | `import { camera } from '@kit.CameraKit'` | `getSupportedOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability` | `let cap = cameraManager.getSupportedOutputCapability(camera, sceneMode)` | 同上 |
| 创建会话实例 | CameraManager.createSession | `import { camera } from '@kit.CameraKit'` | `createSession<T extends Session>(mode: SceneMode): T` | `let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession` | 同上 |
| 创建相机输入 | CameraManager.createCameraInput | `import { camera } from '@kit.CameraKit'` | `createCameraInput(camera: CameraDevice): CameraInput` | `let input = cameraManager.createCameraInput(cameraDevice)` | 同上 |
| 创建预览输出 | CameraManager.createPreviewOutput | `import { camera } from '@kit.CameraKit'` | `createPreviewOutput(profile: Profile, surfaceId: string): PreviewOutput` | `let preview = cameraManager.createPreviewOutput(profile, surfaceId)` | 同上 |
| 创建拍照输出 | CameraManager.createPhotoOutput | `import { camera } from '@kit.CameraKit'` | `createPhotoOutput(profile?: Profile): PhotoOutput` | `let photoOut = cameraManager.createPhotoOutput(profile)` | 同上 |
| 打开相机（Promise） | CameraInput.open | `import { camera } from '@kit.CameraKit'` | `open(): Promise<void>` | `await cameraInput.open()` | 04_媒体/04_Camera Kit/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/09_Interface (CameraInput).md |
| 关闭相机（Promise） | CameraInput.close | `import { camera } from '@kit.CameraKit'` | `close(): Promise<void>` | `await cameraInput.close()` | 同上 |

## CameraDevice
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机设备信息（只读属性） | CameraDevice | `import { camera } from '@kit.CameraKit'` | `{ cameraId, cameraPosition, cameraType, connectionType }` | `cameraDevice.cameraPosition` | 04_媒体/04_Camera Kit/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/46_Interfaces (其他).md |

## @ohos.multimedia.cameraPicker (相机选择器)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起相机选择器 | cameraPicker.pick | `import { cameraPicker } from '@kit.CameraKit'` | `pick(context: Context, mediaTypes: Array<PickerMediaType>, pickerProfile: PickerProfile): Promise<PickerResult>` | `let result = await cameraPicker.pick(context, [PickerMediaType.PHOTO], pickerProfile)` | 04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/02_ohos.multimedia.cameraPicker (相机选择器).md |

## SurfaceId
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 预览表面ID（string类型） | SurfaceId | 从 XComponent 或 ImageReceiver 获取 | `type SurfaceId = string` | 从 XComponent 的 `surfaceId` 事件获取 | CameraManager.createPreviewOutput 文档 |
| 创建无配置预览输出 | CameraManager.createPreviewOutput (12+) | `import { camera } from '@kit.CameraKit'` | `createPreviewOutput(surfaceId: string): PreviewOutput` | `let preview = cameraManager.createPreviewOutput(surfaceId)` | 10_Interface (CameraManager).md |

## 模块注意事项

- **cameraController**: 并非一个独立 API。相机程序流程为: `getCameraManager` -> `createSession(NORMAL_PHOTO)` -> `beginConfig()` -> `addInput(cameraInput)` / `addOutput(photoOutput)` / `addOutput(previewOutput)` -> `commitConfig()` -> `session.start()`。拍照通过 `PhotoOutput.capture()` 触发。
- `@ohos.multimedia.camera` 从 API version 10 开始支持，导入路径为 `@kit.CameraKit`。
- `@ohos.multimedia.cameraPicker` 从 API version 11 开始支持，导入路径为 `@kit.CameraKit`。
- 打开相机需要 `ohos.permission.CAMERA` 权限。
- `SurfaceId` 在 API 中类型为 `string`，通过 `XComponent` 的 `surfaceId` 事件或 `ImageReceiver` 获取。
