# 03 — Image Encoding (图片编码)

## @ohos.multimedia.image — ImagePacker (image.Packer)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建图片编码器实例 | image.createImagePacker | `import { image } from '@kit.ImageKit';` | `createImagePacker(): ImagePacker` | `const imagePackerObj: image.ImagePacker = image.createImagePacker();` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/02_Functions.md` |
| 将 ImageSource 编码为 ArrayBuffer | packToData (ImagePacker 方法) | `import { image } from '@kit.ImageKit';` | `packToData(source: ImageSource, options: PackingOption): Promise<ArrayBuffer>` | `imagePackerObj.packToData(imageSourceObj, { format: "image/jpeg", quality: 98 }).then(data => { ... })` | `04_媒体/06_Image Kit（图片处理服务）/01_ArkTS API/01_ohos.multimedia.image (图片处理)/06_Interface (ImagePacker).md` |
| 将 PixelMap 编码为 ArrayBuffer | packToData (ImagePacker 方法) | `import { image } from '@kit.ImageKit';` | `packToData(source: PixelMap, options: PackingOption): Promise<ArrayBuffer>` | `imagePackerObj.packToData(pixelMap, { format: "image/jpeg", quality: 98 }).then(data => { ... })` | `06_Interface (ImagePacker).md` |
| 将 Picture 编码为 ArrayBuffer | packing (ImagePacker 方法) | `import { image } from '@kit.ImageKit';` | `packing(picture: Picture, options: PackingOption): Promise<ArrayBuffer>` | `await imagePackerObj.packing(pictureObj, { format: "image/jpeg", quality: 98, desiredDynamicRange: image.PackingDynamicRange.AUTO })` | `06_Interface (ImagePacker).md` |
| 将 ImageSource 编码写入文件 | packToFile (ImagePacker 方法) | `import { image } from '@kit.ImageKit';` | `packToFile(source: ImageSource, fd: number, options: PackingOption): Promise<void>` | `imagePackerObj.packToFile(imageSourceObj, file.fd, packOpts)` | `06_Interface (ImagePacker).md` |
| 将 PixelMap 编码写入文件 | packToFile (ImagePacker 方法) | `import { image } from '@kit.ImageKit';` | `packToFile(source: PixelMap, fd: number, options: PackingOption): Promise<void>` | `imagePackerObj.packToFile(pixelmap, file.fd, packOpts)` | `06_Interface (ImagePacker).md` |
| 将多个 PixelMap 编码为 GIF 数据 | packToDataFromPixelmapSequence (ImagePacker 方法) | `import { image } from '@kit.ImageKit';` | `packToDataFromPixelmapSequence(pixelmapSequence: Array<PixelMap>, options: PackingOptionsForSequence): Promise<ArrayBuffer>` | `packer.packToDataFromPixelmapSequence(pixelMapList, { frameCount: 3, delayTimeList: [10,10,10], loopCount: 0 })` | `06_Interface (ImagePacker).md` |
| 将多个 PixelMap 编码为 GIF 文件 | packToFileFromPixelmapSequence (ImagePacker 方法) | `import { image } from '@kit.ImageKit';` | `packToFileFromPixelmapSequence(pixelmapSequence: Array<PixelMap>, fd: number, options: PackingOptionsForSequence): Promise<void>` | `packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops)` | `06_Interface (ImagePacker).md` |
| 获取编码支持的格式列表 | getImagePackerSupportedFormats | `import { image } from '@kit.ImageKit';` | `getImagePackerSupportedFormats(): string[]` | `let formats = image.getImagePackerSupportedFormats();` | `02_Functions.md` |
| 释放 ImagePacker 实例 | release (ImagePacker 方法) | `import { image } from '@kit.ImageKit';` | `release(): Promise<void>` | `imagePackerObj.release().then(() => { ... })` | `06_Interface (ImagePacker).md` |
| 编码参数配置 | PackingOption | `import { image } from '@kit.ImageKit';` | `{ format: string, quality: number, desiredDynamicRange?: PackingDynamicRange, needsPackProperties?: boolean }` | `let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }` | `06_Interface (ImagePacker).md` |

## @ohos.multimedia.image — ImageSource (image.ImageSource)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过文件路径创建 ImageSource | image.createImageSource (uri) | `import { image } from '@kit.ImageKit';` | `createImageSource(uri: string): ImageSource` | `const imageSourceObj: image.ImageSource = image.createImageSource(context.filesDir + "/test.jpg");` | `02_Functions.md` |
| 通过文件路径+SourceOptions创建 ImageSource | image.createImageSource (uri, options) | `import { image } from '@kit.ImageKit';` | `createImageSource(uri: string, options: SourceOptions): ImageSource` | `image.createImageSource(path, { sourceDensity: 120 })` | `02_Functions.md` |
| 通过文件描述符创建 ImageSource | image.createImageSource (fd) | `import { image } from '@kit.ImageKit';` | `createImageSource(fd: number): ImageSource` | `image.createImageSource(file.fd)` | `02_Functions.md` |
| 通过 ArrayBuffer 创建 ImageSource | image.createImageSource (buf) | `import { image } from '@kit.ImageKit';` | `createImageSource(buf: ArrayBuffer): ImageSource` | `const imageSourceObj: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer);` | `02_Functions.md` |
| 通过 RawFileDescriptor 创建 ImageSource | image.createImageSource (rawfile) | `import { image } from '@kit.ImageKit';` | `createImageSource(rawfile: resourceManager.RawFileDescriptor, options?: SourceOptions): ImageSource` | `image.createImageSource(rawFileDescriptor)` | `02_Functions.md` |
| 增量方式创建 ImageSource | image.CreateIncrementalSource | `import { image } from '@kit.ImageKit';` | `CreateIncrementalSource(buf: ArrayBuffer, options?: SourceOptions): ImageSource` | `const imageSource = image.CreateIncrementalSource(new ArrayBuffer(size));` | `02_Functions.md` |
| 获取图片信息 | getImageInfo (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `getImageInfo(index?: number): Promise<ImageInfo>` | `imageSourceObj.getImageInfo(0).then(info => { ... })` | `08_Interface (ImageSource).md` |
| 同步获取图片信息 | getImageInfoSync (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `getImageInfoSync(index?: number): ImageInfo` | `let imageInfo = imageSource.getImageInfoSync(0);` | `08_Interface (ImageSource).md` |
| 将图片解码为 PixelMap | createPixelMap (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `createPixelMap(options?: DecodingOptions): Promise<PixelMap>` | `imageSourceObj.createPixelMap().then(pixelMap => { ... })` | `08_Interface (ImageSource).md` |
| 同步将图片解码为 PixelMap | createPixelMapSync (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `createPixelMapSync(options?: DecodingOptions): PixelMap` | `let pixelmap = imageSource.createPixelMapSync(decodingOptions);` | `08_Interface (ImageSource).md` |
| 将动图解码为 PixelMap 数组 | createPixelMapList (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `createPixelMapList(options?: DecodingOptions): Promise<Array<PixelMap>>` | `imageSourceObj.createPixelMapList(decodeOpts).then(list => { ... })` | `08_Interface (ImageSource).md` |
| 将图片解码为 Picture 对象 | createPicture (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `createPicture(options?: DecodingOptionsForPicture): Promise<Picture>` | `let pictureObj = await imageSourceObj.createPicture(options);` | `08_Interface (ImageSource).md` |
| 指定内存类型解码 PixelMap | createPixelMapUsingAllocator (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `createPixelMapUsingAllocator(options?: DecodingOptions, allocatorType?: AllocatorType): Promise<PixelMap>` | `imageSource.createPixelMapUsingAllocator(decodingOptions, image.AllocatorType.AUTO)` | `08_Interface (ImageSource).md` |
| 获取图片帧数 | getFrameCount (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `getFrameCount(): Promise<number>` | `imageSourceObj.getFrameCount().then(count => { ... })` | `08_Interface (ImageSource).md` |
| 获取指定 Exif 属性值 | getImageProperty (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `getImageProperty(key: PropertyKey, options?: ImagePropertyOptions): Promise<string>` | `imageSourceObj.getImageProperty(image.PropertyKey.BITS_PER_SAMPLE, options)` | `08_Interface (ImageSource).md` |
| 修改指定 Exif 属性值 | modifyImageProperty (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `modifyImageProperty(key: PropertyKey, value: string): Promise<void>` | `imageSourceObj.modifyImageProperty(image.PropertyKey.IMAGE_WIDTH, "120")` | `08_Interface (ImageSource).md` |
| 批量修改 Exif 属性 | modifyImagePropertiesEnhanced (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `modifyImagePropertiesEnhanced(records: Record<string, string | null>): Promise<void>` | `imageSourceObj.modifyImagePropertiesEnhanced({ "ImageWidth": "1024" })` | `08_Interface (ImageSource).md` |
| 释放 ImageSource 实例 | release (ImageSource 方法) | `import { image } from '@kit.ImageKit';` | `release(): Promise<void>` | `imageSourceObj.release().then(() => { ... })` | `08_Interface (ImageSource).md` |
| 支持的格式列表 (属性) | supportedFormats (ImageSource 属性) | `import { image } from '@kit.ImageKit';` | `supportedFormats: Array<string>` | `console.info(imageSource.supportedFormats)` | `08_Interface (ImageSource).md` |

## @ohos.multimedia.image — PixelMap (image.PixelMap)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过像素数据创建 PixelMap (Promise) | image.createPixelMap | `import { image } from '@kit.ImageKit';` | `createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>` | `image.createPixelMap(color, opts).then(pixelMap => { ... })` | `02_Functions.md` |
| 通过像素数据创建 PixelMap (同步) | image.createPixelMapSync | `import { image } from '@kit.ImageKit';` | `createPixelMapSync(colors: ArrayBuffer, options: InitializationOptions): PixelMap` | `let pixelMap = image.createPixelMapSync(color, opts);` | `02_Functions.md` |
| 通过像素数据和属性创建 PixelMap (新推荐) | image.createPixelMapFromPixels | `import { image } from '@kit.ImageKit';` | `createPixelMapFromPixels(pixels: ArrayBuffer, param: InitializationOptions): Promise<PixelMap>` | `image.createPixelMapFromPixels(pixels, config).then(pixelMap => { ... })` | `02_Functions.md` |
| 创建空白 PixelMap | image.createEmptyPixelMap | `import { image } from '@kit.ImageKit';` | `createEmptyPixelMap(param: InitializationOptions): PixelMap` | `const pixelMap = image.createEmptyPixelMap({ size: {width:6,height:4}, pixelFormat: image.PixelMapFormat.RGBA_8888, editable: true });` | `02_Functions.md` |
| 读取 PixelMap 全部像素数据到缓冲区 | readPixelsToBuffer (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `readPixelsToBuffer(dst: ArrayBuffer): Promise<void>` | `pixelMap.readPixelsToBuffer(readBuffer).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 读取 PixelMap 指定区域像素数据 | readPixels (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `readPixels(area: PositionArea): Promise<void>` | `pixelMap.readPixels(area).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 写入像素数据到 PixelMap 指定区域 | writePixels (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `writePixels(area: PositionArea): Promise<void>` | `pixelMap.writePixels(area).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 从缓冲区写入像素数据到 PixelMap | writeBufferToPixels (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `writeBufferToPixels(src: ArrayBuffer): Promise<void>` | `pixelMap.writeBufferToPixels(color).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 获取图像像素信息 | getImageInfo (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `getImageInfo(): Promise<ImageInfo>` | `pixelMap.getImageInfo().then(info => { ... })` | `15_Interface (PixelMap).md` |
| 缩放图片 | scale (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `scale(x: number, y: number): Promise<void>` | `pixelMap.scale(2.0, 1.0).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 创建缩放后的新 PixelMap | createScaledPixelMap (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `createScaledPixelMap(x: number, y: number, level?: AntiAliasingLevel): Promise<PixelMap>` | `pixelMap.createScaledPixelMap(2.0, 1.0, image.AntiAliasingLevel.LOW)` | `15_Interface (PixelMap).md` |
| 旋转图片 | rotate (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `rotate(angle: number): Promise<void>` | `pixelMap.rotate(90.0).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 裁剪图片 | crop (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `crop(region: Region): Promise<void>` | `pixelMap.crop({ x:0, y:0, size:{height:100,width:100} }).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 翻转图片 | flip (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `flip(horizontal: boolean, vertical: boolean): Promise<void>` | `pixelMap.flip(true, false).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 平移图片 | translate (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `translate(x: number, y: number): Promise<void>` | `pixelMap.translate(50.0, 10.0).then(() => { ... })` | `15_Interface (PixelMap).md` |
| 释放 PixelMap 对象 | release (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `release(): Promise<void>` | `pixelMap.release().then(() => { ... })` | `15_Interface (PixelMap).md` |
| 通过 Surface ID 创建 PixelMap | image.createPixelMapFromSurface | `import { image } from '@kit.ImageKit';` | `createPixelMapFromSurface(surfaceId: string): Promise<PixelMap>` | `image.createPixelMapFromSurface(surfaceId).then(pixelMap => { ... })` | `02_Functions.md` |
| PixelMap 序列化到 MessageSequence | marshalling (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `marshalling(sequence: rpc.MessageSequence): void` | `pixelMap.marshalling(messageSequence)` | `15_Interface (PixelMap).md` |
| PixelMap 反序列化 | unmarshalling (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `unmarshalling(sequence: rpc.MessageSequence): Promise<PixelMap>` | `pixelParcel.unmarshalling(messageSequence).then(pixelMap => { ... })` | `15_Interface (PixelMap).md` |
| 获取像素总字节数 | getPixelBytesNumber (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `getPixelBytesNumber(): number` | `let pixelBytesNumber = pixelMap.getPixelBytesNumber();` | `15_Interface (PixelMap).md` |
| 获取每行字节数 | getBytesNumberPerRow (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `getBytesNumberPerRow(): number` | `let rowCount = pixelMap.getBytesNumberPerRow();` | `15_Interface (PixelMap).md` |
| 拷贝 PixelMap | clone (PixelMap 方法) | `import { image } from '@kit.ImageKit';` | `clone(): Promise<PixelMap>` | `pixelMap.clone().then(clonePixelMap => { ... })` | `15_Interface (PixelMap).md` |

## 模块说明

- 所有 API 均通过 `import { image } from '@kit.ImageKit';` 导入。
- **内存管理**：ImagePacker、ImageSource、PixelMap 使用后必须调用 `release()` 释放内存，释放前需确保所有异步方法执行完成。
- **编码支持的格式** (ImagePacker)：jpeg、webp、png、heic（12+）、gif（18+），可通过 `imagePacker.supportedFormats` 查询。
- **解码支持的格式** (ImageSource)：PNG、JPEG、BMP、GIF、WebP、DNG、HEIC（12+）、WBMP（23+）、HEIFS（23+）、TIFF（23+）、AVIF（26.0.0+）、AVIS（26.0.0+）。
- **PixelMap 序列化限制**：最大 128MB，超过会送显失败。大小计算方式：宽 * 高 * 每像素占用字节数。
- **Packer 注意事项**：编码期间避免修改或释放作为输入的 ImageSource/PixelMap/Picture 对象。如果返回 401 错误码，可能是 PixelMap 对象被提前释放。
- API version 13 起推荐使用 `packToData` 替代已废弃的 `packing`。
- API version 15 起推荐使用 `createPixelMapUsingAllocator` 以指定输出内存类型。
- API version 26.0.0 起推荐使用 `createPixelMapFromPixels` 替代旧版 `createPixelMap`。
