# 今天吃什么 — 视觉设计系统（最终版）

## 1. Visual Theme & Atmosphere

最终版视觉主题定为 **"Morning Kitchen"**：温暖晨光洒进厨房，食材、餐具、热气与心情共同决定今天吃什么。设计在精致杂志感基础上进一步统一材质语言，所有页面共享一致的卡片、渐变、阴影和图标风格，确保 App  feels like one coherent product。

关键升级：
- **全局引入纸张纹理感**：通过极淡的米白色背景和细腻的卡片内阴影，模拟高级食谱纸质感。
- **强化色彩语义**：
  - 暖橙 = 决策/行动（转盘、主按钮）
  - 橄榄绿 = 成功/完成（打卡、保存）
  - 奶油 = 背景/柔和状态
- **所有主按钮统一为暖橙渐变 + 动态阴影**，建立强烈品牌识别。
- **结果与反馈使用底部玻璃浮层**，统一弹窗/面板语言。

## 2. Color Palette & Roles（最终）

### Brand
- **暖橙** `#FF8C42`
- **暖橙深** `#FF7043`
- **暖橙暗** `#E86A2E`
- **橄榄绿** `#5A6B58`
- **鼠尾草绿** `#8FA897`
- **薄荷绿** `#4ECB9C`

### Neutrals
- **纸白** `#FFFCFA`
- **奶油** `#FFF5ED`
- **香草** `#F8EFE6`
- **深棕** `#2E2A25`
- **暖灰** `#7A746E`
- **米灰** `#E9E3DD`
- **淡灰** `#F5F0EB`

### Gradients（最终）
- **主按钮**：`linear-gradient(135deg, #FF8C42 0%, #FF7043 55%, #E86A2E 100%)`
- **主按钮按下**：`linear-gradient(135deg, #E86A2E 0%, #FF7043 100%)`
- **转盘中心**：`radial-gradient(circle, #FFFCFA 0%, #FFF0E6 100%)`
- **转盘指针**：`linear-gradient(180deg, #FF8C42 0%, #E86A2E 100%)`
- **成功/打卡**：`linear-gradient(135deg, #4ECB9C 0%, #5A6B58 100%)`
- **分享模板 暖阳**：`linear-gradient(165deg, #FF8C42 0%, #FFD7A8 100%)`
- **分享模板 森系**：`linear-gradient(165deg, #5A6B58 0%, #8FA897 100%)`
- **分享模板 奶油**：`linear-gradient(165deg, #FFF5ED 0%, #FFE0CC 100%)`

### Shadows（最终）
- **卡片**：`0 2px 10px rgba(46, 42, 37, 0.05), 0 6px 20px rgba(46, 42, 37, 0.04)`
- **卡片 hover/press**：`0 4px 16px rgba(46, 42, 37, 0.08)`
- **主按钮**：`0 6px 20px rgba(255, 140, 66, 0.28)`
- **主按钮按下**：`0 3px 10px rgba(232, 106, 46, 0.35)`
- **转盘**：`0 16px 56px rgba(46, 42, 37, 0.12)`
- **玻璃浮层**：`0 -6px 32px rgba(46, 42, 37, 0.1)` + `backdrop-filter: blur(24px) saturate(160%)`

## 3. Typography Rules（最终）

| 角色 | 字号 | 字重 | 行高 | 颜色 |
|------|------|------|------|------|
| 页面大标题 | 30px | 700 | 1.18 | `#2E2A25` |
| 区块标题 | 22px | 700 | 1.25 | `#2E2A25` |
| 卡片标题 | 18px | 600 | 1.3 | `#2E2A25` |
| 正文 | 15px | 400 | 1.55 | `#2E2A25` |
| 辅助文字 | 13px | 400 | 1.45 | `#7A746E` |
| 微小文字 | 11px | 500 | 1.35 | `#7A746E` |
| 数字强调 | 42px | 700 | 1.0 | `#2E2A25` 或品牌色 |

- 数字 `font-variant-numeric: tabular-nums`
- 所有文字在深色背景上使用白色或 `#FFF5ED`

## 4. Component Stylings（最终）

### Buttons

**Primary Filled**
- 背景：主按钮渐变
- 文字：白色，15px，weight 600
- 圆角：18px
- 内边距：16px 28px
- 阴影：主按钮阴影
- 按下：scale 0.97，背景变为主按钮按下渐变，阴影变为主按钮按下阴影

**Secondary Outline**
- 背景：`rgba(255, 252, 250, 0.9)`
- 边框：1.5px solid `#E9E3DD`
- 圆角：16px
- 文字：`#2E2A25`，15px，weight 500
- 按下：背景 `#FFF5ED`

**Text Button**
- 背景：透明
- 文字：`#FF8C42`，14px，weight 600
- 图标在右，间距 4px

**Icon Button**
- 尺寸：44×44px
- 圆角：14px
- 背景：透明或 `#F5F0EB`
- 图标 22px，`#7A746E`

### Cards

**Standard Card**
- 背景：`#FFFCFA`
- 圆角：22px
- 内边距：22px
- 阴影：卡片阴影
- 可选 1px 内边框：`inset 0 0 0 1px rgba(233, 227, 221, 0.5)`

**Feature Card**
- 圆角：20px
- 图标区域 56×56px，圆角 16px
  - 转盘：`#FFF0E6`，图标 `#FF8C42`
  - 食材：`#E8F5F1`，图标 `#4ECB9C`
  - 筛选：`#F5F0E8`，图标 `#8FA897`
  - 打卡：`#E8EEE6`，图标 `#5A6B58`

**Elevated Card**
- 圆角：26px
- 阴影：转盘阴影

### Chips

**Selectable Chip**
- 默认：背景 `#F5F0EB`，文字 `#7A746E`，圆角 20px，内边距 10px 18px
- 选中：背景 `#2E2A25`，文字白色，阴影 `0 4px 12px rgba(46,42,37,0.14)`
- 图标 18px，间距 6px

**Ingredient Tag**
- 背景：`#E8F5F1`
- 文字：`#1E7A63`
- 圆角：20px
- 删除按钮：20px 圆形，`#D1E8E1` 背景，× 图标 `#1E7A63`

### Inputs

**Text Input**
- 背景：`#FFFCFA`
- 边框：1.5px solid `#E9E3DD`
- 圆角：16px
- 内边距：15px 18px
- 聚焦：边框 `#FF8C42`，外发光 `0 0 0 4px rgba(255, 140, 66, 0.12)`
- 占位符：`#A8A29C`

### Bottom Tab Bar（最终）

- 背景：`rgba(255, 252, 250, 0.9)` + `backdrop-filter: blur(24px) saturate(160%)`
- 顶部边框：1px solid `rgba(233, 227, 221, 0.6)`
- 高度：68px + safe-area-bottom
- 图标 24px
- 未选中：`#A8A29C`
- 选中：暖橙 `#FF8C42`
- 标签 11px，weight 500
- 选中项下方 4px 暖橙圆点

## 5. Layout Principles（最终）

- 内容区 max-width: 420vp，居中
- 页面水平边距：22px
- 页面顶部安全区 + 20px
- 区块间距：28px
- 卡片内部间距：16px
- 首屏关键内容限制在顶部 580vp 内

## 6. Specific Page Visual Direction（最终）

### 首页（home-page）
- Header：左侧"今天吃什么"大标题 + 右侧设置图标按钮
- 今日状态卡：奶油渐变背景，左侧文案，右侧厨师帽图标（SVG，暖橙）
- 快捷入口：2×2 网格，四张 Feature Card
- 最近打卡：横向滚动，每项为小卡片（菜品名 + 时间 + 小图标）

### 推荐页（recommend-page）
- 顶部 Segmented Control，背景 `#F5F0EB`，选中 pill 为深棕 `#2E2A25`
- 切换内容区淡入 0.25s

### 转盘页（wheel-page）
- 标题"交给命运"
- 转盘 300px，12 扇区配色循环：暖橙、薄荷绿、橄榄绿、奶油、珊瑚、鼠尾草
- 中心 GO 按钮：主渐变，带脉冲光环
- 顶部固定指针
- 候选区：输入框 + 添加按钮，标签流式
- 结果面板：底部升起玻璃浮层

### 食材页（ingredient-page）
- 标题"我的冰箱"
- 输入行：输入框 + 圆形添加按钮（暖橙）
- 食材标签区
- 全宽"开始推荐"主按钮
- 推荐结果：菜品卡片列表，左侧色块 + 菜名 + 所需食材

### 筛选页（filter-page）
- 分组标题"现在的心情"、"用餐时段"
- 心情标签：开心、想吃辣、清淡、治愈、放纵、随便
- 时段标签：早餐、午餐、晚餐、夜宵
- 应用筛选主按钮
- 结果：2 列网格卡片

### 打卡页（checkin-page）
- 顶部统计卡：连续打卡大数字 + 累计打卡
- 日历卡：7 列，今日高亮圆环，打卡日实心圆点
- 餐别选择：早餐/午餐/晚餐 三个按钮
- 打卡表单卡：菜品输入、备注输入、保存按钮
- 历史列表：按日期倒序

### 分享页（share-page）
- 模板选择器：横向滚动，3 个模板缩略图
- 预览卡片：320×480px，圆角 28px，大菜品名、日期、文案
- 操作区：保存到相册 + 系统分享 两个大按钮

### 菜品管理页（dish-page）
- 顶部搜索框 + 圆形添加按钮
- 列表项：左侧彩色圆形首字母、菜名、标签行、编辑图标
- 空状态：厨师帽 + "还没有菜品，添加第一道吧"

## 7. Semantic UI Binding（最终，无变更）

与 DESIGN1.md 完全一致。

| Surface/Page | Page ID / Route | Tab ID | 关键语义目标 | 事件 |
|--------------|-----------------|--------|--------------|------|
| 首页 | home-page / pages/Home | tab-home | home-today-status-card, home-spin-wheel-button, home-ingredient-button, home-filter-button, home-checkin-button, home-recent-checkin-list | navigate-to-wheel, navigate-to-ingredient, navigate-to-filter, navigate-to-checkin |
| 推荐页 | recommend-page / pages/Recommend | tab-recommend | recommend-segment-wheel, recommend-segment-ingredient, recommend-segment-filter | switch-to-wheel, switch-to-ingredient, switch-to-filter |
| 转盘页 | wheel-page / pages/Wheel | parent tab-recommend | wheel-spin-button, wheel-canvas, wheel-result-panel, wheel-candidate-list, wheel-add-candidate-input, wheel-add-candidate-button, wheel-clear-candidates-button, wheel-go-checkin-button | spin-wheel, add-wheel-candidate, clear-wheel-candidates, navigate-to-checkin-with-result |
| 食材页 | ingredient-page / pages/Ingredient | parent tab-recommend | ingredient-input, ingredient-add-button, ingredient-tag-list, ingredient-recommend-button, ingredient-result-list, ingredient-clear-button | add-ingredient, recommend-by-ingredients, clear-ingredients |
| 筛选页 | filter-page / pages/Filter | parent tab-recommend | filter-mood-list, filter-time-list, filter-apply-button, filter-result-list, filter-reset-button | apply-filter, reset-filter |
| 打卡页 | checkin-page / pages/Checkin | tab-checkin | checkin-calendar, checkin-streak-count, checkin-total-count, checkin-meal-breakfast/lunch/dinner, checkin-dish-input, checkin-note-input, checkin-save-button, checkin-share-button, checkin-history-list | select-meal-type, update-checkin-dish, update-checkin-note, save-checkin, navigate-to-share |
| 分享页 | share-page / pages/Share | — | share-card-preview, share-save-button, share-system-button, share-template-list, share-caption-input | save-share-card, system-share-card, update-share-caption |
| 我的页 | profile-page / pages/Profile | tab-profile | profile-dish-library-button, profile-settings-button | navigate-to-dish-library, open-settings |
| 菜品管理页 | dish-page / pages/DishLibrary | — | dish-add-button, dish-list, dish-search-input, dish-form-name-input, dish-form-tags-input, dish-form-save-button, dish-form-delete-button | open-dish-form, search-dishes, update-dish-name, update-dish-tags, save-dish, delete-dish |

## 8. Do's and Don'ts（最终）

### Do
- 所有强调按钮使用暖橙渐变，保持一致品牌感。
- 卡片使用 20px 以上大圆角。
- 使用 Lucide SVG 图标，并确保每个 SVG 有 contextual title。
- 空状态使用柔和插画/大图标 + 明确引导。
- 底部 Tab Bar 使用玻璃拟态，固定底部。

### Don't
- 不要使用 emoji 作为 UI 图标。
- 不要让内容区超过 420vp 宽度。
- 不要使用多种不同风格的阴影。
- 不要省略语义 ID 的绑定。

---

*Design version: v1.2 (final)*  
*Date: 2026/06/23*
