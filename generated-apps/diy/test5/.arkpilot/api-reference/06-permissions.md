# 06 — Permissions 权限声明与申请

## abilityAccessCtrl
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 程序访问控制管理，提供权限校验和管理能力的模块 | abilityAccessCtrl | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `abilityAccessCtrl.createAtManager(): AtManager` | `let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## ATManager
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 访问控制管理实例，用于权限校验、申请和设置跳转 | AtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit';` (通过 createAtManager 获取实例) | `atManager.checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `let atManager = abilityAccessCtrl.createAtManager(); atManager.checkAccessToken(tokenID, 'ohos.permission.CAMERA').then((data) => {});` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## requestPermissionsFromUser (AtManager 方法)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起弹框请求用户授权（Stage模型） | requestPermissionsFromUser | `import { abilityAccessCtrl, Context, PermissionRequestResult, common } from '@kit.AbilityKit';` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `let context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext; atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data) => { console.info('permissions:' + data.permissions); });` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## PERMISSION_GRANTED
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 授权状态枚举值，表示已授权 | GrantStatus (PERMISSION_GRANTED) | 通过 `abilityAccessCtrl.GrantStatus` 从 `@kit.AbilityKit` 引入 | `enum GrantStatus { PERMISSION_DENIED = -1, PERMISSION_GRANTED = 0 }` | `atManager.checkAccessToken(tokenID, permissionName).then((data: abilityAccessCtrl.GrantStatus) => { if (data === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) { ... } });` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## Context.requestPermissionsFromUser
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Context 请求用户授权（FA 模型专用，Stage 模型请使用 AtManager 方法） | Context.requestPermissionsFromUser | `@kit.AbilityKit` (FA 模型 Context) | `requestPermissionsFromUser(permissions: Array<string>, requestCode: number): Promise<PermissionRequestResult>` | `context.requestPermissionsFromUser(['ohos.permission.CAMERA'], 0).then((data) => { console.info('data: ' + JSON.stringify(data)); });` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/02_FA模型能力的接口/05_app/02_Context (FA模型的上下文基类).md` |

## common.UIAbilityContext
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| UIAbility 组件的上下文类型，继承自 Context | UIAbilityContext | `import { common } from '@kit.AbilityKit';` | `type UIAbilityContext = _UIAbilityContext.default` | `let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/16_ohos.app.ability.common (Ability公共模块).md` |

## ohos.permission.MICROPHONE
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 麦克风权限，用于录音和语音识别 | `ohos.permission.MICROPHONE` | 在 `module.json5` 中声明；代码中以字符串 `'ohos.permission.MICROPHONE'` 传入 | user_grant 权限，API version 9+ | `atManager.requestPermissionsFromUser(context, ['ohos.permission.MICROPHONE']);` | 引用自 Audio Kit、Camera Kit、Media Kit、ArkWeb 等文档 |

## 模块说明

- **权限声明**：`ohos.permission.READ_IMAGEVIDEO`、`ohos.permission.WRITE_IMAGEVIDEO`、`ohos.permission.MEDIA_LOCATION` 在本地 API 参考中未找到独立文档定义——它们是 HarmonyOS 应用权限列表的一部分，具体定义详见官方权限指南。
- **bundleManager.getPermissionDef**：在本地 API 参考文档中未找到该 API，可能存在于其它文档版本或需通过 `bundleManager` 模块的 `BundleInfo` / `ApplicationInfo` 间接获取权限定义信息。
- **Stage 模型权限申请流程**：使用 `abilityAccessCtrl.createAtManager()` 获取 `AtManager` 实例，调用 `atManager.requestPermissionsFromUser(context, permissionList)` 请求用户授权。推荐使用 Promise 风格。
- **授权状态查询**：推荐使用 `AtManager.checkAccessTokenSync()` (API 10+) 同步查询权限状态，替代已废弃的 `verifyAccessTokenSync()`。
- **二次申请**：若用户首次拒绝，可通过 `AtManager.requestPermissionOnSetting()` (API 12+) 拉起权限设置弹框引导用户授权。
