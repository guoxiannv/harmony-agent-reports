# 05 — Audio Recording 语音录制

## @ohos.multimedia.audio

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 音频管理模块导入 | @ohos.multimedia.audio | `@kit.AudioKit` | `import { audio } from '@kit.AudioKit';` | `audio.getAudioManager()` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/01_模块描述.md` |

## AudioManager

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取音频管理器 | audio.getAudioManager | `import { audio } from '@kit.AudioKit'` | `getAudioManager(): AudioManager` | `let audioManager = audio.getAudioManager();` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/02_Functions.md` |
| 获取音频场景模式 | getAudioScene | `audio.AudioManager` | `getAudioScene(): Promise<AudioScene>` | `audioManager.getAudioScene().then(...)` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/04_Interface (AudioManager).md` |

## AudioCapturer

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建音频采集器 | audio.createAudioCapturer | `import { audio } from '@kit.AudioKit'` | `createAudioCapturer(options: AudioCapturerOptions): Promise<AudioCapturer>` | `audio.createAudioCapturer(options).then(data => {...})` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/02_Functions.md` |
| 获取音频采集器信息 | getCapturerInfo | `audio.AudioCapturer` | `getCapturerInfo(): Promise<AudioCapturerInfo>` | `audioCapturer.getCapturerInfo().then(...)` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/03_Interface (AudioCapturer).md` |
| 音频采集器状态（只读属性） | state | `audio.AudioCapturer` | `state: AudioState`（只读） | `let state: audio.AudioState = audioCapturer.state;` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/03_Interface (AudioCapturer).md` |

## AudioCapturerOptions

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 音频采集器配置选项 | AudioCapturerOptions | `import { audio } from '@kit.AudioKit'` | `{ streamInfo: AudioStreamInfo, capturerInfo: AudioCapturerInfo, playbackCaptureConfig?: AudioPlaybackCaptureConfig }` | `let opts: audio.AudioCapturerOptions = { streamInfo: {...}, capturerInfo: { source: audio.SourceType.SOURCE_TYPE_MIC, capturerFlags: 0 } };` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/13_Interfaces (其他).md` |

## AudioVolumeType

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 音频音量类型枚举 | AudioVolumeType | `import { audio } from '@kit.AudioKit'` | 枚举值: VOICE_CALL=0, RINGTONE=2, MEDIA=3, ALARM=4, ACCESSIBILITY=5, VOICE_ASSISTANT=9 | `audio.AudioVolumeType.MEDIA` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/14_Enums.md` |

## AudioRenderer

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建音频渲染器 | audio.createAudioRenderer | `import { audio } from '@kit.AudioKit'` | `createAudioRenderer(options: AudioRendererOptions): Promise<AudioRenderer>` | `audio.createAudioRenderer(options).then(data => {...})` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/02_Functions.md` |
| 获取渲染器信息 | getRendererInfo | `audio.AudioRenderer` | `getRendererInfo(): Promise<AudioRendererInfo>` | `audioRenderer.getRendererInfo().then(...)` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/05_Interface (AudioRenderer).md` |
| 音频渲染器状态（只读属性） | state | `audio.AudioRenderer` | `state: AudioState`（只读） | `let state: audio.AudioState = audioRenderer.state;` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/05_Interface (AudioRenderer).md` |

## AudioRendererOptions

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 音频渲染器配置选项 | AudioRendererOptions | `import { audio } from '@kit.AudioKit'` | `{ streamInfo: AudioStreamInfo, rendererInfo: AudioRendererInfo, privacyType?: AudioPrivacyType }` | `let opts: audio.AudioRendererOptions = { streamInfo: {...}, rendererInfo: { usage: audio.StreamUsage.STREAM_USAGE_MUSIC, rendererFlags: 0 } };` | `04_媒体/01_Audio Kit（音频服务）/01_ArkTS API/01_ohos.multimedia.audio (音频管理)/13_Interfaces (其他).md` |

## @ohos.multimedia.media

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 媒体管理模块导入 | @ohos.multimedia.media | `@kit.MediaKit` | `import { media } from '@kit.MediaKit';` | `media.createAVRecorder()` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/01_模块描述.md` |

## AVRecorder

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建音视频录制实例 | media.createAVRecorder | `import { media } from '@kit.MediaKit'` | `createAVRecorder(): Promise<AVRecorder>` | `media.createAVRecorder().then(recorder => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/02_Functions.md` |
| 音视频录制参数设置 | prepare | `media.AVRecorder` | `prepare(config: AVRecorderConfig): Promise<void>` | `avRecorder.prepare(config).then(() => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 开始录制 | start | `media.AVRecorder` | `start(): Promise<void>` | `avRecorder.start().then(() => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 暂停录制 | pause | `media.AVRecorder` | `pause(): Promise<void>` | `avRecorder.pause().then(() => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 恢复录制 | resume | `media.AVRecorder` | `resume(): Promise<void>` | `avRecorder.resume().then(() => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 停止录制 | stop | `media.AVRecorder` | `stop(): Promise<void>` | `avRecorder.stop().then(() => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 重置录制 | reset | `media.AVRecorder` | `reset(): Promise<void>` | `avRecorder.reset().then(() => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 释放录制资源 | release | `media.AVRecorder` | `release(): Promise<void>` | `avRecorder.release().then(() => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 获取当前音频最大振幅 | getAudioCapturerMaxAmplitude | `media.AVRecorder` | `getAudioCapturerMaxAmplitude(): Promise<number>` | `avRecorder.getAudioCapturerMaxAmplitude().then(amp => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 订阅录制状态变化 | on('stateChange') | `media.AVRecorder` | `on(type: 'stateChange', callback: OnAVRecorderStateChangeHandler): void` | `avRecorder.on('stateChange', (state, reason) => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |
| 订阅录制错误事件 | on('error') | `media.AVRecorder` | `on(type: 'error', callback: ErrorCallback): void` | `avRecorder.on('error', (err) => {...})` | `04_媒体/07_Media Kit（媒体服务）/01_ArkTS API/01_ohos.multimedia.media (媒体服务)/06_Interface (AVRecorder).md` |

## 模块说明

- 语音录制推荐使用 `AVRecorder`（`@kit.MediaKit`），它提供高级封装（prepare/start/stop），支持音频编码为 AAC/MP3/G711MU/AMR-NB/AMR-WB，输出格式为 MP4/M4A/MP3/WAV/AMR/AAC。
- `AudioCapturer`（`@kit.AudioKit`）提供底层的 PCM 音频数据采集能力，适用于需要直接获取原始 PCM 数据的场景。
- `AudioVolumeType` 用于音量调节场景，为 `@ohos.multimedia.audio` 模块中的枚举。
- `AudioRingtone` 在当前本地文档中未找到确切引用——铃声设置能力通过 `@kit.RingtoneKit` 的 `ringtone.startRingtoneSetting()` 和 `RingtoneType` 实现。
- `AudioCapturerOptions` 和 `AudioRendererOptions` 是 `@ohos.multimedia.audio` 模块中的 interface 类型，分别用于配置 `createAudioCapturer` 和 `createAudioRenderer` 的参数。
- 音频采集需申请 `ohos.permission.MICROPHONE` 权限。
