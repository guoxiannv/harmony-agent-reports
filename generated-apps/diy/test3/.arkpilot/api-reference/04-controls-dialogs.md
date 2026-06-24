# 04 -- Controls, Dialogs & Input

## Button

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 创建包含子组件或纯文本的按钮 | Button | ArkUI内置组件，无需import | Button(options: ButtonOptions) / Button(label: ResourceStr, options?: ButtonOptions) / Button() | Button('OK', { type: ButtonType.Normal, stateEffect: true }).borderRadius(8).backgroundColor(0x317aff).width(90).onClick(() => { }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/01_Button.md |

**关键实现说明：** ButtonOptions支持type (ButtonType: Normal/Capsule/Circle/ROUNDED_RECTANGLE)、stateEffect、buttonStyle (ButtonStyleMode: EMPHASIZED/NORMAL/TEXTUAL)、controlSize (ControlSize: SMALL/NORMAL)、role (ButtonRole: NORMAL/ERROR)。属性方法包括type()、fontSize()、fontColor()、fontWeight()、buttonStyle()、controlSize()、role()、labelStyle()、contentModifier()。默认type从API 18起为ROUNDED_RECTANGLE，之前为Capsule。

## Text

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示一段文本 | Text | ArkUI内置组件，无需import | Text(content?: string | Resource, value?: TextOptions) | Text('Hello World').fontSize(16).fontColor(Color.Black).textAlign(TextAlign.Center) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/01_Text.md |

**关键实现说明：** 可包含Span/ImageSpan/SymbolSpan/ContainerSpan子组件实现图文混排。支持丰富属性：布局对齐(baselineOffset、textAlign、textVerticalAlign)、字体样式(fontColor、fontSize、fontWeight、fontFamily、fontStyle、decoration、letterSpacing、textShadow、textCase)、文本溢出(textOverflow、ellipsisMode、maxLines、wordBreak、lineBreakStrategy)、字体自适应(minFontSize、maxFontSize、minFontScale、maxFontScale、heightAdaptivePolicy)、选中与复制(copyOption、selection、textSelectable、caretColor、selectedBackgroundColor)。默认字体大小16fp。

## Span

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Text组件的行内文本子组件 | Span | ArkUI内置组件，无需import | Span(value: string | Resource) | Text() { Span('Hello').fontSize(12).fontColor(Color.Red).decoration({ type: TextDecorationType.Underline, color: Color.Red }) } | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/06_Span.md |

**关键实现说明：** 不支持通用属性，只支持decoration、letterSpacing、textCase、fontColor、fontSize、fontStyle、fontWeight、fontFamily、lineHeight、font、textShadow、textBackgroundStyle、baselineOffset。从API 10起继承父组件Text的对应属性。通用事件仅支持onClick和onHover。

## TextInput

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 单行文本输入框 | TextInput | ArkUI内置组件，无需import | TextInput(value?: TextInputOptions) | TextInput({ placeholder: 'input your word...', text: this.text, controller: this.controller }).onChange((value) => { this.text = value }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/03_TextInput.md |

**关键实现说明：** TextInputOptions包含placeholder、text、controller。支持type(InputType: Normal/Number/PhoneNumber/Email/Password/NUMBER_PASSWORD/USER_NAME/NEW_PASSWORD/NUMBER_DECIMAL/URL/ONE_TIME_CODE)、placeholderColor/Font、enterKeyType、caretColor、maxLength、fontColor/FontSize/Style/Weight/Family、inputFilter、copyOption、showPasswordIcon、style(Default/Inline)、textAlign、cancelButton、showCounter、contentType。默认padding: {top:8vp, right:16vp, bottom:8vp, left:16vp}。支持$$和!!双向绑定。

## TextArea

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 多行文本输入框 | TextArea | ArkUI内置组件，无需import | TextArea(value?: TextAreaOptions) | TextArea({ text: this.text, placeholder: 'input...', controller: this.controller }).onChange((value) => { this.text = value }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/02_TextArea.md |

**关键实现说明：** TextAreaOptions包含placeholder、text、controller。高度未设置时自适应内容。属性包括placeholderColor/Font、textAlign、caretColor、fontColor/FontSize/Style/Weight/Family、inputFilter、copyOption、maxLength、showCounter、style(TextContentStyle)、maxLines、type(TextAreaType: NORMAL/NUMBER/PHONE_NUMBER/EMAIL/NUMBER_DECIMAL/URL/ONE_TIME_CODE)、enterKeyType、lineHeight、decoration、letterSpacing、fontFeature、wordBreak、textOverflow、lineSpacing等。支持showInSubWindow。

## DatePicker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动选择日期的组件 | DatePicker | ArkUI内置组件，无需import | DatePicker(options?: DatePickerOptions) | DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1'), selected: this.selectedDate }).onDateChange((value: Date) => { }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/07_DatePicker.md |

**关键实现说明：** DatePickerOptions包括start(默认1970-1-1)、end(默认2100-12-31)、selected(当前系统日期)、mode(DatePickerMode: DATE/YEAR_AND_MONTH/MONTH_AND_DAY)。属性支持lunar农历显示、disappearTextStyle/textStyle/selectedTextStyle、canLoop循环滚动。事件使用onDateChange10+。最大显示行数竖屏5行横屏3行。

## TimePicker

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动选择时间的组件 | TimePicker | ArkUI内置组件，无需import | TimePicker(options?: TimePickerOptions) | TimePicker({ selected: this.selectedTime }).useMilitaryTime(true).onChange((value: TimePickerResult) => { }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/09_TimePicker.md |

**关键实现说明：** TimePickerOptions包括selected、format(TimePickerFormat: HOUR_MINUTE/HOUR_MINUTE_SECOND)、start/end(API 18起)。属性支持useMilitaryTime、disappearTextStyle/textStyle/selectedTextStyle、loop循环滚动、dateTimeOptions(前导0设置)、enableCascade(上午/下午联动)。事件onChange返回TimePickerResult { hour, minute, second }。默认跟随系统时间制式。

## AlertDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示警告弹窗 | AlertDialog.show / uiContext.showAlertDialog | ArkUI内置，无需import | AlertDialog.show(value) (已废弃) / getUIContext().showAlertDialog(params) | getUIContext().showAlertDialog({ title: 'title', message: 'text', confirm: { value: 'OK', action: () => {} } }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/01_警告弹窗 (AlertDialog).md |

**关键实现说明：** 从API 18起推荐使用UIContext.showAlertDialog替代静态AlertDialog.show。AlertDialogParam参数：title、subtitle、message(必填)、autoCancel、cancel、alignment(DialogAlignment)、offset、gridCount。三种按钮配置：AlertDialogParamWithConfirm(单按钮confirm)、AlertDialogParamWithButtons(双按钮primaryButton+secondaryButton)、AlertDialogParamWithOptions(buttons数组+buttonDirection)。支持showInSubWindow、isModal、backgroundColor、cornerRadius、transition、onWillDismiss、生命周期回调(onWillAppear/onDidAppear/onWillDisappear/onDidDisappear)。按钮配置AlertDialogButtonBaseOptions包含enabled、defaultFocus、style、value、fontColor、backgroundColor、action。

## CustomDialog

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 通过控制器显示自定义弹窗 | CustomDialogController | ArkUI内置，无需import | new CustomDialogController(CustomDialogControllerOptions).open() | @CustomDialog @Component struct MyDialog {}; dialogController: CustomDialogController = new CustomDialogController({ builder: MyDialog() }); dialogController.open() | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/19_弹窗/03_自定义弹窗 (CustomDialog).md |

**关键实现说明：** CustomDialogControllerOptions参数：builder(必需@CustomDialog组件)、cancel、autoCancel、alignment、offset、customStyle(是否自定义容器样式)、gridCount、maskColor、maskRect、openAnimation/closeAnimation、showInSubWindow、backgroundColor、cornerRadius、isModal、borderWidth/Color/Style、width/height、shadow、backgroundBlurStyle、keyboardAvoidMode、onWillDismiss、生命周期回调(onWillAppear/onDidAppear/onWillDisappear/onDidDisappear)、levelMode、focusable。控制器调用open()显示、close()关闭。支持@Link/@Consume数据双向绑定。建议在aboutToDisappear中将controller置空。

## Menu

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 以垂直列表形式显示的菜单容器 | Menu | ArkUI内置组件，需配合bindMenu或bindContextMenu使用 | Menu() | Menu() { MenuItem({ content: "复制", labelInfo: "Ctrl+C" }) }.font({ size: 16 }).radius(8) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/17_菜单/01_Menu.md |

**关键实现说明：** Menu必须配合bindMenu或bindContextMenu使用，不能单独使用。包含MenuItem和MenuItemGroup子组件。属性：font统一设置文本尺寸、fontColor、radius(圆角)、menuItemDivider、menuItemGroupDivider、subMenuExpandingMode(SubMenuExpandingMode: SIDE_EXPAND/EMBEDDED_EXPAND/STACK_EXPAND)、subMenuExpandSymbol。菜单项默认2栅格宽度，最小宽度64vp。

## MenuItem

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 菜单中的具体选项 | MenuItem | ArkUI内置组件，无需import | MenuItem(value?: MenuItemOptions | CustomBuilder) | MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项", labelInfo: "Ctrl+C" }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/17_菜单/02_MenuItem.md |

**关键实现说明：** MenuItemOptions包含startIcon、content、endIcon、labelInfo、builder(二级菜单)、symbolStartIcon/symbolEndIcon(API 12起)。属性：selected(选中状态)、selectIcon(选中图标)、contentFont/contentFontColor、labelFont/labelFontColor。事件onChange((selected: boolean) => void)。MenuItem配合Menu组件使用。

## Select

| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 提供下拉选择菜单 | Select | ArkUI内置组件，无需import | Select(options: Array<SelectOption>) | Select([{ value: 'aaa', icon: $r("app.media.icon") }]).selected(this.index).value(this.text).onSelect((index, value) => { }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/12_Select.md |

**关键实现说明：** SelectOption包含value(必填)、icon、symbolIcon。属性：selected(初始选中索引)、value(按钮文本)、controlSize、font/fontColor、selectedOptionFont/FontColor/BgColor、optionFont/FontColor/BgColor、space(文本与箭头间距)、arrowPosition(ArrowPosition: END/START)、menuAlign(MenuAlignType)、optionWidth/optionHeight、menuBackgroundColor、menuBackgroundBlurStyle、divider/dividerStyle、menuOutline、avoidance、showDefaultSelectedIcon。事件onSelect((index, value) => void)。支持$$和!!双向绑定。

## 模块备注

Select适合简单下拉选择场景；复杂上下文菜单优先使用Menu+MenuItem组合；自定义弹窗优先使用CustomDialog而非AlertDialog；AlertDialog推荐通过UIContext.showAlertDialog调用，避免UI上下文不明确问题。TextInput和TextArea共用TextInputController/TextAreaController基础能力(光标定位、文本选择、编辑态控制)。Text的Span子组件从API 10起支持属性继承父组件。
