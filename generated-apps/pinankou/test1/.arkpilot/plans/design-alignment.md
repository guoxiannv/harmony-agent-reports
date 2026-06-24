# 平安扣 Pinankou - 设计对齐计划

## 1. 视觉输入

- **语义 UI 协议**: `.arkpilot/designs/ui-tree.json`
- **最终视觉设计**: `.arkpilot/designs/DESIGN2.md`（以 DESIGN1.md 为基础，最终版调整背景层次与首页仪表盘）
- **HTML 设计稿**:
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-safety-items-page.html`
  - `.arkpilot/designs/page-hazards-page.html`
  - `.arkpilot/designs/page-inspections-page.html`
  - `.arkpilot/designs/page-inspection-task-page.html`
  - `.arkpilot/designs/page-emergency-page.html`
  - `.arkpilot/designs/page-stats-page.html`
  - `.arkpilot/designs/page-item-form-sheet.html`
  - `.arkpilot/designs/page-hazard-form-sheet.html`
  - `.arkpilot/designs/page-contact-form-sheet.html`
- **路由级页面列表**:
  | pageId | HTML 文件 |
  |--------|-----------|
  | home-page | page-home-page.html |
  | safety-items-page | page-safety-items-page.html |
  | hazards-page | page-hazards-page.html |
  | inspections-page | page-inspections-page.html |
  | inspection-task-page | page-inspection-task-page.html |
  | emergency-page | page-emergency-page.html |
  | stats-page | page-stats-page.html |
  | item-form-sheet | page-item-form-sheet.html |
  | hazard-form-sheet | page-hazard-form-sheet.html |
  | contact-form-sheet | page-contact-form-sheet.html |

## 2. Semantic UI Binding

### Surface / Route / Tab 映射

| surfaceId | pageId | route | tabId |
|-----------|--------|-------|-------|
| home | home-page | pages/Home | tab-home |
| safetyItems | safety-items-page | pages/SafetyItems | — |
| hazards | hazards-page | pages/Hazards | tab-hazards |
| inspections | inspections-page | pages/Inspections | tab-inspections |
| inspectionTask | inspection-task-page | pages/InspectionTask | — |
| emergency | emergency-page | pages/Emergency | — |
| stats | stats-page | pages/Stats | tab-stats |
| profile | profile-page | pages/Profile | tab-profile |
| itemForm | item-form-sheet | pages/ItemForm | — |
| hazardForm | hazard-form-sheet | pages/HazardForm | — |
| contactForm | contact-form-sheet | pages/ContactForm | — |

### 需要保留为 ArkTS `.id(...)` 的语义目标

#### 首页（home-page）
- 动作：`home-scan-button`, `home-report-button`, `home-safety-items-card`, `home-hazards-card`, `home-inspections-card`, `home-emergency-card`, `home-stats-card`
- 断言：`home-pending-count`, `home-overdue-count`, `home-today-inspection-status`
- 列表：`home-quick-action-list`

#### 安全事项（safety-items-page）
- 动作：`items-back-button`, `items-add-button`
- 输入：`items-filter-status`, `items-filter-priority`, `items-search-input`
- 列表/断言：`items-list`, `items-empty-state`, `items-loading-state`
- 重复项模式：`items-item-{id}`

#### 风险隐患（hazards-page）
- 动作：`hazards-add-button`
- 输入：`hazards-filter-level`, `hazards-filter-status`
- 列表/断言：`hazards-list`, `hazards-empty-state`, `hazards-loading-state`
- 重复项模式：`hazards-item-{id}`

#### 巡检打卡（inspections-page / inspection-task-page）
- 动作：`inspections-add-button`, `inspections-history-button`, `task-back-button`, `task-submit-button`
- 输入：`inspections-filter-status`
- 列表/断言：`inspections-list`, `inspections-empty-state`, `task-checkpoint-list`, `task-progress-bar`
- 重复项模式：`inspections-item-{id}`, `task-checkpoint-{id}`
- 检查点输入：`task-checkpoint-{id}-normal`, `task-checkpoint-{id}-abnormal`, `task-checkpoint-{id}-photo`, `task-checkpoint-{id}-note`

#### 应急联系人（emergency-page）
- 动作：`emergency-add-button`, `emergency-contact-{id}-call`, `emergency-contact-{id}-sms`, `emergency-contact-{id}-edit`
- 列表/断言：`emergency-list`, `emergency-empty-state`
- 重复项模式：`emergency-contact-{id}`

#### 统计看板（stats-page）
- 输入：`stats-period-week`, `stats-period-month`, `stats-period-quarter`
- 断言：`stats-hazard-total`, `stats-pending-count`, `stats-completion-rate`, `stats-inspection-rate`, `stats-overdue-count`, `stats-trend-chart`, `stats-distribution-chart`

#### 表单页
- 事项：`item-form-close`, `item-form-title`, `item-form-category`, `item-form-priority`, `item-form-owner`, `item-form-due-date`, `item-form-note`, `item-form-status`, `item-form-save`, `item-form-delete`
- 隐患：`hazard-form-close`, `hazard-form-title`, `hazard-form-location`, `hazard-form-level`, `hazard-form-description`, `hazard-form-photo`, `hazard-form-reporter`, `hazard-form-status`, `hazard-form-save`, `hazard-form-delete`
- 联系人：`contact-form-close`, `contact-form-name`, `contact-form-role`, `contact-form-phone`, `contact-form-save`, `contact-form-delete`

### 必须保留的事件名

`navigate-back`, `navigate-safety-items`, `navigate-hazards`, `navigate-inspections`, `navigate-emergency`, `navigate-stats`, `navigate-inspection-history`, `open-item-form`, `open-hazard-form`, `open-contact-form`, `open-inspection-task`, `save-item`, `delete-item`, `save-hazard`, `delete-hazard`, `save-contact`, `delete-contact`, `change-status-filter`, `change-priority-filter`, `change-level-filter`, `change-search`, `change-stats-period`, `mark-checkpoint-normal`, `mark-checkpoint-abnormal`, `capture-checkpoint-photo`, `change-checkpoint-note`, `submit-inspection`, `call-contact`, `sms-contact`, `edit-contact`, `capture-hazard-photo`。

## 3. 视觉要求

### 全局
- 页面背景：蓝绿渐变 `linear-gradient(180deg, #E0F2FE 0%, #D1FAE5 32%, #F0FDFA 68%, #F8FAFC 100%)`
- 内容区最大宽度 390px，居中；在更宽屏幕上背景铺满，内容不拉伸。
- 字体：PingFang SC / HarmonyOS Sans SC 为主；数字可用 DIN Alternate / HarmonyOS Sans。
- 主色：天际蓝 `#38BDF8`、薄荷绿 `#34D399`、深湖青 `#0F766E`。
- 状态色：高风险红 `#EF4444`、中风险橙 `#F59E0B`、低风险蓝 `#3B82F6`、完成绿 `#10B981`。

### 组件
- 卡片：白色毛玻璃 `rgba(255,255,255,0.88)` + `backdrop-filter: blur(24px)`，圆角 22px，内高光 + 弥散阴影。
- 主按钮：蓝绿渐变，圆角 16px，强阴影。
- 底部 Tab 栏：固定底部，宽度限制 390px 居中，选中态胶囊背景 + 光晕。
- FAB：右下角，58px 圆形渐变按钮，强阴影。
- 状态 chip：全 pill，根据语义使用微渐变背景。

### 各页要点
- **home-page**：顶部玻璃 Header、横向滚动仪表盘（3 张卡片）、2×3 快捷入口网格、最近动态卡片、底部 Tab。
- **safety-items-page**：返回 + 标题 + 新增、状态/优先级筛选胶囊、搜索框、事项卡片（左侧优先级色条，逾期加红竖线）、右下角 FAB。
- **hazards-page**：标题 + 风险等级/状态筛选、隐患卡片（标题、位置、等级徽章、进度条、状态 chip）、右下角 FAB。
- **inspections-page**：返回 + 标题 + 历史记录、渐变 CTA 卡片、任务列表（环形进度 + 状态 chip）。
- **inspection-task-page**：返回 + 任务标题、进度面板、检查点卡片（正常/异常切换、备注、拍照）、底部固定提交栏。
- **emergency-page**：返回 + 标题 + 新增、提示横幅、联系人卡片（头像、首选徽章、电话/短信/编辑按钮）。
- **stats-page**：周期切换胶囊、2×3 指标卡片、柱状趋势图、环形分布图 + 图例。
- **item/hazard/contact-form-sheet**：底部 Sheet，顶部拖拽条、分组表单、保存/删除按钮。

### HTML 到 ArkUI 映射说明
- HTML 中 `.dashboard` 横向滚动对应 ArkUI `List` + `ListItem` 横向模式，或 `Scroll` + `Row`。
- `.quick-grid` 2 列网格对应 ArkUI `Grid` 或 `Flex` `wrap`。
- `.metrics-grid` 2 列网格同上。
- 表单 Sheet 在 ArkUI 中可用 `bindSheet` 或独立页面 `pages/ItemForm` 实现；视觉参考 HTML 的大圆角和底部固定按钮。
- 统计图表可使用 HarmonyOS 图表库或自定义 `Canvas`/`Shape`；若库不可用，先以数字卡片 + 简单 SVG/Canvas 条形图/环形图实现。

## 4. 不可协商约束

- **严禁修改语义 ID**：所有 `data-ui-id` 必须原样映射到 ArkTS 控件的 `.id(...)`。
- **严禁修改 pageId / route / tabId / event name**。
- **HTML 是最终视觉参考**：颜色、圆角、阴影、间距、布局比例必须忠实还原。
- **ui-tree.json 是语义协议，不是布局树**：实现时可以自由组织 ArkUI 容器（Row/Column/Stack/Grid），只要语义目标绑定正确。
- **底部 Tab 必须在底部，且宽度限制居中**：禁止在 PC/宽屏上全宽拉伸，禁止侧边 Tab 栏。
- **SVG 图标必须带业务语义 title**：实现时若使用本地 SVG，保留或注入对应 title。
- **不要引入未在 spec/HTML 中出现的新行为或数据模型**：例如登录注册、云端同步、消息推送、AI 识别等均不属于本阶段。
- **首屏关键内容在顶部 600vp 内可见**：首页 Header + 仪表盘应置于首屏。

## 5. 语义变更请求

无。
