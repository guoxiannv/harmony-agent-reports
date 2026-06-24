# 今天吃什么 — 视觉设计系统

## 1. Visual Theme & Atmosphere

本 App 采用温暖、治愈、食欲感强的 "Cozy Kitchen" 视觉主题。整体氛围像清晨阳光照进厨房：柔和、干净、充满生活气息。通过奶油色背景、暖橙与薄荷绿点缀、大圆角卡片和细腻阴影，营造轻松愉悦的饮食决策体验。

设计关键词：**温暖、新鲜、轻量、有趣、治愈**。界面避免冷峻科技感，优先传递食物带来的幸福感。转盘、打卡、分享等核心功能都通过圆角、微渐变和柔和阴影强化亲和力。

## 2. Color Palette & Roles

### Primary Brand
- **主色暖橙** `#FF8C42`：品牌主色，用于主按钮、转盘指针、关键强调。象征食欲与活力。
- **辅色薄荷绿** `#4ECDC4`：清新辅色，用于成功状态、打卡完成、食材标签。象征新鲜与健康。
- **奶油白** `#FFF9F5`：页面主背景。温暖不刺眼，比纯白更有食物场景感。

### Neutral
- **深墨** `#2D2A26`：主标题与正文。略带暖调，避免纯黑生硬。
- **中灰** `#6B6560`：次级文字、图标、描述。
- **浅灰** `#E8E2DD`：分割线、边框、禁用态背景。
- **白色** `#FFFFFF`：卡片表面、输入框背景、图标反白。

### Semantic
- **成功绿** `#2ECC71`：打卡成功、保存成功提示。
- **警告黄** `#F4D03F`：轻提示、待处理状态。
- **错误红** `#E74C3C`：删除、清空、错误提示。

### Gradient Surfaces
- **主渐变按钮**：`linear-gradient(135deg, #FF8C42 0%, #FF6B35 100%)`
- **转盘中心渐变**：`radial-gradient(circle, #FFF9F5 0%, #FFE8D6 100%)`
- **打卡卡片渐变**：`linear-gradient(135deg, #4ECDC4 0%, #44A08D 100%)`
- **分享卡片渐变 1**：`linear-gradient(135deg, #FF8C42 0%, #FDC830 100%)`（暖阳）
- **分享卡片渐变 2**：`linear-gradient(135deg, #4ECDC4 0%, #556270 100%)`（薄荷夜）

### Shadows
- **卡片阴影**：`0 4px 20px rgba(45, 42, 38, 0.08)`
- **悬浮阴影**：`0 8px 32px rgba(255, 140, 66, 0.20)`
- **转盘阴影**：`0 12px 48px rgba(45, 42, 38, 0.12)`
- **按钮按下**：`0 2px 8px rgba(255, 140, 66, 0.30)`

## 3. Typography Rules

### Font Family
- **中文显示**：系统默认 HarmonyOS Sans / PingFang SC / Microsoft YaHei，无衬线。
- **英文/数字**：`SF Pro Display`, `SF Pro Text`, `Helvetica Neue`, `Arial`, sans-serif。

### Hierarchy

| 角色 | 字号 | 字重 | 行高 | 用途 |
|------|------|------|------|------|
| 页面大标题 | 28px | 700 | 1.2 | 首页欢迎语、页面标题 |
| 区块标题 | 20px | 600 | 1.3 | 卡片标题、模块标题 |
| 卡片标题 | 17px | 600 | 1.35 | 菜品名称、功能卡片 |
| 正文 | 15px | 400 | 1.5 | 描述文字、表单标签 |
| 辅助文字 | 13px | 400 | 1.4 | 时间、标签、提示 |
| 微小文字 | 11px | 500 | 1.35 | 徽章、角标、计数 |
| 数字强调 | 36px | 700 | 1.0 | 连续打卡天数、转盘结果 |

### Typography Principles
- 中文标题避免过细字重，最小使用 400。
- 数字使用 tabular-nums 或等宽感，避免跳动。
- 正文颜色与背景对比度不低于 4.5:1。

## 4. Component Stylings

### Buttons

**Primary Filled（主按钮）**
- 背景：`linear-gradient(135deg, #FF8C42 0%, #FF6B35 100%)`
- 文字：白色，15px，weight 600
- 圆角：16px
- 内边距：14px 24px
- 阴影：`0 4px 16px rgba(255, 140, 66, 0.30)`
- 按下：缩放 0.98，阴影减弱

**Secondary Outline（次级按钮）**
- 背景：白色
- 边框：1.5px solid `#E8E2DD`
- 文字：`#2D2A26`，15px，weight 500
- 圆角：14px
- 按下：背景 `#FFF9F5`

**Ghost Text Button（文字按钮）**
- 背景：透明
- 文字：`#FF8C42`，14px，weight 500
- 无圆角，可带图标

**Icon Button（图标按钮）**
- 尺寸：44px × 44px
- 背景：`#FFFFFF` 或透明
- 圆角：12px
- 图标尺寸：22px，颜色 `#6B6560`

### Cards

**Standard Card**
- 背景：白色
- 圆角：20px
- 内边距：20px
- 阴影：`0 4px 20px rgba(45, 42, 38, 0.08)`

**Feature Card（首页快捷入口）**
- 背景：白色
- 圆角：20px
- 内边距：18px
- 左侧/顶部彩色图标区域：48px 圆角，浅彩色背景
- 阴影：`0 4px 16px rgba(45, 42, 38, 0.06)`

**Elevated Card（转盘、分享预览）**
- 背景：白色
- 圆角：24px
- 阴影：`0 12px 48px rgba(45, 42, 38, 0.12)`

### Tags / Chips

**Selectable Chip**
- 默认：背景 `#F5F0EC`，文字 `#6B6560`，圆角 20px，内边距 8px 16px
- 选中：背景 `#FF8C42`，文字白色，带阴影
- 图标在左，文字在右，间距 6px

**Ingredient Tag**
- 背景：`#E8F8F5`（薄荷浅底）
- 文字：`#1E7E74`
- 圆角：20px
- 右侧带删除小叉

### Inputs

**Text Input**
- 背景：白色
- 边框：1.5px solid `#E8E2DD`
- 圆角：14px
- 内边距：14px 16px
- 聚焦：边框 `#FF8C42`，外发光 `0 0 0 3px rgba(255, 140, 66, 0.15)`
- 占位符：`#9E9994`

**Search Input**
- 左侧搜索图标
- 背景：`#F5F0EC`
- 圆角：14px

### Empty State

- 居中插画/图标区域：80px 圆形浅色背景
- 标题：17px，weight 600，`#2D2A26`
- 描述：14px，`#6B6560`
- 操作按钮：Primary Filled 或 Secondary Outline

### Bottom Tab Bar

- 高度：64px + safe-area
- 背景：白色，顶部 1px border `#F0EBE6`
- 图标 24px，未选中 `#9E9994`，选中 `#FF8C42`
- 标签 11px，weight 500
- 选中项带 4px 圆点指示器（仅图标下方）

## 5. Layout Principles

### Spacing System
- 基础单位：4px
- 常用间距：8, 12, 16, 20, 24, 32, 40, 48

### Page Layout
- 内容区最大宽度：420vp
- 水平边距：20px
- 页面顶部安全区 + 16px
- 底部预留 Tab Bar 高度 + 16px

### Grid
- 首页快捷入口：2 列网格，间距 12px
- 菜品网格：2 列网格，间距 12px
- 筛选标签：水平滚动 + flex-wrap
- 打卡日历：7 列等宽网格

### Section Rhythm
- 区块间距：24px
- 卡片内部元素间距：12-16px
- 标题与内容间距：12px

## 6. Depth & Elevation

| 层级 | 阴影/处理 | 用途 |
|------|-----------|------|
| Level 0 | 无阴影 | 页面背景、纯文字区块 |
| Level 1 | `0 4px 16px rgba(45,42,38,0.06)` | 功能卡片、列表项 |
| Level 2 | `0 4px 20px rgba(45,42,38,0.08)` | 标准卡片 |
| Level 3 | `0 8px 32px rgba(255,140,66,0.20)` | 主按钮悬浮、选中态 |
| Level 4 | `0 12px 48px rgba(45,42,38,0.12)` | 转盘、分享预览、弹窗 |

## 7. Specific Page Visual Direction

### 首页（home-page）
- 顶部：问候语 + 今日日期 + 右侧设置图标按钮
- 核心卡片：今日状态大卡，显示"今天还没决定吃什么"或"已打卡 1 餐"，右侧有厨师帽插画
- 快捷入口：2×2 网格，转盘 / 食材 / 筛选 / 打卡
- 最近打卡：横向滚动卡片或列表

### 推荐页（recommend-page）
- 顶部：分段控制（Segmented Control），暖橙选中态
- 内容区：根据选中项展示转盘 / 食材 / 筛选

### 转盘页（wheel-page）
- 中央：大转盘（直径约 280px），彩色扇区，中心有"GO"按钮
- 转盘指针在顶部固定
- 下方：候选菜品输入 + 标签列表 + 清空按钮
- 结果以弹窗/面板形式从底部升起

### 食材页（ingredient-page）
- 顶部：冰箱食材输入框
- 中部：已添加食材标签（可删除）
- 推荐按钮：主渐变按钮
- 下方：推荐菜品列表卡片

### 筛选页（filter-page）
- 心情标签：水平滚动，图标 + 文字
- 时段标签：早餐 / 午餐 / 晚餐 / 夜宵
- 应用筛选按钮
- 结果网格

### 打卡页（checkin-page）
- 顶部：连续打卡大数字 + 累计打卡
- 日历：7 列，打卡日期带薄荷绿圆点
- 餐别选择：三个大按钮
- 表单：菜品 + 备注
- 保存按钮

### 分享页（share-page）
- 顶部：模板选择（横向滚动小卡片）
- 中部：分享卡片预览（圆角、渐变、文字、日期）
- 底部：保存到相册 + 系统分享

### 菜品管理页（dish-page）
- 顶部：搜索框 + 添加按钮
- 列表：菜品名称 + 标签 + 编辑入口
- 空状态：邀请添加第一道菜品

## 8. Semantic UI Binding

| Surface/Page | Page ID / Route | Tab ID | 关键语义目标 | 事件 |
|--------------|-----------------|--------|--------------|------|
| 首页 | home-page / pages/Home | tab-home | home-today-status-card, home-spin-wheel-button, home-ingredient-button, home-filter-button, home-checkin-button, home-recent-checkin-list | navigate-to-wheel, navigate-to-ingredient, navigate-to-filter, navigate-to-checkin |
| 推荐页 | recommend-page / pages/Recommend | tab-recommend | recommend-segment-wheel, recommend-segment-ingredient, recommend-segment-filter | switch-to-wheel, switch-to-ingredient, switch-to-filter |
| 转盘页 | wheel-page / pages/Wheel | (parent: tab-recommend) | wheel-spin-button, wheel-canvas, wheel-result-panel, wheel-candidate-list, wheel-add-candidate-input, wheel-add-candidate-button, wheel-clear-candidates-button, wheel-go-checkin-button | spin-wheel, add-wheel-candidate, clear-wheel-candidates, navigate-to-checkin-with-result |
| 食材页 | ingredient-page / pages/Ingredient | (parent: tab-recommend) | ingredient-input, ingredient-add-button, ingredient-tag-list, ingredient-recommend-button, ingredient-result-list, ingredient-clear-button | add-ingredient, recommend-by-ingredients, clear-ingredients |
| 筛选页 | filter-page / pages/Filter | (parent: tab-recommend) | filter-mood-list, filter-time-list, filter-apply-button, filter-result-list, filter-reset-button | apply-filter, reset-filter |
| 打卡页 | checkin-page / pages/Checkin | tab-checkin | checkin-calendar, checkin-streak-count, checkin-total-count, checkin-meal-breakfast/lunch/dinner, checkin-dish-input, checkin-note-input, checkin-save-button, checkin-share-button, checkin-history-list | select-meal-type, update-checkin-dish, update-checkin-note, save-checkin, navigate-to-share |
| 分享页 | share-page / pages/Share | — | share-card-preview, share-save-button, share-system-button, share-template-list, share-caption-input | save-share-card, system-share-card, update-share-caption |
| 我的页 | profile-page / pages/Profile | tab-profile | profile-dish-library-button, profile-settings-button | navigate-to-dish-library, open-settings |
| 菜品管理页 | dish-page / pages/DishLibrary | — | dish-add-button, dish-list, dish-search-input, dish-form-name-input, dish-form-tags-input, dish-form-save-button, dish-form-delete-button | open-dish-form, search-dishes, update-dish-name, update-dish-tags, save-dish, delete-dish |

**ID 变更请求**：无。所有语义目标均已映射到视觉控件。

## 9. Do's and Don'ts

### Do
- 使用圆角 16px-24px 的大圆角卡片，营造亲和力。
- 主按钮使用暖橙渐变 + 柔和阴影，保持食欲感。
- 图标统一使用 Lucide 风格 SVG，尺寸 20-24px。
- 打卡、成功等正向反馈使用薄荷绿。
- 保持页面在 420vp 内居中，底部 Tab Bar 固定。

### Don't
- 不要使用纯黑 `#000000` 作为背景或文字。
- 不要引入超过 3 种主色（暖橙、薄荷绿、奶油白已足够）。
- 不要使用尖锐直角或 4px 以下的小圆角作为主要卡片。
- 不要将所有按钮都做成主色，避免视觉疲劳。
- 不要在首屏 600vp 外放置核心入口。

## 10. Responsive Behavior

- 内容区限制最大宽度 420vp，居中显示。
- 底部 Tab Bar 宽度与 body 一致，不超出安全区。
- 转盘直径在 320-420vp 屏幕下保持 280px，更小屏幕自适应缩小。
- 分享卡片预览宽度 320px，高度 480px，保持 2:3 比例。

---

*Design version: v1.0*  
*Date: 2026/06/23*
