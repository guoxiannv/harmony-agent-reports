# 平安扣 Pinankou — 设计对齐计划

## 1. Visual Inputs

- **Semantic UI protocol**: `.arkpilot/designs/ui-tree.json`
- **Final design artifact**: `.arkpilot/designs/DESIGN2.md`
- **HTML artifacts**: 每个 route-worthy surface 对应一个 HTML 文件
  - `page-home-page.html`
  - `page-inspections-page.html`
  - `page-inspection-detail-page.html`
  - `page-hazards-page.html`
  - `page-hazard-detail-page.html`
  - `page-safety-notes-page.html`
  - `page-safety-note-detail-page.html`
  - `page-contacts-page.html`
  - `page-contact-detail-page.html`
  - `page-stats-page.html`
  - `page-profile-page.html`
- **Route-worthy page list**: home-page, inspections-page, inspection-detail-page, hazards-page, hazard-detail-page, safety-notes-page, safety-note-detail-page, contacts-page, contact-detail-page, stats-page, profile-page

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs

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

### Action / Input / Assertion / List IDs to Preserve in ArkTS `.id(...)`

- **home-page**: `home-header-title`, `home-summary-card`, `home-pending-tasks-count`, `home-open-inspections-button`, `home-report-hazard-button`, `home-add-safety-note-button`, `home-open-contacts-button`, `home-recent-activity-list` (items: `home-activity-{id}`), `home-empty-activity`
- **inspections-page**: `inspections-title`, `inspections-add-button`, `inspections-filter-segment`, `inspections-list` (items: `inspection-{id}`), `inspections-empty-state`, `inspections-total-count`
- **inspection-detail-page**: `inspection-detail-back-button`, `inspection-detail-title-input`, `inspection-detail-location-input`, `inspection-detail-date-picker`, `inspection-detail-checklist` (items: `inspection-check-{id}`), `inspection-detail-check-normal-button`, `inspection-detail-check-abnormal-button`, `inspection-detail-convert-hazard-button`, `inspection-detail-submit-button`, `inspection-detail-delete-button`
- **hazards-page**: `hazards-title`, `hazards-add-button`, `hazards-filter-status`, `hazards-filter-level`, `hazards-list` (items: `hazard-{id}`), `hazards-empty-state`, `hazards-total-count`
- **hazard-detail-page**: `hazard-detail-back-button`, `hazard-detail-title-input`, `hazard-detail-location-input`, `hazard-detail-level-picker`, `hazard-detail-status-picker`, `hazard-detail-description-input`, `hazard-detail-photo-uploader`, `hazard-detail-assignee-input`, `hazard-detail-deadline-picker`, `hazard-detail-progress-tracker`, `hazard-detail-comment-list` (items: `hazard-comment-{id}`), `hazard-detail-comment-input`, `hazard-detail-submit-comment-button`, `hazard-detail-save-button`, `hazard-detail-delete-button`
- **safety-notes-page**: `safety-notes-title`, `safety-notes-add-button`, `safety-notes-list` (items: `safety-note-{id}`), `safety-notes-empty-state`, `safety-notes-completed-count`
- **safety-note-detail-page**: `safety-note-detail-back-button`, `safety-note-detail-title-input`, `safety-note-detail-priority-picker`, `safety-note-detail-assignee-input`, `safety-note-detail-deadline-picker`, `safety-note-detail-description-input`, `safety-note-detail-done-toggle`, `safety-note-detail-save-button`, `safety-note-detail-delete-button`
- **contacts-page**: `contacts-title`, `contacts-add-button`, `contacts-search-input`, `contacts-list` (items: `contact-{id}`), `contacts-empty-state`, `contacts-call-button`, `contacts-message-button`
- **contact-detail-page**: `contact-detail-back-button`, `contact-detail-name-input`, `contact-detail-role-input`, `contact-detail-department-input`, `contact-detail-phone-input`, `contact-detail-emergency-toggle`, `contact-detail-save-button`, `contact-detail-delete-button`
- **stats-page**: `stats-title`, `stats-period-picker`, `stats-hazard-total-card`, `stats-closed-rate-card`, `stats-inspection-completion-card`, `stats-overdue-count-card`, `stats-trend-chart`, `stats-status-distribution`, `stats-top-locations-list` (items: `stats-location-{id}`), `stats-empty-locations`
- **profile-page**: `profile-title`, `profile-settings-button`, `profile-about-button`, `profile-export-button`, `profile-clear-data-button`

### Tab IDs

`tab-home`, `tab-inspections`, `tab-hazards`, `tab-stats`, `tab-profile`

### Event Names to Preserve

`navigate-to-inspections`, `open-hazard-detail-new`, `open-safety-note-detail-new`, `navigate-to-contacts`, `open-inspection-detail-new`, `navigate-back`, `mark-check-normal`, `mark-check-abnormal`, `convert-to-hazard`, `submit-inspection`, `delete-inspection`, `save-hazard`, `delete-hazard`, `submit-comment`, `save-safety-note`, `delete-safety-note`, `open-contact-detail-new`, `save-contact`, `delete-contact`, `call-contact`, `message-contact`, `open-settings`, `open-about`, `export-data`, `clear-local-data`

### Repeated Item Strategies

- 工作台最近动态：`home-activity-{id}`
- 巡检列表：`inspection-{id}`
- 巡检检查项：`inspection-check-{id}`
- 隐患列表：`hazard-{id}`
- 隐患评论：`hazard-comment-{id}`
- 安全事项列表：`safety-note-{id}`
- 联系人列表：`contact-{id}`
- 统计高发位置：`stats-location-{id}`

### Empty / Loading / Error State IDs

- `home-empty-activity`
- `inspections-empty-state`
- `hazards-empty-state`
- `safety-notes-empty-state`
- `contacts-empty-state`
- `hazard-empty-comments`
- `stats-empty-locations`

## 3. Visual Requirements

### Color Tokens

- 页面背景：`#F0FDFA`
- 卡片/表单背景：`#FFFFFF`
- 主品牌色：`#0D9488`
- 高亮色：`#14B8A6`
- 天青辅助色：`#06B6D4`
- 语义色：高/逾期 `#EF4444`，中/警告 `#F59E0B`，低/完成 `#10B981`，信息 `#0EA5E9`
- 中性色：正文 `#334155`，标题 `#0F172A`，次级文字 `#64748B`，占位 `#94A3B8`，边框 `#E2E8F0`，输入背景 `#F8FAFC`
- 渐变：
  - 主按钮：`linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)`
  - Hero Header：`linear-gradient(135deg, #0D9488 0%, #06B6D4 100%)`
- 阴影：
  - 卡片：`0 6px 24px rgba(13, 148, 136, 0.10)`
  - 主按钮：`0 4px 14px rgba(13, 148, 136, 0.30)`
  - Tab 栏：`0 -4px 20px rgba(15, 23, 42, 0.06)`

### Spacing

- 页面水平内边距：16px
- 卡片内边距：16px
- 卡片间距：12px
- 区块间距：24px
- 底部安全边距：88vp

### Typography

- 页面大标题：22px / 700
- 页面标题：18px / 600
- 卡片标题：16px / 600
- 正文：14px / 400
- 辅助/时间：12px / 400
- 标签：11px / 600

### Components

- **按钮**：主按钮 14px 圆角，渐变背景，白色文字；次按钮 `#F1F5F9` 背景；危险按钮 `#FEF2F2` 背景红色文字。
- **卡片**：圆角 18px，白色背景，青色调柔和阴影，无边框。
- **输入框**：圆角 12px，`#F8FAFC` 背景，`#E2E8F0` 边框，focus 时品牌色边框 + 光晕。
- **标签**：圆角 10px，padding 5px 10px，11px weight 600，使用语义色背景/文字。
- **Tab 栏**：底部固定，毛玻璃背景，选中项上方 3px 品牌色 indicator。
- **进度条**：高度 6px，圆角 3px，品牌渐变填充。
- **时间轴**：垂直步骤条，当前节点实心带光晕，已完成节点品牌色描边，待办节点灰色描边。
- **开关（Toggle）**：高度 28px，关闭时 `#E2E8F0`，开启时 `#0D9488`。

### Imagery / Icons

- 全部使用 SVG 线性图标，2px 描边，圆角端点。
- 每个 SVG 必须包含上下文 `<title>`。
- 图标颜色默认 `#64748B`，激活态 `#0D9488`。
- 快捷入口图标容器使用不同渐变背景。

### Per-Page Polish Notes

- **home-page**: Hero Header 渐变 + 毛玻璃摘要卡；快捷入口 2×2 网格；最近动态带色点。
- **inspections-page**: 分段器胶囊；列表卡片左侧颜色竖条表示状态；进度条显示完成比例。
- **inspection-detail-page**: 检查项卡片，异常项背景变红并显示“转为隐患”；底部悬浮提交按钮。
- **hazards-page**: 双行筛选；列表卡片左侧等级色条；逾期日期红色强调。
- **hazard-detail-page**: 表单 + 进度时间轴 + 评论区；评论输入栏固定在底部。
- **safety-notes-page**: 列表项带完成 Toggle；已完成项置灰删除线。
- **safety-note-detail-page**: 简洁表单；完成开关。
- **contacts-page**: 搜索框；紧急联系人置顶带红色“急”标签；右侧电话/短信按钮。
- **contact-detail-page**: 表单；是否紧急联系人开关。
- **stats-page**: 2×2 渐变指标卡；趋势折线图（渐变填充）；环形图 + 图例；Top 5 横向条形图。
- **profile-page**: 渐变 Header + 头像/用户信息；菜单列表带图标和右箭头。

### Responsive / Target Device Constraints

- 目标设备：1272vp × 2756vp 普通手机，3x 像素密度。
- 内容区 max-width 390-420vp，居中，禁止全宽铺满。
- Tab 栏固定在底部，宽度限制与 body 一致：`max-width: 390px; left:0; right:0; margin:0 auto;`。
- 严禁侧边导航。
- 首屏关键内容（Header + 核心卡片）在 600vp 内可见。
- 页面主内容底部预留 88vp 安全边距，避免 Tab 遮挡。

### HTML-to-ArkUI Mapping Notes

- HTML 中的 `.card` 对应 ArkUI `Column` + `borderRadius(18)` + `backgroundColor('#FFFFFF')` + `shadow(...)`。
- `.header` 渐变对应 `linearGradient` 或 `Image` 背景。
- `.tab-bar` 对应 `Tabs` 组件的 `barPosition: BarPosition.End`；每个 `.tab-item` 对应 `TabContent`。
- 列表页 `.list` / `.card` 对应 `List` + `ListItem`。
- 表单 `.field` 对应 `Column` 包裹 `Text`（label）+ `TextInput`/`TextArea`/`DatePicker`/`Select`。
- 进度时间轴使用 `Column` + `Circle` / `Line` 自定义绘制，或 `Stepper` 简化实现。
- 统计图表在 ArkTS 中可使用 `Canvas` 自定义绘制折线/环形，或引入图表库；HTML 仅作视觉参考。
- SVG 图标在 ArkUI 中使用 `Image($r('app.media.icon_name')).fillColor(...)` 或 `SymbolGlyph`。

## 4. Non-Negotiable Constraints

- **Do not** rename semantic IDs, page IDs, routes, tab IDs, or action event names silently.
- **Do** treat HTML artifacts as the final visual reference.
- **Do** treat `ui-tree.json` as a semantic binding protocol, not a final layout tree.
- **Do** follow the HTML/design-alignment artifacts for final ArkTS page/component structure, while binding semantic IDs to the correct interactive and assertion targets.
- **Do not** add feature behavior, data model changes, or scaffold assumptions unless recorded as change requests.
- **Do not** use emoji or pictographic Unicode as UI icons.
- **Do** ensure every inline SVG has a contextual `<title>` tag.
- **Do not** seed default app data with HTML sample data; the app first-run state must be empty.
- **Do** keep bottom Tab navigation; no side navigation.
- **Do** enforce content max-width 390-420vp and centered layout.

## 5. Semantic Change Requests

- 语义协议中 `hazard-detail-photo-uploader` 作为整组上传控件根 ID；实现时可拆分为内部“添加照片”按钮与缩略图列表，但对外保持该根 ID 可定位。
- 统计页面 `stats-trend-chart` 与 `stats-status-distribution` 在 ArkTS 中建议用 Canvas 自定义实现；HTML 提供静态视觉参考。
