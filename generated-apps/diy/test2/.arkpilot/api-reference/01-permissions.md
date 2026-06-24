# 01 — Permissions & Runtime Authorization

## @ohos.abilityAccessCtrl

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建访问控制管理实例 | abilityAccessCtrl.createAtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `createAtManager(): AtManager` | `let atManager = abilityAccessCtrl.createAtManager()` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 异步校验权限 | AtManager.checkAccessToken | `import { abilityAccessCtrl, Permissions, bundleManager } from '@kit.AbilityKit'` | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, permissionName).then(...)` | 同上 |
| 同步校验权限 | AtManager.checkAccessTokenSync | 同上 | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data = atManager.checkAccessTokenSync(tokenID, permissionName)` | 同上 |
| 请求用户授权（callback） | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, PermissionRequestResult, common } from '@kit.AbilityKit'` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], callback)` | 同上 |
| 请求用户授权（Promise） | AtManager.requestPermissionsFromUser | 同上 | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then(...)` | 同上 |
| 二次拉起权限设置弹框 | AtManager.requestPermissionOnSetting | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit'` | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.CAMERA']).then(...)` | 同上 |
| 调用全局开关设置弹框 | AtManager.requestGlobalSwitch | 同上 | `requestGlobalSwitch(context: Context, type: SwitchType): Promise<boolean>` | `atManager.requestGlobalSwitch(context, abilityAccessCtrl.SwitchType.CAMERA).then(...)` | 同上 |
| 同步查询应用权限状态 | AtManager.getSelfPermissionStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `getSelfPermissionStatus(permissionName: Permissions): PermissionStatus` | `let data = atManager.getSelfPermissionStatus('ohos.permission.CAMERA')` | 同上 |
| 跳转设置页弹窗 | AtManager.openPermissionOnSetting | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit'` | `openPermissionOnSetting(context: Context, permission: Permissions): Promise<SelectedResult>` | `atManager.openPermissionOnSetting(context, 'ohos.permission.HOOK_KEY_EVENT').then(...)` | 同上 |
| 订阅本应用权限状态变化 | AtManager.on | `import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit'` | `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void` | `atManager.on('selfPermissionStateChange', permissionList, callback)` | 同上 |
| 取消订阅权限状态变化 | AtManager.off | 同上 | `off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void` | `atManager.off('selfPermissionStateChange', permissionList)` | 同上 |
| 同步校验权限（deprecated） | AtManager.verifyAccessTokenSync | `import { abilityAccessCtrl, Permissions, bundleManager } from '@kit.AbilityKit'` | `verifyAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data = atManager.verifyAccessTokenSync(tokenID, permissionName)` | 同上 |
| 异步校验权限（deprecated） | AtManager.verifyAccessToken | 同上 | `verifyAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.verifyAccessToken(tokenID, permissionName).then(...)` | 同上 |

## PermissionRequestResult

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限请求结果对象 | PermissionRequestResult | `import { PermissionRequestResult } from '@kit.AbilityKit'` | 属性: `permissions: Array<string>` `authResults: Array<number>` `dialogShownResults?: Array<boolean>` `errorReasons?: Array<number>` | `data.permissions`, `data.authResults` 表明各权限的授权结果 | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |

## ohos.permission.READ_IMAGEVIDEO

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 读取图片/视频权限声明 | ohos.permission.READ_IMAGEVIDEO | `Permissions` 类型（`@kit.AbilityKit`） | 字符串常量，作为 `Permissions` 类型值 | `'ohos.permission.READ_IMAGEVIDEO'` 用于 `permissionList` 参数或 `module.json5` 的 `requestPermissions` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

## ohos.permission.WRITE_IMAGEVIDEO

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 写入图片/视频权限声明 | ohos.permission.WRITE_IMAGEVIDEO | `Permissions` 类型（`@kit.AbilityKit`） | 字符串常量，作为 `Permissions` 类型值 | `'ohos.permission.WRITE_IMAGEVIDEO'` 用于 `permissionList` 参数或 `module.json5` 的 `requestPermissions` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

## GrantStatus

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 授权状态枚举 | abilityAccessCtrl.GrantStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `PERMISSION_DENIED = -1` 表示未授权；`PERMISSION_GRANTED = 0` 表示已授权 | `data === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## PermissionStatus

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 完整权限状态枚举（API 20+） | abilityAccessCtrl.PermissionStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `DENIED=-1, GRANTED=0, NOT_DETERMINED=1, INVALID=2, RESTRICTED=3` | `atManager.getSelfPermissionStatus('ohos.permission.CAMERA')` 返回此枚举 | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## SwitchType

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 全局开关类型枚举（API 12+） | abilityAccessCtrl.SwitchType | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `CAMERA=0, MICROPHONE=1, LOCATION=2` | `abilityAccessCtrl.SwitchType.CAMERA` | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## PermissionStateChangeInfo

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限状态变化详情（API 18+） | abilityAccessCtrl.PermissionStateChangeInfo | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | 属性: `change: PermissionStateChangeType`, `tokenID: number`, `permissionName: Permissions` | `on()` 回调参数类型 | `01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## 模块说明

- 权限声明在 `module.json5` 的 `requestPermissions` 数组中配置；运行时授权需先声明 `user_grant` 类型的权限。
- `ohos.permission.READ_IMAGEVIDEO` 和 `ohos.permission.WRITE_IMAGEVIDEO` 是 `user_grant` 类型的敏感权限，需运行时动态申请。
- `Permissions` 类型是 `@kit.AbilityKit` 导出的联合字符串类型，包含所有合法的权限名称字符串常量；该类型无独立文档文件，其有效值由在线权限列表定义。
- 通过 Picker 方式访问媒体资源可绕过 `READ_IMAGEVIDEO` 权限声明；本应用自身写入的媒体文件无需额外读权限。
