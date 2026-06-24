# 今天吃什么 — 视觉设计系统

## 1. Visual Theme & Atmosphere

“今天吃什么”是一个帮助用户做饮食决策的温情工具。视觉氛围应当像打开一本精装私厨手账：温暖、有食欲、略带玩味，但不过度卡通。整体采用「奶油纸 + 食物色谱」的暖调系统，让每一次转盘和打卡都像拆礼物。

### 设计关键词
- 温暖奶油底（Warm Cream）
- 食物色谱点缀（番茄红、牛油果绿、蛋黄、焦糖棕）
- 柔和高差与玻璃拟态
- 圆润饱满的组件
- 轻量微交互动效暗示

## 2. Semantic UI Binding

### Surfaces
| Surface ID | Page ID | Route | Tab ID | 说明 |
|------------|---------|-------|--------|------|
| home | home-page | pages/HomePage | tab-home | 决策首页 |
| pantry | pantry-page | pages/PantryPage | tab-pantry | 冰箱食材 |
| check-in | check-in-page | pages/CheckInPage | tab-check-in | 饮食打卡 |
| profile | profile-page | pages/ProfilePage | tab-profile | 我的 |
| result | result-page | pages/ResultPage | - | 结果详情 |
| check-in-editor | check-in-editor-page | pages/CheckInEditorPage | - | 打卡编辑 |
| share-card | share-card-page | pages/ShareCardPage | - | 分享卡片 |

### 重要 Action / Input / Assertion IDs
- `home-spin-button`, `home-mood-filter`, `home-time-filter`, `home-wheel-result`, `home-result-detail-button`, `home-quick-pantry-button`
- `pantry-input`, `pantry-add-button`, `pantry-item-list`, `pantry-recommend-button`, `pantry-mood-filter`, `pantry-result-list`
- `check-in-add-button`, `check-in-list`, `check-in-share-button`, `check-in-delete-button`
- `profile-streak-count`, `profile-total-check-ins`
- `result-dish-name`, `result-check-in-button`, `result-share-button`
- `editor-date-picker`, `editor-meal-picker`, `editor-dish-input`, `editor-mood-picker`, `editor-save-button`
- `share-card-preview`, `share-save-button`, `share-system-button`

### Event Names
`spin-wheel`, `mood-filter-change`, `time-filter-change`, `go-to-pantry`, `add-pantry-item`, `remove-pantry-item`, `recommend-by-pantry`, `pantry-mood-filter-change`, `open-dish-detail`, `open-check-in-editor`, `save-check-in`, `delete-check-in`, `open-share-card`, `save-share-card`, `system-share-card`, `check-in-from-result`, `share-from-result`, `back-from-*`。

### ID Gaps / Change Requests
无。所有语义目标均已映射到对应页面。

## 3. Color Palette & Roles

### Background
- **Cream** `#FFF8F0`：主页面背景，温暖纸感。
- **Cream Dark** `#F5EDE3`：次级背景、输入框、卡片底色。
- **Charcoal** `#2C2A28`：深色强调区（结果页 Hero、分享卡片深色主题）。

### Brand / Accent
- **Tomato** `#E85D4E`：主品牌色，CTA、转盘指针、重要图标。
- **Avocado** `#7CAE7A`：成功、健康标签、食材相关。
- **Yolk** `#F4B942`：次级强调、评分、点缀。
- **Caramel** `#C47D4C`：文字强调、时间场景标签。

### Semantic Surfaces
- **Mood Tag Active** `#FFE8D6`（暖橙） + 文字 `#9C5A36`
- **Mood Tag Inactive** `#FFFFFF` + 文字 `#8A817C` + 边框 `#EBE3DA`
- **Time Chip Active** `#2C2A28` + 文字 `#FFFFFF`
- **Time Chip Inactive** `#FFFFFF` + 文字 `#5C5753` + 边框 `#EBE3DA`
- **Card Surface** `#FFFFFF` + 阴影 `rgba(44, 42, 40, 0.08) 0 8px 28px`

### Text
- **Primary** `#2C2A28`：标题、正文。
- **Secondary** `#6B6560`：描述、占位符。
- **Tertiary** `#A39E99`：时间、辅助说明。
- **On Dark** `#FFF8F0`：深色背景上的文字。

## 4. Typography

字体栈：`HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, sans-serif。

| 角色 | 尺寸 | 字重 | 行高 | 用途 |
|------|------|------|------|------|
| Display | 36px | 700 | 1.15 | 首页大标题、结果菜名 |
| H1 | 24px | 700 | 1.25 | 页面标题 |
| H2 | 20px | 600 | 1.3 | 卡片标题、分组标题 |
| Body | 16px | 400 | 1.5 | 正文、描述 |
| Body Bold | 16px | 600 | 1.5 | 强调正文 |
| Caption | 14px | 400 | 1.4 | 辅助文字、标签 |
| Micro | 12px | 500 | 1.35 | 时间戳、角标 |

## 5. Components

### Buttons

**Primary Filled（主按钮）**
- 背景：`#E85D4E` → `#D64F42` 渐变（从上到下的 8° 暖渐变）
- 文字：白色 16px 600
- 圆角：16px
- 阴影：`rgba(232, 93, 78, 0.25) 0 8px 20px`
- 高度：52px

**Secondary Outlined（次按钮）**
- 背景：白色
- 边框：1.5px `#EBE3DA`
- 文字：`#2C2A28` 16px 500
- 圆角：16px
- 高度：48px

**Filter Tag（筛选标签）**
- Inactive：背景 `#FFFFFF`，边框 1px `#EBE3DA`，文字 `#8A817C`
- Active：背景 `#FFE8D6`，无边框，文字 `#9C5A36`
- 圆角：12px
- 高度：36px，内边距 0 16px

**Time Chip（时间胶囊）**
- Inactive：背景 `#FFFFFF`，边框 1px `#EBE3DA`
- Active：背景 `#2C2A28`，文字白色
- 圆角：999px（胶囊）
- 高度：36px

### Cards
- 背景：白色
- 圆角：20px
- 阴影：`rgba(44, 42, 40, 0.08) 0 8px 28px`
- 内边距：20px

### Inputs
- 背景：`#F5EDE3`
- 圆角：14px
- 高度：52px
- 占位符：`#A39E99`
- 聚焦：边框 2px `#E85D4E`

### Bottom Tab Bar
- 背景：`rgba(255, 248, 240, 0.92)` + `backdrop-filter: blur(20px)`
- 高度：64px（含安全区）
- 图标 24px，未选中 `#A39E99`，选中 `#E85D4E`
- 顶部细线：1px `#EBE3DA`
- 圆角：顶部 24px（浮岛效果）

## 6. Layout & Spacing

- 基础单位：4px
- 页面水平内边距：20px
- 卡片间距：16px
- 内容最大宽度：390px，居中
- 首屏可见区：Header + 核心卡片在 600vp 内

## 7. Elevation & Shadows

| 层级 | 用途 | 值 |
|------|------|-----|
| Card | 普通卡片 | `rgba(44, 42, 40, 0.08) 0 8px 28px` |
| Button | 主按钮悬浮 | `rgba(232, 93, 78, 0.25) 0 8px 20px` |
| Float | 底部 Tab 浮岛 | `rgba(44, 42, 40, 0.1) 0 -4px 24px` |
| Modal | 全屏覆盖页 | 无阴影，纯背景过渡 |

## 8. Page-by-Page Visual Notes

### 首页（home-page）
- 顶部标题："今天吃什么" + 今日日期胶囊。
- 筛选区：心情标签横向滚动，时间胶囊横向滚动。
- 转盘区：圆形转盘，奶油底 + 食物色块分区，中心 Tomato 指针，底部「开始转盘」主按钮。
- 结果浮层：转盘下方展示当前结果菜名与「查看详情」入口。
- 快捷入口：「根据冰箱食材推荐」卡片。

### 食材页（pantry-page）
- 输入框 + 添加按钮。
- 食材标签云，可点击删除。
- 「看看能做什么」主按钮。
- 推荐结果列表：菜品卡片，包含菜名、主要食材、标签、推荐语。

### 打卡页（check-in-page）
- 顶部统计小卡：连续打卡天数 + 总次数。
- 列表按日期分组，每组一个日期标题。
- 每项显示餐别、菜名、心情标签、删除按钮。
- 底部「补录打卡」悬浮按钮（FAB）。

### 我的页（profile-page）
- 头部用户信息区（昵称/头像占位）。
- 统计卡片：连续打卡、总打卡、本月最爱菜。
- 设置入口列表。

### 结果页（result-page）
- 深色 Hero：菜名大字居中，标签胶囊。
- 信息卡：所需食材、推荐语、预估时间、难度。
- 底部双按钮：「打卡记录」+「生成分享卡片」。

### 打卡编辑页（check-in-editor-page）
- 表单：日期选择、餐别选择器、菜品输入、心情选择、备注。
- 底部「保存打卡」主按钮。

### 分享卡片页（share-card-page）
- 卡片预览居中，圆角 24px，渐变背景或食物主题色背景。
- 卡片内容：日期、菜名、心情标签、推荐语、装饰 SVG。
- 底部「保存图片」+「分享」按钮。

## 9. Do's and Don'ts

### Do
- 使用暖奶油底色，营造食欲感。
- 多种食物色彩作为标签/图标强调，避免单调用色。
- 按钮使用柔和渐变 + 投影提升质感。
- 卡片使用大圆角与柔和阴影。
- 底部 Tab 使用浮岛玻璃拟态效果。
- 转盘分区使用多种温暖食物色。

### Don't
- 不要使用冷灰科技风或单一蓝Accent。
- 不要使用直角、无阴影的简陋组件。
- 不要把所有文字都居中对齐。
- 不要使用 emoji 作为图标。
- 不要让 Tab 出现在侧边或全宽铺满。
