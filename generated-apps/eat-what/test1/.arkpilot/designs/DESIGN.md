# 今天吃什么 - 视觉设计规范

## 1. App 氛围与调性

"今天吃什么"是一款温暖、治愈、带有轻仪式感的饮食决策工具。视觉风格借鉴 Apple 的克制与质感，但注入食物主题的温度：柔和的暖色渐变、圆润的卡片、细腻的阴影与玻璃拟态，营造出"厨房窗台边的晨光"般的氛围。界面应当让人感到放松，而非冷冰冰的效率工具。

整体设计语言关键词：**温暖、圆润、轻盈、有仪式感**。

## 2. 色彩系统

### 主色
- **暖白背景** (`#FFF9F5`): 主页面背景，带极淡的暖橙色调，比纯白更柔和。
- **米白卡片** (`#FFFFFF`): 卡片表面，纯净明亮。
- **暖灰文字** (`#2C2C2C`): 主标题与正文，略带暖调。
- **次要文字** (`#6B6B6B`): 描述、辅助信息。
- **弱化文字** (`#9E9E9E`): 占位符、时间戳。

### 强调色
- **焦糖橙** (`#E88D4F`): 主按钮、转盘指针、关键图标、选中标签。传递食欲与温暖。
- **焦糖橙渐变** (`linear-gradient(135deg, #E88D4F 0%, #D66B2E 100%)`): CTA 按钮、重要卡片背景。
- **薄荷绿** (`#5EB69D`): 健康、轻食、打卡成功状态。
- **奶油黄** (`#F4C563`): 早餐、快手菜标签。
- **薰衣草紫** (`#A78BFA`): 治愈系、放纵一下标签。
- **珊瑚粉** (`#F28C8C`): 晚餐、重口味标签。

### 表面与状态
- **卡片阴影** (`0 8px 24px rgba(232, 141, 79, 0.12)`): 暖色调阴影，营造漂浮感。
- **轻阴影** (`0 4px 12px rgba(0, 0, 0, 0.06)`): 普通卡片。
- **玻璃拟态** (`background: rgba(255, 255, 255, 0.72); backdrop-filter: blur(20px);`): 底部 Tab 栏、顶部导航。
- **按压态** (`scale(0.97)`, 背景加深 8%): 按钮反馈。
- **禁用态** (`opacity: 0.4`): 不可交互元素。

### 标签色彩映射
| 标签 | 背景 | 文字 |
|------|------|------|
| 早餐 | `#FFF8E7` | `#C78D1A` |
| 午餐 | `#E7F6F1` | `#2A8F73` |
| 晚餐 | `#FDECEC` | `#C44B4B` |
| 夜宵 | `#F3E8FF` | `#7C4DFF` |
| 想吃清淡 | `#E7F6F1` | `#2A8F73` |
| 重口味 | `#FDECEC` | `#C44B4B` |
| 快手菜 | `#FFF8E7` | `#C78D1A` |
| 健康减脂 | `#E7F6F1` | `#2A8F73` |
| 放纵一下 | `#F3E8FF` | `#7C4DFF` |
| 治愈系 | `#FDECEC` | `#C44B4B` |

## 3. 字体规范

### 字体栈
- **标题**: `SF Pro Display`, `PingFang SC`, `Helvetica Neue`, sans-serif
- **正文**: `SF Pro Text`, `PingFang SC`, `Helvetica Neue`, sans-serif

### 字号层级
| 角色 | 字号 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| 页面大标题 | 32px | 700 | 1.15 | -0.5px | 首页 "今天吃什么" |
| 页面副标题 | 20px | 600 | 1.3 | -0.3px | 二级标题 |
| 卡片标题 | 18px | 600 | 1.3 | -0.2px | 菜品名称 |
| 正文 | 15px | 400 | 1.5 | -0.2px | 描述、食材 |
| 辅助文字 | 13px | 400 | 1.4 | -0.1px | 标签、时间 |
| 小字 | 11px | 500 | 1.3 | 0 | 角标、统计数字 |
| 按钮文字 | 16px | 600 | 1 | 0 | 主按钮 |

## 4. 组件样式

### 主按钮
- 背景：`linear-gradient(135deg, #E88D4F 0%, #D66B2E 100%)`
- 文字：`#FFFFFF`
- 内边距：14px 28px
- 圆角：16px
- 阴影：`0 8px 20px rgba(232, 141, 79, 0.35)`
- 按压：背景加深，`scale(0.98)`

### 次按钮
- 背景：`#FFFFFF`
- 文字：`#E88D4F`
- 边框：1px solid `#E88D4F`
- 圆角：14px
- 阴影：`0 2px 8px rgba(0,0,0,0.04)`

### 标签按钮
- 背景：`#FFF5EE`
- 文字：`#D66B2E`
- 圆角：12px
- 内边距：8px 16px
- 选中：背景 `#E88D4F`，文字 `#FFFFFF`

### 卡片
- 背景：`#FFFFFF`
- 圆角：20px
- 内边距：16px
- 阴影：`0 8px 24px rgba(232, 141, 79, 0.10)`
- 间距：16px

### 输入框
- 背景：`#F7F2EE`
- 圆角：14px
- 高度：48px
- 内边距：0 16px
- 占位符：`#9E9E9E`
- 聚焦：边框 1.5px solid `#E88D4F`

### 底部 Tab 栏
- 背景：玻璃拟态，白色半透明 + 模糊
- 高度：64px + safe-area
- 图标：24px，未选中 `#9E9E9E`，选中 `#E88D4F`
- 文字：10px，选中字重 600

### 转盘
- 外圈：280px 圆形，渐变背景 `conic-gradient(...)`
- 指针：顶部三角形，颜色 `#E88D4F`
- 中心按钮：80px 圆形，焦糖橙渐变，"开始" 文字
- 结果卡片：从转盘下方滑入，带弹簧动画

## 5. 布局原则

### 容器
- 内容最大宽度：390px，居中。
- 水平内边距：20px。
- 页面顶部预留状态栏 + 导航高度：约 56px。

### 间距系统
- 基础单位：4px
- 常用间距：8px, 12px, 16px, 20px, 24px, 32px

### 首屏约束
- Header + 核心操作区必须在 600vp 内可见。
- 首页转盘直径不超过 320px，确保按钮与结果区同时露出。

### 滚动
- 长列表使用垂直滚动。
- 底部 Tab 固定，内容在其上方滚动。

## 6. 动效

- 转盘旋转：cubic-bezier(0.23, 1, 0.32, 1)，持续 3-5 秒。
- 结果卡片出现：从下方 translateY(40px) → 0，opacity 0 → 1，0.45s。
- 标签选中：背景色过渡 0.2s，scale 0.95 按压反馈。
- 页面切换：滑动过渡 0.25s。
- 卡片悬停/按压：translateY(-2px) + 阴影加深。

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
- 顶部为暖白背景，居中展示 "今天吃什么" 大标题与一句话副文案。
- 核心视觉为转盘卡片，占据首屏中心。
- 转盘下方预留结果卡片位置，初始为空状态提示。
- 右上角设置入口，右下角可快速进入分享。

### 食材推荐页
- 顶部输入区固定，下方为已选食材标签流。
- 推荐列表以卡片形式展示，每张卡片展示匹配食材数量与热量。
- 空食材时展示温馨插画与引导文案。

### 发现页
- 顶部两排可滚动/换行的标签：心情标签、时段标签。
- 筛选结果网格或列表展示，卡片上叠加标签。
- 无结果时给出重置建议。

### 打卡页
- 顶部统计卡片：今日打卡次数 + 总热量。
- 中部时间轴列表，每餐一条记录，带餐别图标与颜色。
- 底部大按钮 "记一笔" 悬浮或固定在内容区上方。

### 分享卡片页
- 卡片居中展示，圆角 24px，带日期、菜品、连续打卡天数、装饰元素。
- 模板切换为底部横向缩略图列表。
- 保存与分享按钮并排。

### 菜品详情页
- 顶部大图/渐变占位，下方为标题、标签、食材、步骤。
- 底部悬浮双按钮："打卡这顿" + "生成卡片"。

### 我的页
- 头像/昵称区 + 设置列表。
- 自定义菜品管理 + 数据清理入口。
