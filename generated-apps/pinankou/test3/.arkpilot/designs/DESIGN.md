# 平安扣 Pinankou — 视觉设计系统

## 1. Visual Theme & Atmosphere

平安扣的视觉气质围绕“安全感、清爽、可信赖”展开。不同于商务管理类 App 常见的厚重蓝灰，我们采用**蓝绿色（Teal / Cyan）**作为品牌主色，传递洁净、健康、受控的心理暗示；辅以温润的米白背景和柔和的青灰阴影，让一线安全员在长时间巡检后查看 App 时仍感到轻松。

整体设计语言克制但不冷淡：

- **背景**：大面积的 `#F6FAFA`（极淡青灰白）作为页面底色，让内容呼吸；卡片使用纯白 `#FFFFFF` 叠加轻微阴影/毛玻璃，营造“浮于水面”的层级感。
- **品牌色**：蓝绿色 `#0D9488`（Teal-600）用于主按钮、选中态、关键数据强调；更鲜亮的 `#14B8A6`（Teal-500）用于图标、高亮标签、趋势上升等正向场景。
- **辅助色**：
  - 风险/隐患高等级：`#EF4444`（Red-500）
  - 中等级：`#F59E0B`（Amber-500）
  - 低等级/正常：`#10B981`（Emerald-500）
  - 信息/链接：`#0EA5E9`（Sky-500）
- **渐变与毛玻璃**：顶部 Header 使用 `linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)` 渐变背景；部分数据卡片使用 `backdrop-filter: blur(20px)` 的毛玻璃效果，增强现代感。
- **图标风格**：线性 SVG 图标，2px 描边，圆角端点，主色为青灰 `#64748B`，激活态为品牌蓝绿。

## 2. Color Palette & Roles

### Brand / Primary
- `#0D9488` — 主品牌色，主按钮、Tab 选中、关键强调。
- `#14B8A6` — 高亮品牌色，渐变终点、正向标签、图标激活态。
- `#0F766E` — 深品牌色，Hover/Pressed 状态、标题强调。
- `#CCFBF1` — 极淡青绿，轻提示背景、选中背景。

### Semantic
- `#EF4444` — 高风险 / 逾期 / 删除 / 异常。
- `#F59E0B` — 中风险 / 警告。
- `#10B981` — 低风险 / 正常 / 已完成 / 关闭。
- `#0EA5E9` — 信息 / 链接 / 次要操作。
- `#6366F1` — 巡检 / 流程类辅助色（可选）。

### Neutrals
- `#F6FAFA` — 页面背景。
- `#FFFFFF` — 卡片、表单、弹窗背景。
- `#F1F5F9` — 分隔背景、输入框背景。
- `#E2E8F0` — 边框、分割线。
- `#94A3B8` — 占位文字、禁用文字、次级图标。
- `#64748B` — 次级文字、默认图标。
- `#334155` — 正文文字。
- `#0F172A` — 标题、主文字。

### Shadows & Elevation
- 卡片阴影：`0 4px 20px rgba(13, 148, 136, 0.08)`（带品牌色调的柔和阴影）。
- 悬浮阴影：`0 8px 30px rgba(15, 23, 42, 0.12)`。
- 按钮阴影：`0 4px 12px rgba(13, 148, 136, 0.28)`。
- 毛玻璃：`background: rgba(255, 255, 255, 0.72); backdrop-filter: blur(20px);`。

## 3. Typography Rules

### Font Family
- 中文优先：`PingFang SC`, `Hiragino Sans GB`, `Microsoft YaHei`, `Noto Sans SC`, sans-serif
- 西文回退：`-apple-system`, `BlinkMacSystemFont`, `Segoe UI`, `Roboto`, sans-serif

### Hierarchy

| 角色 | 字号 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| 页面大标题 | 22px | 700 | 1.3 | -0.2px | 首页“平安扣”、统计大数 |
| 页面标题 | 18px | 600 | 1.35 | -0.1px | 详情页/列表页标题 |
| 卡片标题 | 16px | 600 | 1.4 | 0 | 列表项标题、指标卡片标题 |
| 正文 | 14px | 400 | 1.5 | 0 | 描述、备注 |
| 辅助文字 | 12px | 400 | 1.4 | 0 | 时间、地点、状态标签 |
| 数据大数 | 32px | 700 | 1.1 | -0.5px | 统计看板核心数字 |
| 标签文字 | 11px | 600 | 1.2 | 0.2px | 风险等级、状态标签 |

## 4. Component Stylings

### Buttons

**Primary Button（主按钮）**
- Background: `linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)`
- Text: `#FFFFFF`
- Padding: 12px 24px
- Border-radius: 12px
- Font: 16px weight 600
- Shadow: `0 4px 12px rgba(13, 148, 136, 0.28)`
- Active: scale(0.98), 渐变亮度降低 5%

**Secondary Button（次按钮）**
- Background: `#F1F5F9`
- Text: `#334155`
- Border-radius: 12px
- Font: 14px weight 500
- Active: background `#E2E8F0`

**Danger Button（删除/危险）**
- Background: `#FEF2F2`
- Text: `#EF4444`
- Border-radius: 12px
- Font: 14px weight 500

**Icon Button（图标按钮）**
- Size: 40px × 40px
- Background: transparent 或 `#F1F5F9`
- Border-radius: 10px
- Icon color: `#64748B`

### Cards
- Background: `#FFFFFF`
- Border-radius: 16px
- Padding: 16px
- Shadow: `0 4px 20px rgba(13, 148, 136, 0.08)`
- 无可见边框，依靠阴影和背景对比区分层级。

### Tags / Chips
- 高风险：`#FEF2F2` 背景，`#EF4444` 文字，圆角 8px，padding 4px 8px。
- 中风险：`#FFFBEB` 背景，`#F59E0B` 文字。
- 低风险：`#ECFDF5` 背景，`#10B981` 文字。
- 状态标签（整改中/待验收/已关闭）：使用对应语义色，文字 11px weight 600。

### Inputs
- Background: `#F8FAFC`
- Border: 1px solid `#E2E8F0`
- Border-radius: 12px
- Padding: 12px 14px
- Focus: border-color `#14B8A6`, 外加 `0 0 0 3px rgba(20, 184, 166, 0.15)` 光晕。
- Placeholder: `#94A3B8`

### Tab Bar
- Background: `#FFFFFF`
- Shadow: `0 -4px 20px rgba(15, 23, 42, 0.06)`
- Item 默认：`#94A3B8` 图标 + 11px 文字
- Item 选中：图标 `#0D9488`，文字 `#0D9488`，上方有 2px 品牌色小横线 indicator
- Height: 64px（含安全区）

### Bottom Sheet / Dialog
- Background: `#FFFFFF`
- Border-radius: 24px 24px 0 0（底部弹出）或 20px（居中弹窗）
- Shadow: `0 -8px 30px rgba(15, 23, 42, 0.12)`

## 5. Layout Principles

### Spacing System
- Base: 4px
- Scale: 4, 8, 12, 16, 20, 24, 28, 32, 40, 48

### Page Layout
- 页面水平内边距：16px
- 卡片间距：12px
- 区块间距：24px
- 顶部 Header 高度：约 120-160vp（含渐变背景、问候语、日期、关键指标）。
- 内容区 max-width：390-420vp 居中。

### Bottom Tab 约束
- Tab 栏固定在底部，宽度与 body 一致：`width: 100%; max-width: 390px; margin: 0 auto; left: 0; right: 0;`。
- 页面主内容底部预留 80vp 以上安全边距，避免被 Tab 遮挡。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Level 0 | `#F6FAFA` 纯色背景 | 页面底层 |
| Level 1 | 白卡 + `0 4px 20px rgba(13,148,136,0.08)` | 列表卡片、指标卡 |
| Level 2 | 白卡 + `0 8px 30px rgba(15,23,42,0.12)` | 底部 Sheet、悬浮按钮 |
| Level 3 | 毛玻璃 + blur(20px) | 顶部导航条、Tab 栏 |
| Focus | `0 0 0 3px rgba(20,184,166,0.15)` | 输入框、按钮焦点 |

## 7. Per-Page Visual Notes

### 工作台（home-page）
- 顶部为品牌渐变 Header，左侧显示“平安扣”+ 今日日期/问候语，右侧显示用户头像占位。
- Header 下方横向滚动显示 4 个快捷入口：开始巡检、上报隐患、记录事项、应急联系。
- 快捷入口为圆角 16px 白色卡片，带渐变图标背景与标题。
- 中部“待处理任务”统计卡，显示隐患/巡检/事项待办数量。
- 下部“最近动态”列表，按时间倒序展示最近操作记录。

### 巡检（inspections-page）
- 顶部标题 + 新增按钮。
- 分段器筛选：全部 / 进行中 / 已完成。
- 列表卡片展示任务名称、地点、计划时间、进度条。
- 进度条使用品牌渐变，已完成比例越高颜色越亮。

### 巡检详情（inspection-detail-page）
- 表单区：标题、地点、日期。
- 检查项列表：每项左侧序号，右侧正常/异常两个轻按钮。
- 异常项可点击“转为隐患”。
- 底部悬浮保存按钮。

### 隐患（hazards-page）
- 双维度筛选：状态（全部/待处理/整改中/待验收/已关闭）+ 等级（全部/高/中/低）。
- 列表卡片标题下方显示等级标签 + 状态标签 + 截止日期。
- 逾期项用红色强调截止日期。

### 隐患详情（hazard-detail-page）
- 表单区 + 进度时间轴 + 评论区。
- 进度时间轴使用垂直步骤条，当前节点高亮。
- 评论输入框固定在底部，带发送按钮。

### 安全事项（safety-notes-page）
- 列表展示事项标题、优先级、负责人、截止日期、完成开关。
- 已完成项文字置灰并带删除线。

### 安全事项详情（safety-note-detail-page）
- 简洁表单：标题、优先级、负责人、截止日期、备注、完成开关。

### 应急联系人（contacts-page）
- 顶部搜索框。
- 紧急联系人置顶，头像旁带红色“急”角标。
- 右侧电话/短信图标按钮。

### 联系人详情（contact-detail-page）
- 表单：姓名、角色、部门、电话、是否紧急联系人开关。

### 统计看板（stats-page）
- 周期选择器（近 7 天 / 30 天 / 本季度）。
- 4 个指标卡片横向排布：隐患总数、整改率、巡检完成率、逾期数。
- 趋势折线图（近 7 日隐患上报数）。
- 状态分布环形图。
- 隐患高发位置 Top 5 列表。

### 我的（profile-page）
- 用户头像 + 名称占位。
- 设置、关于、导出数据、清除本地数据入口。

## 8. Semantic UI Binding

### Surfaces & Routes

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home | home-page | pages/Home | tab-home |
| inspections | inspections-page | pages/Inspections | tab-inspections |
| inspection-detail | inspection-detail-page | pages/InspectionDetail | — |
| hazards | hazards-page | pages/Hazards | tab-hazards |
| hazard-detail | hazard-detail-page | pages/HazardDetail | — |
| safety-notes | safety-notes-page | pages/SafetyNotes | — |
| safety-note-detail | safety-note-detail-page | pages/SafetyNoteDetail | — |
| contacts | contacts-page | pages/Contacts | — |
| contact-detail | contact-detail-page | pages/ContactDetail | — |
| stats | stats-page | pages/Stats | tab-stats |
| profile | profile-page | pages/Profile | tab-profile |

### Action / Input / Assertion IDs to Preserve

- `home-open-inspections-button`, `home-report-hazard-button`, `home-add-safety-note-button`, `home-open-contacts-button`
- `inspections-add-button`, `inspections-filter-segment`, `inspections-list`
- `inspection-detail-*-input`, `inspection-detail-checklist`, `inspection-detail-check-normal-button`, `inspection-detail-check-abnormal-button`, `inspection-detail-convert-hazard-button`, `inspection-detail-submit-button`
- `hazards-add-button`, `hazards-filter-status`, `hazards-filter-level`, `hazards-list`
- `hazard-detail-*-input`, `hazard-detail-progress-tracker`, `hazard-detail-comment-list`, `hazard-detail-comment-input`, `hazard-detail-submit-comment-button`, `hazard-detail-save-button`
- `safety-notes-add-button`, `safety-notes-list`
- `safety-note-detail-*-input`, `safety-note-detail-done-toggle`, `safety-note-detail-save-button`
- `contacts-add-button`, `contacts-search-input`, `contacts-list`, `contacts-call-button`, `contacts-message-button`
- `contact-detail-*-input`, `contact-detail-emergency-toggle`, `contact-detail-save-button`
- `stats-period-picker`, `stats-hazard-total-card`, `stats-closed-rate-card`, `stats-inspection-completion-card`, `stats-overdue-count-card`, `stats-trend-chart`, `stats-status-distribution`, `stats-top-locations-list`
- `profile-settings-button`, `profile-about-button`, `profile-export-button`, `profile-clear-data-button`

### Event Names to Preserve

`navigate-to-inspections`, `open-hazard-detail-new`, `open-safety-note-detail-new`, `navigate-to-contacts`, `open-inspection-detail-new`, `navigate-back`, `mark-check-normal`, `mark-check-abnormal`, `convert-to-hazard`, `submit-inspection`, `save-hazard`, `submit-comment`, `save-safety-note`, `save-contact`, `call-contact`, `message-contact`, `open-settings`, `open-about`, `export-data`, `clear-local-data`，以及对应的 `delete-*` 事件。

### ID Gaps / Change Requests

- 当前语义协议未定义“拍照”独立 ID，建议在 HTML 中使用 `hazard-detail-photo-uploader` 作为整组上传控件的根 ID，内部由实现决定。
- 统计页面的图表在 ArkTS 中可能需使用自定义 Canvas/Path 或社区图表组件；HTML 中以静态图形示意绑定到 `stats-trend-chart` 与 `stats-status-distribution`。

## 9. Do's and Don'ts

### Do
- 使用蓝绿色系传递安全感，但允许红/黄/绿作为语义色点缀。
- 卡片使用圆角 16px、柔和阴影、无可见边框。
- 底部 Tab 固定在屏幕底部，宽度受限居中。
- 关键操作按钮使用渐变背景增强可点击感。
- 每个 SVG 图标注入上下文 title。

### Don't
- 不要使用全宽铺满的页面布局。
- 不要在侧边放置导航栏。
- 不要使用 emoji 或 Unicode 图标替代 SVG。
- 不要把示例数据写死为应用默认数据。
- 不要改变语义 ID、路由、事件名称。
