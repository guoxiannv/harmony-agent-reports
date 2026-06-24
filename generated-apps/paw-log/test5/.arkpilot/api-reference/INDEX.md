# PawLog 宠迹 — ArkTS API 参考索引

- **Spec**: `/Users/huaweiide/Desktop/fe/code/harmony-pilot/generated-apps/paw-log/test5/.arkpilot/autopilot/spec.md`
- **Docs Root**: `/Users/huaweiide/Desktop/fe/code/harmony-pilot/vendor/harmony-knowledge-base/data/harmonyos_docs/cn/harmonyos-references`
- **总 API 数**: 23（RDB: 12 found, 1 missing; Preferences: 8 found）
- **模块数**: 2

| API / 组件 | 用途 | 详细文档 |
|------------|------|----------|
| `relationalStore` | RDB 模块命名空间，提供 create/open/delete 等顶层函数 | [01-arkdata-rdb.md](01-arkdata-rdb.md#relationalstore) |
| `RdbStore` | 关系型数据库操作接口（insert/update/delete/query/executeSql） | [01-arkdata-rdb.md](01-arkdata-rdb.md#rdbstore) |
| `ResultSet` | 查询结果集，提供游标遍历和列数据获取方法 | [01-arkdata-rdb.md](01-arkdata-rdb.md#resultset) |
| `ValuesBucket` | 插入/更新数据的键值对集合类型 | [01-arkdata-rdb.md](01-arkdata-rdb.md#valuesbucket) |
| `RdbPredicates` | 数据库操作条件谓词类，支持链式调用 | [01-arkdata-rdb.md](01-arkdata-rdb.md#rdbpredicates) |
| `relationalStore.getRdbStore` | 创建或打开关系型数据库，返回 RdbStore 实例 | [01-arkdata-rdb.md](01-arkdata-rdb.md#relationalstoregetrdbstore) |
| `RdbStore.executeSql` | 执行 SQL（不含查询/事务） | [01-arkdata-rdb.md](01-arkdata-rdb.md#executesql) |
| `RdbStore.insert` | 向目标表插入一行数据 | [01-arkdata-rdb.md](01-arkdata-rdb.md#insert) |
| `RdbStore.update` | 根据条件更新数据 | [01-arkdata-rdb.md](01-arkdata-rdb.md#update) |
| `RdbStore.delete` | 根据条件删除数据 | [01-arkdata-rdb.md](01-arkdata-rdb.md#delete) |
| `RdbStore.query` | 根据条件查询数据 | [01-arkdata-rdb.md](01-arkdata-rdb.md#query) |
| `RdbStore.querySql` | 执行 SQL 查询语句 | [01-arkdata-rdb.md](01-arkdata-rdb.md#querysql) |
| `dataPreferences` | Preferences 实例变量（模块级变量名） | [02-arkdata-preferences.md](02-arkdata-preferences.md#preferences-模块) |
| `Preferences` | 首选项实例类（get/put/delete/flush/on/off） | [02-arkdata-preferences.md](02-arkdata-preferences.md#preferencesput) |
| `preferences.getPreferences` | 获取 Preferences 实例 | [02-arkdata-preferences.md](02-arkdata-preferences.md#preferencesgetpreferences) |
| `Preferences.put` | 写入键值对到缓存 | [02-arkdata-preferences.md](02-arkdata-preferences.md#preferencesput) |
| `Preferences.get` | 从缓存中获取键对应的值 | [02-arkdata-preferences.md](02-arkdata-preferences.md#preferencesget) |
| `Preferences.delete` | 删除指定键值对 | [02-arkdata-preferences.md](02-arkdata-preferences.md#preferencesdelete) |
| `Preferences.flush` | 将缓存数据持久化到文件 | [02-arkdata-preferences.md](02-arkdata-preferences.md#preferencesflush) |
| `Preferences.on` | 订阅数据变更事件 | [02-arkdata-preferences.md](02-arkdata-preferences.md#preferenceson) |

## Notable Findings

- **RDB**: 统一使用 `relationalStore.getRdbStore`（无独立的 `createRdbStore` API）；API 12+ 提供同步变体（insertSync/updateSync 等）；单条数据 ≤ 2MB
- **Preferences**: `put/get/delete/flush/on` 是 Preferences 实例方法（非模块级函数）；GSKV 模式下数据实时落盘无需手动 flush；不支持多进程并发
- **Kit 导入**: 两个模块均从 `@kit.ArkData` 导入

## 使用指引

Implement agent 应先读此 `INDEX.md`，再按需加载对应模块的详细文档。
