# 01 — 权限管理

## @ohos.abilityAccessCtrl (程序访问控制管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建访问控制实例 | abilityAccessCtrl.createAtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `createAtManager(): AtManager` | `let atManager = abilityAccessCtrl.createAtManager();` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 校验应用权限(Promise) | AtManager.checkAccessToken | `import { abilityAccessCtrl, Permissions, bundleManager } from '@kit.AbilityKit'` | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, 'ohos.permission.CAMERA')` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 校验应用权限(同步) | AtManager.checkAccessTokenSync | `import { abilityAccessCtrl, Permissions, bundleManager } from '@kit.AbilityKit'` | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data = atManager.checkAccessTokenSync(tokenID, 'ohos.permission.CAMERA');` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 请求用户授权(callback) | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, PermissionRequestResult, common } from '@kit.AbilityKit'` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err, data) => {...})` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 请求用户授权(Promise) | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, PermissionRequestResult, common } from '@kit.AbilityKit'` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then(...)` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 二次拉起权限设置弹框 | AtManager.requestPermissionOnSetting | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit'` | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.CAMERA'])` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 联动全局开关 | AtManager.requestGlobalSwitch | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit'` | `requestGlobalSwitch(context: Context, type: SwitchType): Promise<boolean>` | `atManager.requestGlobalSwitch(context, abilityAccessCtrl.SwitchType.CAMERA)` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 查询本应用权限状态(同步) | AtManager.getSelfPermissionStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `getSelfPermissionStatus(permissionName: Permissions): PermissionStatus` | `let data = atManager.getSelfPermissionStatus('ohos.permission.CAMERA');` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 订阅自身权限状态变化 | AtManager.on | `import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit'` | `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void` | `atManager.on('selfPermissionStateChange', ['ohos.permission.CAMERA'], callback)` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 授权状态枚举 | GrantStatus | — | `PERMISSION_DENIED = -1, PERMISSION_GRANTED = 0` | — | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 权限状态枚举(API 20+) | PermissionStatus | — | `DENIED = -1, GRANTED = 0, NOT_DETERMINED = 1, INVALID = 2, RESTRICTED = 3` | — | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 权限请求结果对象 | PermissionRequestResult | `import { PermissionRequestResult } from '@kit.AbilityKit'` | `type PermissionRequestResult = _PermissionRequestResult` | `data.permissions, data.authResults, data.dialogShownResults, data.errorReasons` | `04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |

## ohos.permission.READ_MEDIA_IMAGES
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 读取图片权限声明 | ohos.permission.READ_MEDIA_IMAGES | module.json5 `requestPermissions` | 权限字符串声明 | `"name": "ohos.permission.READ_MEDIA_IMAGES"` | 未在本地 references 中找到；本地记录的是 `ohos.permission.READ_IMAGEVIDEO` |

## ohos.permission.WRITE_IMAGE
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 写入图片权限声明 | ohos.permission.WRITE_IMAGE | module.json5 `requestPermissions` | 权限字符串声明 | `"name": "ohos.permission.WRITE_IMAGE"` | 未在本地 references 中找到；本地记录的是 `ohos.permission.WRITE_IMAGEVIDEO` |

## bundleManager — 通过 getPermissionFlags 获取权限状态
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过 bundleManager 获取权限状态 | bundleManager.getPermissionFlags | — | — | — | 未在本地 references 中找到 |

## 模块备注

- **ohos.permission.READ_MEDIA_IMAGES 和 ohos.permission.WRITE_IMAGE** 权限名未在本地 HarmonyOS References 中找到。本地文档中对应媒体库读取权限为 `ohos.permission.READ_IMAGEVIDEO`，写入权限为 `ohos.permission.WRITE_IMAGEVIDEO`。如需确认最新权限名，应查阅 HarmonyOS 应用权限列表 guides 文档（不在本 references 范围内）。
- **bundleManager.getPermissionFlags** 方法未在本地文档中发现。`@ohos.bundle.bundleManager` 模块当前提供的能力包括 `getBundleInfoForSelf`、`getBundleInfo`、`getBundleInfoForSelfSync`、`getBundleInfoSync`、`canOpenLink`、`getLaunchWant` 等，但不包含 `getPermissionFlags` 方法。
- 权限校验推荐使用 `AtManager.checkAccessToken` (Promise) / `checkAccessTokenSync` (同步) 替代已废弃的 `verifyAccessToken`。
- 请求用户授权推荐使用 `requestPermissionsFromUser` (仅 Stage 模型)，用户拒绝后可通过 `requestPermissionOnSetting` 拉起二次弹框。
