# 今天吃什么 - 视觉设计规范 v2

## 1. App 氛围与调性

一款带有"厨房仪式感"的饮食决策 App。视觉上像一本打开的食谱手账：温暖的纸张质感、圆润的容器、柔和的阴影、食欲感配色。在 Apple 式信息层级的基础上，加入更多生活化细节——标签像彩色便签，转盘像餐桌上的幸运轮盘，打卡卡片像一张可以贴在冰箱上的小便签。整体感觉应当是**放松、治愈、值得期待**的。

设计语言关键词：**手账感、圆润、食欲配色、轻仪式感、温暖**。

## 2. 色彩系统

### 主色
- **纸感背景** (`#FDF8F3`): 主页面背景，像一张略带纹理的烘焙纸。
- **纯白表面** (`#FFFFFF`): 卡片、底部栏、弹窗。
- **墨黑标题** (`#1A1A1A`): 主标题，稳重清晰。
- **炭灰正文** (`#4A4A4A`): 正文、描述。
- **浅灰辅助** (`#A8A29E`): 占位符、时间、说明。

### 强调色
- **焦糖橙** (`#D97736`): 主按钮、转盘指针、选中态。
- **焦糖渐变** (`linear-gradient(145deg, #F2A864 0%, #D97736 55%, #B85C25 100%)`): 主 CTA、转盘中心、统计卡片背景。
- **鼠尾草绿** (`#4A9B8E`): 健康、清淡、打卡成功、低热量。
- **蜂蜜黄** (`#E4B84A`): 早餐、快手菜、提示。
- **雾紫** (`#8B7EC8`): 治愈系、放纵一下、夜宵。
- **砖红** (`#C65D4F`): 晚餐、重口味、删除（慎用）。

### 表面与状态
- **暖阴影** (`0 14px 36px rgba(217, 119, 54, 0.12)`): 悬浮卡片、转盘。
- **浅阴影** (`0 6px 20px rgba(26, 26, 26, 0.06)`): 普通卡片。
- **底部玻璃栏** (`background: rgba(255, 255, 255, 0.86); backdrop-filter: saturate(200%) blur(28px); border-top: 1px solid rgba(0,0,0,0.03)`).
- **按压态**: `scale(0.96)`，背景明度降低 12%。
- **禁用态**: `opacity: 0.35`。
- **选中标签**: 背景 `#D97736`，文字 `#FFFFFF`，阴影 `0 4px 14px rgba(217,119,54,0.28)`。

### 渐变与纹理
- **首页顶部光晕** (`radial-gradient(ellipse at 50% 0%, rgba(242, 168, 100, 0.16) 0%, transparent 55%)`).
- **转盘分区** (`conic-gradient(from 0deg, #F2A864, #E4B84A, #4A9B8E, #8B7EC8, #C65D4F, #F2A864)`): 每一格 60deg。
- **统计卡片背景** (`linear-gradient(135deg, #F2A864 0%, #D97736 100%)`).
- **手账便签装饰**: 小圆点、虚线、轻微旋转 2deg 的卡片。

### 标签色彩映射
| 标签 | 背景 | 文字 |
|------|------|------|
| 早餐 | `#FFF6D6` | `#A67C1A` |
| 午餐 | `#E3F3F0` | `#147A6B` |
| 晚餐 | `#FBE8E6` | `#A8483C` |
| 夜宵 | `#F0EBFF` | `#6B5BAB` |
| 想吃清淡 | `#E3F3F0` | `#147A6B` |
| 重口味 | `#FBE8E6` | `#A8483C` |
| 快手菜 | `#FFF6D6` | `#A67C1A` |
| 健康减脂 | `#E3F3F0` | `#147A6B` |
| 放纵一下 | `#F0EBFF` | `#6B5BAB` |
| 治愈系 | `#FBE8E6` | `#A8483C` |

## 3. 字体规范

### 字体栈
- **标题**: `-apple-system, BlinkMacSystemFont, SF Pro Display, PingFang SC, Microsoft YaHei, sans-serif`
- **正文**: `-apple-system, BlinkMacSystemFont, SF Pro Text, PingFang SC, Microsoft YaHei, sans-serif`

### 字号层级
| 角色 | 字号 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| 页面大标题 | 36px | 800 | 1.1 | -0.7px | 首页 "今天吃什么" |
| 页面副标题 | 22px | 700 | 1.25 | -0.3px | 二级标题 |
| 卡片标题 | 18px | 700 | 1.3 | -0.2px | 菜品名称 |
| 正文 | 15px | 500 | 1.55 | -0.1px | 描述、食材 |
| 辅助文字 | 13px | 500 | 1.42 | 0 | 标签、时间 |
| 小字 | 11px | 600 | 1.3 | 0.2px | 角标、统计数字 |
| 按钮文字 | 16px | 700 | 1 | 0 | 主按钮 |

## 4. 组件样式

### 主按钮
- 背景：`linear-gradient(145deg, #F2A864 0%, #D97736 100%)`
- 文字：`#FFFFFF`
- 内边距：16px 32px
- 圆角：20px
- 阴影：`0 10px 26px rgba(217, 119, 54, 0.36)`
- 按压：`scale(0.96)`，阴影收窄

### 次按钮
- 背景：`#FFFFFF`
- 文字：`#D97736`
- 边框：1.5px solid `#D97736`
- 圆角：18px
- 阴影：`0 2px 10px rgba(0,0,0,0.04)`

### 标签按钮
- 背景：`#FFF5ED`
- 文字：`#B85C25`
- 圆角：14px
- 内边距：9px 18px
- 未选中边框：1px solid transparent
- 选中：背景 `#D97736`，文字 `#FFFFFF`

### 卡片
- 背景：`#FFFFFF`
- 圆角：24px
- 内边距：20px
- 阴影：`0 14px 36px rgba(217, 119, 54, 0.08)`
- 间距：16px
- 便签装饰：左上角 6px 圆点，颜色与主题相关

### 输入框
- 背景：`#F5EFE9`
- 圆角：16px
- 高度：52px
- 内边距：0 18px
- 占位符：`#A8A29E`
- 聚焦：边框 2px solid `#D97736`，背景 `#FFFFFF`

### 底部 Tab 栏
- 背景：玻璃拟态白色
- 高度：72px（含安全区）
- 图标：26px，未选中 `#A8A29E`，选中 `#D97736`
- 文字：11px，选中字重 700
- 选中指示：图标上方 4px 小圆点

### 转盘
- 外圈：300px 圆形，conic-gradient 6 色分区。
- 内圈：白色细环 4px，内阴影营造凹陷感。
- 指针：顶部倒三角 `#D97736`，底座 16px 圆。
- 中心按钮：92px 圆形，焦糖渐变，"开始" 16px 700。
- 结果卡片：从转盘下方滑入，圆角 24px，暖阴影，左侧 4px 色条标识。

## 5. 布局原则

### 容器
- 内容最大宽度：390px，居中。
- 水平内边距：20px。
- 顶部安全区 + 导航：约 56px。

### 间距系统
- 基础单位：4px
- 常用：8px, 12px, 16px, 20px, 24px, 32px, 40px

### 首屏约束
- Header + 转盘 + 结果区必须在 600vp 内可见。
- 转盘 300px，结果区最大 120px。

### 滚动
- 列表垂直滚动，底部预留 100px。
- 底部 Tab 固定。

## 6. 动效

- 转盘旋转：`cubic-bezier(0.22, 1, 0.36, 1)`，4-7 圈，2.8-4 秒。
- 结果卡片：`translateY(40px) → 0`，`opacity 0 → 1`，0.55s，`cubic-bezier(0.34, 1.56, 0.64, 1)`。
- 标签选中：0.2s ease，scale 0.94 按压。
- 页面切换：水平滑动 0.28s。
- 卡片按压：`translateY(-2px)`，阴影加深。

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
- 顶部纸感背景 + 暖色光晕。
- "今天吃什么" 36px 大标题居中，下方小文案 "让转盘替你决定"。
- 转盘卡片居中，300px 圆盘，多彩分区，中心 "开始" 按钮。
- 结果卡片从转盘下方滑入，左侧色条，展示菜品名与两个操作按钮。
- 右上角齿轮图标，右下角分享图标。

### 食材推荐页
- 顶部输入区 + 添加按钮。
- 已选食材以彩色标签展示，可点击删除。
- 推荐卡片列表：左侧序号圆点、菜品名、匹配食材、热量、打卡按钮。
- 空状态：手绘风餐具插画 + 引导文案。

### 发现页
- 顶部 "发现" 标题。
- 心情标签区 + 时段标签区，可换行。
- 结果网格：每行 1-2 张卡片，展示封面色块、菜名、标签、热量。
- 无结果：提示放宽条件。

### 打卡页
- 顶部统计卡片：今日打卡次数、总热量，焦糖渐变背景，白色文字。
- 时间轴：左侧彩色餐别圆点，右侧内容区。
- 每条记录可编辑/删除。
- "+ 记一笔" 主按钮固定在统计卡片下方或列表上方。

### 分享卡片页
- 卡片预览居中，圆角 28px，背景根据模板切换（暖橙/薄荷绿/雾紫/蜂蜜黄）。
- 卡片内容：日期、菜品名、一句话、连续天数、装饰图案。
- 底部模板缩略图横向列表。
- 保存与分享按钮并排。

### 菜品详情页
- 顶部大图占位（或渐变封面）。
- 标题 + 标签 + 热量。
- 食材清单（圆点列表）+ 步骤（数字序号）。
- 底部悬浮操作栏："打卡这顿" + "生成卡片"。

### 我的页
- 顶部用户信息卡片，渐变背景，圆角 24px。
- 自定义菜品列表，可新增/删除。
- 设置项：清空数据、关于我们。
