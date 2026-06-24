# 08 -- 工具能力 文件联系人权限 Lifecycle Permissions

## fileIo (fs)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 基础文件操作：文件基本管理、文件目录管理、文件信息统计、文件流式读写 | fileIo | `import { fileIo } from '@kit.CoreFileKit'` | `fileIo.stat(file: string \| number): Promise<Stat>` | `fileIo.stat(filePath).then((stat) => { console.info(\`size: \${stat.size}\`); })` | `02_应用框架/09_Core File Kit（文件基础服务）/01_ArkTS API/06_ohos.file.fs (文件管理).md` |

## photoAccessHelper

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 相册管理：创建相册、访问和修改相册中的媒体数据 | photoAccessHelper | `import { photoAccessHelper } from '@kit.MediaLibraryKit'` | 参见 `@ohos.file.photoAccessHelper` 模块；包含 PhotoAccessHelper、PhotoAsset、Album 等接口 | `let helper = photoAccessHelper.getPhotoAccessHelper(context);` | `04_媒体/08_Media Library Kit（媒体文件管理服务）/01_ArkTS API/01_ohos.file.photoAccessHelper (相册管理模块)/` |

## contact (contactsManager)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 联系人管理：添加、删除、更新联系人 | contact | `import { contact } from '@kit.ContactsKit'` | `contact.addContact(context: Context, contact: Contact, callback: AsyncCallback<number>): void` | `contact.addContact(context, { name: { fullName: 'xxx' }, phoneNumbers: [{ phoneNumber: '138xxxxxxxx' }] }, (err, data) => {});` | `06_应用服务/08_Contacts Kit（联系人服务）/01_ArkTS API/01_ohos.contact (联系人).md` |

## call (telephony)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 呼叫管理：拨打电话、跳转到拨号界面、获取通话状态、格式化电话号码 | call | `import { call } from '@kit.TelephonyKit'` | `call.makeCall(phoneNumber: string): Promise<void>` | `call.makeCall("138xxxxxxxx").then(() => { console.info('makeCall success'); });` | `03_系统/02_网络/08_Telephony Kit（蜂窝通信服务）/01_ArkTS API/01_ohos.telephony.call (拨打电话).md` |

## UIAbility

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 带界面的应用组件，提供组件创建、销毁、前后台切换等生命周期回调及后台通信能力 | UIAbility | `import { UIAbility } from '@kit.AbilityKit'` | `onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void` | `export default class EntryAbility extends UIAbility { onCreate(want, launchParam) { /* init */ } }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/36_ohos.app.ability.UIAbility (带界面的应用组件).md` |

## AbilityStage

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Module级别的组件管理器，用于 Module 级别资源预加载、线程创建等初始化操作 | AbilityStage | `import { AbilityStage } from '@kit.AbilityKit'` | `onCreate(): void` | `export default class MyAbilityStage extends AbilityStage { onCreate() { console.info('MyAbilityStage.onCreate is called'); } }` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/01_Stage模型能力的接口/04_ohos.app.ability.AbilityStage (AbilityStage组件管理器).md` |

## window

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 窗口管理：创建、销毁、属性设置，窗口间管理调度 | window | `import { window } from '@kit.ArkUI'` | `window.createWindow(config: Configuration, callback: AsyncCallback<Window>): void` | `window.createWindow({ name: "test", windowType: window.WindowType.TYPE_DIALOG, ctx: this.context }, (err, data) => {});` | `02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/02_窗口管理/03_ohos.window (窗口)/` |

## abilityAccessCtrl

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 程序访问控制：应用程序的权限校验和管理 | abilityAccessCtrl | `import { abilityAccessCtrl } from '@kit.AbilityKit'` | `abilityAccessCtrl.createAtManager(): AtManager` | `let atManager = abilityAccessCtrl.createAtManager(); atManager.checkAccessToken(tokenID, permissionName).then((data) => {});` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/01_ohos.abilityAccessCtrl (程序访问控制管理).md` |

## bundleManager

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 应用程序包管理：查询应用包信息、Ability/ExtensionAbility 组件信息 | bundleManager | `import { bundleManager } from '@kit.AbilityKit'` | `bundleManager.getBundleInfoForSelfSync(bundleFlag: number): BundleInfo` | `let bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);` | `02_应用框架/01_Ability Kit（程序框架服务）/01_ArkTS API/03_通用能力的接口(推荐)/16_ohos.bundle.bundleManager (应用程序包管理模块).md` |

## @ohos.enterprise.adminManager

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 企业 MDM 应用 admin 权限管理：激活/解除激活 admin、事件订阅、委托授权 | adminManager | `import { adminManager } from '@kit.MDMKit'` | `adminManager.disableAdmin(admin: Want, userId?: number): Promise<void>` | `adminManager.disableAdmin(wantTemp).then(() => {});` | `03_系统/03_基础功能/06_MDM Kit（企业设备管理服务）/01_ArkTS API/02_ohos.enterprise.adminManager（admin权限管理）.md` |

## 模块说明

- `fileAccess` (`@ohos.file.fileAccess`) 未在本地文档集中找到。文件管理服务使用 `fileManagerService` (`import { fileManagerService } from '@kit.FileManagerServiceKit'`) 作为替代，提供删除文件到回收站、获取文件图标及解析文件快捷方式能力。
- `photoAccessHelper` 属于 Media Library Kit（媒体文件管理服务）而非 File Manager Service Kit，归类于媒体目录。
- `UIAbility`/`AbilityStage`/`bundleManager`/`abilityAccessCtrl` 统一通过 `@kit.AbilityKit` 导入。
- 企业级 admin 管理 (`@ohos.enterprise.adminManager`) 仅对设备管理应用开放，需要 `ohos.permission.MANAGE_ENTERPRISE_DEVICE_ADMIN` 等权限。
