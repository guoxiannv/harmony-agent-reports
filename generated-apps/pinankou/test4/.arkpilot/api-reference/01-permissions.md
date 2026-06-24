# 01 — Permissions (权限声明)

## @ohos.abilityAccessCtrl (程序访问控制管理)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建程序访问控制管理实例 | abilityAccessCtrl.createAtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `createAtManager(): AtManager` | `let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 校验权限(异步) | AtManager.checkAccessToken | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, 'ohos.permission.CAMERA').then(...)` | 同上 |
| 校验权限(同步) | AtManager.checkAccessTokenSync | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let result = atManager.checkAccessTokenSync(tokenID, 'ohos.permission.CAMERA');` | 同上 |
| 拉起弹框请求用户授权(callback) | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err, data) => {...});` | 同上 |
| 拉起弹框请求用户授权(Promise) | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data) => {...});` | 同上 |
| 二次拉起权限设置弹框 | AtManager.requestPermissionOnSetting | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.CAMERA']).then(...)` | 同上 |
| 查询本应用权限状态(同步) | AtManager.getSelfPermissionStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `getSelfPermissionStatus(permissionName: Permissions): PermissionStatus` | `let status = atManager.getSelfPermissionStatus('ohos.permission.CAMERA');` | 同上 |
| 订阅权限状态变化 | AtManager.on | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void` | `atManager.on('selfPermissionStateChange', ['ohos.permission.APPROXIMATELY_LOCATION'], (data) => {...});` | 同上 |
| 取消订阅权限状态变化 | AtManager.off | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void` | `atManager.off('selfPermissionStateChange', permissionList);` | 同上 |
| 拉起全局开关设置弹框 | AtManager.requestGlobalSwitch | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `requestGlobalSwitch(context: Context, type: SwitchType): Promise<boolean>` | `atManager.requestGlobalSwitch(context, abilityAccessCtrl.SwitchType.CAMERA).then(...)` | 同上 |
| 拉起跳转设置页弹窗 | AtManager.openPermissionOnSetting | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `openPermissionOnSetting(context: Context, permission: Permissions): Promise<SelectedResult>` | `atManager.openPermissionOnSetting(context, 'ohos.permission.HOOK_KEY_EVENT').then(...)` | 同上 |

## @ohos.bundle.bundleManager (应用程序包管理模块)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 获取当前应用BundleInfo(异步) | bundleManager.getBundleInfoForSelf | `import { bundleManager } from '@kit.AbilityKit';` | `getBundleInfoForSelf(bundleFlags: number): Promise<BundleInfo>` | `bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {...});` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/16_ohos.bundle.bundleManager (应用程序包管理模块).md` |
| 获取当前应用BundleInfo(同步) | bundleManager.getBundleInfoForSelfSync | `import { bundleManager } from '@kit.AbilityKit';` | `getBundleInfoForSelfSync(bundleFlags: number): BundleInfo` | `let info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);` | 同上 |
| 获取BundleInfo含权限信息(同步) | bundleManager.getBundleInfoForSelfSync | `import { bundleManager } from '@kit.AbilityKit';` | `getBundleInfoForSelfSync(bundleFlags: number): BundleInfo` | `let data = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);` | 同上 |

## ohos.permission.\* (权限字符串常量)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 允许应用使用相机拍摄照片和视频 | ohos.permission.CAMERA | `Permissions` type from `@kit.AbilityKit` | 字符串字面量 `'ohos.permission.CAMERA'` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then(...)` | 见 `01_ohos.abilityAccessCtrl (程序访问控制管理).md` 使用示例 |
| 允许应用获取设备模糊位置信息 | ohos.permission.APPROXIMATELY_LOCATION | `Permissions` type from `@kit.AbilityKit` | 字符串字面量 `'ohos.permission.APPROXIMATELY_LOCATION'` | `atManager.on('selfPermissionStateChange', ['ohos.permission.APPROXIMATELY_LOCATION'], callback);` | 同上 |
| 允许应用获取设备精确位置信息 | ohos.permission.LOCATION | `Permissions` type from `@kit.AbilityKit` | 字符串字面量 `'ohos.permission.LOCATION'` | 在 `module.json5` 中声明 | 参考应用权限列表 docs |
| 允许应用在后台获取设备位置信息 | ohos.permission.LOCATION_IN_BACKGROUND | `Permissions` type from `@kit.AbilityKit` | 字符串字面量 `'ohos.permission.LOCATION_IN_BACKGROUND'` | 在 `module.json5` 中声明 | 参考应用权限列表 docs |
| 允许应用读取用户外部存储中的媒体文件 | ohos.permission.READ_MEDIA | `Permissions` type from `@kit.AbilityKit` | 字符串字面量 `'ohos.permission.READ_MEDIA'` | 在 `module.json5` 中声明 | 参考应用权限列表 docs |
| 允许应用读写用户外部存储中的媒体文件 | ohos.permission.WRITE_MEDIA | `Permissions` type from `@kit.AbilityKit` | 字符串字面量 `'ohos.permission.WRITE_MEDIA'` | 在 `module.json5` 中声明 | 参考应用权限列表 docs |
| 允许应用拨打电话 | ohos.permission.CALL_PHONE | `Permissions` type from `@kit.AbilityKit` | 字符串字面量 `'ohos.permission.CALL_PHONE'` | 在 `module.json5` 中声明 | 参考应用权限列表 docs |

## PermissionRequestResult

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限请求结果对象 | PermissionRequestResult | `import { PermissionRequestResult } from '@kit.AbilityKit';` | `{ permissions: Array<string>; authResults: Array<number>; dialogShownResults?: Array<boolean>; errorReasons?: Array<number> }` | `atManager.requestPermissionsFromUser(context, ["ohos.permission.CAMERA"]).then((data) => { console.info(data.permissions); console.info(data.authResults); })` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |

## 模块说明

- 权限声明的完整流程：在 `module.json5` 的 `requestPermissions` 字段中声明权限字符串，然后运行时通过 `abilityAccessCtrl.createAtManager()` 获取 `AtManager` 实例，调用 `requestPermissionsFromUser()` 向用户弹窗申请授权，使用 `checkAccessTokenSync()` 或 `getSelfPermissionStatus()` 查询授权状态。
- `Permissions` 类型是从 `@kit.AbilityKit` 导出的字符串字面量联合类型，包含了所有合法的 HarmonyOS 权限字符串常量。
- 获取本应用 `tokenID` 的标准方式：`bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).appInfo.accessTokenId`。
- 注意：location 相关权限存在精确/模糊/后台三级粒度限制，需同时处理 `ohos.permission.APPROXIMATELY_LOCATION`、`ohos.permission.LOCATION` 和 `ohos.permission.LOCATION_IN_BACKGROUND` 的组合关系。
