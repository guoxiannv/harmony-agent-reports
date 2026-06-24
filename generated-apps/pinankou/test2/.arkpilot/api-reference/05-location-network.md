# 05 — 定位与网络 Location Network

## geoLocationManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位置服务（GNSS/网络定位/地理编码/逆地理编码/国家码/地理围栏） | @ohos.geoLocationManager | `import { geoLocationManager } from '@kit.LocationKit';` | `getCurrentLocation(request: CurrentLocationRequest \| SingleLocationRequest, callback: AsyncCallback<Location>): void` | `geoLocationManager.getCurrentLocation(requestInfo, (err, location) => { ... });` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |
| 订阅持续位置变化 | @ohos.geoLocationManager.on('locationChange') | `import { geoLocationManager } from '@kit.LocationKit';` | `on(type: 'locationChange', request: LocationRequest \| ContinuousLocationRequest, callback: Callback<Location>): void` | `geoLocationManager.on('locationChange', requestInfo, locationChange);` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |
| 获取最后已知位置 | @ohos.geoLocationManager.getLastLocation | `import { geoLocationManager } from '@kit.LocationKit';` | `getLastLocation(callback: AsyncCallback<Location>): void` | `geoLocationManager.getLastLocation((err, location) => { ... });` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## geocoder
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 逆地理编码（坐标转地址） | geoLocationManager.getAddressesFromLocation | `import { geoLocationManager } from '@kit.LocationKit';` | `getAddressesFromLocation(request: ReverseGeoCodeRequest, callback: AsyncCallback<Array<GeoAddress>>): void` | `geoLocationManager.getAddressesFromLocation({latitude:31.12, longitude:121.11, maxItems:1}, (err, data) => { ... });` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |
| 地理编码（地址转坐标） | geoLocationManager.getAddressesFromLocationName | `import { geoLocationManager } from '@kit.LocationKit';` | `getAddressesFromLocationName(request: GeoCodeRequest, callback: AsyncCallback<Array<GeoAddress>>): void` | `geoLocationManager.getAddressesFromLocationName({description:"上海市浦东新区xx路xx号", maxItems:1}, (err, data) => { ... });` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |
| 判断地理编码服务是否可用 | geoLocationManager.isGeocoderAvailable | `import { geoLocationManager } from '@kit.LocationKit';` | `isGeocoderAvailable(): boolean` | `if (geoLocationManager.isGeocoderAvailable()) { ... }` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## http
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| HTTP数据请求（GET/POST等） | @ohos.net.http | `import { http } from '@kit.NetworkKit';` | `http.createHttp(): HttpRequest` | `let httpRequest = http.createHttp(); httpRequest.request("EXAMPLE_URL", options, (err, data) => { ... });` | `03_系统/02_网络/04_Network Kit（网络服务）/01_ArkTS API/03_ohos.net.http (数据请求).md` |
| HTTP请求（带选项，callback方式） | http.request | `import { http } from '@kit.NetworkKit';` | `request(url: string, options: HttpRequestOptions, callback: AsyncCallback<HttpResponse>): void` | `httpRequest.request("url", { method: http.RequestMethod.POST, extraData: 'data', header: { 'Accept': 'application/json' } }, callback);` | `03_系统/02_网络/04_Network Kit（网络服务）/01_ArkTS API/03_ohos.net.http (数据请求).md` |
| HTTP请求（Promise方式） | http.request | `import { http } from '@kit.NetworkKit';` | `request(url: string, options?: HttpRequestOptions): Promise<HttpResponse>` | `httpRequest.request("url").then((data) => { ... }).catch((err) => { ... });` | `03_系统/02_网络/04_Network Kit（网络服务）/01_ArkTS API/03_ohos.net.http (数据请求).md` |

## request (upload download)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 上传文件 | request.uploadFile | `import { request } from '@kit.BasicServicesKit';` | `uploadFile(context: BaseContext, config: UploadConfig): Promise<UploadTask>` | `request.uploadFile(context, { url: '...', files: [{ filename: "test", uri: "internal://cache/test.jpg", type: "image/jpeg" }] }).then(task => { ... });` | `03_系统/03_基础功能/01_Basic Services Kit（基础服务）/01_ArkTS API/03_数据文件处理/05_ohos.request (上传下载).md` |
| 下载文件 | request.downloadFile | `import { request } from '@kit.BasicServicesKit';` | `downloadFile(context: BaseContext, config: DownloadConfig): Promise<DownloadTask>` | `request.downloadFile(context, { url: 'https://xxxx/xxxx.hap' }).then(task => { ... });` | `03_系统/03_基础功能/01_Basic Services Kit（基础服务）/01_ArkTS API/03_数据文件处理/05_ohos.request (上传下载).md` |
| 订阅上传进度 | UploadTask.on('progress') | `import { request } from '@kit.BasicServicesKit';` | `on(type: 'progress', callback: (uploadedSize: number, totalSize: number) => void): void` | `uploadTask.on('progress', (uploadedSize, totalSize) => { ... });` | `03_系统/03_基础功能/01_Basic Services Kit（基础服务）/01_ArkTS API/03_数据文件处理/05_ohos.request (上传下载).md` |
| 订阅下载进度 | DownloadTask.on('progress') | `import { request } from '@kit.BasicServicesKit';` | `on(type: 'progress', callback: (receivedSize: number, totalSize: number) => void): void` | `downloadTask.on('progress', (receivedSize, totalSize) => { ... });` | `03_系统/03_基础功能/01_Basic Services Kit（基础服务）/01_ArkTS API/03_数据文件处理/05_ohos.request (上传下载).md` |

## Module Notes

- **geocoder 不是独立模块**：地理编码和逆地理编码能力集成在 `@ohos.geoLocationManager` 中，通过 `getAddressesFromLocation`（逆地理编码，坐标->地址）和 `getAddressesFromLocationName`（地理编码，地址->坐标）提供。没有独立的 `@ohos.geocoder` 包。
- **geoLocationManager** 支持 WGS-84 坐标系（API 9+），从 API version 12 起增加 GCJ-02 坐标系支持（仅地理围栏）。
- **http** 数据请求最大接收量：API 23 之前为 5MB，API 23 之后为 50MB。上传/下载大文件应使用 `request` 模块或 `requestInStream`。
- **request** 模块的 `uploadFile` 和 `downloadFile` 均需传入 `BaseContext`（推荐通过 `this.getUIContext().getHostContext()` 获取 UIAbilityContext），且仅 Stage 模型支持。旧 `upload`/`download` 接口（无 context 参数）自 API 9 起废弃。
- **request** 模块暂不支持在 Extension 中调用。
