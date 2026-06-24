# 平安扣 Pinankou 视觉对齐计划

## 1. Visual Inputs

- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Artifact**: `.arkpilot/designs/DESIGN2.md`
- **HTML Artifacts**:
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-inspection-page.html`
  - `.arkpilot/designs/page-inspection-detail-page.html`
  - `.arkpilot/designs/page-risk-page.html`
  - `.arkpilot/designs/page-risk-detail-page.html`
  - `.arkpilot/designs/page-report-risk-page.html`
  - `.arkpilot/designs/page-emergency-page.html`
  - `.arkpilot/designs/page-profile-page.html`
- **Route-worthy Pages**: home-page, inspection-page, inspection-detail-page, risk-page, risk-detail-page, report-risk-page, emergency-page, profile-page

---

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs

| Surface ID | Page ID | Route | Tab ID | HTML Artifact |
|---|---|---|---|---|
| home | home-page | pages/Home | tab-home | page-home-page.html |
| inspection | inspection-page | pages/Inspection | tab-inspection | page-inspection-page.html |
| inspection-detail | inspection-detail-page | pages/InspectionDetail | — | page-inspection-detail-page.html |
| risk | risk-page | pages/Risk | tab-risk | page-risk-page.html |
| risk-detail | risk-detail-page | pages/RiskDetail | — | page-risk-detail-page.html |
| report-risk | report-risk-page | pages/ReportRisk | — | page-report-risk-page.html |
| emergency | emergency-page | pages/Emergency | tab-emergency | page-emergency-page.html |
| profile | profile-page | pages/Profile | tab-profile | page-profile-page.html |

### Action / Input / Assertion / List IDs

#### 首页（page-home-page.html）
- `home-header-title`：页面标题。
- `home-stat-today-inspection` / `home-stat-pending-risk` / `home-stat-overdue-risk` / `home-stat-closed-rate`：统计指标数值。
- `home-quick-action-report` / `home-quick-action-inspection` / `home-quick-action-contact`：快捷入口。
- `home-chart-risk-distribution`：风险状态分布图容器。
- `home-recent-activity-list`：最近动态列表容器。
- `home-empty-activity`：空状态容器。

#### 巡检页（page-inspection-page.html）
- `inspection-segment-today` / `inspection-segment-pending` / `inspection-segment-history`：分段控制器。
- `inspection-task-list`：巡检任务列表。
- `inspection-empty-task`：空状态。
- `inspection-add-task`：添加任务按钮。
- `inspection-task-start-{id}`：任务卡片开始/继续按钮。

#### 巡检详情页（page-inspection-detail-page.html）
- `inspection-detail-title`：巡检标题。
- `inspection-detail-checklist`：检查项列表。
- `inspection-checkitem-pass-{id}` / `inspection-checkitem-fail-{id}`：检查项状态按钮。
- `inspection-checkitem-note-{id}`：检查项备注输入。
- `inspection-submit-result`：提交结果按钮。

#### 隐患页（page-risk-page.html）
- `risk-filter-all` / `risk-filter-pending` / `risk-filter-inprogress` / `risk-filter-review` / `risk-filter-closed`：筛选标签。
- `risk-add-button`：上报隐患按钮。
- `risk-search-input`：搜索框。
- `risk-list`：隐患列表。
- `risk-empty-list`：空状态。
- `risk-item-{id}`：隐患列表项。

#### 隐患详情页（page-risk-detail-page.html）
- `risk-detail-title`：隐患标题。
- `risk-detail-status`：状态徽章。
- `risk-detail-level`：等级徽章。
- `risk-detail-progress-timeline`：时间线列表。
- `risk-action-assign`：指派整改人。
- `risk-action-remind`：催办。
- `risk-action-submit-fix`：提交整改。
- `risk-action-review-pass` / `risk-action-review-reject`：复核通过/不通过。

#### 上报隐患页（page-report-risk-page.html）
- `report-risk-title-input`：标题输入。
- `report-risk-type-picker`：类型选择器。
- `report-risk-level-picker`：等级选择器。
- `report-risk-location-input`：地点输入。
- `report-risk-desc-input`：描述输入。
- `report-risk-photos`：照片上传区域。
- `report-risk-deadline-picker`：截止日期。
- `report-risk-handler-picker`：整改责任人。
- `report-risk-submit`：提交按钮。

#### 应急页（page-emergency-page.html）
- `emergency-search-input`：搜索框。
- `emergency-add-contact`：添加联系人。
- `emergency-contact-list`：联系人列表。
- `emergency-empty-contact`：空状态。
- `emergency-contact-call-{id}`：拨打按钮。

#### 我的页（page-profile-page.html）
- `profile-avatar`：头像。
- `profile-name`：姓名。
- `profile-role`：职务。
- `profile-setting-export`：导出数据。
- `profile-setting-about`：关于。

### Events Preserved

所有事件名来自 `ui-tree.json`，实现阶段必须原样保留：
`navigate-report-risk`、`navigate-inspection`、`navigate-emergency`、`switch-segment-today`、`switch-segment-pending`、`switch-segment-history`、`start-inspection`、`open-add-inspection-sheet`、`mark-checkitem-pass`、`mark-checkitem-fail`、`submit-inspection-result`、`filter-risk-all`、`filter-risk-pending`、`filter-risk-inprogress`、`filter-risk-review`、`filter-risk-closed`、`open-risk-detail`、`assign-risk-handler`、`remind-risk-handler`、`submit-risk-fix`、`review-risk-pass`、`review-risk-reject`、`submit-report-risk`、`dial-contact`、`open-add-contact-sheet`、`export-data`、`open-about`。

---

## 3. Visual Requirements

### Color Tokens
- 页面背景：`#F3F6F8`
- 卡片背景：`#FFFFFF`
- 主标题：`#0F172A`
- 正文：`#334155`
- 辅助文字：`#64748B`
- 占位符：`#94A3B8`
- 主渐变：`linear-gradient(135deg, #0D9488 0%, #2DD4BF 100%)`
- 主按钮阴影：`0 10px 28px rgba(13,148,136,0.28)`
- 卡片阴影：`0 6px 22px rgba(15,23,42,0.06)`
- 风险/状态色严格按 DESIGN2.md 表格。

### Typography
- 页面大标题：24px / 700 / line-height 1.22 / -0.3px
- 模块标题：18px / 600
- 卡片标题：16px / 600
- 正文：14px / 400 / line-height 1.55
- 辅助说明：12-13px
- 数据指标：32px / 700 / -0.5px
- Tab 标签：11px / 500

### Spacing
- 页面水平边距：16px
- 卡片内边距：16px
- 卡片间距：12px
- 模块间距：24px
- 长页面底部预留 ≥100px（避开 Tab Bar）

### Elevation
- 列表卡片：Level 1
- 统计卡：Level 2
- 主按钮：Level 4
- 中央悬浮“+”按钮：Level 5
- Hero 卡：Level 6
- 底部 Tab Bar：Glass（毛玻璃 + blur 24px）

### Iconography
- 全部使用内联 SVG，禁止 emoji。
- 每个 `<svg>` 首子元素为 `<title>`，语义反映业务动作。
- Tab 图标 24px，列表类型图标 20px，按钮内 18px。

### Components
- **主按钮**：渐变背景、白色文字、14px 圆角、弥散阴影。
- **次要按钮**：`#CCFBF1` 背景、`#0F766E` 文字。
- **卡片**：白色背景、12-20px 圆角、柔和阴影。
- **输入框**：白色背景、1px `#E2E8F0` 边框、12px 圆角、聚焦时青绿色边框+光晕。
- **搜索框**：`#F1F5F9` 背景、999px 圆角、无边界。
- **筛选标签**：未选中 `#F1F5F9` + `#64748B`；选中 `#CCFBF1` + `#0F766E` + `#0D9488` 边框。
- **风险/状态徽章**：11px / 600 / 8px 圆角 / 按语义色。

### Per-Page Polish Notes

#### 首页
- Hero 卡片必须占满内容区宽度，标题左、盾牌图标右。
- 统计指标 2×2 网格，图标颜色按指标语义（青/橙/红/绿）。
- 快捷入口 4 列网格，图标使用不同浅色底/渐变。
- 风险分布图使用柱状图，配色对应状态色。
- 最近动态列表项左侧带颜色圆点。

#### 巡检页
- 顶部分段控制器：今日/待办/历史。
- 任务卡片展示进度条、状态标签、操作按钮。
- 空状态提供创建任务入口。

#### 巡检详情页
- 顶部信息卡展示时间、负责人、状态。
- 检查项卡片：序号圆点 + 标题 + 正常/异常按钮 + 备注输入。
- 异常项自动展开照片上传区。
- 底部固定“提交巡检结果”主按钮。

#### 隐患页
- 搜索框 + 横向滚动筛选标签。
- 隐患卡片：左侧类型图标（按类型配色）+ 标题/编号/地点 + 等级/状态徽章 + 底部责任人/截止日期。
- 逾期截止日期使用橙色高亮。

#### 隐患详情页
- 头部信息卡：编号、标题、等级徽章、状态徽章、负责人、地点、截止日期。
- 问题描述卡片。
- 时间线：左侧节点+连线，右侧内容卡片。
- 底部操作栏：根据当前用户角色显示“催办+提交整改”或“复核通过+不通过”。

#### 上报隐患页
- 表单分三组卡片：基本信息、现场照片、指派信息。
- 照片上传区使用虚线边框占位。
- 底部固定“提交上报”主按钮。

#### 应急页
- 顶部 Hero Banner 强化安全感。
- 搜索框 + 按职责分组的联系人列表。
- 联系人卡片：头像（姓氏）+ 姓名/职务/电话 + 拨打按钮。

#### 我的页
- 顶部渐变个人信息卡。
- 菜单列表分组：数据/设置、关于/帮助。
- 底部版本号。

---

## 4. Non-Negotiable Constraints

1. **不得修改语义 ID、page ID、route、tab ID 或事件名**。如需调整，必须作为变更请求记录。
2. **HTML artifacts 是最终视觉参考**。ArkTS 实现应忠实复现布局、配色、圆角、阴影、字体层级。
3. **`ui-tree.json` 是语义绑定协议**，不是最终布局树。视觉层级、容器嵌套、装饰元素可以自由调整，但语义目标必须正确绑定。
4. **底部 Tab Bar 必须固定于底部**，宽度与 body 一致（max-width: 420px 居中），禁止侧边导航。
5. **内容区禁止在 PC 浏览器全宽拉伸**，最大宽度 420px 并居中。
6. **所有 SVG 必须包含 `<title>`** 作为首子元素，且语义反映业务动作。
7. **禁止使用 emoji 或 Unicode 图标**替代 SVG。
8. **首运行应为空状态**，HTML 中的示例数据仅作视觉展示，不作为默认种子数据。
9. **风险等级和状态必须使用颜色+文字双重提示**，不能仅依赖颜色。
10. **不要在此阶段生成 HarmonyOS 源码或实现计划**。

---

## 5. HTML-to-ArkUI Mapping Notes

- 页面根容器对应 ArkTS `@Entry @Component` 页面。
- `.page` 容器 → `Column()` + `Scroll()`，底部预留 padding 避开 Tab Bar。
- `.tabbar` → 自定义 `BottomTabBar` 组件，固定在底部，毛玻璃效果使用 `backgroundBlurStyle`。
- `.hero` / `.profile-header` / `.emergency-banner` → `Stack` 或 `Row` + 渐变 `LinearGradient`。
- 统计 `.stats-grid` → `Grid()` 2 列。
- 快捷入口 `.quick-grid` → `Grid()` 4 列。
- 列表 `.task-list` / `.risk-list` / `.contact-list` / `.activity-list` → `List()` + `ForEach`。
- 表单卡片 `.form-card` → `Column()` + 圆角+阴影。
- 时间线 `.timeline` → `List()`，左侧使用 `Row` + `Column` 模拟节点与连线。
- 固定底部按钮 → `Stack` 定位或页面内 `Button` 置于 Scroll 外部。
- 所有 `data-ui-id` → ArkUI `.id(...)` 绑定。
- `data-tab-id` → TabBar 子项 ID。

---

## 6. Open Change Requests

- 可选扩展：为首页趋势图容器补充 `home-chart-risk-trend` ID（不强制修改 ui-tree.json）。
- 隐患详情页底部操作栏需根据用户角色动态切换按钮组合（责任人视角 vs 复核人视角），在实现阶段通过状态控制。
