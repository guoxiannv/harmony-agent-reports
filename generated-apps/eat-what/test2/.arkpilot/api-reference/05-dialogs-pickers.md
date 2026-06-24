# 05 — Dialogs, Pickers & Input Controls

## CustomDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 自定义弹窗控制器 | CustomDialogController | 内置，无需额外 import | `dialogController: CustomDialogController \| null = new CustomDialogController(CustomDialogControllerOptions)` | `dialogController.open(); dialogController.close();` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/03_自定义弹窗 (CustomDialog).md |

CustomDialogController 支持 `open()`、`close()`、`getState()` 方法。`CustomDialogControllerOptions` 中 `builder` 为必填的自定义内容构造器，`cancel`、`autoCancel`、`alignment`、`offset`、`customStyle`、`gridCount`、`maskColor`、`maskRect`、`showInSubWindow`、`backgroundColor`、`cornerRadius` 等为可选参数。从 API version 7 开始支持。建议优先使用自定义弹窗便于样式与内容自定义。

## AlertDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 警告弹窗 | AlertDialog | 内置，无需额外 import | `AlertDialog.show(value: AlertDialogParamWithConfirm \| AlertDialogParamWithButtons \| AlertDialogParamWithOptions)`（API 18 起废弃）<br>推荐：`this.getUIContext().showAlertDialog({ ... })` | `this.getUIContext().showAlertDialog({ title: '提示', message: '确定删除？', autoCancel: true, alignment: DialogAlignment.Center, confirm: { value: '确定', action: () => {} } })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/01_警告弹窗 (AlertDialog).md |

从 API version 7 开始支持。`AlertDialog.show()` 从 API 18 起废弃，推荐通过 `UIContext.showAlertDialog()` 调用。支持 `title`、`subtitle`、`message`、`autoCancel`、`cancel`、`alignment`、`offset`、`gridCount`、`maskRect`、`showInSubWindow`、`isModal`、`backgroundColor`、`backgroundBlurStyle`、`cornerRadius`、`transition`、`width`、`height`、`borderWidth`、`borderColor`、`borderStyle`、`shadow`、`textStyle`、`onWillDismiss`、`onWillAppear`、`onDidAppear`、`onWillDisappear`、`onDidDisappear`、`levelMode`、`immersiveMode` 等参数。

## DatePicker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动选择日期的组件 | DatePicker | 内置，无需额外 import | `DatePicker(options?: DatePickerOptions)` | `DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-12-31'), selected: new Date() })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/07_DatePicker.md |

从 API version 8 开始支持。`DatePickerOptions` 包含 `start`、`end`、`selected`、`mode`（API 18+，支持 DATE/YEAR_AND_MONTH/MONTH_AND_DAY）。`selected` 从 API 10 起支持 `$$` 双向绑定。支持 `lunar` 属性设置农历显示。

## DatePickerDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 日期滑动选择器弹窗 | DatePickerDialog | 内置，无需额外 import | `DatePickerDialog.show(options?: DatePickerDialogOptions)`（API 18 起废弃）<br>推荐：`this.getUIContext().showDatePickerDialog({ ... })` | `this.getUIContext().showDatePickerDialog({ start: new Date(), end: new Date('2030-12-31'), lunar: false, showTime: true })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/05_日期滑动选择器弹窗 (DatePickerDialog).md |

从 API version 8 开始支持。`DatePickerDialog.show()` 从 API 18 起废弃，推荐通过 `UIContext.showDatePickerDialog()` 调用。`DatePickerDialogOptions` 继承自 `DatePickerOptions`，额外支持 `lunar`、`showTime`、`useMilitaryTime`、`lunarSwitch`、`lunarSwitchStyle`、`disappearTextStyle`、`textStyle`、`selectedTextStyle` 等参数。不支持深浅色模式热更新。

## Rating

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 评分组件 | Rating | 内置，无需额外 import | `Rating(options?: RatingOptions)` | `Rating({ rating: 3.5, stars: 5, stepSize: 0.5 })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/11_Rating.md |

从 API version 7 开始支持。支持 `stars`（默认 5）、`stepSize`（默认 0.5）、`starStyle` 属性。支持 `onChange` 事件。

## Button

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按钮组件 | Button | 内置，无需额外 import | `Button(options: ButtonOptions)` / `Button(label: ResourceStr, options?: ButtonOptions)` | `Button('确定', { type: ButtonType.Capsule, stateEffect: true })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/01_Button.md |

从 API version 7 开始支持。`ButtonOptions` 包含 `type`（默认 ROUNDED_RECTANGLE）、`stateEffect`、`buttonStyle`（API 11+）、`controlSize`（API 11+）、`role`（API 12+）。支持 `backgroundColor`、`fontColor` 等属性。

## Slider

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动条组件 | Slider | 内置，无需额外 import | `Slider(options?: SliderOptions)` | `Slider({ value: 30, min: 0, max: 100, step: 5, style: SliderStyle.OutSet })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/13_Slider.md |

从 API version 7 开始支持。`SliderOptions` 包含 `value`（支持 `$$` 双向绑定）、`min`（默认 0）、`max`（默认 100）、`step`、`style`（OutSet/InSet/NONE）、`direction`（API 8+）、`reverse`（API 8+）。支持 `onChange` 事件。

## Checkbox

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 多选框组件 | Checkbox | 内置，无需额外 import | `Checkbox(options?: CheckboxOptions)` | `Checkbox({ name: 'agree', group: 'terms' }).select(true)` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/03_Checkbox.md |

从 API version 8 开始支持。API 11 开始默认样式由圆角方形变为圆形。`CheckboxOptions` 包含 `name`、`group`、`indicatorBuilder`（API 12+）。属性包括 `select`（支持 `$$` 双向绑定）、`selectedColor`、`onChange`。支持 `CheckboxGroup` 组合使用。

## TextInput

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 单行文本输入框 | TextInput | 内置，无需额外 import | `TextInput(value?: TextInputOptions)` | `TextInput({ placeholder: '请输入...', text: '', controller: this.controller })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/03_TextInput.md |

从 API version 7 开始支持。`TextInputOptions` 包含 `placeholder`、`text`（支持 `$$` 双向绑定）、`controller`（API 8+）。支持 `type`（InputType）、`placeholderColor`、`placeholderFont`、`onChange`、`onSubmit` 等属性。默认 padding 为 `{ top: 8vp, right: 16vp, bottom: 8vp, left: 16vp }`。

## TextArea

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 多行文本输入框 | TextArea | 内置，无需额外 import | `TextArea(value?: TextAreaOptions)` | `TextArea({ placeholder: '请输入...', text: '', controller: this.controller })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/02_TextArea.md |

从 API version 7 开始支持。高度未设置时自适应内容高度，宽度默认撑满最大宽度。`TextAreaOptions` 包含 `placeholder`、`text`（支持 `$$` 双向绑定）、`controller`（API 8+）。支持 `placeholderColor`、`placeholderFont`、`onChange`、`onSubmit` 等属性。

## Text

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 文本显示组件 | Text | 内置，无需额外 import | `Text(content?: string \| Resource, value?: TextOptions)` | `Text('Hello World', { textAlign: TextAlign.Center, fontSize: 16 })` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/01_Text.md |

从 API version 7 开始支持。可包含 Span、ImageSpan、SymbolSpan、ContainerSpan 子组件。支持丰富的文本属性：布局对齐、字体样式（字号、颜色、粗细、字族、装饰线、阴影）、文本溢出与断行（textOverflow、maxLines、wordBreak）、行与段落（lineHeight、lineSpacing、textIndent）、字体自适应（heightAdaptivePolicy、maxFontSize、minFontSize）、文本选择复制（copyOption）。

## Image

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 图片组件 | Image | 内置，无需额外 import | `Image(src: PixelMap \| ResourceStr \| DrawableDescriptor)`（API 12+ 增加 `ImageContent`） | `Image($r('app.media.icon'))` / `Image('https://example.com/image.png')` | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/11_图片与视频/01_Image.md |

从 API version 7 开始支持。支持 png、jpg、jpeg、bmp、svg、webp、gif、heif、tiff 格式。使用网络图片需申请 `ohos.permission.INTERNET`。支持本地图片（$r 资源引用）、网络图片 URL、Base64 字符串、file:// 沙箱 URI、PixelMap。支持 `objectFit`、`alt`、`onComplete`、`onError` 等属性和事件。

## @ohos.promptAction

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Toast 即时反馈 | promptAction.openToast | `import { promptAction } from '@kit.ArkUI'` | `openToast(options: ShowToastOptions): Promise<number>` | `uiContext.getPromptAction().openToast({ message: '操作成功', duration: 2000 })` | 02_应用框架/05_ArkUI（方舟UI框架）/01_ArkTS API/01_UI界面/21_ohos.promptAction (弹窗).md |
| 对话框 | promptAction.showDialog | `import { promptAction } from '@kit.ArkUI'` | `showDialog(options: ShowDialogOptions): Promise<ShowDialogSuccessResponse>`（已废弃，推荐使用 UIContext 中的对话框方法） | `uiContext.getPromptAction().showDialog({ title: '提示', message: '内容', buttons: [{ text: '确定', color: '#007dff' }] })` | 同上 |
| 操作菜单 | promptAction.showActionMenu | `import { promptAction } from '@kit.ArkUI'` | `showActionMenu(options: ActionMenuOptions): Promise<ActionMenuSuccessResponse>`（已废弃） | `uiContext.getPromptAction().showActionMenu({ title: '选择', buttons: [{ text: '选项一', color: '#000' }] })` | 同上 |

从 API version 9 开始支持。导入路径为 `@kit.ArkUI`。`openToast` 从 API 18 开始支持，`showDialog` 和 `showActionMenu` 已废弃（从 API 18 起不建议使用），推荐使用 `UIContext` 中的弹窗方法。`ShowToastOptions` 支持 `message`（必填）、`duration`、`bottom`、`alignment`、`offset`、`showMode`、`backgroundColor`、`textColor`、`backgroundBlurStyle`、`shadow` 等参数。本模块不支持在 UIAbility 生命周期中调用。建议通过 `uiContext.getPromptAction()` 获取 `PromptAction` 对象后调用弹窗方法。

## 模块说明

- `AlertDialog.show()` 和 `DatePickerDialog.show()` 从 API 18 起废弃，应统一通过 `UIContext.showAlertDialog()` / `UIContext.showDatePickerDialog()` 调用。
- `promptAction.showDialog()` 和 `promptAction.showActionMenu()` 从 API 18 起废弃，推荐使用 `UIContext` 中的对应弹窗方法。
- 所有 ArkUI 组件（CustomDialog/AlertDialog/Button/Slider/Checkbox/Text/TextInput/TextArea/Image/DatePicker/Rating 等）都是内置组件，无需额外 import。只有 `@ohos.promptAction` 需要显式 import。
- DatePickerDialog、CalendarPickerDialog 等 picker 弹窗不建议在 `showInSubWindow=true` 的自定义弹窗中使用。
