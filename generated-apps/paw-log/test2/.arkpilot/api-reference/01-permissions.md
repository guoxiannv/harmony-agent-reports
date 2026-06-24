# 01 — Permissions & Ability Access Control

## ohos.abilityAccessCtrl (程序访问控制管理)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建访问控制管理实例 | abilityAccessCtrl.createAtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `createAtManager(): AtManager` | `let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |
| 校验应用权限（Promise） | AtManager.checkAccessToken (API 9+) | `import { abilityAccessCtrl, Permissions, bundleManager } from '@kit.AbilityKit';` | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, 'ohos.permission.GRANT_SENSITIVE_PERMISSIONS').then(...)` | 同上 |
| 校验应用权限（同步） | AtManager.checkAccessTokenSync (API 10+) | 同上 | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(tokenID, permissionName);` | 同上 |
| 获取自身权限状态（同步） | AtManager.getSelfPermissionStatus (API 20+) | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `getSelfPermissionStatus(permissionName: Permissions): PermissionStatus` | `let data: abilityAccessCtrl.PermissionStatus = atManager.getSelfPermissionStatus('ohos.permission.CAMERA');` | 同上 |
| 订阅自身权限状态变更 | AtManager.on('selfPermissionStateChange') (API 18+) | `import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';` | `on(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback: Callback<PermissionStateChangeInfo>): void` | `atManager.on('selfPermissionStateChange', ['ohos.permission.APPROXIMATELY_LOCATION'], (data) => { ... });` | 同上 |
| 取消订阅自身权限状态变更 | AtManager.off('selfPermissionStateChange') (API 18+) | 同上 | `off(type: 'selfPermissionStateChange', permissionList: Array<Permissions>, callback?: Callback<PermissionStateChangeInfo>): void` | `atManager.off('selfPermissionStateChange', permissionList);` | 同上 |
| 拉起弹框请求用户授权（Callback） | AtManager.requestPermissionsFromUser (API 9+) | `import { abilityAccessCtrl, Context, PermissionRequestResult, common } from '@kit.AbilityKit';` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>, requestCallback: AsyncCallback<PermissionRequestResult>): void` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err, data) => { ... });` | 同上 |
| 拉起弹框请求用户授权（Promise） | AtManager.requestPermissionsFromUser (API 9+) | 同上 | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then(...)` | 同上 |
| 二次拉起权限设置弹框（Promise） | AtManager.requestPermissionOnSetting (API 12+) | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit';` | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.CAMERA']).then(...)` | 同上 |
| 拉起全局开关设置弹框 | AtManager.requestGlobalSwitch (API 12+) | 同上 | `requestGlobalSwitch(context: Context, type: SwitchType): Promise<boolean>` | `atManager.requestGlobalSwitch(context, abilityAccessCtrl.SwitchType.CAMERA).then(...)` | 同上 |
| 拉起跳转设置页弹窗 | AtManager.openPermissionOnSetting (API 22+) | 同上 | `openPermissionOnSetting(context: Context, permission: Permissions): Promise<SelectedResult>` | `atManager.openPermissionOnSetting(context, 'ohos.permission.HOOK_KEY_EVENT').then(...)` | 同上 |

## PermissionRequestResult
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限请求结果对象 | PermissionRequestResult | `import { PermissionRequestResult } from '@kit.AbilityKit';` | `type PermissionRequestResult = _PermissionRequestResult` — 属性: `permissions: Array<string>`, `authResults: Array<number>`, `dialogShownResults12+: Array<boolean>`, `errorReasons18+: Array<number>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA']).then((data) => { console.info(data.permissions, data.authResults); })` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |

## GrantStatus 枚举
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 授权状态枚举 | GrantStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `PERMISSION_DENIED = -1` (未授权), `PERMISSION_GRANTED = 0` (已授权) | `checkAccessToken 返回值类型` | 同 abilityAccessCtrl doc |

## PermissionStatus 枚举 (API 20+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限状态枚举 | PermissionStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `DENIED = -1`, `GRANTED = 0`, `NOT_DETERMINED = 1`, `INVALID = 2`, `RESTRICTED = 3` | `getSelfPermissionStatus 返回值类型` | 同 abilityAccessCtrl doc |

## SelectedResult 枚举 (API 22+)
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 跳转设置页弹窗结果枚举 | SelectedResult | `import { abilityAccessCtrl } from '@kit.AbilityKit';` | `REJECTED = -1`, `OPENED = 0`, `GRANTED = 1` | `openPermissionOnSetting 返回值类型` | 同 abilityAccessCtrl doc |

## Module Notes

### 声明权限 (module.json5)
应用必须在 `entry/src/main/module.json5` 中声明所需权限：
```json
{
  "module": {
    "requestPermissions": [
      {
        "name": "ohos.permanentPermission",
        "reason": "需要使用该权限的原因",
        "usedScene": {
          "abilities": ["EntryAbility"],
          "when": "inuse"
        }
      }
    ]
  }
}
```
- `name`: 权限名称（如 `ohos.permission.READ_IMAGEVIDEO`）
- `reason`: 申请权限的原因，用户可见（仅 user_grant 权限要求）
- `usedScene`: 权限使用的场景和时机（仅 user_grant 权限要求）
- 此配置属于 HarmonyOS 应用开发指南（非 API 参考），本地文档未包含完整 schema。

### Permission System Capacity
所有权限相关 API 的系统能力为 `SystemCapability.Security.AccessToken`。

### Stage Model Only
`requestPermissionsFromUser`、`requestPermissionOnSetting`、`requestGlobalSwitch`、`openPermissionOnSetting` 仅支持 Stage 模型。

### 权限名称常量
`ohos.permission.READ_IMAGEVIDEO` 和 `ohos.permission.WRITE_IMAGEVIDEO` 是 HarmonyOS 应用权限列表中的权限名称字符串（user_grant 类型），定义在官方 `app-permissions` 指南中而非 API 参考文档中，本地知识库未包含。
