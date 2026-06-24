# 05 -- 定位服务 (Location)

## geoLocationManager.getLastLocation

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取上一次缓存的位置信息(同步) | `geoLocationManager.getLastLocation` | `import { geoLocationManager } from '@kit.LocationKit';` | `getLastLocation(): Location` | `let location = geoLocationManager.getLastLocation();` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

**需要权限**: `ohos.permission.APPROXIMATELY_LOCATION`。若位置开关关闭或未授权则抛出异常。返回的 `Location` 对象包含 `latitude`、`longitude`、`altitude`、`accuracy`、`speed`、`timeStamp`、`direction` 等字段。

---

## geoLocationManager.on('locationChange')

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 开启连续位置变化订阅并启动定位请求 | `geoLocationManager.on('locationChange')` | `import { geoLocationManager } from '@kit.LocationKit';` | `on(type: 'locationChange', request: LocationRequest \| ContinuousLocationRequest, callback: Callback<Location>): void` | `geoLocationManager.on('locationChange', requestInfo, locationChange);` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

**需要权限**: `ohos.permission.APPROXIMATELY_LOCATION`。`LocationRequest` 使用 `priority`/`scenario`/`timeInterval`/`distanceInterval`/`maxAccuracy` 控制定位行为；`ContinuousLocationRequest` (API 12+) 使用 `interval`/`locationScenario`。回调返回 `Callback<Location>`。

---

## geoLocationManager.off('locationChange')

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 关闭位置变化订阅并删除对应的定位请求 | `geoLocationManager.off('locationChange')` | `import { geoLocationManager } from '@kit.LocationKit';` | `off(type: 'locationChange', callback?: Callback<Location>): void` | `geoLocationManager.off('locationChange', locationChange);` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

**需要权限**: `ohos.permission.APPROXIMATELY_LOCATION`。`callback` 为可选参数；若不传则取消当前类型的所有订阅。

---

## geoLocationManager.getCurrentLocation

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取当前位置(单次定位)，支持 callback 和 Promise | `geoLocationManager.getCurrentLocation` | `import { geoLocationManager } from '@kit.LocationKit';` | `getCurrentLocation(request?: CurrentLocationRequest \| SingleLocationRequest): Promise<Location>` | `geoLocationManager.getCurrentLocation(requestInfo).then((result) => { ... });` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

**需要权限**: `ohos.permission.APPROXIMATELY_LOCATION`。提供三种调用形式：无参数、`CurrentLocationRequest` (含 `priority`/`scenario`/`maxAccuracy`/`timeoutMs`)、`SingleLocationRequest` (API 12+, 含 `locatingPriority`/`locatingTimeoutMs`)。返回值 `Location` 支持元服务 (API 11+)。

---

## geoLocationManager.isLocationEnabled

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 判断位置服务是否已开启(同步) | `geoLocationManager.isLocationEnabled` | `import { geoLocationManager } from '@kit.LocationKit';` | `isLocationEnabled(): boolean` | `let enabled = geoLocationManager.isLocationEnabled();` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

返回 `boolean`：`true` 表示位置信息开关已开启，`false` 表示已关闭。该接口支持元服务 (API 11+)。

---

## 模块备注

- `requestLocationPermission` 不是一个独立的 API；位置权限需要在 `module.json5` 中声明 `ohos.permission.APPROXIMATELY_LOCATION`(模糊定位) 和/或 `ohos.permission.LOCATION`(精确定位)，并通过 `@ohos.abilityAccessCtrl` 模块在运行时动态请求用户授权。
- Location Kit 仅支持 WGS-84 坐标系。
- 使用位置服务前需确保设备 "位置" 开关已打开，否则接口会抛出错误码 `3301100`。
- `getLastLocation` 为同步方法；`getCurrentLocation`、`on('locationChange')` 为异步。
- `on('locationChange')` 的 `LocationRequest` 中未设置 `scenario` 或 `priority` 时无法发起定位请求。
