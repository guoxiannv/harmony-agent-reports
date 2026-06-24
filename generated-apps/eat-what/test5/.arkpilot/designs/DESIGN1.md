# 今天吃什么 — 视觉设计系统（迭代版）

## 1. Visual Theme & Atmosphere

本次迭代在 "Cozy Kitchen" 基础上提升精致度与层次感。整体视觉借鉴高端美食杂志的编辑感：以奶油白为底，暖橙与鼠尾草绿形成对比，通过大圆角、柔和渐变、微阴影和细腻的材质分区，让决策饮食这件事像翻阅一本精致食谱。

关键升级：
- **引入深橄榄绿**作为新的高级强调色，平衡暖橙的食欲感，增加沉稳气质。
- **卡片使用双层背景**：浅色卡片表面 + 极淡的彩色内发光，营造柔和光晕。
- **转盘区域使用径向渐变背景**，让转盘成为页面焦点。
- **玻璃拟态（Glassmorphism）**用于底部 Tab Bar 和结果浮层，提升现代感。

设计关键词：**精致、温暖、有食欲、现代、治愈**。

## 2. Color Palette & Roles

### Primary Brand
- **暖橙** `#FF8C42`：主按钮、转盘指针、选中态、核心强调。
- **深橄榄绿** `#5A6B58`：次级强调、导航选中、高级标签。平衡暖橙，带来自然感。
- **鼠尾草绿** `#8FA897`：辅助背景、成功态、食材相关元素。

### Neutrals
- **奶油白** `#FFFBF8`：页面主背景，比纯白更温暖。
- **香草卡士达** `#FFF5ED`：卡片hover/高亮背景、转盘区域背景。
- **深棕** `#2E2A25`：主标题与正文。
- **暖灰** `#7A746E`：次级文字、图标。
- **米灰** `#E9E3DD`：分割线、边框。
- **纯白** `#FFFFFF`：卡片表面、输入框。

### Gradients（升级）
- **主按钮渐变**：`linear-gradient(135deg, #FF8C42 0%, #FF7043 60%, #FF5722 100%)`
- **转盘背景径向渐变**：`radial-gradient(ellipse at center top, #FFF5ED 0%, #FFFBF8 70%)`
- **转盘指针渐变**：`linear-gradient(180deg, #FF8C42 0%, #FF5722 100%)`
- **成功渐变**：`linear-gradient(135deg, #8FA897 0%, #5A6B58 100%)`
- **分享卡片模板 1（暖阳）**：`linear-gradient(160deg, #FF8C42 0%, #FFD194 100%)`
- **分享卡片模板 2（森系）**：`linear-gradient(160deg, #5A6B58 0%, #8FA897 100%)`
- **分享卡片模板 3（奶油）**：`linear-gradient(160deg, #FFF5ED 0%, #FFDFC9 100%)`

### Shadows（更精致）
- **卡片阴影**：`0 2px 12px rgba(46, 42, 37, 0.06), 0 8px 24px rgba(46, 42, 37, 0.04)`
- **悬浮阴影**：`0 8px 28px rgba(255, 140, 66, 0.22)`
- **转盘阴影**：`0 16px 56px rgba(46, 42, 37, 0.14)`
- **玻璃浮层**：`0 -4px 24px rgba(46, 42, 37, 0.08)` + `backdrop-filter: blur(20px)`

## 3. Typography Rules

与 DESIGN.md 保持一致，但在数字和标题上增加紧凑感：

| 角色 | 字号 | 字重 | 行高 |
|------|------|------|------|
| 页面大标题 | 30px | 700 | 1.18 |
| 区块标题 | 22px | 700 | 1.25 |
| 卡片标题 | 18px | 600 | 1.3 |
| 正文 | 15px | 400 | 1.55 |
| 辅助文字 | 13px | 400 | 1.45 |
| 微小文字 | 11px | 500 | 1.35 |
| 数字强调 | 40px | 700 | 1.0 |

数字统一使用 `font-variant-numeric: tabular-nums`。

## 4. Component Stylings（升级）

### Buttons

**Primary Filled**
- 背景：暖橙渐变
- 文字：白色，15px，weight 600
- 圆角：18px（更大）
- 内边距：15px 28px
- 阴影：`0 6px 20px rgba(255, 140, 66, 0.28)`
- 按下：scale 0.97，阴影收缩

**Secondary Outline**
- 背景：rgba(255,255,255,0.7)
- 边框：1.5px solid `#E9E3DD`
- 圆角：16px
- 文字：`#2E2A25`，15px，weight 500

**Ghost Pill（筛选标签选中态）**
- 背景：`#2E2A25`
- 文字：白色
- 圆角：24px

### Cards

**Standard Card**
- 背景：白色
- 圆角：22px
- 内边距：22px
- 阴影：`0 2px 12px rgba(46, 42, 37, 0.06), 0 8px 24px rgba(46, 42, 37, 0.04)`
- 可叠加 1px 内边框 `rgba(233, 227, 221, 0.5)`

**Feature Card**
- 图标区域：56px 圆角，使用柔和彩色背景
  - 转盘：#FFF0E6（暖橙浅底）
  - 食材：#E8F3F0（薄荷浅底）
  - 筛选：#F5F0E8（米黄浅底）
  - 打卡：#E6EEE6（橄榄浅底）

**Elevated Card**
- 圆角：26px
- 阴影：`0 16px 56px rgba(46, 42, 37, 0.14)`

### Chips / Tags

**Selectable Chip**
- 默认：背景 `#F5F0EB`，文字 `#7A746E`，圆角 20px
- 选中：背景 `#2E2A25`，文字白色，阴影 `0 4px 12px rgba(46,42,37,0.15)`
- 带图标的 chip：图标 18px，文字 14px

**Ingredient Tag**
- 背景：`#E8F3F0`
- 文字：`#2E6B61`
- 圆角：20px
- 删除按钮：18px 圆形浅背景

### Inputs

**Text Input**
- 背景：白色
- 边框：1.5px solid `#E9E3DD`
- 圆角：16px
- 内边距：15px 18px
- 聚焦：边框 `#FF8C42`，外发光 `0 0 0 4px rgba(255, 140, 66, 0.12)`
- 占位符：`#A8A29C`

### Bottom Tab Bar

- 背景：rgba(255, 251, 248, 0.88) + `backdrop-filter: blur(20px) saturate(180%)`
- 顶部 1px border：`rgba(233, 227, 221, 0.6)`
- 高度：68px + safe-area
- 未选中图标：`#A8A29C`
- 选中图标：暖橙 `#FF8C42`
- 选中标签：暖橙
- 选中态带 4px 小圆点

## 5. Layout Principles

- 最大内容宽度 420vp，居中
- 页面水平边距 22px
- 区块间距 28px
- 首页首屏：Header + 今日状态卡 + 快捷入口网格，全部在 600vp 内

## 6. Specific Page Visual Direction（升级）

### 首页
- 顶部右侧设置按钮改为深橄榄绿 subtle 图标按钮
- 今日状态卡使用暖橙到奶油渐变背景，左侧文字，右侧悬浮厨师帽插画
- 快捷入口 2×2 网格，四个卡片分别使用不同柔和底色
- 最近打卡使用横向滚动小卡片，带菜品图片占位和日期

### 推荐页
- 分段控制（Segment）背景 `#F5F0EB`，选中项为深橄榄绿填充 pill
- 三个子页面切换有 0.25s 淡入动画

### 转盘页
- 页面顶部大标题"今天吃什么"
- 转盘直径 300px，12 色扇区（暖橙、薄荷、奶油、橄榄等交替）
- 中心 GO 按钮使用主渐变，带脉冲动画
- 指针使用三角形暖橙渐变，悬浮于转盘上方
- 候选区使用浅灰背景输入框 + 添加按钮
- 结果浮层从底部升起，玻璃拟态背景

### 食材页
- 顶部"我的冰箱"标题
- 输入框 + 添加按钮在同一行
- 食材标签流式排列
- 推荐按钮全宽主渐变
- 推荐结果使用卡片列表，每张卡片左侧色块、右侧菜名和所需食材

### 筛选页
- "现在是什么心情？" + "什么时候吃？" 两个分组
- 心情标签带 emoji-free 图标（笑脸、星星、心、月亮等 SVG）
- 时段标签：早餐（太阳）/ 午餐（餐具）/ 晚餐（月亮）/ 夜宵（星星）
- 结果网格 2 列，每张卡片带渐变顶部条

### 打卡页
- 顶部统计卡片：连续打卡大数字 + 累计打卡
- 日历卡片：7 列，今日高亮，打卡日带实心圆点
- 餐别选择：三个横向大按钮，选中为深橄榄绿
- 表单卡片：菜品输入 + 备注输入 + 保存按钮
- 历史记录：列表卡片

### 分享页
- 横向滚动的模板选择器，每个模板为小卡片预览
- 主预览区卡片 320×480px，圆角 28px，带渐变、日期、菜品名、文案
- 底部两个主按钮：保存到相册（主渐变）、系统分享（深橄榄绿填充）

### 菜品管理页
- 顶部搜索框 + 圆形添加按钮
- 列表项：左侧彩色圆形首字母、菜名、标签、编辑图标
- 空状态：大厨师帽图标 + 引导文字

## 7. Semantic UI Binding

与 DESIGN.md 完全一致，无变更请求。

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

## 8. Do's and Don'ts

### Do
- 使用深橄榄绿 + 暖橙双主色，提升高级感。
- 卡片使用双层阴影，增加层次感。
- 转盘页使用径向渐变背景聚焦注意力。
- 分享卡片使用 2:3 竖版比例，适合社交平台。
- 图标统一 Lucide 风格，保持 20-24px。

### Don't
- 不要使用过饱和的颜色。
- 不要让 Tab Bar 透明到与内容混淆，必须使用玻璃拟态。
- 不要让按钮圆角过小，主要按钮保持 16px 以上。
- 不要在卡片上使用超过 2 种强调色。

---

*Design version: v1.1*  
*Date: 2026/06/23*
