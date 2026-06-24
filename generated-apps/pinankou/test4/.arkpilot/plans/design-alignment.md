# 平安扣 Pinankou 设计对齐计划

## 1. 视觉输入

| 文件 | 路径 |
|------|------|
| 产品规格 | `.arkpilot/autopilot/spec.md` |
| 语义 UI 协议 | `.arkpilot/designs/ui-tree.json` |
| 最终视觉设计 | `.arkpilot/designs/DESIGN2.md` |
| 首页 | `.arkpilot/designs/page-home.html` |
| 巡检页 | `.arkpilot/designs/page-patrol.html` |
| 隐患页 | `.arkpilot/designs/page-issues.html` |
| 隐患详情 | `.arkpilot/designs/page-issue-detail.html` |
| 隐患表单 | `.arkpilot/designs/page-issue-form.html` |
| 巡检打卡弹窗 | `.arkpilot/designs/page-patrol-checkin.html` |
| 联系人页 | `.arkpilot/designs/page-contacts.html` |
| 联系人表单 | `.arkpilot/designs/page-contact-form.html` |
| 统计页 | `.arkpilot/designs/page-stats.html` |

Route-worthy 页面清单：

- `home` → `pages/Home`
- `patrol` → `pages/Patrol`
- `issues` → `pages/Issues`
- `issue-detail` → `pages/IssueDetail`
- `issue-form` → `pages/IssueForm`
- `contacts` → `pages/Contacts`
- `contact-form` → `pages/ContactForm`
- `stats` → `pages/Stats`

`patrol-checkin` 为弹窗/底部表单，非独立路由页面，但在 ui-tree.json 中作为 dialog surface 定义。

## 2. Semantic UI Binding

### 2.1 Surface / Route / Tab 映射

| Surface ID | Page ID | ArkTS Route | Tab ID |
|------------|---------|-------------|--------|
| home-page | home | pages/Home | tab-home |
| patrol-page | patrol | pages/Patrol | tab-patrol |
| issues-page | issues | pages/Issues | tab-issues |
| issue-form-page | issue-form | pages/IssueForm | — |
| issue-detail-page | issue-detail | pages/IssueDetail | — |
| contacts-page | contacts | pages/Contacts | tab-contacts |
| contact-form-page | contact-form | pages/ContactForm | — |
| stats-page | stats | pages/Stats | tab-stats |

### 2.2 必须在 ArkTS `.id(...)` 中保留的语义目标

#### 首页（Home）

- `home-header-title`：Header 标题 Text。
- `home-notification-button`：通知按钮 Button。
- `home-today-patrol-progress`：巡检进度 KPI 数值 Text。
- `home-pending-issues-count`：待处理隐患 KPI 数值 Text。
- `home-resolved-this-week-count`：本周已整改 KPI 数值 Text。
- `home-quick-report-button`：上报隐患快捷按钮 Button。
- `home-quick-patrol-button`：开始巡检快捷按钮 Button。
- `home-quick-contact-button`：应急联系快捷按钮 Button。
- `home-recent-issues-list`：最近动态 List，子项使用 `home-recent-issue-{id}`。
- `home-view-all-issues-link`：查看全部隐患 Text/Link。
- `home-tabbar`：底部 Tab 导航容器。

#### 巡检页（Patrol）

- `patrol-header-title`：页面标题。
- `patrol-date-label`：日期文本。
- `patrol-progress-ring`：环形进度图（Progress/Canvas 容器）。
- `patrol-route-name`：巡检路线名称。
- `patrol-point-list`：点位 List，子项使用 `patrol-point-{id}`。
- `patrol-point-{id}-checkin-button`：打卡按钮。
- `patrol-point-{id}-report-issue-link`：报隐患链接。
- `patrol-checkin-modal`：打卡确认弹窗/底部面板。
- `patrol-checkin-photo-button`：拍照按钮。
- `patrol-checkin-notes-input`：备注输入框。
- `patrol-checkin-abnormal-toggle`：异常开关。
- `patrol-checkin-submit-button`：确认打卡按钮。
- `patrol-checkin-cancel-button`：取消按钮。

#### 隐患页（Issues）

- `issues-header-title`：页面标题。
- `issues-search-input`：搜索输入框。
- `issues-filter-status`：状态筛选器（Row/List）。
- `issues-filter-risk`：风险等级筛选器（Row/List）。
- `issues-add-button`：新建按钮。
- `issues-list`：隐患列表，子项使用 `issues-item-{id}`。
- `issues-item-{id}-row`：列表项可点击行。
- `issues-item-{id}-status-label`：状态标签。

#### 隐患详情（IssueDetail）

- `issue-detail-title`：隐患标题。
- `issue-detail-status-badge`：状态徽章。
- `issue-detail-risk-badge`：风险徽章。
- `issue-detail-location`：位置信息。
- `issue-detail-assignee`：负责人信息。
- `issue-detail-due-date`：截止日期。
- `issue-detail-description`：问题描述。
- `issue-detail-photo-list`：照片网格，子项使用 `issue-detail-photo-{index}`。
- `issue-detail-timeline-list`：进度时间线，子项使用 `issue-detail-timeline-{index}`。
- `issue-detail-progress-action-button`：更新进度按钮。
- `issue-detail-edit-button`：编辑按钮。
- `issue-detail-close-button`：关闭按钮。

#### 隐患表单（IssueForm）

- `issue-form-title-input`：标题输入。
- `issue-form-type-picker`：类型选择器。
- `issue-form-risk-picker`：风险等级选择器。
- `issue-form-location-input`：位置输入。
- `issue-form-assignee-input`：负责人输入。
- `issue-form-due-date-picker`：截止日期选择器。
- `issue-form-description-input`：描述输入。
- `issue-form-photo-grid`：照片网格，子项使用 `issue-form-photo-{index}`。
- `issue-form-add-photo-button`：添加照片按钮。
- `issue-form-submit-button`：提交按钮。
- `issue-form-cancel-button`：取消按钮。

#### 联系人页（Contacts）

- `contacts-header-title`：页面标题。
- `contacts-search-input`：搜索输入框。
- `contacts-add-button`：添加联系人按钮。
- `contacts-group-list`：分组标签列表，子项使用 `contacts-group-{id}`。
- `contacts-list`：联系人列表，子项使用 `contacts-item-{id}`。
- `contacts-item-{id}-call-button`：呼叫按钮。
- `contacts-item-{id}-edit-button`：编辑按钮。

#### 联系人表单（ContactForm）

- `contact-form-name-input`：姓名输入。
- `contact-form-role-input`：角色输入。
- `contact-form-group-picker`：分组选择器。
- `contact-form-phone-input`：电话输入。
- `contact-form-priority-toggle`：紧急联系人开关。
- `contact-form-save-button`：保存按钮。
- `contact-form-cancel-button`：取消按钮。

#### 统计页（Stats）

- `stats-header-title`：页面标题。
- `stats-period-picker`：周期选择器。
- `stats-kpi-issues`：隐患总数 KPI。
- `stats-kpi-resolved`：已整改 KPI。
- `stats-kpi-completion`：整改完成率 KPI。
- `stats-kpi-patrol`：巡检完成率 KPI。
- `stats-trend-chart`：趋势图容器。
- `stats-risk-chart`：风险分布图容器。
- `stats-export-button`：导出报告按钮。

### 2.3 事件名（必须在 ArkTS 控件上触发）

- `open-notifications`
- `navigate-issue-form`
- `navigate-patrol`
- `navigate-contacts`
- `navigate-issues`
- `open-checkin`
- `navigate-issue-form-with-point`
- `take-photo`
- `submit-checkin`
- `cancel-checkin`
- `open-issue-detail`
- `submit-issue`
- `cancel-issue-form`
- `update-progress`
- `edit-issue`
- `close-issue`
- `call-contact`
- `edit-contact`
- `navigate-contact-form`
- `save-contact`
- `cancel-contact-form`
- `export-report`

### 2.4 列表与空状态策略

| 列表 | itemIdPattern | 空状态 ID |
|------|---------------|-----------|
| home-recent-issues-list | home-recent-issue-{id} | home-recent-empty |
| patrol-point-list | patrol-point-{id} | patrol-empty |
| issues-list | issues-item-{id} | issues-empty |
| issue-detail-photo-list | issue-detail-photo-{index} | issue-detail-photo-empty |
| issue-detail-timeline-list | issue-detail-timeline-{index} | — |
| issue-form-photo-grid | issue-form-photo-{index} | issue-form-photo-empty |
| contacts-group-list | contacts-group-{id} | — |
| contacts-list | contacts-item-{id} | contacts-empty |

## 3. 视觉要求

### 3.1 颜色 Tokens（必须一致）

- 品牌主色：`#0D9488`
- 品牌亮色：`#14B8A6`
- 品牌薄荷：`#5EEAD4`
- 品牌深色：`#115E59`
- 页面背景：`#F0FDFA`
- 卡片背景：`#FFFFFF`
- 次要背景：`#F8FAFC`
- 边框/分割线：`#E2E8F0`
- 主文字：`#0F172A`
- 次文字：`#475569`
- 弱文字：`#94A3B8`
- 安全色：`#059669` / 背景 `#D1FAE5`
- 警告色：`#B45309` / 背景 `#FEF3C7`
- 危险色：`#DC2626` / 背景 `#FEE2E2`
- 重大色：`#991B1B` / 背景 `#FECACA`

### 3.2 字体

- 默认字体栈：`HarmonyOS Sans SC`、`PingFang SC`、`Microsoft YaHei`、sans-serif
- H1：22px / weight 700
- H2：18px / weight 600
- H3：16px / weight 600
- Body：14px / weight 400
- Caption：12px / weight 400
- Micro：10px / weight 600

### 3.3 间距与圆角

- 页面水平内边距：16vp
- 卡片内边距：16vp
- 卡片圆角：14-20vp（KPI 20vp，列表项 14-16vp）
- 按钮圆角：9999vp（Pill）
- 按钮高度：主按钮 48vp，次按钮 40-46vp
- 列表项间距：10-12vp
- Tab 导航高度：68vp（含底部安全区）

### 3.4 阴影与光晕

- 卡片阴影：`0 4px 14px -3px rgba(13,148,136,0.13)`
- 底部导航阴影：`0 12px 32px -10px rgba(13,148,136,0.20)`
- 品牌光晕：`0 0 18px rgba(94,234,212,0.48)`（Tab 选中态）

### 3.5 底部 Tab 导航

- 必须使用底部导航，5 个 Tab：首页、巡检、隐患、联系人、统计。
- 背景为毛玻璃：`rgba(255,255,255,0.85)` + `backdrop-filter: blur(24px) saturate(160%)`。
- 选中图标背景为品牌渐变圆角矩形（非正圆），带光晕。
- 固定定位宽度限制为 `max-width: 420px`，水平居中，禁止全宽铺满。

### 3.6 图标

- 所有图标使用 SVG。
- 每个内联 SVG 第一个子元素必须是 contextual `<title>`。
- 禁止使用 emoji 或 Unicode 图标。

### 3.7 每页视觉重点

| 页面 | 重点 |
|------|------|
| 首页 | Hero 区装饰渐变圆、3 个 KPI 卡片、3 个快捷 Pill 按钮、最近动态列表 |
| 巡检 | 环形进度图、点位状态区分（已完成/当前/未开始）、打卡按钮 |
| 隐患 | 搜索框、Pill 筛选、悬浮「+」按钮、列表左侧色条 |
| 隐患详情 | 渐变 Hero、信息网格、照片网格、时间线、底部操作栏 |
| 隐患表单 | 分组表单、照片添加区、底部双按钮 |
| 巡检打卡 | 底部 Sheet、异常开关、拍照按钮 |
| 联系人 | 搜索、分组标签、头像、圆形呼叫按钮 |
| 联系人表单 | 表单字段、紧急联系人开关 |
| 统计 | 分段控制器、2×2 KPI 网格、趋势折线图、风险分布条形图 |

## 4. HTML-to-ArkUI 映射说明

| HTML 元素/模式 | ArkUI 建议 |
|---------------|-----------|
| `.header` 毛玻璃 | `Row` + `Stack` + `backdropBlur` / `backgroundBlurStyle` |
| `.kpi-grid` | `GridRow` / `Row` + `Column` |
| `.kpi-card` | `Column` + 渐变背景 + 圆角 + 阴影 |
| `.list-item` / `.issue-card` | `ListItem` + `Row` + 左侧装饰 `Divider` |
| `.badge` | `Text` + 圆角背景 |
| `.quick-btn` / `.btn-primary` | `Button` + 渐变背景 |
| `.tabbar` | `Tabs` + `TabContent` 或自定义底部 `Row` |
| `.progress-ring` | `Progress` 类型 `ProgressType.Ring` 或自定义 `Canvas` |
| `.chart-card svg` | `Canvas` 或自定义 `Shape` 绘制 |
| `.sheet` | `Sheet` 组件或底部 `Panel` |
| `.toggle-row` | `Toggle` 组件 |

## 5. 不可协商约束

1. **语义 ID 不变**：不得重命名 ui-tree.json 中的 `id`、`pageId`、`route`、`tabId`、事件名。
2. **页面结构以 HTML 为准**：HTML 是最终视觉参考，ArkTS 实现应还原布局、配色、圆角、阴影、图标。
3. **底部 Tab**：必须位于底部，宽度限制在 420vp 内居中，禁止侧边导航。
4. **首屏可见**：首页 Header + 核心卡片必须在 600vp 内可见。
5. **SVG 语义**：每个内联 SVG 必须有 contextual `<title>`。
6. **无 emoji/Unicode 图标**。
7. **空状态**：首运行各列表为空，必须实现空状态 UI；HTML 中的示例数据仅为视觉参考。
8. **不引入新功能**：仅实现 spec.md 与 ui-tree.json 中定义的行为；新增功能需作为变更请求记录。

## 6. 变更请求

当前无变更请求。

## 7. 验证建议

1. 使用 DevEco MCP `CheckArktsFiles` 对实现的 ArkTS 文件进行静态检查。
2. 使用 DevEco MCP `build_project` 完成编译构建。
3. QA 阶段使用 `start_app`、`get_app_ui_tree`、`perform_ui_action` 验证各页面语义目标与交互。
4. 检查首屏 600vp 可见性、底部 Tab 宽度约束、所有 SVG title 标签。
