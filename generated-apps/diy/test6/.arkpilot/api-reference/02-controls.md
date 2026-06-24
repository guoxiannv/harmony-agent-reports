# 02 — Controls & Input Components

## Button
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 按钮组件，可快速创建不同样式的按钮 | Button | 内置组件，无需导入 | Button(options: ButtonOptions), Button(label: ResourceStr, options?: ButtonOptions) | Button('确定').type(ButtonType.Capsule).onClick(() => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/01_Button.md |

## TextInput
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 单行文本输入框 | TextInput | 内置组件，无需导入 | TextInput(value?: TextInputOptions) | TextInput({ placeholder: '请输入用户名', text: '' }).onChange((val) => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/03_TextInput.md |

## TextArea
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 多行文本输入框，自动换行 | TextArea | 内置组件，无需导入 | TextArea(value?: TextAreaOptions) | TextArea({ placeholder: '请输入详细地址', text: '' }).onChange((val) => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/02_TextArea.md |

## Search
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 搜索框组件，支持搜索图标和搜索按钮 | Search | 内置组件，无需导入 | Search(options?: SearchOptions) | Search({ value: '', placeholder: '搜索...' }).searchButton('搜索').onSubmit((val) => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/05_Search.md |

## Checkbox
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 多选框组件，支持自定义选中样式 | Checkbox | 内置组件，无需导入 | Checkbox(options?: CheckboxOptions) | Checkbox({ name: 'agree' }).select(true).onChange((val) => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/03_Checkbox.md |

## Radio
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 单选框，相同group内只能选中一项 | Radio | 内置组件，无需导入 | Radio(options: RadioOptions) | Radio({ value: 'male', group: 'genderGroup' }).checked(true) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/10_Radio.md |

## Select
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 下拉选择菜单 | Select | 内置组件，无需导入 | Select(options: Array&lt;SelectOption&gt;) | Select([{ value: '选项1' }, { value: '选项2' }]).onSelect((index, val) => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/12_Select.md |

## Badge
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 信息标记组件，附加在组件上做提醒 | Badge | 内置组件，无需导入 | Badge(value: BadgeParamWithNumber), Badge(value: BadgeParamWithString) | Badge({ count: 99, position: BadgePosition.RightTop }) { Text('消息') } | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/12_信息展示/03_Badge.md |

## Menu
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 垂直列表菜单，需配合 bindMenu/bindContextMenu 使用 | Menu | 内置组件，无需导入 | Menu() | Menu() { MenuItem({ content: '复制' }) }.bindMenu() | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/17_菜单/01_Menu.md |

## DatePicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动选择日期的组件 | DatePicker | 内置组件，无需导入 | DatePicker(options?: DatePickerOptions) | DatePicker({ start: new Date('2000-1-1'), end: new Date('2030-12-31'), selected: new Date() }).onChange((val) => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/07_DatePicker.md |

## TimePicker
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 滑动选择时间的组件 | TimePicker | 内置组件，无需导入 | TimePicker(options?: TimePickerOptions) | TimePicker({ selected: new Date(), format: TimePickerFormat.HOUR_MINUTE }).onChange((val) => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/09_TimePicker.md |

## Rating
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 评分组件，在给定范围内选择评分 | Rating | 内置组件，无需导入 | Rating(options?: RatingOptions) | Rating({ rating: 3, stars: 5 }).onChange((val) => {}) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/09_按钮与选择/11_Rating.md |

## Progress
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 进度条组件，支持 Linear/Ring/Scale/Moon 等类型 | Progress | 内置组件，无需导入 | Progress(options: ProgressOptions) | Progress({ value: 50, total: 100, type: ProgressType.Linear }) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/12_信息展示/10_Progress.md |

## LoadingProgress
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示加载动效的组件 | LoadingProgress | 内置组件，无需导入 | LoadingProgress() | LoadingProgress().color('#ff666666').enableLoading(true) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/12_信息展示/07_LoadingProgress.md |

## Text
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| 显示一段文本的组件，可包含 Span/ImageSpan 子组件 | Text | 内置组件，无需导入 | Text(content?: string \| Resource, value?: TextOptions) | Text('Hello World').fontSize(16).fontColor(Color.Black).textAlign(TextAlign.Center) | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/01_Text.md |

## Span
| 用途 | API/组件/装饰器名 | 导入路径/模块 | API 定义/签名 | 用法示例 | 来源文件 |
|------|-------------------|---------------|--------------|----------|----------|
| Text 的子组件，用于显示行内文本 | Span | 内置组件，无需导入 | Span(value: string \| Resource) | Text() { Span('Hello ').fontColor(Color.Red).fontSize(16) } | 02_应用框架/05_ArkUI（方舟UI框架）/02_ArkTS组件/10_文本与输入/06_Span.md |

## 模块备注

- 所有列出的 ArkUI 控件均为内置组件，无需 import 声明，可直接在 @Component 的 build() 方法中使用。
- 高级类型（如 ComponentContent、SymbolGlyphModifier、LengthMetrics、ColorMetrics）需从 `@kit.ArkUI` 导入。
- MultiplePicker（DatePicker/TimePicker）不建议在动效过程中修改属性数据。
- Menu 必须通过 bindMenu() 或 bindContextMenu() 挂载到目标组件上，不能单独使用。
- Badge 为容器组件，支持单个子组件，不影响子组件布局。
- Span 从 API 10 开始可继承父组件 Text 的字体/颜色属性。
- Rating 父组件若指定宽高，需为 Rating 设置宽高或父组件开启 clip。
