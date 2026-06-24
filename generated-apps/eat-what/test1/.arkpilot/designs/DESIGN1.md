# 今天吃什么 - 视觉设计规范 v1

## 1. App 氛围与调性

一款有"生活烟火气"的饮食决策 App。整体视觉在 Apple 克制版式的基础上，融入食物的温度感：背景像清晨厨房的暖光，卡片像陶瓷餐具般圆润，阴影柔和，色彩以焦糖橙为主轴，搭配薄荷绿、奶油黄、薰衣草紫等食欲感辅助色。界面应当让人觉得"被照顾到了"，而不是被算法支配。

设计语言关键词：**温暖、圆润、有食欲、仪式感、轻松**。

## 2. 色彩系统

### 主色
- **暖奶油背景** (`#FFF7F0`): 主页面背景，比纯白更温暖，像晨光洒在桌面上。
- **纯白卡片** (`#FFFFFF`): 卡片、底部栏、弹窗表面。
- **深炭文字** (`#1F1F1F`): 主标题，高对比但不刺眼。
- **中灰文字** (`#5A5A5A`): 正文、描述。
- **浅灰文字** (`#9CA3AF`): 占位符、辅助说明。

### 强调色
- **焦糖橙** (`#E07B39`): 主按钮、转盘指针、选中态、关键图标。
- **焦糖渐变** (`linear-gradient(145deg, #F4A261 0%, #E07B39 50%, #C65D26 100%)`): 主 CTA、转盘中心、重要卡片。
- **薄荷绿** (`#2A9D8F`): 健康、清淡、打卡成功、热量低标签。
- **奶油黄** (`#E9C46A`): 早餐、快手菜、温暖提示。
- **薰衣草紫** (`#9B7EDE`): 治愈系、放纵一下、夜宵。
- **珊瑚粉** (`#E76F51`): 晚餐、重口味、删除/警示（慎用）。

### 表面与状态
- **暖阴影** (`0 12px 32px rgba(224, 123, 57, 0.14)`): 悬浮卡片、转盘。
- **中性阴影** (`0 4px 16px rgba(31, 31, 31, 0.08)`): 普通卡片。
- **底部玻璃栏** (`background: rgba(255, 255, 255, 0.82); backdrop-filter: saturate(180%) blur(24px); border-top: 1px solid rgba(0,0,0,0.04)`).
- **按压态**: 按钮 `scale(0.97)`，背景明度降低 10%。
- **禁用态**: `opacity: 0.38`。

### 渐变背景
- **首页顶部氛围渐变** (`radial-gradient(circle at 50% 0%, rgba(244, 162, 97, 0.12) 0%, transparent 60%)`): 营造顶部暖光。
- **转盘外圈** (`conic-gradient(from 0deg, #F4A261, #E9C46A, #2A9D8F, #9B7EDE, #E76F51, #F4A261)`): 多彩分区，每一格一种食欲色。

### 标签色彩映射
| 标签 | 背景 | 文字 | 边框 |
|------|------|------|------|
| 早餐 | `#FFF8E1` | `#B9891B` | 无 |
| 午餐 | `#E0F2F1` | `#167A6D` | 无 |
| 晚餐 | `#FCE4EC` | `#B94A5F` | 无 |
| 夜宵 | `#F3E5F5` | `#7E57C2` | 无 |
| 想吃清淡 | `#E0F2F1` | `#167A6D` | 无 |
| 重口味 | `#FCE4EC` | `#B94A5F` | 无 |
| 快手菜 | `#FFF8E1` | `#B9891B` | 无 |
| 健康减脂 | `#E0F2F1` | `#167A6D` | 无 |
| 放纵一下 | `#F3E5F5` | `#7E57C2` | 无 |
| 治愈系 | `#FCE4EC` | `#B94A5F` | 无 |

## 3. 字体规范

### 字体栈
- **标题**: `-apple-system, BlinkMacSystemFont, SF Pro Display, PingFang SC, Microsoft YaHei, sans-serif`
- **正文**: `-apple-system, BlinkMacSystemFont, SF Pro Text, PingFang SC, Microsoft YaHei, sans-serif`

### 字号层级
| 角色 | 字号 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| 页面大标题 | 34px | 800 | 1.12 | -0.6px | 首页 "今天吃什么" |
| 页面副标题 | 22px | 700 | 1.25 | -0.3px | 二级标题 |
| 卡片标题 | 18px | 700 | 1.3 | -0.2px | 菜品名称 |
| 正文 | 15px | 500 | 1.55 | -0.1px | 描述、食材 |
| 辅助文字 | 13px | 500 | 1.4 | 0 | 标签、时间 |
| 小字 | 11px | 600 | 1.3 | 0.2px | 角标、统计数字 |
| 按钮文字 | 16px | 700 | 1 | 0 | 主按钮 |

## 4. 组件样式

### 主按钮
- 背景：`linear-gradient(145deg, #F4A261 0%, #E07B39 100%)`
- 文字：`#FFFFFF`
- 内边距：16px 32px
- 圆角：18px
- 阴影：`0 10px 24px rgba(224, 123, 57, 0.38)`
- 按压：`scale(0.97)`，阴影收窄

### 次按钮
- 背景：`#FFFFFF`
- 文字：`#E07B39`
- 边框：1.5px solid `#E07B39`
- 圆角：16px
- 阴影：`0 2px 8px rgba(0,0,0,0.04)`

### 标签按钮
- 背景：`#FFF5EE`
- 文字：`#C65D26`
- 圆角：14px
- 内边距：9px 18px
- 选中：背景 `#E07B39`，文字 `#FFFFFF`，阴影 `0 4px 12px rgba(224,123,57,0.25)`

### 卡片
- 背景：`#FFFFFF`
- 圆角：24px
- 内边距：20px
- 阴影：`0 12px 32px rgba(224, 123, 57, 0.10)`
- 间距：16px

### 输入框
- 背景：`#F8F1EC`
- 圆角：16px
- 高度：52px
- 内边距：0 18px
- 占位符：`#9CA3AF`
- 聚焦：边框 2px solid `#E07B39`，背景 `#FFFFFF`

### 底部 Tab 栏
- 背景：玻璃拟态白色
- 高度：72px（含安全区）
- 图标：26px，未选中 `#9CA3AF`，选中 `#E07B39`
- 文字：11px，选中字重 700

### 转盘
- 外圈：300px 圆形，背景 conic-gradient 多色分区
- 内圈阴影：`inset 0 0 20px rgba(0,0,0,0.06)`
- 指针：顶部倒三角，颜色 `#E07B39`，带小圆点底座
- 中心按钮：88px 圆形，焦糖渐变，"开始" 16px 700
- 结果卡片：从转盘下方滑入，圆角 24px，暖阴影

## 5. 布局原则

### 容器
- 内容最大宽度：390px，居中，`margin: 0 auto`。
- 水平内边距：20px。
- 顶部安全区 + 导航：约 56px。

### 间距系统
- 基础单位：4px
- 常用间距：8px, 12px, 16px, 20px, 24px, 32px, 40px

### 首屏约束
- Header + 转盘 + 结果提示必须在 600vp 内可见。
- 转盘直径 300px，首页不强制滚动即可操作。

### 滚动
- 列表垂直滚动。
- 底部 Tab 固定，内容在 Tab 上方滚动，最后一条预留 100px 底部空白。

## 6. 动效

- 转盘旋转：`cubic-bezier(0.22, 1, 0.36, 1)`，4-6 圈，2.5-4 秒。
- 结果卡片：`translateY(30px) → 0`，`opacity 0 → 1`，0.5s，`cubic-bezier(0.34, 1.56, 0.64, 1)`（弹簧）。
- 标签选中：0.2s ease，scale 0.95 按压。
- 页面切换：水平滑动 0.28s。
- 卡片按压：`translateY(-1px)`，阴影加深。

## 7. Semantic UI Binding

### Surfaces
| pageId | route | tabId | name |
|--------|-------|-------|------|
| home-page | pages/Home | tab-home | 首页 |
| ingredients-page | pages/Ingredients | tab-ingredients | 食材推荐 |
| discover-page | pages/Discover | tab-discover | 发现 |
| checkin-page | pages/Checkin | tab-checkin | 打卡 |
| share-card-page | pages/ShareCard | - | 分享卡片 |
| dish-detail-page | pages/DishDetail | - | 菜品详情 |
| profile-page | pages/Profile | tab-profile | 我的 |
| checkin-form-sheet | pages/CheckinForm | - | 打卡表单 |
| wheel-settings-sheet | pages/WheelSettings | - | 转盘设置 |

### Action / Input / Assertion IDs
| ID | role | event / binding | 视觉映射 |
|----|------|-----------------|----------|
| home-spin-button | action | spin-wheel | 转盘中心 "开始" 大按钮 |
| home-wheel-result | assertion | /wheel/selectedDish | 转盘下方结果卡片中的菜品名 |
| home-result-view-button | action | open-dish-detail | 结果卡片上的 "查看做法" 按钮 |
| home-spin-again-button | action | spin-wheel | 结果卡片上的 "再转一次" 按钮 |
| home-wheel-settings-button | action | open-wheel-settings | 首页右上角齿轮图标 |
| home-quick-checkin-button | action | open-checkin-form | 首页结果卡片上的 "打卡这顿" 按钮 |
| ingredients-input | input | add-ingredient | 食材输入框 |
| ingredients-add-button | action | add-ingredient | 输入框右侧 "添加" 按钮 |
| ingredients-list | list | /ingredients | 已添加食材标签列表 |
| ingredients-clear-button | action | clear-ingredients | 列表旁的 "清空" 文字按钮 |
| ingredients-recommend-list | list | /ingredients/recommendations | 推荐菜品卡片列表 |
| ingredients-recommend-checkin-button | action | open-checkin-form | 推荐卡片上的 "打卡" 按钮 |
| discover-mood-filter | input | filter-mood | 心情标签组 |
| discover-time-filter | input | filter-time | 时段标签组 |
| discover-reset-button | action | reset-filters | 筛选区 "重置" 按钮 |
| discover-result-list | list | /discover/results | 筛选结果菜品列表 |
| checkin-add-button | action | open-checkin-form | 打卡页顶部 "+ 记一笔" 按钮 |
| checkin-today-count | assertion | /checkin/todayCount | 今日打卡次数统计 |
| checkin-today-calories | assertion | /checkin/todayCalories | 今日总热量统计 |
| checkin-timeline-list | list | /checkin/today | 今日打卡时间轴 |
| checkin-edit-button | action | edit-checkin | 每条打卡记录的编辑按钮 |
| checkin-delete-button | action | delete-checkin | 每条打卡记录的删除按钮 |
| checkin-share-button | action | open-share-card | 打卡页顶部 "分享今日" 按钮 |
| share-card-preview | assertion | /share/cardData | 卡片预览区域 |
| share-template-selector | input | select-template | 模板切换按钮组 |
| share-save-button | action | save-card | "保存到相册" 按钮 |
| share-share-button | action | share-card | "分享卡片" 主按钮 |
| dish-detail-title | assertion | /dish/name | 菜品详情页标题 |
| dish-detail-checkin-button | action | open-checkin-form | "打卡这顿" 按钮 |
| dish-detail-share-button | action | open-share-card | "生成卡片" 按钮 |
| profile-custom-dishes-list | list | /profile/customDishes | 自定义菜品列表 |
| profile-add-custom-dish-button | action | add-custom-dish | "添加自定义菜品" 按钮 |
| profile-clear-data-button | action | clear-all-data | "清空所有数据" 文字按钮 |
| checkin-form-meal-picker | input | select-meal | 餐别选择器 |
| checkin-form-dish-search | input | search-dish | 菜品搜索框 |
| checkin-form-note-input | input | - | 备注输入框 |
| checkin-form-submit-button | action | submit-checkin | "完成打卡" 主按钮 |
| checkin-form-cancel-button | action | cancel-checkin-form | "取消" 按钮 |
| wheel-settings-input | input | - | 自定义菜品输入框 |
| wheel-settings-add-button | action | add-wheel-dish | "添加" 按钮 |
| wheel-settings-list | list | /wheelSettings/customDishes | 自定义菜品列表 |
| wheel-settings-reset-button | action | reset-wheel-dishes | "恢复默认" 按钮 |

### Change Requests
- 无。语义协议已覆盖所有核心交互目标。

## 8. 页面级视觉要点

### 首页
- 顶部暖光径向渐变背景。
- "今天吃什么" 大标题居中，下方一句轻文案。
- 转盘卡片居中，300px 圆形，多彩分区。
- 转盘下方结果卡片，初始为空状态文案。
- 右上角齿轮设置，右下角分享入口。

### 食材推荐页
- 顶部固定输入区 + 已选食材标签。
- 推荐列表卡片，展示匹配度条、所需食材、热量。
- 空状态：温馨插画 + "先添加冰箱里的食材吧"。

### 发现页
- 顶部两排标签，可横向滚动或换行。
- 结果卡片网格 1 列或 2 列，按选中标签动态过滤。
- 无结果：建议重置或放宽条件。

### 打卡页
- 顶部统计卡片：今日打卡次数 + 总热量，背景渐变。
- 时间轴列表，每餐一种颜色标识。
- 底部 "记一笔" 主按钮，可固定在内容末尾。

### 分享卡片页
- 卡片预览居中，圆角 28px，带日期、菜品、连续天数、装饰图案。
- 模板切换横向缩略图。
- 保存（次按钮）+ 分享（主按钮）并排。

### 菜品详情页
- 顶部大图/暖色渐变占位。
- 标题区带标签与热量。
- 食材清单 + 步骤列表。
- 底部悬浮双按钮。

### 我的页
- 顶部用户信息卡片，渐变背景。
- 自定义菜品管理列表。
- 设置项：清空数据、关于。
