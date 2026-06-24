# 05 — Permissions Management

## @ohos.abilityAccessCtrl (abilityAccessCtrl)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建程序访问控制管理实例 | abilityAccessCtrl.createAtManager | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `createAtManager(): AtManager` | `let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## AtManager.checkAccessToken (API 9+)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 异步校验应用是否被授予指定权限 | AtManager.checkAccessToken | `import { abilityAccessCtrl, Permissions, bundleManager } from '@kit.AbilityKit'` | `checkAccessToken(tokenID: number, permissionName: Permissions): Promise<GrantStatus>` | `atManager.checkAccessToken(tokenID, 'ohos.permission.READ_MEDIA').then((data: abilityAccessCtrl.GrantStatus) => { ... })` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## AtManager.checkAccessTokenSync (API 10+)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 同步校验应用是否被授予指定权限 | AtManager.checkAccessTokenSync | `import { abilityAccessCtrl, Permissions, bundleManager } from '@kit.AbilityKit'` | `checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus` | `let data: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(tokenID, 'ohos.permission.READ_MEDIA');` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## AtManager.requestPermissionsFromUser (API 9+)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 拉起弹框请求用户授权（Stage模型） | AtManager.requestPermissionsFromUser | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit'` | `requestPermissionsFromUser(context: Context, permissionList: Array<Permissions>): Promise<PermissionRequestResult>` | `atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA']).then((data) => { console.info(data.authResults); })` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## PermissionRequestResult

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 权限请求结果对象 | PermissionRequestResult | `import { PermissionRequestResult } from '@kit.AbilityKit'` | `{ permissions: Array<string>, authResults: Array<number>, dialogShownResults?: Array<boolean>, errorReasons?: Array<number> }` | `data.authResults.forEach((r) => { if (r === 0) { /* granted */ } })` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/04_接口依赖的元素及定义/04_security/01_PermissionRequestResult.md` |

## GrantStatus

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 授权状态枚举 | GrantStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `enum GrantStatus { PERMISSION_DENIED = -1, PERMISSION_GRANTED = 0 }` | `if (data === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) { /* 已授权 */ }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## PermissionStatus (API 20+)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 更详细的权限状态枚举（适用于 getSelfPermissionStatus） | PermissionStatus | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `enum PermissionStatus { DENIED = -1, GRANTED = 0, NOT_DETERMINED = 1, INVALID = 2, RESTRICTED = 3 }` | `let status = atManager.getSelfPermissionStatus('ohos.permission.READ_MEDIA');` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## AtManager.requestPermissionOnSetting (API 12+)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 二次拉起权限设置弹框引导用户授权 | AtManager.requestPermissionOnSetting | `import { abilityAccessCtrl, Context, common } from '@kit.AbilityKit'` | `requestPermissionOnSetting(context: Context, permissionList: Array<Permissions>): Promise<Array<GrantStatus>>` | `atManager.requestPermissionOnSetting(context, ['ohos.permission.READ_MEDIA']).then(...)` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## Module Notes

### module.json5 权限声明格式

所有 user_grant 权限（包括 `ohos.permission.READ_MEDIA`、`ohos.permission.WRITE_MEDIA`）必须在 `entry/src/main/module.json5` 的 `requestPermissions` 数组中声明，否则 `requestPermissionsFromUser` 调用会失败（错误码 12100001）。声明格式如下：

```json5
{
  module: {
    requestPermissions: [
      {
        name: "ohos.permission.READ_MEDIA",
        reason: "$string:permission_read_media_reason",
        usedScene: {
          abilities: ["EntryAbility"],
          when: "inuse"
        }
      }
    ]
  }
}
```

- `name` — 权限名称字符串。
- `reason` — 向用户展示的申请原因（仅 user_grant 类权限必填），通常引用 `string.json` 中的资源 ID。
- `usedScene.abilities` — 使用该权限的 ability 列表。
- `usedScene.when` — 使用时机，可选 `"inuse"`（前台使用时）或 `"always"`。

### 运行态权限申请流程

1. 在 `module.json5` 中声明权限。
2. 通过 `bundleManager.getBundleInfoForSelfSync` 获取本应用的 `accessTokenId`。
3. 使用 `atManager.checkAccessToken(tokenID, permissionName)` 检查是否已授权。
4. 如未授权，调用 `atManager.requestPermissionsFromUser(context, permissionList)` 弹出授权对话框。
5. 在 `requestPermissionsFromUser` 的 Promise/回调中检查 `PermissionRequestResult.authResults`，每个元素对应 `permissionList` 同索引的权限结果：`0` 表示授权，`-1` 表示拒绝，`2` 表示无效请求。
6. 若用户首次拒绝，无法再次弹窗；可调用 `requestPermissionOnSetting` 二次拉起设置弹框引导授权。

### 关于 permissionManager

`permissionManager` 并非独立 API 模块。在 HarmonyOS 文档中，访问控制功能归入 `@ohos.abilityAccessCtrl` 模块，所有权限校验和请求操作均通过 `AtManager` 实例完成。

### 关于 READ_MEDIA / WRITE_MEDIA

- `ohos.permission.READ_MEDIA` 和 `ohos.permission.WRITE_MEDIA` 属于 user_grant（用户授权）类型权限，需要运行时弹窗申请。
- API 12+ 推荐使用 `PhotoAccessHelper` 替代直接文件路径读写，后者在部分场景下可免去 `WRITE_MEDIA` 权限需求。
- `READ_MEDIA` 权限的授权方式为 `manual_settings`，需用户在设置中手动授予。
