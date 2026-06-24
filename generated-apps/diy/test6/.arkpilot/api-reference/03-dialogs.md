# 03 — Dialogs & Sheets

## AlertDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示警告弹窗，可设置文本内容与响应回调 | AlertDialog | built-in（ArkUI 框架内置） | `AlertDialog.show({ title, message, confirm?, cancel?, alignment?, offset? })` | `AlertDialog.show({ title: '提示', message: '确定删除？', confirm: { value: '确定', action: () => {} } })` | 19_弹窗 |
| 推荐方式：UIContext | `this.getUIContext().showAlertDialog(...)` | `this.getUIContext().showAlertDialog({ title, message, confirm, cancel })` | 同上 | 19_弹窗 |

> ⚠️ `AlertDialog.show()` 从 API 18 废弃，推荐使用 `UIContext.showAlertDialog()`

## CustomDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 完全自定义弹窗 | @CustomDialog + CustomDialogController | built-in | `@CustomDialog struct MyDialog {}` → `controller: CustomDialogController = new CustomDialogController(MyDialog({...}))` | `@CustomDialog struct ConfirmDialog { controller: CustomDialogController; build() { Column() { Text('确认操作'); Button('确定').onClick(() => this.controller.close()) } } }` | 19_弹窗 |

> ⚠️ CustomDialog 不支持响应式动态刷新参数；可通过 `customStyle=true` + 内部 @State 实现动态效果

## ActionSheet

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表选择弹窗 | ActionSheet | built-in | `ActionSheet.show({ title, message, sheets: [{ title, action }], ... })` | `ActionSheet.show({ title: '选择', sheets: [{ title: '编辑', action: () => {} }, { title: '删除', action: () => {} }] })` | 19_弹窗 |
| 推荐方式：UIContext | `this.getUIContext().showActionSheet(...)` | `this.getUIContext().showActionSheet({ title, sheets, ... })` | 同上 | 19_弹窗 |

> ⚠️ `ActionSheet.show()` 从 API 18 废弃，推荐使用 `UIContext.showActionSheet()`

## BottomSheet (bindSheet)

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 半模态页面 | bindSheet | built-in（组件属性方法） | `.bindSheet($$isPresent, { build(), ... }, config?)` | `@State isPresent: boolean = false; Column() { Button('打开').onClick(() => { this.isPresent = true }) }.bindSheet($$this.isPresent, { build() { Text('内容') }, detents: ['medium', 'large'] })` | 19_弹窗 |

> 支持多挡位高度（detents）、多种样式（底部/居中/跟手/侧边/全屏）；不支持路由跳转，仅限 Stage 模型

## promptAction

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 全局 Toast/对话框/操作菜单 | promptAction | `import { promptAction } from '@kit.ArkUI'` | `promptAction.showToast({ message, duration? })` / `promptAction.showDialog({ ... })` / `promptAction.showActionMenu({ ... })` | `promptAction.showToast({ message: '保存成功', duration: 2000 })` | 19_弹窗 |

> ⚠️ 从 API 18 废弃，推荐使用 `UIContext.getPromptAction().showToast()`

## Toast

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 即时反馈提示消息 | openToast | built-in（组件属性方法） | `.openToast({ message, duration?, alignment?, offset? })` | `Button('点击').onClick(() => { this.openToast({ message: '操作成功' }) })` | 19_弹窗 |
| 全局方式 | promptAction.showToast | `@kit.ArkUI` | `promptAction.showToast({ message, duration })` | `promptAction.showToast({ message: '操作成功', duration: 2000 })` | 19_弹窗 |

> `openToast()` 是 API 18+ 推荐的组件属性方法；`promptAction.showToast()` 是全局方式

## Menu

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 垂直列表菜单 | Menu + MenuItem | built-in | `.bindMenu(Array<{ value, action }>)` / `.bindContextMenu({ build, ... }, options)` | `Text('更多').bindMenu([{ value: '编辑', action: () => {} }, { value: '删除', action: () => {} }])` | 17_菜单 |

> `bindMenu` 适合简单菜单；`bindContextMenu` 支持右键/长按触发的自定义内容菜单

