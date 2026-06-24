# 04 — Location (位置服务)

## @ohos.geoLocationManager (位置服务)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 持续定位：订阅位置变化 | geoLocationManager.on('locationChange') | `import { geoLocationManager } from '@kit.LocationKit'` | `on(type: 'locationChange', request: LocationRequest \| ContinuousLocationRequest, callback: Callback<Location>): void` | `geoLocationManager.on('locationChange', requestInfo, locationChange);` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/01_ohos.geoLocationManager (位置服务).md` |
| 单次定位：获取当前位置 | geoLocationManager.getCurrentLocation | 同上 | `getCurrentLocation(request?: CurrentLocationRequest \| SingleLocationRequest): Promise<Location>` | `geoLocationManager.getCurrentLocation(requestInfo).then((result) => { ... });` | 同上 |
| 获取上一次缓存位置 | geoLocationManager.getLastLocation | 同上 | `getLastLocation(): Location` | `let location = geoLocationManager.getLastLocation();` | 同上 |
| 判断位置服务开关 | geoLocationManager.isLocationEnabled | 同上 | `isLocationEnabled(): boolean` | `let enabled = geoLocationManager.isLocationEnabled();` | 同上 |
| 逆地理编码：坐标转地址 | geoLocationManager.getAddressesFromLocation | 同上 | `getAddressesFromLocation(request: ReverseGeoCodeRequest): Promise<Array<GeoAddress>>` | `geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest).then((data) => { ... });` | 同上 |
| 地理编码：地址转坐标 | geoLocationManager.getAddressesFromLocationName | 同上 | `getAddressesFromLocationName(request: GeoCodeRequest): Promise<Array<GeoAddress>>` | `geoLocationManager.getAddressesFromLocationName(geocodeRequest).then((result) => { ... });` | 同上 |
| 查询国家码 | geoLocationManager.getCountryCode | 同上 | `getCountryCode(): Promise<CountryCode>` | `geoLocationManager.getCountryCode().then((result) => { ... });` | 同上 |
| 订阅位置服务状态变化 | geoLocationManager.on('locationEnabledChange') | 同上 | `on(type: 'locationEnabledChange', callback: Callback<boolean>): void` | `geoLocationManager.on('locationEnabledChange', locationEnabledChange);` | 同上 |
| 订阅定位错误码（API 12+） | geoLocationManager.on('locationError') | 同上 | `on(type: 'locationError', callback: Callback<LocationError>): void` | `geoLocationManager.on('locationError', locationErrorChange);` | 同上 |
| 订阅GNSS卫星状态 | geoLocationManager.on('satelliteStatusChange') | 同上 | `on(type: 'satelliteStatusChange', callback: Callback<SatelliteStatusInfo>): void` | `geoLocationManager.on('satelliteStatusChange', gnssStatusCb);` | 同上 |
| 订阅GNSS NMEA信息 | geoLocationManager.on('nmeaMessage') | 同上 | `on(type: 'nmeaMessage', callback: Callback<string>): void` | `geoLocationManager.on('nmeaMessage', nmeaCb);` | 同上 |
| 订阅缓存GNSS定位结果 | geoLocationManager.on('cachedGnssLocationsChange') | 同上 | `on(type: 'cachedGnssLocationsChange', request: CachedGnssLocationsRequest, callback: Callback<Array<Location>>): void` | `geoLocationManager.on('cachedGnssLocationsChange', requestInfo, cachedLocationsCb);` | 同上 |
| 订阅国家码变化 | geoLocationManager.on('countryCodeChange') | 同上 | `on(type: 'countryCodeChange', callback: Callback<CountryCode>): void` | `geoLocationManager.on('countryCodeChange', callback);` | 同上 |
| 添加GNSS圆形围栏（API 12+） | geoLocationManager.addGnssGeofence | 同上 | `addGnssGeofence(fenceRequest: GnssGeofenceRequest): Promise<number>` | `geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => { ... });` | 同上 |
| 删除GNSS围栏（API 12+） | geoLocationManager.removeGnssGeofence | 同上 | `removeGnssGeofence(geofenceId: number): Promise<void>` | `geoLocationManager.removeGnssGeofence(fenceId).then(() => { ... });` | 同上 |
| 添加beacon围栏（API 20+） | geoLocationManager.addBeaconFence | 同上 | `addBeaconFence(fenceRequest: BeaconFenceRequest): Promise<number>` | `geoLocationManager.addBeaconFence(fenceRequest).then((id) => { ... });` | 同上 |
| 删除beacon围栏（API 20+） | geoLocationManager.removeBeaconFence | 同上 | `removeBeaconFence(beaconFence?: BeaconFence): Promise<void>` | `geoLocationManager.removeBeaconFence(beacon).then(() => { ... });` | 同上 |
| 判断是否支持GNSS | geoLocationManager.isGnssServiceSupported | 同上 | `isGnssServiceSupported(): boolean` | `let supported = geoLocationManager.isGnssServiceSupported();` | 同上 |
| 判断是否支持GNSS围栏 | geoLocationManager.isGnssFenceServiceSupported | 同上 | `isGnssFenceServiceSupported(): boolean` | `let supported = geoLocationManager.isGnssFenceServiceSupported();` | 同上 |
| 获取地理编码/逆地理编码服务状态 | geoLocationManager.isGeocoderAvailable | 同上 | `isGeocoderAvailable(): boolean` | `let available = geoLocationManager.isGeocoderAvailable();` | 同上 |
| 获取两个位置间直线距离（API 20+） | geoLocationManager.getDistanceBetweenLocations | 同上 | `getDistanceBetweenLocations(location1: Location, location2: Location): number` | `let distance = geoLocationManager.getDistanceBetweenLocations(loc1, loc2);` | 同上 |

## @ohos.app.ability.FenceExtensionAbility (FenceExtensionAbility)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 地理围栏扩展能力基类（API 14+，Stage模型） | FenceExtensionAbility | `import { FenceExtensionAbility } from '@kit.LocationKit'` | `class FenceExtensionAbility extends ExtensionAbility` | `export class MyFenceExtensionAbility extends FenceExtensionAbility { onFenceStatusChange(...) {} }` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/02_ohos.app.ability.FenceExtensionAbility (FenceExtensionAbility).md` |
| 接收地理围栏事件回调 | FenceExtensionAbility.onFenceStatusChange | 同上 | `onFenceStatusChange(transition: geoLocationManager.GeofenceTransition, additions: Record<string, string>): void` | `onFenceStatusChange(transition, additions) { console.info(...); }` | 同上 |
| 接收销毁事件 | FenceExtensionAbility.onDestroy | 同上 | `onDestroy(): void` | `onDestroy() { console.info('on ability destroy'); }` | 同上 |

## @ohos.app.ability.FenceExtensionContext (FenceExtensionContext)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 围栏服务上下文（API 14+，Stage模型） | FenceExtensionContext | `import { FenceExtensionContext } from '@kit.LocationKit'` | `class FenceExtensionContext extends ExtensionContext` | `let fenceExtensionContext: FenceExtensionContext = this.context;` | `06_应用服务/16_Location Kit（位置服务）/01_ArkTS API/03_ohos.app.ability.FenceExtensionContext (FenceExtensionContext).md` |

## Module Notes

- `geoLocationManager` from `@kit.LocationKit` is the primary API for all location operations. First available from API 9.
- Requires device location switch to be on; requires `ohos.permission.APPROXIMATELY_LOCATION` (and `ohos.permission.LOCATION` for precise location).
- All coordinates are in WGS-84 coordinate system only.
- `FenceExtensionAbility` and `FenceExtensionContext` are API 14+ and Stage model only. Used together with `geoLocationManager.addGnssGeofence()` for background geofence callbacks via `fenceExtensionAbilityName` field.
- Beacon fences (API 20+) are managed separately via `addBeaconFence` / `removeBeaconFence`, with a max of 10 per app.
- GNSS geofences have a max of 100 per app.
