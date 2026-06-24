# 平安扣 Pinankou 视觉设计系统

## 1. Visual Theme & Atmosphere

平安扣的视觉基调以“安全感”为核心：稳定、清晰、可信赖。整体采用蓝绿色系，传递冷静、专业、环保与秩序；避免高饱和警示色带来的压迫感，但在风险等级与逾期状态上保留明确的语义色彩。界面强调信息层级，通过足够的留白、柔和的卡片和毛玻璃质感，让一线安全员在户外或车间环境下也能快速扫读。

设计语言借鉴 Apple 的克制与层级：
- 大标题紧凑有力，正文舒展易读；
- 背景以浅灰白为主，关键数据卡片使用白色悬浮于浅灰底上；
- 主行动按钮使用蓝绿色渐变，营造安全、可靠的行动召唤；
- 底部 Tab 导航固定，图标简洁、选中态高亮；
- 状态颜色（风险等级、逾期、完成）严格遵循语义，不混用装饰色。

**Key Characteristics:**
- 主背景：`#F6F8FA` 微冷浅灰，营造干净、专业的工业感。
- 卡片背景：纯白 `#FFFFFF`，配合柔和投影形成层级。
- 主色调：蓝绿色渐变，从 `#0EA5E9` 到 `#10B981`，象征安全与信任。
- 强调色：深蓝 `#0284C7` 用于文字链接和选中态。
- 风险语义色：低 `#22C55E`、中 `#F59E0B`、高 `#EF4444`、重大 `#B91C1C`。
- 状态色：逾期 `#F97316`、完成 `#10B981`、进行中 `#0EA5E9`、待处理 `#64748B`。
- 圆角体系：卡片 16px、按钮 12px、输入框 10px、小标签 8px、全胶囊 999px。
- 阴影：卡片使用 `0 4px 20px rgba(15, 23, 42, 0.06)`，悬浮按钮使用更强的弥散阴影。
- 图标：线性 SVG，2px 描边，统一 24px 视口；语义 title 必须完整。

---

## 2. Color Palette & Roles

### Primary
- **深蓝绿** `#0B6E7A`：品牌主色，用于 AppBar 标题、重要图标、选中态。
- **亮蓝绿** `#10B981`：正向完成态、成功提示。
- **天蓝** `#0EA5E9`：辅助行动色、信息提示、图表主色。

### Gradient
- **主渐变**：`linear-gradient(135deg, #0EA5E9 0%, #10B981 100%)` —— 用于首页 Hero 卡片、主 CTA 按钮背景。
- **玻璃拟态渐变**：`linear-gradient(180deg, rgba(255,255,255,0.85) 0%, rgba(255,255,255,0.55) 100%)` —— 用于 Tab Bar 和悬浮面板背景，配合 `backdrop-filter: blur(20px)`。

### Functional
- **主行动按钮背景**：`linear-gradient(135deg, #0EA5E9, #10B981)`，文字 `#FFFFFF`。
- **次要按钮背景**：`#E0F2FE`（极浅蓝），文字 `#0284C7`。
- **危险/删除**：`#EF4444` 背景或文字。
- **禁用态**：背景 `#E2E8F0`，文字 `#94A3B8`。

### Text
- **主标题**：`#0F172A`（接近黑色，带冷调）。
- **正文**：`#334155`。
- **次要说明**：`#64748B`。
- **占位符**：`#94A3B8`。
- **反白文字**：`#FFFFFF` 用于渐变按钮和深色卡片。

### Surface
- **页面背景**：`#F6F8FA`。
- **卡片背景**：`#FFFFFF`。
- **浅蓝灰背景**：`#F0F9FF` 用于选中项、标签背景。
- **分隔线**：`#E2E8F0`，1px。

### Risk Levels
| 等级 | 颜色 | 背景浅底 | 使用场景 |
|---|---|---|---|
| 低 | `#22C55E` | `#DCFCE7` | 风险徽章、低风险条 |
| 中 | `#F59E0B` | `#FEF3C7` | 风险徽章、中风险条 |
| 高 | `#EF4444` | `#FEE2E2` | 风险徽章、高风险条 |
| 重大 | `#B91C1C` | `#FECACA` | 风险徽章、重大风险条 |

### Status
| 状态 | 颜色 | 说明 |
|---|---|---|
| 待整改 | `#64748B` | 灰色，未开始 |
| 整改中 | `#0EA5E9` | 蓝色，进行中 |
| 待复核 | `#F59E0B` | 琥珀色，等待复核 |
| 已关闭 | `#10B981` | 绿色，闭环完成 |
| 逾期 | `#F97316` | 橙色，超期未处理 |

### Shadows
- **卡片阴影**：`0 4px 20px rgba(15, 23, 42, 0.06)`。
- **悬浮按钮阴影**：`0 8px 24px rgba(14, 165, 233, 0.32)`。
- **底部 Tab 阴影**：`0 -2px 12px rgba(15, 23, 42, 0.04)`。
- **强投影（Hero 卡片）**：`0 12px 40px rgba(14, 165, 233, 0.18)`。

---

## 3. Typography Rules

### Font Family
- **中文**：`PingFang SC`、`Microsoft YaHei`、`Helvetica Neue`、`Arial`、`sans-serif`。
- **英文/数字**：`SF Pro Display`（大标题）、`SF Pro Text`（正文），fallback 到 `Helvetica Neue`、`Arial`。

### Hierarchy

| 角色 | 字号 | 字重 | 行高 | 字间距 | 颜色 |
|---|---|---|---|---|---|
| 页面大标题 | 24px | 700 | 1.20 | -0.3px | `#0F172A` |
| 模块标题 | 18px | 600 | 1.30 | -0.2px | `#0F172A` |
| 卡片标题 | 16px | 600 | 1.35 | 0 | `#0F172A` |
| 正文 | 14px | 400 | 1.50 | 0 | `#334155` |
| 辅助说明 | 12px | 400 | 1.45 | 0 | `#64748B` |
| 数据指标 | 32px | 700 | 1.10 | -0.5px | `#0F172A` |
| 数据指标（反白） | 32px | 700 | 1.10 | -0.5px | `#FFFFFF` |
| 按钮文字 | 16px | 600 | 1.00 | 0 | `#FFFFFF` 或 `#0284C7` |
| Tab 标签 | 11px | 500 | 1.20 | 0 | `#64748B` / 选中 `#0B6E7A` |
| 小标签/徽章 | 11px | 600 | 1.00 | 0 | 按语义色 |

### Principles
- 数字指标使用更紧凑的行高和负字间距，形成“仪表盘”观感。
- 正文使用 1.5 行高，确保长备注可读。
- 颜色层级：标题最深、正文次之、辅助最浅，避免纯黑带来的刺眼感。

---

## 4. Component Stylings

### Buttons

**主按钮（Primary CTA）**
- 背景：`linear-gradient(135deg, #0EA5E9, #10B981)`
- 文字：`#FFFFFF`，16px，weight 600
- 内边距：12px 24px
- 圆角：12px
- 阴影：`0 8px 24px rgba(14, 165, 233, 0.32)`
- 按压态：亮度降低 8%，缩放 0.98
- 用于：上报隐患、提交巡检、保存联系人

**次要按钮（Secondary）**
- 背景：`#E0F2FE`
- 文字：`#0284C7`，16px，weight 600
- 内边距：12px 24px
- 圆角：12px
- 用于：取消、返回、编辑

**小按钮/文字按钮（Text Button）**
- 背景：透明
- 文字：`#0284C7`，14px，weight 500
- 用于：查看更多、催办

**危险按钮（Destructive）**
- 背景：`#FEE2E2`
- 文字：`#DC2626`
- 用于：删除联系人、复核不通过

### Cards

**统计指标卡（Stat Card）**
- 背景：`#FFFFFF`
- 圆角：16px
- 内边距：16px
- 阴影：`0 4px 20px rgba(15, 23, 42, 0.06)`
- 标题：12px `#64748B`
- 数值：28px `#0F172A` weight 700
- 变化标签：11px 圆角胶囊

**Hero 欢迎卡（Gradient Hero Card）**
- 背景：`linear-gradient(135deg, #0EA5E9 0%, #10B981 100%)`
- 圆角：20px
- 内边距：20px
- 阴影：`0 12px 40px rgba(14, 165, 233, 0.18)`
- 文字反白，左侧标题 + 右侧装饰图标

**列表项卡片（List Item Card）**
- 背景：`#FFFFFF`
- 圆角：12px
- 内边距：14px 16px
- 左侧：类型图标/状态色块；中间：标题+副标题+标签；右侧：箭头/操作
- 分隔：卡片之间 12px 间距

**风险详情时间线卡片**
- 左侧：垂直时间线（节点圆点 + 连线）
- 右侧：内容卡片，圆角 12px，背景 `#F8FAFC`
- 当前节点：主色圆点 `#0EA5E9`
- 已完成节点：`#10B981`
- 未完成节点：`#CBD5E1`

### Inputs

**文本输入框**
- 背景：`#FFFFFF`
- 边框：1px solid `#E2E8F0`
- 圆角：10px
- 内边距：12px 14px
- 字体：14px `#334155`
- 聚焦：边框色 `#0EA5E9`，阴影 `0 0 0 3px rgba(14, 165, 233, 0.12)`
- 占位符：`#94A3B8`

**选择器（Picker）**
- 外观与输入框一致，右侧带下拉箭头图标
- 弹出底部选择 Sheet

**搜索框**
- 背景：`#F1F5F9`
- 无边框
- 圆角：999px（胶囊）
- 左侧搜索图标，右侧清空图标

### Badges & Chips

**风险等级徽章**
- 内边距：4px 8px
- 圆角：6px
- 字号：11px，weight 600
- 颜色按等级：低/中/高/重大

**筛选标签（Filter Chip）**
- 默认：背景 `#F1F5F9`，文字 `#64748B`
- 选中：背景 `#E0F2FE`，文字 `#0284C7`，边框 1px `#0EA5E9`
- 圆角：999px

### Navigation

**底部 Tab Bar**
- 背景：毛玻璃 `rgba(255,255,255,0.85)` + `backdrop-filter: blur(20px)`
- 高度：64px（含安全区）
- 上边框：1px solid `rgba(226, 232, 240, 0.6)`
- 5 个 Tab：首页、巡检、隐患、应急、我的
- 图标 24px，标签 11px
- 未选中：`#94A3B8`
- 选中：`#0B6E7A`（图标） + `#0B6E7A`（文字）
- 中央“+”快捷上报按钮：悬浮于 Tab Bar 上方，圆形渐变背景，带阴影

**顶部 AppBar**
- 背景：页面背景或白色
- 左侧：页面标题 18px weight 600
- 右侧：操作图标（搜索、添加、更多）
- 高度：56px

### Empty States
- 居中插画：线性 SVG，主色描边，尺寸 120px
- 标题：16px `#0F172A`
- 说明：14px `#64748B`
- 主操作按钮在下方 24px 处

---

## 5. Layout Principles

### Spacing System
- 基础单位：4px
- 常用刻度：4, 8, 12, 16, 20, 24, 32, 40, 48
- 卡片内边距：16px
- 列表项间距：12px
- 模块间距：24px
- 页面水平边距：16px

### Container
- 内容区最大宽度：390px（移动端）/ 420px（大屏手机）
- 水平居中，禁止全宽铺满
- 卡片在内容区内撑满宽度，内部按 Flex 排列

### Grid
- 移动端以单列为主
- 首页统计指标使用 2×2 网格
- 快捷入口使用 4 列网格
- 巡检/隐患列表为单列卡片列表

### Whitespace
- 页面顶部预留 16-24px 与状态栏/安全区间距
- 模块之间 24px 留白
- 卡片内部元素间距 12-16px
- 长页面底部预留 100px，避免被 Tab Bar 遮挡

---

## 6. Depth & Elevation

| 层级 | 处理 | 用途 |
|---|---|---|
| Level 0 | 无阴影，贴合背景 | 普通文字区域、分隔线 |
| Level 1 | `0 4px 20px rgba(15,23,42,0.06)` | 统计卡、列表项卡片 |
| Level 2 | `0 8px 24px rgba(14,165,233,0.32)` | 悬浮操作按钮 |
| Level 3 | `0 12px 40px rgba(14,165,233,0.18)` | Hero 渐变卡片 |
| Glass | `backdrop-filter: blur(20px)` + 半透明白 | 底部 Tab Bar、顶部筛选栏 |

---

## 7. Do's and Don'ts

### Do
- 使用蓝绿色渐变强化品牌安全感。
- 保持卡片圆角 12-16px，营造柔和、现代的工业工具感。
- 用风险语义色让用户 1 秒识别隐患等级。
- 为所有图标提供语义化 `<title>`，便于测试与无障碍。
- 保持底部 Tab 固定，并在长内容页底部预留安全区。
- 在空状态提供明确的下一步操作按钮。

### Don't
- 不要使用 emoji 或 Unicode 图标替代 SVG。
- 不要把 Tab 导航放在侧边或顶部（底部固定）。
- 不要让内容区在 PC 浏览器上全宽拉伸。
- 不要在一个页面使用超过 3 种主色，避免花哨。
- 不要为装饰元素分配 `data-ui-id` 语义 ID。
- 不要省略风险等级的颜色+文字双重提示。

---

## 8. Responsive Behavior

### 目标断点
- 标准手机：360-420px
- 大屏手机：420-480px
- 超出 420px 时内容区保持居中，最大宽度 420px

### 适配规则
- 统计卡片 2×2 网格在窄屏保持。
- 快捷入口 4 列在 360px 仍可显示。
- 列表项文字截断使用 `…`，保留操作按钮。
- 底部 Tab Bar 始终固定于视口底部，宽度与 body 一致。

---

## 9. Semantic UI Binding

本设计严格绑定 `.arkpilot/designs/ui-tree.json` 中的语义目标。

### Surfaces / Pages

| Surface ID | Page ID | Route | Tab ID | 页面名称 |
|---|---|---|---|---|
| home | home-page | pages/Home | tab-home | 首页 |
| inspection | inspection-page | pages/Inspection | tab-inspection | 巡检 |
| inspection-detail | inspection-detail-page | pages/InspectionDetail | — | 巡检详情 |
| risk | risk-page | pages/Risk | tab-risk | 隐患 |
| risk-detail | risk-detail-page | pages/RiskDetail | — | 隐患详情 |
| report-risk | report-risk-page | pages/ReportRisk | — | 上报隐患 |
| emergency | emergency-page | pages/Emergency | tab-emergency | 应急 |
| profile | profile-page | pages/Profile | tab-profile | 我的 |

### Action / Input / Assertion Targets

#### 首页（home-page）
- `home-header-title`：AppBar 标题。
- `home-stat-today-inspection`：今日巡检数指标。
- `home-stat-pending-risk`：待处理隐患数指标。
- `home-stat-overdue-risk`：逾期隐患数指标。
- `home-stat-closed-rate`：整改闭环率指标。
- `home-quick-action-report`：快捷入口“上报隐患”。
- `home-quick-action-inspection`：快捷入口“开始巡检”。
- `home-quick-action-contact`：快捷入口“应急联系人”。
- `home-chart-risk-distribution`：风险状态分布图。
- `home-recent-activity-list`：最近动态列表。

#### 巡检页（inspection-page）
- `inspection-segment-today/pending/history`：顶部分段控制器。
- `inspection-task-list`：巡检任务列表。
- `inspection-task-start-{id}`：任务卡片上的“开始”按钮。
- `inspection-add-task`：添加巡检任务按钮。

#### 巡检详情页（inspection-detail-page）
- `inspection-detail-title`：巡检标题。
- `inspection-detail-checklist`：检查项列表。
- `inspection-checkitem-pass-{id}`：检查项“正常”按钮。
- `inspection-checkitem-fail-{id}`：检查项“异常”按钮。
- `inspection-checkitem-note-{id}`：检查项备注输入。
- `inspection-submit-result`：提交巡检结果按钮。

#### 隐患页（risk-page）
- `risk-filter-all/pending/inprogress/review/closed`：筛选标签。
- `risk-add-button`：上报隐患按钮。
- `risk-search-input`：搜索框。
- `risk-list`：隐患列表。
- `risk-item-{id}`：隐患列表项，点击进入详情。

#### 隐患详情页（risk-detail-page）
- `risk-detail-title`：隐患标题。
- `risk-detail-status`：隐患状态。
- `risk-detail-level`：隐患等级。
- `risk-detail-progress-timeline`：整改进度时间线。
- `risk-action-assign`：指派整改人按钮。
- `risk-action-remind`：催办按钮。
- `risk-action-submit-fix`：提交整改按钮。
- `risk-action-review-pass/reject`：复核通过/不通过按钮。

#### 上报隐患页（report-risk-page）
- `report-risk-title-input`：标题输入。
- `report-risk-type-picker`：类型选择器。
- `report-risk-level-picker`：等级选择器。
- `report-risk-location-input`：地点输入。
- `report-risk-desc-input`：描述输入。
- `report-risk-photos`：照片上传区域。
- `report-risk-deadline-picker`：截止日期选择器。
- `report-risk-handler-picker`：整改责任人选择器。
- `report-risk-submit`：提交按钮。

#### 应急页（emergency-page）
- `emergency-search-input`：搜索框。
- `emergency-add-contact`：添加联系人按钮。
- `emergency-contact-list`：联系人列表。
- `emergency-contact-call-{id}`：拨打按钮。

#### 我的页（profile-page）
- `profile-avatar`：头像。
- `profile-name`：姓名。
- `profile-role`：职务。
- `profile-setting-export`：导出数据入口。
- `profile-setting-about`：关于入口。

### Events Preserved
所有 ui-tree.json 中声明的事件名在本设计阶段保持不变，详见 ui-tree.json `events` 数组。

### ID Gaps / Change Requests
- 当前语义协议未包含“首页趋势图/柱状图”的具体 ID；建议在实现阶段为图表容器补充 `data-ui-id="home-chart-risk-trend"` 作为扩展断言目标，但不强制修改 ui-tree.json。
- 底部 Tab Bar 的 5 个 Tab 需要在实现中稳定绑定 `tab-home`、`tab-inspection`、`tab-risk`、`tab-emergency`、`tab-profile`。

---

## 10. Iconography

- 所有图标使用本地 SVG 或内联 SVG；禁止 emoji。
- 每个 `<svg>` 首子元素必须是 `<title>`，内容反映业务语义，例如：
  - 首页 Tab：`<title>打开首页统计看板</title>`
  - 上报隐患按钮：`<title>上报新的风险隐患</title>`
  - 一键拨号：`<title>拨打该应急联系人电话</title>`
- 图标尺寸：Tab 24px、列表类型 20px、按钮内 16-20px、装饰 40-120px。
- 描边统一 2px，端点 round，拐角 round。

---

## 11. Sample Data Notes

HTML  artifacts 中可使用示例数据以提升视觉真实感，但示例数据不得成为产品默认种子数据。所有表单输入、列表项、统计数值在真实首运行时应从空状态开始。
