# 平安扣 Pinankou - Visual Design Specification (Refined)

## 1. Visual Theme & Atmosphere

平安扣的视觉核心是"安全感"与"可信赖"。我们避免冷白医疗感或沉重工业风，选择**清晨湖面**意象：蓝绿渐变像水天交界，白色卡片像漂浮的薄瓷片，通透、干净、有秩序。界面在传递专业性的同时保持温度，让一线巡检员在户外强光下也能快速辨识状态，让管理人员在数据看板中一眼抓住风险。

设计关键词：**清晨蓝绿、通透玻璃、秩序卡片、克制状态色、数据可读**。

本次 refinement 重点：
- 背景渐变从单一蓝绿改为**多层氛围渐变**（浅水蓝 → 薄荷绿 → 极浅青白），增加空间深度；
- 卡片引入** subtle inner highlight** 与毛玻璃效果，让卡片有"被光从上方照亮"的质感；
- 首页汇总区使用**双轴渐变徽章 + 微光边框**，避免普通数字卡片的模板感；
- 状态色不再只用纯色块，而是**双色微渐变 chip**（例如高风险：红 → 深玫红）；
- 统计数字使用**渐变文字 fill**，提升数据焦点；
- Tab 栏选中态使用**上浮胶囊背景 + 柔和光晕**。

## 2. Color Palette & Roles

### Brand / Primary
- **清晨蓝** `#38BDF8` (Sky 400): 顶部氛围、主要按钮左侧。
- **薄荷绿** `#34D399` (Emerald 400): 完成态、正向指标、按钮右侧。
- **深青** `#0F766E` (Teal 700): 页面标题、关键数字、选中态图标。
- **湖水青** `#14B8A6` (Teal 500): 次级强调、hover/active 状态。

### Functional Accents
- **风险高** `#F87171` → `#DC2626` 微渐变: 高风险、逾期、紧急电话强调。
- **风险中** `#FBBF24` → `#D97706`: 中风险、处理中、提醒。
- **风险低** `#60A5FA` → `#2563EB`: 低风险、普通提示。
- **完成绿** `#34D399` → `#059669`: 已完成、正常巡检点。
- **待处理** `#CBD5E1` → `#94A3B8`: 未开始、禁用、占位。

### Neutrals
- **页面背景渐变**: `linear-gradient(180deg, #E0F2FE 0%, #D1FAE5 35%, #F0FDFA 70%, #F8FAFC 100%)`
- **卡片背景**: `rgba(255, 255, 255, 0.86)` + `backdrop-filter: blur(20px)`
- **卡片内高光**: `inset 0 1px 0 0 rgba(255,255,255,0.7)`
- **主文字** `#0F172A`
- **次级文字** `#475569`
- **三级文字** `#94A3B8`
- **分割线** `#E2E8F0`

### Surfaces & Elevation
- **卡片阴影**: `0 20px 40px -12px rgba(14, 165, 233, 0.15), 0 4px 12px -4px rgba(0, 0, 0, 0.05)`
- **悬浮按钮阴影**: `0 16px 40px -8px rgba(14, 165, 233, 0.45)`
- **Tab 栏阴影**: `0 -8px 30px rgba(15, 23, 42, 0.08)`
- **选中 Tab 光晕**: `0 0 20px rgba(56, 189, 248, 0.35)`
- **Header 玻璃**: `rgba(255,255,255,0.78)` + `backdrop-filter: blur(18px) saturate(180%)`

### Dark / Modal
- **Sheet 背景**: `#FFFFFF`
- **Sheet 遮罩**: `rgba(15, 23, 42, 0.5)` + `backdrop-filter: blur(4px)`
- **删除按钮**: 背景 `#FEE2E2`，文字 `#DC2626`

## 3. Typography Rules

### Font Family
- **Primary**: `"PingFang SC", "HarmonyOS Sans SC", "SF Pro Text", -apple-system, BlinkMacSystemFont, sans-serif`
- **Display/Numbers**: `"DIN Alternate", "HarmonyOS Sans", "SF Pro Display", sans-serif`

### Hierarchy

| Role | Size | Weight | Line Height | Color |
|------|------|--------|-------------|-------|
| Page Title | 24px | 700 | 1.2 | `#0F766E` |
| Section Title | 18px | 600 | 1.3 | `#0F172A` |
| Card Title | 16px | 600 | 1.35 | `#0F172A` |
| Body | 15px | 400 | 1.55 | `#475569` |
| Caption | 13px | 400 | 1.4 | `#94A3B8` |
| Stat Number | 34px | 700 | 1.05 | 渐变文字 `#0F766E` → `#0EA5E9` |
| Tab Label | 11px | 500 | 1.2 | `#94A3B8` / `#0EA5E9` |
| Button | 16px | 600 | 1.0 | `#FFFFFF` |

## 4. Component Stylings

### Primary Button
- Background: `linear-gradient(135deg, #38BDF8 0%, #34D399 100%)`
- Text: `#FFFFFF`
- Padding: 14px 28px
- Border-radius: 16px
- Shadow: `0 10px 24px -6px rgba(56, 189, 248, 0.45)`
- Hover/Active: scale(0.98)，阴影收缩

### Secondary Button
- Background: `rgba(255,255,255,0.72)`
- Border: 1px solid `#E2E8F0`
- Text: `#0F766E`
- Border-radius: 14px

### Danger Button
- Background: `#FEE2E2`
- Text: `#DC2626`
- Border-radius: 14px

### Cards
- Background: `rgba(255,255,255,0.86)`
- Backdrop-filter: `blur(20px)`
- Border: `1px solid rgba(255,255,255,0.6)`
- Inner highlight: `inset 0 1px 0 0 rgba(255,255,255,0.7)`
- Border-radius: 22px
- Padding: 20px
- Shadow: 见上文

### Status Chips (Gradient)
| 状态 | 背景渐变 | 文字 |
|------|----------|------|
| 待处理 | `#F1F5F9` → `#E2E8F0` | `#64748B` |
| 处理中 | `#FEF3C7` → `#FDE68A` | `#B45309` |
| 待验收 | `#DBEAFE` → `#BFDBFE` | `#1D4ED8` |
| 已完成 | `#D1FAE5` → `#A7F3D0` | `#047857` |
| 高风险 | `#FEE2E2` → `#FECACA` | `#DC2626` |
| 中风险 | `#FEF3C7` → `#FDE68A` | `#B45309` |
| 低风险 | `#DBEAFE` → `#BFDBFE` | `#1E40AF` |

### Form Inputs
- Background: `#F8FAFC`
- Border: 1px solid `#E2E8F0`
- Border-radius: 14px
- Padding: 14px 16px
- Focus: border `#38BDF8`, shadow `0 0 0 4px rgba(56,189,248,0.12)`

### Bottom Tab Bar
- Background: `rgba(255,255,255,0.92)` + `backdrop-filter: blur(20px)`
- Border-top: 1px solid `rgba(226,232,240,0.6)`
- Height: 68px + safe-area
- 选中态：胶囊背景 `rgba(224,242,254,0.8)` + 图标渐变 + 光晕

### Floating Action Button (FAB)
- Size: 58px
- Background: 主按钮渐变
- Icon: 白色 24px
- Shadow: 悬浮按钮阴影
- Position: 右下角 20px

## 5. Layout Principles

- Base unit: 4px
- 内容区 max-width: 390px，居中。
- 水平内边距: 16px。
- Header 高度 60px + 状态栏安全区。
- 底部 Tab 栏 68px + safe-area。
- 首页 2 列网格间距 14px。
- 统计页 2 列指标网格间距 14px。
- 列表卡片间距 14px。

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| 页面背景 | 多层蓝绿渐变 |
| 内容卡片 | 毛玻璃 + 弥散阴影 + 内高光 |
| Header | 强玻璃模糊 + 半透明 |
| Tab Bar | 玻璃底 + 顶部细线 + 阴影 |
| FAB | 强渐变 + 强投影 |
| Sheet | 白色底 + 大圆角 + 遮罩模糊 |
| 选中态 | 光晕 + 渐变填充 |

## 7. Page-Specific Design Notes

### 首页（home-page）
- Header 玻璃质感，左侧 logo（青绿渐变圆角矩形 + 平安扣文字），右侧通知铃铛。
- 欢迎横幅："早上好，今天也要平安归家" + 日期。
- 顶部"今日安全仪表盘"：三个横向卡片，分别显示待办数、逾期数、巡检完成率；数字使用渐变填充，卡片带微光边框。
- 快捷入口 2×3 网格，每个入口为白色毛玻璃圆角卡片，图标 28px，使用蓝绿渐变。
- 最近动态：白色卡片，展示最多 3 条待处理事项，带状态 chip。
- 底部 56px 留白给 Tab 栏。

### 安全事项（safety-items-page）
- 顶部返回 + 标题 + 新增图标。
- 筛选栏为白色玻璃胶囊，状态与优先级筛选并排。
- 事项卡片左侧有一条颜色竖线表示优先级（高=红、中=橙、低=蓝）；右侧显示状态 chip。
- 逾期事项整张卡片带浅红背景晕染。
- 空状态：青绿渐变插图 + 文案 + 主按钮。

### 风险隐患（hazards-page）
- Tab 级页面，顶部标题 + 隐患上报 FAB。
- 风险等级用徽章颜色区分，状态用进度条 + chip。
- 卡片底部显示"上报于 2 小时前"等时间戳。
- 空状态同上。

### 巡检打卡（inspections-page）
- 顶部"开始巡检"主按钮占满宽度，带扫描/定位图标。
- 任务卡片包含环形进度指示器（SVG）。
- 进入任务页后，顶部显示"已完成 4/8"与线性进度条。
- 每个检查点卡片包含名称、位置、正常/异常单选、备注输入、拍照按钮。

### 应急联系人（emergency-page）
- 联系人卡片左侧为青绿渐变圆形头像（姓名首字），右侧电话/短信按钮使用图标按钮。
- 第一个联系人可标记为"首选"，带小皇冠或星标徽章。
- 空状态："添加第一位应急联系人"。

### 统计看板（stats-page）
- 顶部周期切换为胶囊分段控制器。
- 指标卡片 2×3 网格，数字使用渐变文字，图标背景为浅色渐变圆。
- 趋势图使用简洁柱状图，柱体使用蓝绿渐变；分布图使用环形图，颜色按风险等级。

### 表单页（item/hazard/contact-form-sheet）
- 全屏 Sheet，顶部大圆角 28px，带拖拽指示条。
- 表单分组标题使用小写大写字母间距（letter-spacing 1px）。
- 底部固定保存按钮区，带安全边距。

## 8. Responsive Behavior

- 以 390px 宽度为基准，max-width 390px 居中。
- 更宽屏幕仅背景渐变铺满，内容保持居中。
- 长屏幕保证首屏关键内容在 600vp 内可见，其余自然滚动。

## 9. Do's and Don'ts

### Do
- 使用多层蓝绿渐变营造安全感。
- 卡片使用毛玻璃 + 内高光 + 弥散阴影。
- 状态 chip 使用微渐变。
- 图标使用本地 SVG，并注入业务语义 title。
- 底部 Tab 固定底部且宽度限制居中。

### Don't
- 不要使用 emoji。
- 不要让 Tab 栏全宽拉伸。
- 不要使用超过 3 种主色。
- 不要给所有文字加粗。
- 不要省略空/加载/错误状态。

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

- 无。
