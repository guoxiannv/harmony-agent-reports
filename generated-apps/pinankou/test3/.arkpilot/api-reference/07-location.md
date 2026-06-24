# 07 — Location 位置服务

## @ohos.geoLocationManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位置服务模块导入（GNSS定位、网络定位、地理/逆地理编码、国家码、地理围栏） | @ohos.geoLocationManager | `import { geoLocationManager } from '@kit.LocationKit'` | 位置服务提供 GNSS 定位、网络定位（蜂窝基站、WLAN、蓝牙）、地理编码、逆地理编码、国家码和地理围栏等功能。本模块首批接口从 API version 9 开始支持。仅支持 WGS-84 坐标系。 | `import { geoLocationManager } from '@kit.LocationKit';` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## geoLocationManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位置服务命名空间，提供定位、地理编码、围栏等功能 | geoLocationManager | `import { geoLocationManager } from '@kit.LocationKit'` | 同模块导入后使用 `geoLocationManager.xxx` 调用所有方法 | `import { geoLocationManager } from '@kit.LocationKit';` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## geoLocationManager.on('locationChange')
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 开启位置变化订阅，并发起持续定位请求 | `geoLocationManager.on('locationChange')` | `import { geoLocationManager } from '@kit.LocationKit'` | `on(type: 'locationChange', request: LocationRequest \| ContinuousLocationRequest, callback: Callback<Location>): void` | `let request = { priority: geoLocationManager.LocationRequestPriority.FIRST_FIX, scenario: geoLocationManager.LocationRequestScenario.UNSET, timeInterval: 1, distanceInterval: 0, maxAccuracy: 0 }; geoLocationManager.on('locationChange', request, (location) => { ... });` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## geoLocationManager.getCurrentLocation
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取当前位置（支持 callback 和 Promise 两种异步模式） | `geoLocationManager.getCurrentLocation` | `import { geoLocationManager } from '@kit.LocationKit'` | `getCurrentLocation(request?: CurrentLocationRequest \| SingleLocationRequest): Promise<Location>` / `getCurrentLocation(request: CurrentLocationRequest \| SingleLocationRequest, callback: AsyncCallback<Location>): void` | `let request = { priority: geoLocationManager.LocationRequestPriority.FIRST_FIX, scenario: geoLocationManager.LocationRequestScenario.UNSET, maxAccuracy: 0 }; geoLocationManager.getCurrentLocation(request).then((location) => { ... });` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## geoLocationManager.getLastLocation
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取上一次缓存的位置信息（同步方法） | `geoLocationManager.getLastLocation` | `import { geoLocationManager } from '@kit.LocationKit'` | `getLastLocation(): Location` | `try { let location = geoLocationManager.getLastLocation(); } catch (err) { ... }` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## LocationRequest
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位置信息请求参数（持续定位用），支持 priority/scenario/timeInterval/distanceInterval/maxAccuracy | LocationRequest | `import { geoLocationManager } from '@kit.LocationKit'` | `interface LocationRequest { priority?: LocationRequestPriority; scenario?: LocationRequestScenario; timeInterval?: number; distanceInterval?: number; maxAccuracy?: number; }` | `let request: geoLocationManager.LocationRequest = { priority: geoLocationManager.LocationRequestPriority.FIRST_FIX, scenario: geoLocationManager.LocationRequestScenario.UNSET, timeInterval: 1, distanceInterval: 0, maxAccuracy: 0 };` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## CurrentLocationRequest
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 当前位置请求参数（单次定位用），支持 priority/scenario/maxAccuracy/timeoutMs | CurrentLocationRequest | `import { geoLocationManager } from '@kit.LocationKit'` | `interface CurrentLocationRequest { priority?: LocationRequestPriority; scenario?: LocationRequestScenario; maxAccuracy?: number; timeoutMs?: number; }` | `let request: geoLocationManager.CurrentLocationRequest = { priority: geoLocationManager.LocationRequestPriority.FIRST_FIX, scenario: geoLocationManager.LocationRequestScenario.UNSET, maxAccuracy: 0 };` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## Location
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 位置信息结构体，包含纬度、经度、海拔、精度、速度、方向、时间戳等 | Location | `import { geoLocationManager } from '@kit.LocationKit'` | `interface Location { latitude: number; longitude: number; altitude: number; accuracy: number; speed: number; timeStamp: number; direction: number; timeSinceBoot: number; additions?: string[]; additionSize?: number; ... }` | `let loc: geoLocationManager.Location = { latitude: 31.12, longitude: 121.11, altitude: 0, accuracy: 0, speed: 0, timeStamp: 0, direction: 0, timeSinceBoot: 0, additionSize: 0 };` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |

## 模块说明
- 所有 API 位于同一模块文件 `01_ohos.geoLocationManager (位置服务).md` 中。
- 导入语句：`import { geoLocationManager } from '@kit.LocationKit'`。
- 需要权限：单次定位和持续定位至少需要 `ohos.permission.APPROXIMATELY_LOCATION`；获取精确位置需同时申请 `ohos.permission.APPROXIMATELY_LOCATION` 和 `ohos.permission.LOCATION`。
- 定位前需确保设备"位置"开关已开启，否则会抛出错误码 `3301100`。
- 本模块仅支持 WGS-84 坐标系。
- API version 12+ 新增 `SingleLocationRequest`、`ContinuousLocationRequest`、`LocatingPriority`、`UserActivityScenario`、`PowerConsumptionScenario` 等类型。
