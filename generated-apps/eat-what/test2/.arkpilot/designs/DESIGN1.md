# 今天吃什么 - 视觉设计规范（评审版）

## 1. Visual Theme & Atmosphere

「今天吃什么」是一款温暖、治愈又带点趣味的饮食决策 App。整体视觉语言借鉴 Apple 的克制高级感，但在中性基底上加入食物与情绪相关的小面积柔和色点，营造"厨房灯光"般的亲切氛围。页面以浅灰白为主场，顶部与决策 moment 使用深色沉浸区块形成节奏感；转盘页采用全屏深色背景，让转盘的彩色分区成为绝对主角。

设计关键词：**温暖、克制、有趣、可信**。

### 整体氛围
- 浅色背景：奶油白 `#FAF8F5`（比上一版更柔和）
- 深色沉浸区：炭黑 `#0F0F0F`（转盘页 Hero、顶部氛围区）
- 主色强调：暖橙 `#FF6B35`（食欲感 CTA）
- 情绪辅助色：
  - 薄荷青 `#3DD9C0`（清新/健康/食材）
  - 奶酪黄 `#FFC93D`（开心/奖励）
  - 莓红 `#FF4D6D`（想吃辣/冲动）
  - 芋泥紫 `#9B7EDE`（悠闲/周末）
- 色彩使用原则：每个页面最多出现 2 种强调色，通过不同透明度和渐变层次避免单调。

### 关键特征
- 使用大圆角卡片（16px-28px）承载内容，模拟餐盘/便签。
- 大面积留白，信息节奏舒缓。
- 转盘页全屏深色，强调戏剧性与决策仪式感。
- 底部 Tab Bar 使用玻璃拟态悬浮，统一存在于三个主 Tab 页。
- 文字使用系统无衬线，标题紧凑、正文宽松。
- 卡片与按钮增加细腻的弥散阴影与微渐变，避免"扁平模板感"。

## 2. Color Palette & Roles

### Primary / Background
- **页面底色** `#FAF8F5`：奶油白，主页面背景。
- **卡片底色** `#FFFFFF`：纯白卡片，覆盖在页面底色上。
- **深色沉浸背景** `#0F0F0F`：转盘页、首页顶部氛围区。
- **深色卡片** `#1C1C1E`：深色背景上的内容卡片。
- **半透明玻璃** `rgba(255, 255, 255, 0.08)`：深色页面上用于叠加层。

### Accent
- **暖橙 CTA** `#FF6B35`：主按钮、转盘指针、高强调标签。
- **暖橙浅** `#FF8A5B`：渐变第二站。
- **薄荷青** `#3DD9C0`：食材/健康相关标签、成功状态。
- **奶酪黄** `#FFC93D`：开心/奖励、选中高亮。
- **莓红** `#FF4D6D`：想吃辣/重口味标签、删除/危险操作。
- **芋泥紫** `#9B7EDE`：悠闲/周末/特殊场景。
- **聚焦环** `#FF6B35`：所有可聚焦元素的 outline。

### Text
- **主标题深色** `#1A1A1A`
- **正文深色** `#4A4A4A`
- **次级文字** `#8A8A8A`
- **深色背景文字** `#FFFFFF`
- **深色背景次级文字** `rgba(255, 255, 255, 0.72)`

### Surface & States
- **卡片阴影** `0 12px 32px rgba(0, 0, 0, 0.06)`
- **悬浮按钮阴影** `0 8px 24px rgba(255, 107, 53, 0.32)`
- **选中描边** `2px solid #FF6B35`
- **未选中描边** `1px solid rgba(0, 0, 0, 0.06)`
- **标签底色** `rgba(255, 107, 53, 0.08)`
- **空状态底色** `#F0EEEB`
- **微渐变背景** `linear-gradient(135deg, #FF6B35 0%, #FF8A5B 100%)`
- **转盘分区渐变** 每个分区使用同色系深浅渐变，例如 `#FF6B35 → #FF8A5B`

## 3. Typography Rules

### Font Family
- 全局：`HarmonyOS Sans SC`, `PingFang SC`, `SF Pro Text`, `Helvetica Neue`, `sans-serif`

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing |
|------|------|--------|-------------|----------------|
| Page Hero Title | 40px | 700 | 1.10 | -0.5px |
| Section Title | 24px | 700 | 1.20 | -0.3px |
| Card Title | 18px | 600 | 1.30 | 0 |
| Body | 15px | 400 | 1.55 | 0 |
| Caption | 13px | 400 | 1.40 | 0 |
| Tab Label | 11px | 600 | 1.20 | 0.2px |
| Button | 16px | 600 | 1.00 | 0 |
| Tag | 12px | 500 | 1.20 | 0 |

## 4. Component Stylings

### Buttons

**主按钮（Primary CTA）**
- Background: `linear-gradient(135deg, #FF6B35 0%, #FF8A5B 100%)`
- Text: `#FFFFFF`
- Padding: 14px 28px
- Border-radius: 24px（全胶囊）
- Font: 16px, weight 600
- Shadow: `0 8px 24px rgba(255, 107, 53, 0.32)`
- Active: scale(0.98), 阴影收缩

**次按钮（Secondary）**
- Background: `#FFFFFF`
- Text: `#1A1A1A`
- Border: 1px solid rgba(0,0,0,0.08)
- Padding: 12px 24px
- Border-radius: 20px
- Hover/Active: bg `#F7F5F2`

**文字按钮（Text Link）**
- Background: transparent
- Text: `#FF6B35`
- Font: 14px, weight 600

### Cards
- Background: `#FFFFFF`
- Border-radius: 20px
- Padding: 20px
- Shadow: `0 12px 32px rgba(0, 0, 0, 0.06)`
- 可选顶部装饰条：4px 高度，暖橙渐变
- Hover/Active: 轻微上移 2px

### Tags / Chips
- 默认：bg `rgba(0,0,0,0.04)`, text `#4A4A4A`, radius 18px, padding 8px 14px, border 1px solid transparent
- 选中：bg `rgba(255,107,53,0.10)`, text `#FF6B35`, border `#FF6B35`
- 标签类型颜色：
  - 心情标签：选中为 `#FFC93D` 背景 + `#1A1A1A` 文字
  - 时间标签：选中为 `#3DD9C0` 背景 + `#FFFFFF` 文字
  - 餐别标签：选中为 `#FF6B35` 背景 + `#FFFFFF` 文字
  - 辣度/口味标签：选中为 `#FF4D6D` 背景 + `#FFFFFF` 文字
  - 场景标签：选中为 `#9B7EDE` 背景 + `#FFFFFF` 文字

### Input Fields
- Background: `#FFFFFF`
- Border: 1px solid rgba(0,0,0,0.08)
- Border-radius: 14px
- Padding: 12px 16px
- Focus: border `#FF6B35`, 2px outline ring

### Bottom Tab Bar
- Background: `rgba(255, 248, 245, 0.86)` + `backdrop-filter: blur(24px)`
- Height: 64px（含安全区）
- 3 个 Tab 等分：今日、食材、打卡
- 图标 24px，标签 11px
- 未选中：`#8A8A8A`；选中：`#FF6B35`
- 顶部 1px 分隔线 `rgba(0,0,0,0.06)`

### 转盘组件
- 全屏深色背景 `#0F0F0F`
- 转盘直径：视口宽度的 92%（max 360px）
- 分区使用一组协调的暖色循环，每个分区带轻微同色系渐变：
  1. `#FF6B35 → #FF8A5B`
  2. `#FFC93D → #FFE082`
  3. `#3DD9C0 → #7EE8D8`
  4. `#FF4D6D → #FF7A8F`
  5. `#9B7EDE → #BBA3E8`
  6. `#4ECDC4 → #88E0D9`
  7. `#F7DC6F → #FBE9A0`
  8. `#BB8FCE → #D5B5E4`
- 中心圆形按钮：暖橙渐变，白字"开始"，带脉冲阴影动画
- 顶部固定指针：白色三角形，指向 12 点钟方向，带轻微发光
- 结果弹窗：深色卡片 `#1C1C1E`，圆角 28px，从底部滑入，带半透明背景遮罩

## 5. Layout Principles

### Spacing System
- Base unit: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80

### Container
- 内容区最大宽度：390px，居中
- 水平内边距：20px
- 卡片间距：16px
- 区块间距：32px

### 页面结构
- 顶部氛围区（首页）：高度 260px，深色渐变背景，包含问候语、日期、今日决策入口
- 内容区：奶油色背景，白色卡片堆叠，底部预留 Tab Bar 高度（80px）
- 转盘页：全屏深色，居中布局，顶部返回按钮
- 筛选页：浅色背景，分组卡片
- 食材页：顶部输入区 + 食材标签云 + 推荐列表
- 打卡页：顶部日历 + 当日记录列表

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| 0 | 页面背景，无阴影 |
| 1 | 卡片：`0 12px 32px rgba(0,0,0,0.06)` |
| 2 | 悬浮按钮/底部 Tab：`0 8px 24px rgba(0,0,0,0.12)` |
| 3 | 转盘中心按钮脉冲：`0 0 0 16px rgba(255,107,53,0.16)` |
| 4 | 结果弹窗：`0 -8px 40px rgba(0,0,0,0.24)` |
| Focus | `2px solid #FF6B35` |

## 7. Do's and Don'ts

### Do
- 保持页面色调温暖克制，避免五颜六色的模板感。
- 转盘分区使用协调的暖色循环渐变，不同页面强调色统一。
- 使用真实食物插画/占位图增强食欲感（占位图可用渐变几何图形）。
- 每个操作按钮都要有足够大的触摸区域（最小 44px）。
- 空状态使用趣味插画 + 引导文案。
- 在卡片、按钮、转盘中心使用微渐变和柔和阴影提升高级感。

### Don't
- 禁止在浅色页面同时使用超过两种强调色。
- 禁止底部 Tab 出现在侧边或顶部。
- 禁止转盘页使用浅色背景破坏沉浸感。
- 禁止使用 emoji 作为图标。
- 禁止卡片铺满全宽超过 420px。
- 禁止所有按钮都使用同一种样式，要有主次之分。

## 8. Responsive Behavior

### Target Device
- 屏幕分辨率：1272vp × 2756vp（宽 × 高）
- 内容区 max-width：390px，居中
- 底部 Tab 宽度与 body 一致（100%, max-width 390px, margin 0 auto, left/right 0）

### Scaling
- 文字使用相对单位 rem，关键组件固定最大宽度。
- 转盘尺寸基于视口宽度百分比但不超过 360px。
- 长屏幕保证底部 Tab 始终可见，内容可滚动。

## 9. Semantic UI Binding

### Surfaces / Routes / Tabs

| Surface ID | Page ID | Route | Tab ID | Notes |
|------------|---------|-------|--------|-------|
| home | home | pages/Home | tab-home | 底部 Tab 主页 |
| wheel | wheel | pages/Wheel | - | 全屏页面，从首页进入 |
| ingredients | ingredients | pages/Ingredients | tab-ingredients | 底部 Tab 食材页 |
| filter | filter | pages/Filter | - | 从首页/食材页进入 |
| records | records | pages/Records | tab-records | 底部 Tab 打卡页 |
| record-form | record-form | pages/RecordForm | - | 从首页/打卡页进入 |
| share-card | share-card | pages/ShareCard | - | 从转盘结果/打卡记录进入 |

### Semantic Targets to Preserve

| Surface | ID | Role | Visual Mapping |
|---------|-----|------|----------------|
| home | home-title | assertion | 首页顶部问候/日期标题 |
| home | home-quick-wheel-button | action | 首页"转一转"主按钮，暖橙渐变胶囊 |
| home | home-filter-button | action | 首页筛选入口图标/按钮 |
| home | home-recommend-list | list | 推荐菜谱卡片列表 |
| home | home-empty-recommendations | assertion | 无推荐时的空状态 |
| home | home-today-record-status | assertion | 今日是否已打卡状态标签 |
| home | home-add-record-button | action | 首页快捷打卡按钮 |
| wheel | wheel-back-button | action | 左上角返回箭头 |
| wheel | wheel-title | assertion | 页面标题"今天吃什么" |
| wheel | wheel-canvas | assertion | 转盘可视区域 |
| wheel | wheel-spin-button | action | 转盘中心"开始"按钮 |
| wheel | wheel-result-name | assertion | 结果弹窗中的菜名 |
| wheel | wheel-result-accept-button | action | 结果弹窗"就吃这个" |
| wheel | wheel-result-reshuffle-button | action | 结果弹窗"再转一次" |
| wheel | wheel-share-button | action | 结果页分享按钮 |
| ingredients | ingredients-title | assertion | 页面标题 |
| ingredients | ingredients-input | input | 食材名称输入框 |
| ingredients | ingredients-add-button | action | 添加食材按钮 |
| ingredients | ingredients-list | list | 食材标签/卡片列表 |
| ingredients | ingredients-empty-state | assertion | 无食材空状态 |
| ingredients | ingredient-delete-button | action | 每个食材项的删除按钮 |
| ingredients | ingredients-recommend-button | action | "看看能做什么"按钮 |
| ingredients | ingredients-dish-list | list | 基于食材的推荐菜谱列表 |
| ingredients | ingredients-empty-recommendations | assertion | 无匹配菜谱空状态 |
| filter | filter-back-button | action | 返回按钮 |
| filter | filter-mood-group | input | 心情筛选胶囊组 |
| filter | filter-time-group | input | 时间筛选胶囊组 |
| filter | filter-meal-group | input | 餐别筛选胶囊组 |
| filter | filter-apply-button | action | 应用筛选按钮 |
| filter | filter-reset-button | action | 重置筛选按钮 |
| records | records-title | assertion | 页面标题 |
| records | records-calendar | assertion | 打卡日历组件 |
| records | records-add-button | action | 新增打卡按钮 |
| records | records-list | list | 打卡记录列表 |
| records | records-empty-state | assertion | 无记录空状态 |
| records | record-share-button | action | 单条记录分享按钮 |
| record-form | record-form-date-picker | input | 日期选择 |
| record-form | record-form-meal-group | input | 餐别选择 |
| record-form | record-form-dish-input | input | 菜名输入 |
| record-form | record-form-rating | input | 满意度评分 |
| record-form | record-form-note-input | input | 备注输入 |
| record-form | record-form-save-button | action | 保存打卡 |
| record-form | record-form-cancel-button | action | 取消 |
| share-card | share-card-preview | assertion | 卡片预览区域 |
| share-card | share-card-save-button | action | 保存到相册 |
| share-card | share-card-close-button | action | 关闭 |

### Events to Preserve

`open-wheel`, `open-filter`, `apply-filter`, `reset-filter`, `spin-wheel`, `accept-result`, `reshuffle`, `add-ingredient`, `delete-ingredient`, `show-ingredient-recommendations`, `open-add-record`, `save-record`, `cancel-record`, `open-share-card`, `save-share-card`, `close-share-card`, `navigate-back`

### ID Gaps / Change Requests

- 无变更请求。所有语义目标均已映射到视觉控件。
- 建议在实现时为每个筛选胶囊在 HTML/ArkTS 中通过子项索引或动态 ID 保持可测试性，但 semantic protocol 中仅需保证 group 级 ID。
