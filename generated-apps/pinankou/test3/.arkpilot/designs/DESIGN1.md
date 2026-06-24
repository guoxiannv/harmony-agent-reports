# 平安扣 Pinankou — 视觉设计系统 v1（Reviewed）

## 1. Visual Theme & Atmosphere

平安扣是一款面向一线安全员的移动工具，视觉需要在“专业可信”与“轻松不压抑”之间取得平衡。我们在蓝绿色主调基础上引入**双渐变系统**和**玻璃拟态（Glassmorphism）**，让界面在安全感中透出精致与现代感。

整体氛围关键词：**清澈、受控、轻盈、可信赖**。

- **背景层次**：使用 `#F0FDFA`（极淡青绿）作为页面底色，营造“干净的水面”感；内容卡片使用纯白 `#FFFFFF`，并在顶部 Header 区域引入从 `#0D9488` 到 `#06B6D4`（青绿→天青）的渐变，象征安全状态从“稳定”过渡到“警觉”。
- **品牌色**：
  - `#0D9488`（Teal-600）— 主按钮、Tab 选中、核心强调。
  - `#14B8A6`（Teal-500）— 正向标签、完成态、图表上升线。
  - `#06B6D4`（Cyan-500）— 次级高亮、渐变终点、信息提示。
- **语义色**（保留）：
  - 高风险/逾期：`#EF4444`
  - 中风险/警告：`#F59E0B`
  - 低风险/正常/关闭：`#10B981`
- **材质与光感**：
  - Header 与部分统计卡使用 `linear-gradient(135deg, #0D9488 0%, #06B6D4 100%)` 渐变。
  - Tab 栏与顶部浮动导航使用毛玻璃：`rgba(255, 255, 255, 0.82)` + `backdrop-filter: blur(24px) saturate(180%)`。
  - 卡片使用带青色调的柔和投影：`0 6px 24px rgba(13, 148, 136, 0.10)`。
- **图标**：线性 2px 描边，圆角端点，默认色 `#64748B`，激活态 `#0D9488`。

## 2. Color Palette & Roles

### Brand Gradients
- **Primary Gradient**：`linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)` — 主按钮、关键指标强调。
- **Hero Gradient**：`linear-gradient(135deg, #0D9488 0%, #06B6D4 100%)` — 顶部 Header、品牌卡片。
- **Soft Gradient**：`linear-gradient(180deg, rgba(255,255,255,0.95) 0%, rgba(240,253,250,0.6) 100%)` — 页面内容区轻微过渡。

### Brand
- `#0D9488` — 主品牌色。
- `#14B8A6` — 高亮品牌色。
- `#06B6D4` — 天青辅助色。
- `#0F766E` — 深按态。
- `#CCFBF1` — 极淡青绿背景。

### Semantic
- `#EF4444` / `#FEF2F2` — 高/逾期。
- `#F59E0B` / `#FFFBEB` — 中/警告。
- `#10B981` / `#ECFDF5` — 低/正常/完成。
- `#0EA5E9` / `#F0F9FF` — 信息/链接。
- `#6366F1` / `#EEF2FF` — 巡检/流程辅助。

### Neutrals
- `#F0FDFA` — 页面背景。
- `#FFFFFF` — 卡片、表单。
- `#F8FAFC` — 输入框背景。
- `#E2E8F0` — 边框、分割线。
- `#94A3B8` — placeholder、禁用。
- `#64748B` — 次级文字、默认图标。
- `#334155` — 正文。
- `#0F172A` — 标题。

### Elevation
- Card：`0 6px 24px rgba(13, 148, 136, 0.10)`
- Hover Card：`0 10px 32px rgba(13, 148, 136, 0.14)`
- Floating Button：`0 6px 20px rgba(13, 148, 136, 0.32)`
- Tab Bar：`0 -4px 20px rgba(15, 23, 42, 0.06)`
- Bottom Sheet：`0 -8px 30px rgba(15, 23, 42, 0.12)`
- Focus Ring：`0 0 0 3px rgba(20, 184, 166, 0.18)`

## 3. Typography Rules

- 中文：`PingFang SC`, `Hiragino Sans GB`, `Microsoft YaHei`, sans-serif
- 西文：`-apple-system`, `BlinkMacSystemFont`, `Segoe UI`, `Roboto`, sans-serif

| 角色 | 字号 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| Hero 数字 | 36px | 700 | 1.1 | -0.5px | 统计看板大数 |
| 页面大标题 | 22px | 700 | 1.25 | -0.2px | 首页标题 |
| 页面标题 | 18px | 600 | 1.35 | -0.1px | 详情页标题 |
| 卡片标题 | 16px | 600 | 1.4 | 0 | 列表项标题 |
| 正文 | 14px | 400 | 1.55 | 0 | 描述 |
| 辅助 | 12px | 400 | 1.4 | 0 | 时间、地点 |
| 标签 | 11px | 600 | 1.2 | 0.2px | 状态/风险标签 |

## 4. Component Stylings

### Buttons

**Primary Gradient Button**
- Background: `linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)`
- Text: white, 16px, weight 600
- Padding: 12px 24px
- Radius: 14px
- Shadow: `0 4px 14px rgba(13, 148, 136, 0.30)`
- Active: scale 0.98, 渐变亮度 -5%

**Secondary Button**
- Background: `#F1F5F9`
- Text: `#334155`, 14px weight 500
- Radius: 12px

**Ghost Button**
- Background: transparent
- Text: `#0D9488`
- Border: 1px solid `#CCFBF1`
- Radius: 12px

**Danger Text Button**
- Background: transparent
- Text: `#EF4444`, 14px weight 500

### Cards
- Background: `#FFFFFF`
- Radius: 18px
- Padding: 16px
- Shadow: `0 6px 24px rgba(13, 148, 136, 0.10)`
- Hover（PC 预览）: translateY(-2px), shadow 增强。

### Tags
- 高：`#FEF2F2` + `#EF4444`
- 中：`#FFFBEB` + `#F59E0B`
- 低：`#ECFDF5` + `#10B981`
- 信息：`#F0F9FF` + `#0EA5E9`
- 全部圆角 10px，padding 5px 10px。

### Inputs
- Background: `#F8FAFC`
- Border: 1px solid `#E2E8F0`
- Radius: 12px
- Padding: 12px 14px
- Focus: border `#14B8A6`, ring `0 0 0 3px rgba(20,184,166,0.18)`

### Tab Bar
- Background: `rgba(255,255,255,0.88)` + `backdrop-filter: blur(24px) saturate(180%)`
- Height: 68px（含安全区）
- 选中 indicator：上方 3px 圆角短线，颜色 `#0D9488`。

### Progress / Tracker
- 进度条高度 6px，圆角 3px，背景 `#E2E8F0`，填充品牌渐变。
- 时间轴节点：当前节点为实心品牌色圆点 12px，已完成节点为品牌色描边圆点，待办节点为灰色描边圆点。

## 5. Layout Principles

- 页面水平内边距 16px。
- 卡片间距 12-16px。
- 区块标题与内容间距 12px。
- 内容区 max-width 390-420vp 居中。
- 页面底部预留 88vp 安全边距。

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| 0 | `#F0FDFA` 页面背景 |
| 1 | 白卡 + 柔和投影 |
| 2 | Hover 提升 + 更强投影 |
| 3 | 毛玻璃 Tab/Header |
| 4 | 底部 Sheet / 悬浮按钮 |

## 7. Per-Page Visual Notes

### 工作台
- Hero Header 使用渐变背景，包含：问候语、今日日期、头像。
- 4 个快捷入口做成 2×2 网格白色卡片，图标容器使用渐变背景（每个入口不同渐变角度/色值：青绿、天青、蓝紫、橙黄）。
- 待处理任务卡使用毛玻璃半透明卡片叠加在 Header 渐变下方或紧邻其下。
- 最近动态列表为白色卡片，项与项之间 12px 间距。

### 巡检/隐患/安全事项/联系人列表
- 顶部标题 18px + 右侧渐变主按钮（+ 图标）。
- 筛选器使用圆角胶囊分段器或下拉，背景 `#F8FAFC`。
- 列表卡片左侧可带颜色竖条表示状态/等级。

### 详情/表单页
- 顶部返回按钮 + 标题居中 + 保存/提交按钮。
- 表单分组使用卡片容器，分组标题 14px weight 600，颜色 `#334155`。
- 底部固定保存按钮（距底部 24px，避开 Tab，非 Tab 页面）。

### 统计看板
- 4 个指标卡 2×2 网格，每个卡片使用不同浅色背景（青绿/天青/蓝紫/橙黄）+ 深色数字。
- 趋势图使用渐变填充折线图。
- 环形图使用品牌色 + 语义色分段。

## 8. Semantic UI Binding

同 `DESIGN.md`，此处不再重复。所有语义 ID、路由、Tab ID、事件名称保持完全一致。

## 9. Do's and Don'ts

同 `DESIGN.md`，补充：
- **Do** 在 Header 和关键数据卡上使用渐变，避免全 App 单一纯色显得呆板。
- **Do** 使用玻璃拟态 Tab 栏，增强现代感。
- **Don't** 在同一张卡片内使用超过 3 种颜色，保持和谐。
- **Don't** 使用纯黑或纯深灰大面积背景，避免压抑感。
