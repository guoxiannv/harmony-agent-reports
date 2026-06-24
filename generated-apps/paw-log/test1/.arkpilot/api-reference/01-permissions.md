# 01 -- Permissions (权限请求)

## abilityAccessCtrl (requestPermissionsFromUser)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建程序访问控制管理实例 | createAtManager | @kit.AbilityKit | `createAtManager(): AtManager` | `let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 拉起弹框请求用户授权（callback） | requestPermissionsFromUser | @kit.AbilityKit | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err, data) => { ... });` | 同上 |
| 拉起弹框请求用户授权（Promise） | requestPermissionsFromUser | @kit.AbilityKit | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data) => { ... });` | 同上 |
| 校验应用是否被授予权限（Promise） | checkAccessToken | @kit.AbilityKit | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, permissionName).then(...)` | 同上 |
| 校验应用是否被授予权限（同步） | checkAccessTokenSync | @kit.AbilityKit | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data = atManager.checkAccessTokenSync(tokenID, permissionName);` | 同上 |
| 二次拉起权限设置弹框 | requestPermissionOnSetting | @kit.AbilityKit | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.CAMERA'])` | 同上 |
| 查询应用权限状态（同步，API 20+） | getSelfPermissionStatus | @kit.AbilityKit | `getSelfPermissionStatus(permissionName: Permissions): PermissionStatus` | `let status = atManager.getSelfPermissionStatus('ohos.permission.CAMERA');` | 同上 |
| 拉起跳转设置页弹窗（API 22+） | openPermissionOnSetting | @kit.AbilityKit | `openPermissionOnSetting(context: Context, permission: Permissions): Promise<SelectedResult>` | `atManager.openPermissionOnSetting(context, 'ohos.permission.HOOK_KEY_EVENT')` | 同上 |
| 拉起全局开关设置弹框 | requestGlobalSwitch | @kit.AbilityKit | `requestGlobalSwitch(context: Context, type: SwitchType): Promise<boolean>` | `atManager.requestGlobalSwitch(context, abilityAccessCtrl.SwitchType.CAMERA)` | 同上 |
| 订阅本应用权限状态变化 | on | @kit.AbilityKit | `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void` | `atManager.on('selfPermissionStateChange', ['ohos.permission.APPROXIMATELY_LOCATION'], callback)` | 同上 |
| 取消订阅权限状态变化 | off | @kit.AbilityKit | `off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void` | `atManager.off('selfPermissionStateChange', permissionList);` | 同上 |

## @ohos.abilityAccessCtrl

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 程序访问控制管理模块（全量导入） | abilityAccessCtrl | @kit.AbilityKit | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `import { abilityAccessCtrl, Permissions, bundleManager } from '@kit.AbilityKit';` | 同上 |
| 授权状态枚举：未授权 | GrantStatus.PERMISSION_DENIED | @kit.AbilityKit | `PERMISSION_DENIED = -1` | 同上 |
| 授权状态枚举：已授权 | GrantStatus.PERMISSION_GRANTED | @kit.AbilityKit | `PERMISSION_GRANTED = 0` | 同上 |
| 权限状态枚举（API 20+）：未授权 | PermissionStatus.DENIED | @kit.AbilityKit | `DENIED = -1` | 同上 |
| 权限状态枚举（API 20+）：已授权 | PermissionStatus.GRANTED | @kit.AbilityKit | `GRANTED = 0` | 同上 |
| 权限状态枚举（API 20+）：未操作 | PermissionStatus.NOT_DETERMINED | @kit.AbilityKit | `NOT_DETERMINED = 1` | 同上 |
| 全局开关类型：相机 | SwitchType.CAMERA | @kit.AbilityKit | `CAMERA = 0` | 同上 |
| 全局开关类型：麦克风 | SwitchType.MICROPHONE | @kit.AbilityKit | `MICROPHONE = 1` | 同上 |
| 全局开关类型：位置 | SwitchType.LOCATION | @kit.AbilityKit | `LOCATION = 2` | 同上 |

## Permissions 类型（权限字符串常量）

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 读取图片视频权限 | ohos.permission.READ_IMAGEVIDEO | 模块.json5 声明 + @kit.AbilityKit | `'ohos.permission.READ_IMAGEVIDEO'` | `permissionList: Array<Permissions> = ['ohos.permission.READ_IMAGEVIDEO']` | HarmonyOS 应用权限列表指南 |
| 读取媒体文件权限（相册/音频等） | ohos.permission.READ_MEDIA | 模块.json5 声明 + @kit.AbilityKit | `'ohos.permission.READ_MEDIA'` | `permissionList: Array<Permissions> = ['ohos.permission.READ_MEDIA']` | HarmonyOS 应用权限列表指南 |
| 写入媒体文件权限 | ohos.permission.WRITE_MEDIA | 模块.json5 声明 + @kit.AbilityKit | `'ohos.permission.WRITE_MEDIA'` | `permissionList: Array<Permissions> = ['ohos.permission.WRITE_MEDIA']` | HarmonyOS 应用权限列表指南 |
| 通知代理控制器权限 | ohos.permission.NOTIFICATION_AGENT_CONTROLLER | 模块.json5 声明 + @kit.AbilityKit | `'ohos.permission.NOTIFICATION_AGENT_CONTROLLER'` | 声明在 `module.json5` 的 `requestPermissions` 中 | HarmonyOS 应用权限列表指南 |

## Context (UIAbilityContext)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility 组件的上下文（即 Context 类型） | UIAbilityContext | @kit.AbilityKit | `import { common } from '@kit.AbilityKit';`<br>`type UIAbilityContext = _Context` | `let context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/02_application/24_UIAbilityContext.md` |
| 启动 UIAbility（Promise） | startAbility | @kit.AbilityKit | `startAbility(want: Want, options?: StartOptions): Promise<void>` | `this.context.startAbility(want, options).then(() => { ... })` | 同上 |
| 销毁 UIAbility 自身 | terminateSelf | @kit.AbilityKit | `terminateSelf(): Promise<void>` | `this.context.terminateSelf().then(() => { ... })` | 同上 |
| 在组件内获取 UIAbilityContext | getUIContext().getHostContext | @kit.ArkUI | `this.getUIContext().getHostContext(): Context` | `let context = this.getUIContext().getHostContext() as common.UIAbilityContext;` | 同上 |

## @ohos.app.ability.UIAbility

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 带界面的应用组件基类 | UIAbility | @kit.AbilityKit | `import { UIAbility } from '@kit.AbilityKit';` | `export default class MyAbility extends UIAbility { ... }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/36_ohos.app.ability.UIAbility (带界面的应用组件).md` |
| UIAbility 上下文属性 | context | @kit.AbilityKit | `context: UIAbilityContext` | `this.context.startAbility(want)` | 同上 |
| UIAbility 创建时回调 | onCreate | @kit.AbilityKit | `onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void` | `onCreate(want, launchParam) { /* 初始化 */ }` | 同上 |
| 窗口创建时回调（加载页面） | onWindowStageCreate | @kit.AbilityKit | `onWindowStageCreate(windowStage: window.WindowStage): void` | `onWindowStageCreate(windowStage) { windowStage.loadContent('pages/Index', ...) }` | 同上 |

## PermissionRequestResult

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限请求结果对象 | PermissionRequestResult | @kit.AbilityKit | `type PermissionRequestResult = _PermissionRequestResult` | `import { PermissionRequestResult } from '@kit.AbilityKit';` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |
| 用户传入的权限列表 | permissions | @kit.AbilityKit | `permissions: Array<string>` | `data.permissions` | 同上 |
| 相应请求权限结果 | authResults | @kit.AbilityKit | `authResults: Array<number>` (-1:未授权, 0:已授权, 2:请求无效) | `data.authResults` | 同上 |
| 是否有弹窗（API 12+） | dialogShownResults | @kit.AbilityKit | `dialogShownResults?: Array<boolean>` | `data.dialogShownResults` | 同上 |
| 错误原因码（API 18+） | errorReasons | @kit.AbilityKit | `errorReasons?: Array<number>` (0:合法, 1:权限名非法, 2:权限未声明, ...) | `data.errorReasons` | 同上 |

## Module Notes

- `requestPermissionsFromUser` 仅可在 Stage 模型下使用。如果用户拒绝授权，无法再次拉起弹框；需调用 `requestPermissionOnSetting` 二次拉起权限设置弹框，或引导用户在系统设置中手动授权。
- `Permissions` 类型为 HarmonyOS 权限名字符串联合类型，具体权限字符串定义在 HarmonyOS 应用权限列表指南中。声明的权限需在 `module.json5` 的 `requestPermissions` 数组中配置才能在运行时请求。
- `ohos.permission.NOTIFICATION_AGENT_CONTROLLER` 为系统级权限，普通应用无法申请。
- `ohos.permission.READ_IMAGEVIDEO`、`ohos.permission.READ_MEDIA`、`ohos.permission.WRITE_MEDIA` 属于用户授权（user_grant）权限，需运行时通过 `requestPermissionsFromUser` 弹框申请。
- 建议优先使用 Promise 风格的 `requestPermissionsFromUser` 重载。校验权限时推荐使用 `checkAccessToken`/`checkAccessTokenSync`（API 9+），而非已废弃的 `verifyAccessToken`。
- 在 Page 组件中通过 `this.getUIContext().getHostContext() as common.UIAbilityContext` 获取 Context 实例。
