# 01 — 权限管理 (Permissions)

## abilityAccessCtrl

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 程序访问控制管理模块入口 | abilityAccessCtrl | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `abilityAccessCtrl.createAtManager(): AtManager` | `let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();` | `03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## AtManager

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 访问控制管理实例（通过 createAtManager 获取） | AtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `class AtManager` 包含 checkAccessToken / requestPermissionsFromUser / verifyAccessTokenSync 等方法 | `let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();` | `03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 校验应用是否被授予权限（Promise） | AtManager.checkAccessToken | 同上 | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, 'ohos.permission.CAMERA')` | 同上 |
| 校验应用是否被授予权限（同步） | AtManager.checkAccessTokenSync | 同上 | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let status = atManager.checkAccessTokenSync(tokenID, permissionName);` | 同上 |
| 拉起弹框请求用户授权（callback） | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit';` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err, data) => { ... });` | 同上 |
| 拉起弹框请求用户授权（Promise） | AtManager.requestPermissionsFromUser | 同上 | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data) => { ... });` | 同上 |
| 二次拉起权限设置弹框 | AtManager.requestPermissionOnSetting | 同上 | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.CAMERA'])` | 同上 |
| 拉起全局开关设置弹框 | AtManager.requestGlobalSwitch | 同上 | `requestGlobalSwitch(context: Context, type: SwitchType): Promise<boolean>` | `atManager.requestGlobalSwitch(context, abilityAccessCtrl.SwitchType.CAMERA)` | 同上 |
| 查询应用权限状态（同步） | AtManager.getSelfPermissionStatus | 同上 | `getSelfPermissionStatus(permissionName: Permissions): PermissionStatus` | `let status = atManager.getSelfPermissionStatus('ohos.permission.CAMERA');` | 同上 |
| 校验应用是否被授予权限（同步，推荐 checkAccessTokenSync 替代） | AtManager.verifyAccessTokenSync | 同上 | `verifyAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data = atManager.verifyAccessTokenSync(tokenID, permissionName);` | 同上 |
| 订阅本应用权限状态变化 | AtManager.on | 同上 | `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void` | `atManager.on('selfPermissionStateChange', ['ohos.permission.APPROXIMATELY_LOCATION'], callback);` | 同上 |
| 取消订阅权限状态变化 | AtManager.off | 同上 | `off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void` | `atManager.off('selfPermissionStateChange', permissionList);` | 同上 |

## Context.requestPermissionsFromUser

注意：`requestPermissionsFromUser` 并非 `Context` 的直接方法，而是 `AtManager` 实例上的方法，调用时需要传入 `Context` 作为第一个参数。

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起弹框请求用户授权（实际为 AtManager 方法） | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit';` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `let context = this.getUIContext().getHostContext() as common.UIAbilityContext; atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']);` | `03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## PermissionRequestResult

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限请求结果对象 | PermissionRequestResult | `import { PermissionRequestResult } from '@kit.AbilityKit';` | `type PermissionRequestResult = _PermissionRequestResult` | 见下方示例 | `04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |

PermissionRequestResult 属性：

| 名称 | 类型 | 说明 |
|------|------|------|
| permissions | Array\<string\> | 用户传入的权限列表 |
| authResults | Array\<number\> | 请求结果：-1 未授权，0 已授权，2 无效 |
| dialogShownResults (12+) | Array\<boolean\> | 是否有弹窗 |
| errorReasons (18+) | Array\<number\> | 错误原因码 |

```ts
import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit';
let atManager = abilityAccessCtrl.createAtManager();
let context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;
atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data) => {
  console.info('permissions:' + data.permissions);
  console.info('authResults:' + data.authResults);
});
```

## ohos.permission.CAMERA

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机权限字符串常量 | `ohos.permission.CAMERA` | `Permissions` 类型（来自 `@kit.AbilityKit`） | `'ohos.permission.CAMERA'` 为 string 字面量 | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']);` | 外部参考：HarmonyOS 应用权限列表 |

## ohos.permission.READ_IMAGE_VIDEO

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 读取图片视频权限字符串常量 | `ohos.permission.READ_IMAGE_VIDEO` | `Permissions` 类型（来自 `@kit.AbilityKit`） | `'ohos.permission.READ_IMAGE_VIDEO'` 为 string 字面量 | `atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_IMAGE_VIDEO']);` | 外部参考：HarmonyOS 应用权限列表 |

## ohos.permission.WRITE_IMAGE_VIDEO

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 写入图片视频权限字符串常量 | `ohos.permission.WRITE_IMAGE_VIDEO` | `Permissions` 类型（来自 `@kit.AbilityKit`） | `'ohos.permission.WRITE_IMAGE_VIDEO'` 为 string 字面量 | `atManager.requestPermissionsFromUser(context, ['ohos.permission.WRITE_IMAGE_VIDEO']);` | 外部参考：HarmonyOS 应用权限列表 |

## ohos.permission.NOTIFICATION_CONTROLLER

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通知控制权限字符串常量 | `ohos.permission.NOTIFICATION_CONTROLLER` | `Permissions` 类型（来自 `@kit.AbilityKit`） | `'ohos.permission.NOTIFICATION_CONTROLLER'` 为 string 字面量 | 需在 module.json5 中声明后使用 | 外部参考：HarmonyOS 应用权限列表 |

## ohos.permission.DISTRIBUTED_DATASYNC

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 分布式数据同步权限字符串常量 | `ohos.permission.DISTRIBUTED_DATASYNC` | `Permissions` 类型（来自 `@kit.AbilityKit`） | `'ohos.permission.DISTRIBUTED_DATASYNC'` 为 string 字面量 | 需在 module.json5 中声明后使用 | 外部参考：HarmonyOS 应用权限列表 |

## Permissions

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限名称类型 | Permissions | `import { Permissions } from '@kit.AbilityKit';` | `type Permissions` 为 string 字面量联合类型，表示合法的权限名称 | `let permissionName: Permissions = 'ohos.permission.CAMERA';` | `03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## 模块说明

- `requestPermissionsFromUser` 是 `AtManager` 实例方法，不是 `Context` 的直接方法，调用时需要将 `Context` 作为第一个参数传入。
- 授权方式分为 user_grant（用户授权）和 system_grant（系统授权），user_grant 权限需要通过 `requestPermissionsFromUser` 弹窗申请。
- 权限常量字符串值定义在 HarmonyOS 应用权限列表（外部指南），不在 API 参考文档中直接定义。
- `AtManager.verifyAccessToken` 从 API 9 起废弃，推荐使用 `checkAccessToken` 替代。
- 所有权限管理接口仅在 Stage 模型下可用。
- 基础系统能力：`SystemCapability.Security.AccessToken`
