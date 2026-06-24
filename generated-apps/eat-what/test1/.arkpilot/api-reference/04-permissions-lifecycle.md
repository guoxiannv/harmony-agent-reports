# 04 — Permissions & Lifecycle (权限与生命周期)

## @ohos.abilityAccessCtrl (程序访问控制管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建访问控制管理实例 | abilityAccessCtrl.createAtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `createAtManager(): AtManager` | `let atManager = abilityAccessCtrl.createAtManager();` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 校验应用是否被授予权限（Promise） | AtManager.checkAccessToken | `@kit.AbilityKit` | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, 'ohos.permission.CAMERA').then((data) => { ... })` | 同上 |
| 校验应用是否被授予权限（同步） | AtManager.checkAccessTokenSync | `@kit.AbilityKit` | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let result: GrantStatus = atManager.checkAccessTokenSync(tokenID, 'ohos.permission.CAMERA');` | 同上 |
| 拉起弹框请求用户授权（Promise） | AtManager.requestPermissionsFromUser | `@kit.AbilityKit` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data) => { ... })` | 同上 |
| 拉起弹框请求用户授权（Callback） | AtManager.requestPermissionsFromUser | `@kit.AbilityKit` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err, data) => { ... })` | 同上 |
| 二次拉起权限设置弹框 | AtManager.requestPermissionOnSetting | `@kit.AbilityKit` | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.CAMERA']).then((data) => { ... })` | 同上 |
| 查询应用权限状态（同步） | AtManager.getSelfPermissionStatus | `@kit.AbilityKit` | `getSelfPermissionStatus(permissionName: Permissions): PermissionStatus` | `let status: PermissionStatus = atManager.getSelfPermissionStatus('ohos.permission.CAMERA');` | 同上 |
| 拉起跳转设置页的弹窗 | AtManager.openPermissionOnSetting | `@kit.AbilityKit` | `openPermissionOnSetting(context: Context, permission: Permissions): Promise<SelectedResult>` | `atManager.openPermissionOnSetting(context, 'ohos.permission.CAMERA').then((data) => { ... })` | 同上 |

**GrantStatus 枚举**: `PERMISSION_DENIED = -1` (未授权), `PERMISSION_GRANTED = 0` (已授权)

**PermissionStatus 枚举 (API 20+)**: `DENIED = -1` (未授权), `GRANTED = 0` (已授权), `NOT_DETERMINED = 1` (未操作), `INVALID = 2` (无效), `RESTRICTED = 3` (受限)

**模型约束**: `requestPermissionsFromUser`、`requestPermissionOnSetting`、`openPermissionOnSetting` 仅可在Stage模型下使用。

**系统能力**: SystemCapability.Security.AccessToken（所有接口）

## ohos.permission.WRITE_IMAGEVIDEO (写入图片视频权限)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 保存/创建图片和视频资源到相册所需的权限 | ohos.permission.WRITE_IMAGEVIDEO | 在 module.json5 中声明 | `"requestPermissions": [{"name": "ohos.permission.WRITE_IMAGEVIDEO"}]` | 在 module.json5 中声明，运行时通过 `requestPermissionsFromUser` 请求授权 | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

此权限为 **user_grant** 类型，需要在 `module.json5` 中声明，并在运行时通过 `abilityAccessCtrl.AtManager.requestPermissionsFromUser` 请求用户授权。用于 `photoAccessHelper` 的 `createAsset` 等写入操作。

## ohos.permission.READ_IMAGEVIDEO (读取图片视频权限)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 读取图片和视频资源所需的权限 | ohos.permission.READ_IMAGEVIDEO | 在 module.json5 中声明 | `"requestPermissions": [{"name": "ohos.permission.READ_IMAGEVIDEO"}]` | 在 module.json5 中声明，运行时通过 `requestPermissionsFromUser` 请求授权 | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/14_Interface (PhotoAccessHelper).md` |

此权限为 **user_grant** 类型，需要在 `module.json5` 中声明，并在运行时通过 `abilityAccessCtrl.AtManager.requestPermissionsFromUser` 请求用户授权。用于 `photoAccessHelper` 的 `getAssets` 等读取操作。通过 picker 方式访问无需申请此权限。

## @ohos.app.ability.UIAbility (UIAbility生命周期)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility 导入 | UIAbility | `import { UIAbility } from '@kit.AbilityKit'` | 基类 | `export default class MyAbility extends UIAbility { ... }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/36_ohos.app.ability.UIAbility (带界面的应用组件).md` |
| UIAbility 创建回调 | UIAbility.onCreate | `@kit.AbilityKit` | `onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void` | 在冷启动时触发，执行初始化逻辑（定义变量、加载资源等） | 同上 |
| WindowStage 创建回调 | UIAbility.onWindowStageCreate | `@kit.AbilityKit` | `onWindowStageCreate(windowStage: window.WindowStage): void` | 通过 `windowStage.loadContent('pages/Index', ...)` 加载页面 | 同上 |
| WindowStage 销毁回调 | UIAbility.onWindowStageDestroy | `@kit.AbilityKit` | `onWindowStageDestroy(): void` | 释放 UI 相关资源 | 同上 |
| 前台回调 | UIAbility.onForeground | `@kit.AbilityKit` | `onForeground(): void` | 应用转到前台时申请所需资源（如定位服务） | 同上 |
| 后台回调 | UIAbility.onBackground | `@kit.AbilityKit` | `onBackground(): void` | 应用转到后台时释放资源（如停止定位） | 同上 |
| 销毁回调 | UIAbility.onDestroy | `@kit.AbilityKit` | `onDestroy(): void | Promise<void>` | 执行资源清理、数据保存 | 同上 |
| 再次拉起回调 | UIAbility.onNewWant | `@kit.AbilityKit` | `onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void` | 已启动的 UIAbility 再次被拉起时触发 | 同上 |
| UIAbility 上下文属性 | UIAbility.context | `@kit.AbilityKit` | `context: UIAbilityContext` | `this.context` 获取 UIAbility 上下文 | 同上 |

**生命周期状态**: `Create`(onCreate) -> `Foreground`(onForeground) <-> `Background`(onBackground) -> `Destroy`(onDestroy)

**WindowStage 生命周期**: `onWindowStageCreate`（加载页面） -> `onWindowStageWillDestroy`（取消监听） -> `onWindowStageDestroy`（释放资源）

**系统能力**: SystemCapability.Ability.AbilityRuntime.AbilityCore

**模型约束**: 本模块接口仅可在 Stage 模型下使用。

## 模块笔记

- 运行时权限请求的标准流程：在 `module.json5` 中声明权限 -> 运行时调用 `abilityAccessCtrl.createAtManager()` 获取 `AtManager` 实例 -> 调用 `requestPermissionsFromUser(context, permissionList)` 拉起弹窗请求授权。用户拒绝后可使用 `requestPermissionOnSetting` 二次拉起设置弹框。
- WRITE_IMAGEVIDEO 和 READ_IMAGEVIDEO 均为 user_grant 类型权限，必须运行时请求。
- UIAbility 的 `onCreate` 是同步接口，不支持异步回调；`onDestroy` 支持 Promise 异步回调。
- 通过 picker 方式访问媒体文件无需申请 READ_IMAGEVIDEO 权限。
