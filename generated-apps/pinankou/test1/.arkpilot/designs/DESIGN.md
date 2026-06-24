# 平安扣 Pinankou - Visual Design Specification

## 1. Visual Theme & Atmosphere

平安扣是一款以"安全感"为核心的企业安全管理应用。视觉语言追求**清爽、可信、专业**，用蓝绿色系传递稳定与可靠，同时通过细腻的卡片层次、玻璃质感和有序的信息分组，让用户在繁忙的巡检与整改场景中一眼抓到重点。

设计关键词：**秩序感、呼吸感、可信蓝绿、轻盈卡片、信息优先**。

不同于通用 AI 模板的直白白色页面，本设计采用：
- 柔和蓝绿渐变作为页面背景基底，营造安全氛围而不喧宾夺主；
- 顶部玻璃拟态 Header，与内容区形成自然景深；
- 大圆角卡片 + 柔和弥散阴影，提升触感与层级；
- 状态色（红/橙/绿）严格按语义使用，避免全屏花哨；
- 底部固定 Tab 栏，胶囊形图标 + 选中态渐变填充。

## 2. Color Palette & Roles

### Brand / Primary
- **品牌青** `#0EA5E9` (Sky 500): 主按钮、选中态、关键图标。
- **品牌绿** `#10B981` (Emerald 500): 完成态、安全指标、正向强调。
- **品牌深蓝** `#0F766E` (Teal 700): 标题文字、导航选中图标、强调性文字。

### Functional Accents
- **风险高** `#EF4444` (Red 500): 高风险隐患、逾期、紧急。
- **风险中** `#F59E0B` (Amber 500): 中风险、提醒、处理中。
- **风险低** `#3B82F6` (Blue 500): 低风险、普通提示。
- **完成绿** `#10B981` (Emerald 500): 已完成、正常巡检点。
- **待处理灰** `#94A3B8` (Slate 400): 未开始、禁用。

### Neutrals
- **页面背景** `#F0F9FF` → `#ECFDF5` 线性渐变（上浅蓝下浅绿，180deg）。
- **卡片背景** `#FFFFFF` 不透明，叠加 `backdrop-filter: blur(12px)` 玻璃质感。
- **主文字** `#0F172A` (Slate 900)。
- **次级文字** `#475569` (Slate 600)。
- **三级文字/占位** `#94A3B8` (Slate 400)。
- **分割线** `#E2E8F0` (Slate 200)。

### Surfaces & Elevation
- **卡片阴影**: `0 10px 25px -5px rgba(14, 165, 233, 0.12), 0 4px 10px -2px rgba(0, 0, 0, 0.05)`
- **悬浮按钮阴影**: `0 12px 30px -4px rgba(14, 165, 233, 0.35)`
- **Tab 栏阴影**: `0 -4px 20px rgba(15, 23, 42, 0.06)`
- **选中 Tab 背景**: 径向渐变 `radial-gradient(circle at 50% 0%, rgba(14,165,233,0.16), transparent 70%)`

### Dark / Modal
- **底部 Sheet 背景**: `#FFFFFF`
- **Sheet 遮罩**: `rgba(15, 23, 42, 0.45)`
- **删除/危险按钮**: `#EF4444`

## 3. Typography Rules

### Font Family
- **Primary**: `"PingFang SC", "HarmonyOS Sans SC", "SF Pro Text", -apple-system, BlinkMacSystemFont, sans-serif`
- **Display/Numbers**: `"DIN Alternate", "HarmonyOS Sans", "SF Pro Display", sans-serif`（用于统计数字）

### Hierarchy

| Role | Size | Weight | Line Height | Color |
|------|------|--------|-------------|-------|
| Page Title | 22px | 700 | 1.2 | `#0F172A` |
| Section Title | 18px | 600 | 1.3 | `#0F172A` |
| Card Title | 16px | 600 | 1.35 | `#0F172A` |
| Body | 15px | 400 | 1.5 | `#475569` |
| Caption | 13px | 400 | 1.4 | `#94A3B8` |
| Stat Number | 32px | 700 | 1.1 | `#0F766E` |
| Tab Label | 11px | 500 | 1.2 | `#94A3B8` / `#0EA5E9` |
| Button | 16px | 600 | 1.0 | `#FFFFFF` |

### Principles
- 中文内容行高略大于英文模板，确保阅读舒适。
- 数字使用 tighter line-height，强化数据感。
- 标题使用较重字重，正文保持 400，避免整屏粗体。

## 4. Component Stylings

### Primary Button
- Background: 线性渐变 `linear-gradient(135deg, #0EA5E9 0%, #10B981 100%)`
- Text: `#FFFFFF`
- Padding: 14px 24px
- Border-radius: 14px
- Shadow: `0 8px 20px -4px rgba(14, 165, 233, 0.35)`
- Active: scale(0.98), 阴影减弱

### Secondary Button
- Background: `#FFFFFF`
- Border: 1px solid `#E2E8F0`
- Text: `#0F766E`
- Border-radius: 12px
- Padding: 12px 20px

### Danger Button
- Background: `#FEE2E2`
- Text: `#DC2626`
- Border-radius: 12px

### Cards
- Background: `#FFFFFF`
- Border-radius: 20px
- Padding: 18px
- Shadow: 卡片阴影（见上文）
- 无可见边框，靠阴影与背景区分

### Status Chips
| 状态 | 背景 | 文字 |
|------|------|------|
| 待处理 | `#F1F5F9` | `#64748B` |
| 处理中 | `#FEF3C7` | `#B45309` |
| 待验收 | `#DBEAFE` | `#1D4ED8` |
| 已完成 | `#D1FAE5` | `#047857` |
| 高风险 | `#FEE2E2` | `#DC2626` |
| 中风险 | `#FEF3C7` | `#B45309` |
| 低风险 | `#DBEAFE` | `#1E40AF` |

### Form Inputs
- Background: `#F8FAFC`
- Border: 1px solid `#E2E8F0`
- Border-radius: 12px
- Padding: 14px 16px
- Focus: border `#0EA5E9`, shadow `0 0 0 3px rgba(14,165,233,0.15)`

### Bottom Tab Bar
- Background: `#FFFFFF`
- Border-top: none，使用阴影 `0 -4px 20px rgba(15, 23, 42, 0.06)`
- Height: 64px + safe-area-inset-bottom
- 图标尺寸 24px，选中态图标填充渐变色
- 选中文字颜色 `#0EA5E9`

### Floating Action Button (FAB)
- Size: 56px
- Background: 主按钮渐变
- Icon: 白色 24px
- Shadow: 悬浮按钮阴影
- Position: 列表页右下角，距边缘 20px

## 5. Layout Principles

### Spacing System
- Base unit: 4px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48px

### Container
- 内容区最大宽度: 390px，居中。
- 水平内边距: 16px（移动端安全边距）。
- 页面顶部预留 Header 高度 56px + 16px 间距。
- 底部预留 Tab 栏高度 64px + safe-area。

### Grid
- 首页采用 2 列快捷入口网格，间距 12px。
- 统计页采用 2 列指标卡片网格。
- 列表页单列卡片，间距 12px。

### Whitespace Philosophy
- 卡片内部密集、卡片之间疏朗。
- 同组信息紧凑，不同组之间用 24-32px 大间距分割。
- 顶部欢迎语和日期作为"呼吸区"，不抢功能入口注意力。

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| 页面背景 | 蓝绿渐变，无阴影 |
| 内容卡片 | 白色背景 + 柔和弥散阴影 |
| Header | 玻璃模糊 `backdrop-filter: blur(12px)`，半透明背景 `rgba(255,255,255,0.72)` |
| Tab Bar | 白色实底 + 顶部阴影 |
| FAB | 强烈投影 + 渐变 |
| Sheet | 白色底 + 顶部大圆角 24px + 遮罩层 |

## 7. Page-Specific Design Notes

### 首页（home-page）
- 顶部玻璃 Header 显示 "平安扣" logo + 通知图标。
- 欢迎语："早上好，安全巡检 today"。
- 顶部汇总卡片：今日待办数 + 逾期数 + 今日巡检状态，使用大数字 + 绿/橙/红点区分。
- 快捷入口 2×3 网格：安全事项、风险隐患、巡检打卡、应急联系人、统计看板、更多。
- 最近动态：最近 3 条待处理事项/隐患。

### 安全事项（safety-items-page）
- 顶部标题 + 新增按钮。
- 筛选栏：状态筛选（全部/待办/已完成）+ 优先级筛选。
- 事项卡片：标题、分类标签、优先级色条、截止日期、状态 chip。
- 逾期事项左侧加红色竖线。
- 空状态：插图 + "暂无安全事项，点击新增" + 新建按钮。

### 风险隐患（hazards-page）
- 标题 + 隐患上报 FAB。
- 筛选：风险等级 + 状态。
- 隐患卡片：标题、位置、风险等级徽章、状态进度条、上报时间。
- 点击卡片进入详情/编辑。
- 空状态同上。

### 巡检打卡（inspections-page）
- 标题 + 开始巡检主按钮。
- 任务列表卡片：任务名、检查点进度环、截止时间。
- 历史记录入口。
- 进入任务后显示检查点列表，每个检查点有"正常"/"异常"单选 + 备注 + 拍照。
- 顶部进度条随完成数更新。

### 应急联系人（emergency-page）
- 标题 + 新增按钮。
- 联系人卡片：头像首字母、姓名、角色、电话，右侧电话/短信图标按钮。
- 空状态："还没有应急联系人"。

### 统计看板（stats-page）
- 顶部周期切换：本周 / 本月 / 本季度。
- 2×3 指标卡片：隐患总数、待整改、整改完成率、巡检完成率、逾期事项、本月新增。
- 趋势图：近 7 天隐患上报折线/柱状图。
- 分布图：隐患等级饼图/环形图。

### 表单页（item/hazard/contact-form-sheet）
- 底部 Sheet 或全屏页，顶部大圆角。
- 表单分组：基本信息、分类/等级、补充信息。
- 底部保存按钮（主渐变）+ 删除按钮（编辑态显示）。

## 8. Responsive Behavior

- 设计以 390px 宽度为基准，内容居中，max-width 390px。
- 在更宽屏幕上保持居中，背景渐变铺满，内容不拉伸。
- 长屏幕（2756px 高度）充分利用垂直滚动；首屏关键内容（Header + 汇总卡片）在 600vp 内可见。

## 9. Do's and Don'ts

### Do
- 使用蓝绿色渐变强化安全感。
- 保持卡片大圆角和柔和阴影。
- 状态色严格按语义使用。
- 图标使用本地 SVG，并注入业务语义 `<title>`。
- 底部 Tab 固定在底部，宽度限制在 390px 内居中。

### Don't
- 不要使用 emoji 作为图标。
- 不要让 Tab 栏在 PC 浏览器全宽拉伸。
- 不要使用超过 3 种主色，避免花哨。
- 不要给所有文字加粗。
- 不要省略空状态、加载状态、错误状态。

## 10. Semantic UI Binding

### Surfaces / Routes / Tabs

| pageId | route | tabId | name |
|--------|-------|-------|------|
| home-page | pages/Home | tab-home | 首页 |
| safety-items-page | pages/SafetyItems | — | 安全事项 |
| hazards-page | pages/Hazards | tab-hazards | 风险隐患 |
| inspections-page | pages/Inspections | tab-inspections | 巡检打卡 |
| inspection-task-page | pages/InspectionTask | — | 巡检任务详情 |
| emergency-page | pages/Emergency | — | 应急联系人 |
| stats-page | pages/Stats | tab-stats | 统计看板 |
| profile-page | pages/Profile | tab-profile | 我的 |
| item-form-sheet | pages/ItemForm | — | 事项表单 |
| hazard-form-sheet | pages/HazardForm | — | 隐患表单 |
| contact-form-sheet | pages/ContactForm | — | 联系人表单 |

### Important Action / Input / Assertion IDs

- `home-scan-button`, `home-report-button`, `home-safety-items-card`, `home-hazards-card`, `home-inspections-card`, `home-emergency-card`, `home-stats-card`
- `home-pending-count`, `home-overdue-count`, `home-today-inspection-status`
- `items-add-button`, `items-filter-status`, `items-filter-priority`, `items-search-input`, `items-list`, `items-empty-state`, `items-loading-state`
- `hazards-add-button`, `hazards-filter-level`, `hazards-filter-status`, `hazards-list`, `hazards-empty-state`, `hazards-loading-state`
- `inspections-add-button`, `inspections-filter-status`, `inspections-list`, `inspections-empty-state`, `inspections-history-button`
- `task-back-button`, `task-checkpoint-list`, `task-checkpoint-{id}-normal`, `task-checkpoint-{id}-abnormal`, `task-checkpoint-{id}-photo`, `task-checkpoint-{id}-note`, `task-submit-button`, `task-progress-bar`
- `emergency-add-button`, `emergency-list`, `emergency-empty-state`, `emergency-contact-{id}-call`, `emergency-contact-{id}-sms`, `emergency-contact-{id}-edit`
- `stats-period-week`, `stats-period-month`, `stats-period-quarter`, `stats-hazard-total`, `stats-pending-count`, `stats-completion-rate`, `stats-inspection-rate`, `stats-overdue-count`, `stats-trend-chart`, `stats-distribution-chart`
- `item-form-*`, `hazard-form-*`, `contact-form-*`

### Event Names

`navigate-back`, `navigate-safety-items`, `navigate-hazards`, `navigate-inspections`, `navigate-emergency`, `navigate-stats`, `navigate-inspection-history`, `open-item-form`, `open-hazard-form`, `open-contact-form`, `open-inspection-task`, `save-item`, `delete-item`, `save-hazard`, `delete-hazard`, `save-contact`, `delete-contact`, `change-status-filter`, `change-priority-filter`, `change-level-filter`, `change-search`, `change-stats-period`, `mark-checkpoint-normal`, `mark-checkpoint-abnormal`, `capture-checkpoint-photo`, `change-checkpoint-note`, `submit-inspection`, `call-contact`, `sms-contact`, `edit-contact`, `capture-hazard-photo`, `navigate-settings`, `navigate-about`, `export-data`.

### Change Requests / Gaps

- 无。所有语义 ID 已在 DESIGN.md 中保留并映射到视觉控件。
