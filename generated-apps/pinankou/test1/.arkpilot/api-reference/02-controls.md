# 02 — Controls, Input & Dialogs

## Button
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按钮组件，可快速创建不同样式的按钮 | Button | 内置组件，无需额外 import | `Button(label: ResourceStr, options?: ButtonOptions)`<br>`Button(options: ButtonOptions)`<br>`Button()` | `Button('OK', { type: ButtonType.Normal, stateEffect: true }).borderRadius(8).backgroundColor(0x317aff).width(90)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/01_Button.md` |

## TextInput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 单行文本输入框组件 | TextInput | 内置组件，无需额外 import | `TextInput(value?: TextInputOptions)` | `TextInput({ text: this.text!!, placeholder: 'input your word...', controller: this.controller }).placeholderColor(Color.Grey).caretColor(Color.Blue)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/03_TextInput.md` |

## TextArea
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 多行文本输入框组件，自动换行显示 | TextArea | 内置组件，无需额外 import | `TextArea(value?: TextAreaOptions)` | `TextArea({ text: this.text, placeholder: 'The text area can hold an unlimited amount of text. input your word...', controller: this.controller }).placeholderFont({ size: 16, weight: 400 }).width(336).height(56)` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/02_TextArea.md` |

## Checkbox
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供多选框组件 | Checkbox | 内置组件，无需额外 import | `Checkbox(options?: CheckboxOptions)` | `Checkbox({ name: 'checkbox1', group: 'checkboxGroup' }).select(true).selectedColor(0xed6f21).shape(CheckBoxShape.CIRCLE).onChange((value: boolean) => { })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/03_Checkbox.md` |

## Select
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供下拉选择菜单，让用户在多个选项间选择 | Select | 内置组件，无需额外 import | `Select(options: Array\<SelectOption>)` | `Select([{ value: 'aaa', icon: $r("app.media.selection") }, { value: 'bbb' }]).selected(this.index).value(this.text).font({ size: 16, weight: 500 })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/12_Select.md` |

## DatePicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动选择日期的组件 | DatePicker | 内置组件，无需额外 import | `DatePicker(options?: DatePickerOptions)` | `DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1'), selected: this.selectedDate }).lunar(this.isLunar).onDateChange((value: Date) => { })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/07_DatePicker.md` |

## TimePicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动选择时间的组件 | TimePicker | 内置组件，无需额外 import | `TimePicker(options?: TimePickerOptions)` | `TimePicker({ selected: this.selectedTime }).disappearTextStyle({ color: '#004aaf', font: { size: 24 } }).textStyle({ color: Color.Black, font: { size: 26 } }).selectedTextStyle({ color: Color.Blue, font: { size: 30 } }).onChange((value: TimePickerResult) => { })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/09_TimePicker.md` |

## AlertDialog
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示警告弹窗组件，可设置文本内容与响应回调 | AlertDialog | 内置方法，推荐通过 `getUIContext().showAlertDialog()` 调用 | `AlertDialog.show(value: AlertDialogParamWithConfirm \| AlertDialogParamWithButtons \| AlertDialogParamWithOptions)` | `this.getUIContext().showAlertDialog({ title: 'title', message: 'text', autoCancel: true, alignment: DialogAlignment.Bottom, confirm: { value: 'button', action: () => { } } })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/01_警告弹窗 (AlertDialog).md` |

## CustomDialog
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过CustomDialogController类显示自定义弹窗 | CustomDialogController | 内置类，无需额外 import；需使用 `@CustomDialog` 装饰器 | `new CustomDialogController(CustomDialogControllerOptions)`<br>方法：`open()` / `close()` | `@CustomDialog @Component struct CustomDialogExample { @Link textValue: string; ... }` 在组件中：`dialogController: CustomDialogController = new CustomDialogController({ builder: CustomDialogExample({}) })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/03_自定义弹窗 (CustomDialog).md` |

## ActionSheet
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 列表弹窗，提供多个选项供用户选择 | ActionSheet | 内置方法，推荐通过 `getUIContext().showActionSheet()` 调用 | `ActionSheet.show(value: ActionSheetOptions)` | `this.getUIContext().showActionSheet({ title: 'ActionSheet title', subtitle: 'ActionSheet subtitle', message: 'message', autoCancel: true, confirm: { defaultFocus: true, value: 'Confirm button', action: () => { } }, sheets: [{ title: 'app', action: () => { } }] })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/02_列表选择弹窗 (ActionSheet).md` |

## Menu
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 以垂直列表形式显示的菜单 | Menu / MenuItem / MenuItemGroup | 内置组件，需配合 `bindMenu` 或 `bindContextMenu` 使用 | `Menu()` 包含 `MenuItem(value?: MenuItemOptions \| CustomBuilder)` 和 `MenuItemGroup(value?: MenuItemGroupOptions)` | `Menu() { MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" }) MenuItem({ content: "复制", labelInfo: "Ctrl+C" }) }` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/17_菜单/01_Menu.md` |

## Toggle
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供勾选框样式、状态按钮样式和开关样式 | Toggle | 内置组件，无需额外 import | `Toggle(options: ToggleOptions)` | `Toggle({ type: ToggleType.Switch, isOn: false }).selectedColor('#007DFF').switchPointColor('#FFFFFF').onChange((isOn: boolean) => { })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/02_Toggle.md` |

## Radio
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 单选框，提供用户交互选择项 | Radio | 内置组件，无需额外 import | `Radio(options: RadioOptions)` | `Radio({ value: 'Radio1', group: 'radioGroup' }).checked(true).radioStyle({ checkedBackgroundColor: Color.Pink }).onChange((isChecked: boolean) => { })` | `02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/10_Radio.md` |

## 模块说明

- Button、TextInput、TextArea、Checkbox、Select、DatePicker、TimePicker、Toggle、Radio 均为 ArkUI 内置组件（ArkTS Component），无需 import 语句即可直接在 `build()` 中使用。
- AlertDialog 和 ActionSheet 是全局方法调用，推荐通过 `getUIContext().showAlertDialog()` / `getUIContext().showActionSheet()` 调用以明确 UI 上下文。
- CustomDialog 需要 `@CustomDialog` 装饰器装饰自定义组件 struct，并通过 `CustomDialogController` 控制显示/关闭。
- Menu 组件不能单独使用，需配合宿主组件的 `bindMenu` 或 `bindContextMenu` 属性挂载。
