# 01 -- 权限管理 (Permissions)

## @ohos.abilityAccessCtrl (程序访问控制管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建程序访问控制管理实例 | abilityAccessCtrl.createAtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `createAtManager(): AtManager` | `let atManager = abilityAccessCtrl.createAtManager();` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 校验应用是否被授予权限（Promise） | AtManager.checkAccessToken | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, 'ohos.permission.CAMERA').then(data => { ... })` | 同上 |
| 校验应用是否被授予权限（同步） | AtManager.checkAccessTokenSync | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let status = atManager.checkAccessTokenSync(tokenID, 'ohos.permission.CAMERA');` | 同上 |
| 拉起弹框请求用户授权（callback） | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, PermissionRequestResult } from '@kit.AbilityKit'` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err, data) => { ... });` | 同上 |
| 拉起弹框请求用户授权（Promise） | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, PermissionRequestResult } from '@kit.AbilityKit'` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then(data => { ... });` | 同上 |
| 二次拉起权限设置弹框 | AtManager.requestPermissionOnSetting | `import { abilityAccessCtrl, Context } from '@kit.AbilityKit'` | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.CAMERA']).then(data => { ... });` | 同上 |
| 拉起全局开关设置弹框 | AtManager.requestGlobalSwitch | `import { abilityAccessCtrl, Context } from '@kit.AbilityKit'` | `requestGlobalSwitch(context: Context, type: SwitchType): Promise<boolean>` | `atManager.requestGlobalSwitch(context, abilityAccessCtrl.SwitchType.CAMERA).then(data => { ... });` | 同上 |
| 查询应用权限状态（同步） | AtManager.getSelfPermissionStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `getSelfPermissionStatus(permissionName: Permissions): PermissionStatus` | `let status = atManager.getSelfPermissionStatus('ohos.permission.CAMERA');` | 同上 |
| 拉起跳转设置页的弹窗 | AtManager.openPermissionOnSetting | `import { abilityAccessCtrl, Context } from '@kit.AbilityKit'` | `openPermissionOnSetting(context: Context, permission: Permissions): Promise<SelectedResult>` | `atManager.openPermissionOnSetting(context, 'ohos.permission.CAMERA').then(data => { ... });` | 同上 |
| 校验应用是否被授予权限（同步，替代方案） | AtManager.verifyAccessTokenSync | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `verifyAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data = atManager.verifyAccessTokenSync(tokenID, 'ohos.permission.CAMERA');` | 同上 |
| 订阅自身权限授权状态变化 | AtManager.on | `import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit'` | `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void` | `atManager.on('selfPermissionStateChange', ['ohos.permission.CAMERA'], callback);` | 同上 |
| 取消订阅自身权限状态变化 | AtManager.off | `import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit'` | `off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void` | `atManager.off('selfPermissionStateChange', ['ohos.permission.CAMERA']);` | 同上 |

## PermissionRequestResult (权限请求结果对象)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限请求结果对象 | PermissionRequestResult | `import { PermissionRequestResult } from '@kit.AbilityKit'` | `type: { permissions: Array<string>, authResults: Array<number>, dialogShownResults?: Array<boolean>, errorReasons?: Array<number> }` | `data.permissions; data.authResults; data.dialogShownResults; data.errorReasons` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |

## 权限常量 (ohos.permission.*)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相机权限 | ohos.permission.CAMERA | 无单独模块声明，作为 `Permissions` 类型字符串字面量使用 | 字符串常量：`'ohos.permission.CAMERA'` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'])` | 在线指南：[应用权限列表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-permissions) |
| 麦克风权限 | ohos.permission.MICROPHONE | 同上 | 字符串常量：`'ohos.permission.MICROPHONE'` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.MICROPHONE'])` | 同上 |
| 位置权限 | ohos.permission.LOCATION | 同上 | 字符串常量：`'ohos.permission.LOCATION'` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.LOCATION'])` | 同上 |
| 粗略位置权限 | ohos.permission.APPROXIMATELY_LOCATION | 同上 | 字符串常量：`'ohos.permission.APPROXIMATELY_LOCATION'` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.APPROXIMATELY_LOCATION'])` | 同上 |
| 后台位置权限 | ohos.permission.LOCATION_IN_BACKGROUND | 同上 | 字符串常量：`'ohos.permission.LOCATION_IN_BACKGROUND'` | 声明在 `module.json5` 的 `requestPermissions` 数组中 | 同上 |
| 读取图片视频权限 | ohos.permission.READ_IMAGEVIDEO | 同上 | 字符串常量：`'ohos.permission.READ_IMAGEVIDEO'` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_IMAGEVIDEO'])` | 同上 |
| 写入图片视频权限 | ohos.permission.WRITE_IMAGEVIDEO | 同上 | 字符串常量：`'ohos.permission.WRITE_IMAGEVIDEO'` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.WRITE_IMAGEVIDEO'])` | 同上 |
| 分布式数据同步权限 | ohos.permission.DISTRIBUTED_DATASYNC | 同上 | 字符串常量：`'ohos.permission.DISTRIBUTED_DATASYNC'` | 声明在 `module.json5` 的 `requestPermissions` 数组中，用于 `startAbilityByCall` 跨设备场景 | 同上 |

## UIAbilityContext (上下文)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility 组件上下文 | UIAbilityContext | `import { common } from '@kit.AbilityKit'` | 继承自 Context，提供 abilityInfo、currentHapModuleInfo、config、windowStage 等属性 | `let context = this.context;` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/02_application/24_UIAbilityContext.md` |

## 模块说明

- **`requestPermissionsFromUser` 属于 `AtManager`，不在 `UIAbilityContext` 上**: `UIAbilityContext` 不提供 `requestPermissionsFromUser` 方法。该方法是 `AtManager` 实例的方法（来自 `abilityAccessCtrl.createAtManager()`），接受 `context` 参数（可传入 `UIAbilityContext`）。在组件中通过 `this.getUIContext().getHostContext() as common.UIAbilityContext` 获取 context 实例后传入。
- **`grantPermission` 未找到**: `abilityAccessCtrl` 模块文档中不存在名为 `grantPermission` 的公开 API。权限授予由系统在用户授权流程中处理，应用侧无法直接调用 grantPermission。
- **`ohos.permission.*` 权限常量无独立 API 参考文档**: 这些权限名称作为 `Permissions` 类型的字符串字面量使用，在 HarmonyOS 在线指南 [应用权限列表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-permissions) 中有详细说明。本地参考文档中无独立的 ohos.permission.* API 文件。
- **`SwitchType` 枚举**: `AtManager.SwitchType` 枚举值包括 `CAMERA` (0)、`MICROPHONE` (1)、`LOCATION` (2)，用于 `requestGlobalSwitch` 接口。
- **`PermissionRequestResult.authResults` 值含义**: -1 未授权、0 已授权、2 请求无效（未声明目标权限/权限名非法/未满足特殊申请条件）。
