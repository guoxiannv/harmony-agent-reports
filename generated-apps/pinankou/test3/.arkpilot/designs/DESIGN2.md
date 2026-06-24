# 平安扣 Pinankou — 视觉设计系统 v2（Final）

## 1. Visual Theme & Atmosphere

平安扣的最终视觉方向是**“清澈的安全感”**：以蓝绿色为主调，搭配天青色渐变、毛玻璃材质与柔和青灰阴影，让安全管理工具既专业可信，又不失日常使用的轻松感。

整体关键词：**清澈、受控、轻盈、可信赖、现代**。

- **背景**：页面底色 `#F0FDFA`（极淡青绿），模拟干净、明亮的工作环境；内容卡片使用纯白 `#FFFFFF`，形成清晰的层级。
- **品牌渐变**：
  - 主渐变：`linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)` — 用于主按钮、核心强调。
  - Hero 渐变：`linear-gradient(135deg, #0D9488 0%, #06B6D4 100%)` — 用于顶部 Header、品牌卡。
- **语义色**（保留并强化）：
  - 高风险/逾期：红 `#EF4444` / 浅红 `#FEF2F2`
  - 中风险/警告：琥珀 `#F59E0B` / 浅琥珀 `#FFFBEB`
  - 低风险/正常/完成：绿 `#10B981` / 浅绿 `#ECFDF5`
  - 信息/链接：天蓝 `#0EA5E9` / 浅天蓝 `#F0F9FF`
- **材质与光感**：
  - Header、关键统计卡使用渐变背景，增强视觉焦点。
  - Tab 栏、顶部浮动条使用毛玻璃：`rgba(255,255,255,0.88)` + `backdrop-filter: blur(24px) saturate(180%)`。
  - 卡片使用青色调柔和投影：`0 6px 24px rgba(13, 148, 136, 0.10)`。
  - 按钮使用品牌色投影，提升可点击感。
- **图标**：线性 2px 描边，圆角端点；默认 `#64748B`，激活态 `#0D9488`。每个 SVG 必须带上下文 `<title>`。

## 2. Color Palette & Roles

### Brand
- `#0D9488` — 主品牌色，主按钮、Tab 选中、关键强调。
- `#14B8A6` — 高亮品牌色，正向标签、完成态、图表上升线。
- `#06B6D4` — 天青辅助色，渐变终点、信息提示。
- `#0F766E` — 深品牌色，按态/重色文字。
- `#CCFBF1` — 极淡青绿，轻提示背景、选中背景。
- `#F0FDFA` — 页面背景。

### Semantic
- `#EF4444` / `#FEF2F2` — 高风险 / 逾期 / 删除。
- `#F59E0B` / `#FFFBEB` — 中风险 / 警告。
- `#10B981` / `#ECFDF5` — 低风险 / 正常 / 已关闭 / 完成。
- `#0EA5E9` / `#F0F9FF` — 信息 / 链接。
- `#6366F1` / `#EEF2FF` — 巡检 / 流程辅助。

### Neutrals
- `#FFFFFF` — 卡片、表单。
- `#F8FAFC` — 输入框背景、次级卡片。
- `#E2E8F0` — 边框、分割线、进度条背景。
- `#94A3B8` — placeholder、禁用、次级图标。
- `#64748B` — 次级文字、默认图标。
- `#334155` — 正文。
- `#0F172A` — 标题、主文字。

### Elevation
- Card：`0 6px 24px rgba(13, 148, 136, 0.10)`
- Card Hover：`0 10px 32px rgba(13, 148, 136, 0.14)`
- Primary Button：`0 4px 14px rgba(13, 148, 136, 0.30)`
- Floating Action：`0 6px 20px rgba(13, 148, 136, 0.32)`
- Tab Bar：`0 -4px 20px rgba(15, 23, 42, 0.06)`
- Bottom Sheet：`0 -8px 30px rgba(15, 23, 42, 0.12)`
- Focus Ring：`0 0 0 3px rgba(20, 184, 166, 0.18)`

## 3. Typography Rules

- 中文：`PingFang SC`, `Hiragino Sans GB`, `Microsoft YaHei`, sans-serif
- 西文：`-apple-system`, `BlinkMacSystemFont`, `Segoe UI`, `Roboto`, sans-serif

| 角色 | 字号 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| Hero 数字 | 34px | 700 | 1.1 | -0.5px | 统计看板大数 |
| 页面大标题 | 22px | 700 | 1.25 | -0.2px | 首页标题 |
| 页面标题 | 18px | 600 | 1.35 | -0.1px | 详情页标题 |
| 卡片标题 | 16px | 600 | 1.4 | 0 | 列表项标题 |
| 正文 | 14px | 400 | 1.55 | 0 | 描述 |
| 辅助文字 | 12px | 400 | 1.4 | 0 | 时间、地点 |
| 标签文字 | 11px | 600 | 1.2 | 0.2px | 状态/风险标签 |

## 4. Component Stylings

### Buttons

**Primary Gradient Button**
- Background: `linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)`
- Text: `#FFFFFF`, 16px, weight 600
- Padding: 12px 24px
- Border-radius: 14px
- Shadow: `0 4px 14px rgba(13, 148, 136, 0.30)`
- Active: scale(0.98), 渐变亮度 -5%

**Secondary Button**
- Background: `#F1F5F9`
- Text: `#334155`, 14px weight 500
- Border-radius: 12px
- Active: background `#E2E8F0`

**Ghost Button**
- Background: transparent
- Text: `#0D9488`
- Border: 1px solid `#CCFBF1`
- Border-radius: 12px

**Danger Button**
- Background: `#FEF2F2`
- Text: `#EF4444`, 14px weight 500
- Border-radius: 12px

**Icon Button**
- Size: 40px × 40px
- Background: `#F1F5F9` 或 transparent
- Border-radius: 10px
- Icon color: `#64748B`

### Cards
- Background: `#FFFFFF`
- Border-radius: 18px
- Padding: 16px
- Shadow: `0 6px 24px rgba(13, 148, 136, 0.10)`
- 无边框，靠阴影/背景区分层级。
- Hover（PC 预览）：translateY(-2px)，阴影增强。

### Tags / Chips
- 高风险：`#FEF2F2` 背景，`#EF4444` 文字，圆角 10px，padding 5px 10px。
- 中风险：`#FFFBEB` 背景，`#F59E0B` 文字。
- 低风险：`#ECFDF5` 背景，`#10B981` 文字。
- 信息标签：`#F0F9FF` 背景，`#0EA5E9` 文字。
- 状态标签（整改中/待验收/已关闭）：使用对应语义色，11px weight 600。

### Inputs
- Background: `#F8FAFC`
- Border: 1px solid `#E2E8F0`
- Border-radius: 12px
- Padding: 12px 14px
- Focus: border-color `#14B8A6`，外加 `0 0 0 3px rgba(20, 184, 166, 0.18)` 光晕。
- Placeholder: `#94A3B8`

### Tab Bar
- Background: `rgba(255, 255, 255, 0.88)` + `backdrop-filter: blur(24px) saturate(180%)`
- Height: 68px（含底部安全区）
- Item 默认：`#94A3B8` 图标 + 11px 文字
- Item 选中：图标 `#0D9488`，文字 `#0D9488`，上方 3px 品牌色圆角短线 indicator

### Progress / Timeline
- 进度条：高度 6px，圆角 3px，背景 `#E2E8F0`，填充品牌渐变。
- 时间轴：当前节点实心 `#0D9488` 圆点 12px；已完成节点品牌色描边圆点；待办节点灰色描边圆点。

## 5. Layout Principles

- 页面水平内边距：16px
- 卡片间距：12-16px
- 区块间距：24px
- 内容区 max-width：390-420vp 居中
- 页面主内容底部预留：88vp 安全边距（避免被 Tab 遮挡）
- 列表页顶部：标题 + 操作按钮 + 筛选器 + 列表，间距 16px

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| 0 | `#F0FDFA` 纯色背景 | 页面底层 |
| 1 | 白卡 + `0 6px 24px rgba(13,148,136,0.10)` | 列表卡片、指标卡 |
| 2 | Hover 提升 + 更强阴影 | 可交互卡片悬停态 |
| 3 | 毛玻璃 + blur(24px) | Tab 栏、顶部浮动导航 |
| 4 | 悬浮按钮 / 底部 Sheet | 全局新增、表单提交 |
| Focus | `0 0 0 3px rgba(20,184,166,0.18)` | 输入框、按钮焦点 |

## 7. Per-Page Visual Notes

### 工作台（home-page）
- **Hero Header**：使用 Hero 渐变背景，左上角问候语“早上好，安全员” 14px 白色 70% 透明度；大标题“平安扣” 22px 白色 weight 700；右上角圆形头像占位。
- **日期/摘要条**：Header 下方一行显示今日日期与“今日待处理 N 项”小标签。
- **快捷入口 2×2 网格**：
  - 开始巡检：图标容器渐变 `#0D9488 → #14B8A6`
  - 上报隐患：图标容器渐变 `#14B8A6 → #06B6D4`
  - 记录事项：图标容器渐变 `#6366F1 → #0EA5E9`
  - 应急联系：图标容器渐变 `#F59E0B → #EF4444`（暖色提醒）
  - 每个入口白色圆角卡片 18px，标题 14px weight 600，副标题 12px `#64748B`。
- **待处理任务卡**：白色卡片，内部三列小指标：隐患数、巡检数、事项数，每列上方数字 18px weight 700，下方标签 11px。
- **最近动态**：白色卡片标题“最近动态”+ 右侧“查看全部”。列表项左侧小色点（根据类型：绿=巡检、红=隐患、蓝=事项、紫=联系人），标题 14px，时间 12px `#94A3B8`。

### 巡检（inspections-page）
- 标题“巡检” 18px weight 600，右侧渐变“+”主按钮。
- 分段器：全部 / 进行中 / 已完成，胶囊样式，选中项白色背景 + 品牌色文字 + 投影。
- 列表卡片：左侧颜色竖条（绿=已完成，蓝=进行中，灰=未开始），标题 16px weight 600，地点/时间 12px，底部进度条与完成数“3/5”。

### 巡检详情（inspection-detail-page）
- 顶部返回按钮 + “巡检详情”标题 + “保存”主按钮。
- 表单分组卡片：基本信息（标题、地点、日期）。
- 检查项列表：每项白色卡片，左侧序号圆角方块（渐变背景），右侧“正常”/“异常”两个 Ghost 按钮；异常时该卡片边框变为 `#FEF2F2` 背景。
- 异常项下方显示“转为隐患”文字按钮（红色）。
- 底部固定“提交巡检结果”渐变主按钮。

### 隐患（hazards-page）
- 标题“隐患” + 右侧“+”主按钮。
- 双筛选行：第一行状态（全部/待处理/整改中/待验收/已关闭），第二行等级（全部/高/中/低）。
- 列表卡片：左侧等级色块（红/黄/绿），标题 16px，下方状态标签 + 截止日期（逾期为红色）。

### 隐患详情（hazard-detail-page）
- 顶部返回 + 标题 + 保存。
- 表单分组：隐患信息、风险等级、责任人与期限、现场照片。
- 进度时间轴：垂直步骤条，节点分别为“上报 → 指派 → 整改中 → 待验收 → 已关闭”。
- 评论区分组：评论列表 + 底部输入框与发送按钮。

### 安全事项（safety-notes-page）
- 标题“安全事项” + “+”主按钮。
- 列表项带完成开关（Toggle），已完成项标题置灰 + 删除线。
- 优先级标签使用语义色。

### 安全事项详情（safety-note-detail-page）
- 简洁表单：标题、优先级、负责人、截止日期、备注、完成开关。
- 底部保存按钮。

### 应急联系人（contacts-page）
- 标题“应急联系人” + “+”主按钮。
- 搜索框：带搜索图标，背景 `#F8FAFC`。
- 紧急联系人置顶，头像旁红色“急”小标签。
- 右侧电话/短信图标按钮。

### 联系人详情（contact-detail-page）
- 表单：姓名、角色、部门、电话、是否紧急联系人开关。
- 底部保存 + 删除按钮。

### 统计看板（stats-page）
- 标题“统计看板” + 周期选择器（近7天/30天/本季度）。
- 指标卡 2×2：
  - 隐患总数：青绿渐变背景卡，白色大数字。
  - 整改率：天青渐变背景卡。
  - 巡检完成率：蓝紫渐变背景卡。
  - 逾期数：橙红渐变背景卡（逾期>0 时高亮）。
- 趋势图卡片：标题“近7日隐患趋势”，渐变填充折线。
- 状态分布卡片：标题“隐患状态分布”，环形图（青绿/天青/琥珀/红/灰）。
- 高发位置 Top 5：白色卡片列表。

### 我的（profile-page）
- 顶部渐变 Header，头像 + 名称占位 + 角色。
- 菜单列表：设置、关于、导出数据、清除本地数据，每项带右箭头图标。

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

### Important Semantic IDs to Preserve

- 工作台：`home-open-inspections-button`, `home-report-hazard-button`, `home-add-safety-note-button`, `home-open-contacts-button`, `home-recent-activity-list`, `home-pending-tasks-count`
- 巡检：`inspections-add-button`, `inspections-filter-segment`, `inspections-list`
- 巡检详情：`inspection-detail-title-input`, `inspection-detail-checklist`, `inspection-detail-check-normal-button`, `inspection-detail-check-abnormal-button`, `inspection-detail-convert-hazard-button`, `inspection-detail-submit-button`
- 隐患：`hazards-add-button`, `hazards-filter-status`, `hazards-filter-level`, `hazards-list`
- 隐患详情：`hazard-detail-title-input`, `hazard-detail-level-picker`, `hazard-detail-status-picker`, `hazard-detail-progress-tracker`, `hazard-detail-comment-list`, `hazard-detail-comment-input`, `hazard-detail-submit-comment-button`, `hazard-detail-save-button`
- 安全事项：`safety-notes-add-button`, `safety-notes-list`
- 安全事项详情：`safety-note-detail-title-input`, `safety-note-detail-done-toggle`, `safety-note-detail-save-button`
- 联系人：`contacts-add-button`, `contacts-search-input`, `contacts-list`, `contacts-call-button`, `contacts-message-button`
- 联系人详情：`contact-detail-name-input`, `contact-detail-emergency-toggle`, `contact-detail-save-button`
- 统计：`stats-period-picker`, `stats-hazard-total-card`, `stats-closed-rate-card`, `stats-inspection-completion-card`, `stats-overdue-count-card`, `stats-trend-chart`, `stats-status-distribution`, `stats-top-locations-list`
- 我的：`profile-settings-button`, `profile-about-button`, `profile-export-button`, `profile-clear-data-button`

### Event Names to Preserve

`navigate-to-inspections`, `open-hazard-detail-new`, `open-safety-note-detail-new`, `navigate-to-contacts`, `open-inspection-detail-new`, `navigate-back`, `mark-check-normal`, `mark-check-abnormal`, `convert-to-hazard`, `submit-inspection`, `save-hazard`, `delete-hazard`, `submit-comment`, `save-safety-note`, `delete-safety-note`, `save-contact`, `delete-contact`, `call-contact`, `message-contact`, `open-settings`, `open-about`, `export-data`, `clear-local-data`。

## 9. Do's and Don'ts

### Do
- 使用蓝绿色系传递安全感，允许红/黄/绿作为语义色点缀。
- 在 Header 和关键数据卡上使用渐变，避免全 App 单一纯色呆板。
- 卡片使用圆角 18px、柔和阴影、无可见边框。
- 底部 Tab 固定在屏幕底部，宽度受限居中。
- 每个 SVG 图标注入上下文 `<title>`。
- 保持内容区 max-width 在 390-420vp 内居中。

### Don't
- 不要使用全宽铺满的页面布局。
- 不要在侧边放置导航栏。
- 不要使用 emoji 或 Unicode 图标替代 SVG。
- 不要把示例数据写死为应用默认数据。
- 不要改变语义 ID、路由、事件名称。
- 不要在同一张卡片内使用超过 3 种颜色。
- 不要使用纯黑或纯深灰大面积背景。
