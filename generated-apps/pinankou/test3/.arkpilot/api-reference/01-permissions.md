# 01 — Permissions 权限管理

## abilityAccessCtrl

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建程序访问控制管理的实例 | abilityAccessCtrl.createAtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `createAtManager(): AtManager` | `let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 校验应用权限（Promise异步） | AtManager.checkAccessToken | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, 'ohos.permission.CAMERA').then((data) => { ... });` | 同上 |
| 校验应用权限（同步） | AtManager.checkAccessTokenSync | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data = atManager.checkAccessTokenSync(tokenID, permissionName);` | 同上 |

## @ohos.ability.AbilityConstant

注意：文档中实际路径为 `@ohos.app.ability.AbilityConstant`。

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Ability相关常量（启动原因、退出原因等） | AbilityConstant | `import { AbilityConstant } from '@kit.AbilityKit';` | 枚举和类型定义：LaunchReason、LastExitReason、OnContinueResult、MemoryLevel、WindowMode、OnSaveResult、StateType、ContinueState、CollaborateResult、PrepareTermination、LaunchParam、LastExitDetailInfo | `onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) { ... }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/02_ohos.app.ability.AbilityConstant (Ability相关常量).md` |

## @ohos.ability.UIAbility

注意：文档中实际路径为 `@ohos.app.ability.UIAbility`。

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 带界面的应用组件 | UIAbility | `import { UIAbility } from '@kit.AbilityKit';` | 生命周期回调：onCreate、onWindowStageCreate、onForeground、onBackground、onDestroy、onNewWant、onContinue、onDump、onSaveState、onShare、onPrepareToTerminate、onBackPressed、onCollaborate | `export default class MyUIAbility extends UIAbility { onCreate(want, launchParam) { ... } }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/36_ohos.app.ability.UIAbility (带界面的应用组件).md` |

## PermissionRequestResult

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限请求结果对象 | PermissionRequestResult | `import { PermissionRequestResult } from '@kit.AbilityKit';` | 属性：permissions（Array<string>）、authResults（Array<number>）、dialogShownResults（Array<boolean>）、errorReasons（Array<number>） | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data: PermissionRequestResult) => { console.info(data.permissions); });` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |

## Permissions (系统权限定义)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 系统权限名称类型 | Permissions | `import { Permissions } from '@kit.AbilityKit';` | 别名类型，取值范围为 `ohos.permission.xxx` 字符串常量，例如 `ohos.permission.CAMERA`、`ohos.permission.APPROXIMATELY_LOCATION` | `let permissionName: Permissions = 'ohos.permission.CAMERA';` | 仅在 abilityAccessCtrl 文档中引用，类型定义由 `@kit.AbilityKit` 导出，完整权限列表参考外部文档 |

## bundleManager / @ohos.bundle.bundleManager

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用程序包管理 | bundleManager | `import { bundleManager } from '@kit.AbilityKit';` | 提供 getBundleInfoForSelfSync 等方法，返回 BundleInfo/ApplicationInfo | `let bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/16_ohos.bundle.bundleManager (应用程序包管理模块).md` |
| 获取本应用 BundleInfo（同步） | bundleManager.getBundleInfoForSelfSync | `import { bundleManager } from '@kit.AbilityKit';` | `getBundleInfoForSelfSync(flag: BundleFlag): BundleInfo` | `let tokenID = bundleInfo.appInfo.accessTokenId;` | 同上 |

## requestPermissionsFromUser

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起弹框请求用户授权（callback 回调） | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err, data) => { ... });` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 拉起弹框请求用户授权（Promise 异步） | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, PermissionRequestResult, common } from '@kit.AbilityKit';` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data) => { ... });` | 同上 |

## Context.requestPermissionsFromUser

注意：`Context` 是 `requestPermissionsFromUser` 方法的第一个参数类型，而非 Context 自身的实例方法。实际的调用方式是通过 `AtManager` 实例调用。

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility/UIExtensionAbility 的上下文（作为请求权限时的 context 参数） | Context（Stage模型） | `import { common } from '@kit.AbilityKit';` | 继承自 BaseContext，提供 applicationInfo、cacheDir、filesDir 等属性，以及 requestPermissionsFromUser、requestPermissionOnSetting 等能力（后者借助 AtManager 实现） | `let context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/02_application/15_Context (Stage模型的上下文基类).md` |

## 模块备注

- 权限管理的核心入口是 `@ohos.abilityAccessCtrl` 模块，通过 `createAtManager()` 获取 `AtManager` 实例后调用 `requestPermissionsFromUser` 向用户请求授权。
- `@ohos.ability.AbilityConstant` 和 `@ohos.ability.UIAbility` 在文档中实际路径为 `@ohos.app.ability.AbilityConstant` 和 `@ohos.app.ability.UIAbility`（含 `.app.` 中间段）。
- `Permissions` 类型为 `@kit.AbilityKit` 导出的字符串别名，无独立文档文件。完整权限名列表见 HarmonyOS 官方指南。
- `bundleManager.getBundleInfoForSelfSync()` 用于获取本应用的 accessTokenId，供权限校验使用。
- `requestPermissionsFromUser` 是 `AtManager` 的方法，接收 `Context` 作为上下文参数，并非 `Context` 本身的成员方法。
