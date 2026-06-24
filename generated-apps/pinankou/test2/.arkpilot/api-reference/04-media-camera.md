# 04 — 相机与媒体 Camera Media

## CameraManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机管理核心类，获取相机列表、创建 Session、控制输出 | `camera.CameraManager` | `import { camera } from '@kit.CameraKit'` | `camera.getCameraManager(context: Context): CameraManager` | `let cameraManager = camera.getCameraManager(context); let cameras = cameraManager.getSupportedCameras(); let session = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/01_ohos.multimedia.camera (相机管理)/10_Interface (CameraManager).md` |

## PhotoViewPicker (ImagePicker)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图库选择器，拉起系统相册选择图片/视频 | `photoAccessHelper.PhotoViewPicker` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `new PhotoViewPicker().select(option?: PhotoSelectOptions): Promise<PhotoSelectResult>` | `let photoPicker = new photoAccessHelper.PhotoViewPicker(); let result = await photoPicker.select({ MIMEType: photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE, maxSelectNumber: 5 });` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/06_Class (PhotoViewPicker).md` |
| 相机内拍照选择器，快速拍照/录制 | `cameraPicker.pick` | `import { cameraPicker } from '@kit.CameraKit'` | `cameraPicker.pick(context: Context, mediaTypes: Array<PickerMediaType>, pickerProfile: PickerProfile): Promise<PickerResult>` | `let result = await cameraPicker.pick(context, [cameraPicker.PickerMediaType.PHOTO], { cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK });` | `04_媒体/04_Camera Kit（相机服务）/01_ArkTS API/02_ohos.multimedia.cameraPicker (相机选择器).md` |

## ImagePacker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片压缩和编码（JPEG/WebP/PNG/HEIC/GIF） | `image.ImagePacker` | `import { image } from '@kit.ImageKit'` | `image.createImagePacker(): ImagePacker; packToData(source: ImageSource \| PixelMap, options: PackingOption): Promise<ArrayBuffer>` | `let packer = image.createImagePacker(); let data = await packer.packToData(pixelMap, { format: "image/jpeg", quality: 98 });` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |

## AudioCapturer
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 音频采集器，录制原始 PCM 音频数据 | `audio.AudioCapturer` | `import { audio } from '@kit.AudioKit'` | `audio.createAudioCapturer(options: AudioCapturerOptions): Promise<AudioCapturer>` | `let capturer = await audio.createAudioCapturer({ streamInfo: { samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, channels: audio.AudioChannel.CHANNEL_2, sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW }, capturerInfo: { source: audio.SourceType.SOURCE_TYPE_MIC, capturerFlags: 0 } });` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/03_Interface (AudioCapturer).md` |

## AVRecorder (AudioRecorder 替代)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 音视频录制管理类（替代已废弃的 AudioRecorder） | `media.AVRecorder` | `import { media } from '@kit.MediaKit'` | `media.createAVRecorder(): Promise<AVRecorder>; avRecorder.prepare(config: AVRecorderConfig, callback: AsyncCallback<void>): void; avRecorder.start(): void; avRecorder.stop(): void; avRecorder.release(): void;` | `let avRecorder = await media.createAVRecorder(); avRecorder.prepare({ audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC, profile: { audioBitrate: 48000, audioChannels: 2, audioCodec: media.CodecMimeType.AUDIO_AAC, audioSampleRate: 48000, fileFormat: media.ContainerFormatType.CFT_MPEG_4 }, url: 'fd://...' }, (err) => { if (!err) avRecorder.start(); });` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |

## photoAccessHelper
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相册管理模块，获取图库资源 | `photoAccessHelper.PhotoAccessHelper` | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | `photoAccessHelper.getPhotoAccessHelper(context: Context): PhotoAccessHelper; phAccessHelper.getAssets(options: FetchOptions): Promise<FetchResult<PhotoAsset>>` | `let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context); let fetchResult = await phAccessHelper.getAssets({ fetchColumns: [], predicates: new dataSharePredicates.DataSharePredicates() });` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

## 模块备注

- 原始的 `AudioRecorder`（位于 `@ohos.multimedia.media`）已在 API 9 废弃，推荐使用 `media.AVRecorder` 替代。
- 如果应用仅需快速拍照/录制，推荐使用 `cameraPicker.pick` 拉起系统相机选择器，无需申请 `ohos.permission.CAMERA` 权限。
- `PhotoViewPicker` 通过 `select()` 返回的 `photoUris` 具有永久授权，可直接传入 `getAssets()` 使用。
- `cameraPicker` 返回的 URI 不含永久授权，需及时使用。
- `AudioCapturer` 创建时需要申请 `ohos.permission.MICROPHONE` 权限。
