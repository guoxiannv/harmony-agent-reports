# API Reference Index

> **Spec**: `spec.md` | **Docs Root**: `vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
> **Total APIs**: 33 | **Modules**: 4

| API/组件 | 用途 | 详细文档 |
|----------|------|----------|
| **数据持久化 — RDB & Preferences** | | [01-data-persistence.md](01-data-persistence.md) |
| `relationalStore.getRdbStore` | 创建/打开关系型数据库 | [#relationalstoregetrdbstore](01-data-persistence.md#relationalstoregetrdbstore) |
| `RdbStore.insert / update / delete / query` | 增删改查操作 | [#insert](01-data-persistence.md#insert) |
| `RdbStore.execute` | 执行 DDL/DML SQL 语句 | [#execute12](01-data-persistence.md#execute12) |
| `RdbPredicates` | 构造查询/更新/删除条件 | [#class-rdbpredicates](01-data-persistence.md#class-rdbpredicates) |
| `ValuesBucket / ValueType` | 数据集合类型与字段类型 | [#valuesbucket](01-data-persistence.md#valuesbucket) |
| `preferences.getPreferences` | 获取 KV 持久化实例 | [#preferencesgetpreferences](01-data-persistence.md#preferencesgetpreferences) |
| `Preferences.get / put / delete / has` | KV 读写操作 | [#get](01-data-persistence.md#get) |
| `Preferences.flush / getAll` | 落盘与全量读取 | [#flush](01-data-persistence.md#flush) |
| `Preferences.on('change')` | 订阅变更事件 | [#onchange](01-data-persistence.md#onchange) |
| **相册选择 — Photo Picker** | | [02-photo-picker.md](02-photo-picker.md) |
| `photoAccessHelper` | 相册管理模块入口 | [#photoaccesshelper](02-photo-picker.md#photoaccesshelper) |
| `PhotoViewPicker` | 拉起系统图库选择器 | [#photoviewpicker](02-photo-picker.md#photoviewpicker) |
| `PhotoSelectOptions` | 配置选择过滤条件 | [#photoselectoptions](02-photo-picker.md#photoselectoptions) |
| `PhotoSelectResult` | 选择结果（photoUris 数组） | [#photoselectresult](02-photo-picker.md#photoselectresult) |
| `phAccessHelper` | PhotoAccessHelper 实例（变量名惯例） | [#phaccesshelper](02-photo-picker.md#phaccesshelper) |
| **文件存储 — File IO & Backup** | | [03-file-io.md](03-file-io.md) |
| `fileIo (@ohos.file.fs)` | 基础文件操作（读/写/创建/删除/复制/移动等） | [#ohosfilefs-文件管理](03-file-io.md#ohosfilefs-文件管理) |
| `Environment (@ohos.file.environment)` | 获取系统预授权目录（2in1 设备限定） | [#ohosfileenvironment-目录环境能力](03-file-io.md#ohosfileenvironment-目录环境能力) |
| `BackupExtensionAbility` | 备份恢复扩展能力基类 | [#ohosapplicationbackupextensionability](03-file-io.md#ohosapplicationbackupextensionability) |
| `BackupExtensionContext` | 备份恢复扩展上下文（backupDir） | [#ohosfilebackupextensioncontext](03-file-io.md#ohosfilebackupextensioncontext) |
| **通知角标 — Notification Badge** | | [04-notification-badge.md](04-notification-badge.md) |
| `notificationManager` | 通知管理模块导入入口 | [#notificationmanager-模块](04-notification-badge.md#notificationmanager-模块) |
| `notificationManager.setBadgeNumber` | 设定桌面图标角标个数（API 10+） | [#notificationmanagersetbadgenumber-promise](04-notification-badge.md#notificationmanagersetbadgenumber-promise) |
| `notificationManager.getBadgeNumber` | 获取当前应用角标数量（API 22+） | [#notificationmanagergetbadgenumber](04-notification-badge.md#notificationmanagergetbadgenumber) |
| `NotificationRequest.badgeNumber` | 通知请求上的角标数字属性（API 9+） | [#notificationmanagernotificationrequestbadgenumber](04-notification-badge.md#notificationmanagernotificationrequestbadgenumber) |
| `NotificationSlot.badgeFlag` | 通知渠道角标显示开关 | [#notificationmanagernotificationslotbadgeflag](04-notification-badge.md#notificationmanagernotificationslotbadgeflag) |
| `notificationManager.publish` | 发布通知到系统通知中心 | [#notificationmanagerpublish](04-notification-badge.md#notificationmanagerpublish) |

## Notable Findings

- **RDB 单条数据限制 2MB**（共享内存），字符串字段上限 8MB；单次查询建议不超过 5000 条
- **Preferences** 支持 XML（默认，需 flush 落盘）和 GSKV（实时落盘）两种模式，API 18+ 可切换
- **PhotoViewPicker** 返回的 `photoUris` 有**永久授权**，无需声明 `READ_IMAGEVIDEO` 权限
- **PhotoViewPicker 实例**需要跟随 NavDestination 销毁，重复拉起前必须先销毁上一个
- **fileIo** 导入路径为 `@kit.CoreFileKit`，旧 `@ohos.fileio` 已废弃
- **Environment 目录接口**仅 2in1 设备可用
- **角标设置两条路径**：`NotificationRequest.badgeNumber`（累加，API 9+）和 `setBadgeNumber()`（覆盖，API 10+）
- **`badgeNumber <= 0` 清除角标**，`> 99` 显示 `99+`
- **Missing APIs**: `fileAccess`（由 `fileIo.access()` 替代）、`NotificationBadgeStyle`（在通知 Kit 中不存在独立类型）

## 如何阅读

1. **实现 agent 先读本 INDEX.md**（轻量，~70 行）了解全部 API 分布
2. **按需加载模块文件**：实现数据层时加载 `01-data-persistence.md`，实现相册选择时加载 `02-photo-picker.md`，以此类推
