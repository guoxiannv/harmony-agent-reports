# 平安扣 Pinankou 视觉设计系统 v1.2

## 1. Visual Theme & Atmosphere

平安扣是面向一线安全员与班组负责人的现场安全管理工具。视觉核心是**“可信赖的秩序感”**：界面必须让使用者在嘈杂、光线多变的工业环境中，3 秒内定位关键信息并完成操作。

整体色彩以**深海青 `#0D9488`**、**薄荷绿 `#2DD4BF`** 和**雾蓝 `#7DD3FC`** 构成蓝绿色安全感体系，并加入少量**暖琥珀 `#F59E0B`** 作为“需要关注”的语义色。背景采用极浅冷灰 `#F3F6F8`，让白色卡片像浮在平静水面上一样自然分层；关键数据使用深色文字形成强对比，而状态信息则通过语义色块快速传达。

材质语言强调“干净的安全工业风”：
- **渐变**：从深海青到薄荷绿的 135° 渐变用于 Hero 区、主按钮和品牌强调，传递“守护”情绪；
- **毛玻璃**：底部 Tab Bar 和顶部浮动筛选栏使用半透明白 + 高斯模糊，营造现代悬浮感；
- **弥散阴影**：卡片和按钮使用柔和的蓝灰阴影，避免死板扁平；
- **圆角**：大卡片 20px、列表卡片 16px、按钮 14px、输入框 12px，整体柔和但不失专业；
- **图标**：线性 SVG，统一 2px 描边，所有图标带语义 title。

**Key Characteristics:**
- 页面背景：`#F3F6F8`
- 卡片背景：`#FFFFFF`
- 主渐变：`linear-gradient(135deg, #0D9488 0%, #2DD4BF 100%)`
- 副渐变（信息/次级）：`linear-gradient(135deg, #0EA5E9 0%, #7DD3FC 100%)`
- 主标题：`#0F172A`，正文：`#334155`，辅助：`#64748B`
- 主按钮：渐变背景 + 白色文字 + 弥散阴影
- 风险等级：低 `#16A34A`、中 `#D97706`、高 `#DC2626`、重大 `#991B1B`
- 状态：待整改 `#64748B`、整改中 `#0EA5E9`、待复核 `#D97706`、已关闭 `#16A34A`、逾期 `#EA580C`

---

## 2. Color Palette & Roles

### Primary
- **深海青** `#0D9488`：品牌主色，AppBar 选中态、关键图标、渐变起点。
- **薄荷绿** `#2DD4BF`：渐变终点、完成态、正向强调。
- **雾蓝** `#7DD3FC`：信息提示、图表辅助、次级卡片高光。

### Gradient
- **主渐变（Hero / 主 CTA）**：`linear-gradient(135deg, #0D9488 0%, #2DD4BF 100%)`
- **副渐变（信息卡 / 图表）**：`linear-gradient(135deg, #0EA5E9 0%, #7DD3FC 100%)`
- **暖提示渐变（仅用于逾期/催办）**：`linear-gradient(135deg, #EA580C 0%, #F59E0B 100%)`
- **毛玻璃底**：`linear-gradient(180deg, rgba(255,255,255,0.92) 0%, rgba(255,255,255,0.76) 100%)` + `backdrop-filter: blur(24px)`

### Functional
- **主按钮背景**：主渐变；文字 `#FFFFFF`。
- **次要按钮背景**：`#CCFBF1`（极浅薄荷）；文字 `#0F766E`。
- **幽灵按钮**：透明背景 + 1px `#CBD5E1` 边框；文字 `#334155`。
- **文字按钮/链接**：`#0F766E`。
- **危险**：`#DC2626` 文字，背景 `#FEE2E2`。
- **禁用**：背景 `#E2E8F0`，文字 `#94A3B8`。

### Text
- **页面标题**：`#0F172A`，24px，weight 700
- **模块标题**：`#0F172A`，18px，weight 600
- **卡片标题**：`#0F172A`，16px，weight 600
- **正文**：`#334155`，14px，weight 400，line-height 1.55
- **辅助说明**：`#64748B`，12-13px
- **占位符**：`#94A3B8`
- **反白文字**：`#FFFFFF`

### Surface
- **页面背景**：`#F3F6F8`
- **卡片背景**：`#FFFFFF`
- **浅青底**：`#CCFBF1` 用于选中、标签、完成态背景
- **浅蓝底**：`#E0F2FE` 用于信息态背景
- **分隔线**：`#E2E8F0`，1px

### Risk Levels
| 等级 | 文字/图标 | 浅色背景 |
|---|---|---|
| 低 | `#16A34A` | `#DCFCE7` |
| 中 | `#D97706` | `#FEF3C7` |
| 高 | `#DC2626` | `#FEE2E2` |
| 重大 | `#991B1B` | `#FECACA` |

### Status
| 状态 | 颜色 | 浅色背景 |
|---|---|---|
| 待整改 | `#64748B` | `#F1F5F9` |
| 整改中 | `#0EA5E9` | `#E0F2FE` |
| 待复核 | `#D97706` | `#FEF3C7` |
| 已关闭 | `#16A34A` | `#DCFCE7` |
| 逾期 | `#EA580C` | `#FFEDD5` |

### Shadows
- **卡片阴影**：`0 6px 22px rgba(15, 23, 42, 0.06)`
- **卡片悬浮阴影**：`0 10px 28px rgba(15, 23, 42, 0.10)`
- **主按钮阴影**：`0 10px 28px rgba(13, 148, 136, 0.28)`
- **悬浮操作按钮阴影**：`0 12px 36px rgba(13, 148, 136, 0.32)`
- **Hero 卡片阴影**：`0 18px 48px rgba(13, 148, 136, 0.20)`
- **底部 Tab 阴影**：`0 -4px 16px rgba(15, 23, 42, 0.05)`

---

## 3. Typography Rules

### Font Family
- 中文：`PingFang SC`, `Microsoft YaHei`, `Helvetica Neue`, Arial, sans-serif
- 英文/数字：`SF Pro Display`（标题）、`SF Pro Text`（正文），fallback 到 `Helvetica Neue`, Arial

### Hierarchy

| 角色 | 字号 | 字重 | 行高 | 字间距 | 颜色 |
|---|---|---|---|---|---|
| 页面大标题 | 24px | 700 | 1.22 | -0.3px | `#0F172A` |
| 模块标题 | 18px | 600 | 1.30 | -0.2px | `#0F172A` |
| 卡片标题 | 16px | 600 | 1.35 | 0 | `#0F172A` |
| 正文 | 14px | 400 | 1.55 | 0 | `#334155` |
| 辅助说明 | 12px | 400 | 1.45 | 0 | `#64748B` |
| 小标签/徽章 | 11px | 600 | 1.20 | 0 | 按语义 |
| 数据指标 | 32px | 700 | 1.10 | -0.5px | `#0F172A` |
| 数据指标（反白） | 32px | 700 | 1.10 | -0.5px | `#FFFFFF` |
| 按钮文字 | 15px | 600 | 1.00 | 0 | `#FFFFFF` 或 `#0F766E` |
| Tab 标签 | 11px | 500 | 1.20 | 0 | `#64748B` / 选中 `#0D9488` |

### Principles
- 数据指标使用紧凑负字间距，形成仪表盘观感。
- 正文行高 1.55，长备注在户外/车间仍可读。
- 通过颜色深浅 + 字重建立层级，避免过多字号变化。

---

## 4. Component Stylings

### Buttons

**主按钮（Primary CTA）**
- 背景：`linear-gradient(135deg, #0D9488 0%, #2DD4BF 100%)`
- 文字：`#FFFFFF`，15px，weight 600
- 内边距：14px 28px
- 圆角：14px
- 阴影：`0 10px 28px rgba(13, 148, 136, 0.28)`
- 按压态：亮度 -10%，scale 0.98
- 用于：上报隐患、提交巡检、保存联系人、提交整改

**次要按钮（Secondary）**
- 背景：`#CCFBF1`
- 文字：`#0F766E`，15px，weight 600
- 圆角：14px
- 用于：取消、返回、编辑

**幽灵按钮（Ghost）**
- 背景：透明
- 边框：1px solid `#CBD5E1`
- 文字：`#334155`
- 用于：筛选未选中、次级操作

**文字按钮（Text Button）**
- 背景：透明
- 文字：`#0F766E`，14px，weight 500
- 用于：查看更多、催办

**危险按钮（Destructive）**
- 背景：`#FEE2E2`
- 文字：`#DC2626`，15px，weight 600
- 用于：删除、复核不通过

### Cards

**Hero 欢迎卡**
- 背景：主渐变
- 圆角：20px
- 内边距：22px
- 阴影：`0 18px 48px rgba(13, 148, 136, 0.20)`
- 文字反白，标题 20px weight 700，副标题 14px
- 右侧装饰：40px 反白描边盾牌/勾图标
- 底部可加一条细白半透明分割线，增强结构

**统计指标卡（2×2 网格）**
- 背景：`#FFFFFF`
- 圆角：18px
- 内边距：16px
- 阴影：`0 6px 22px rgba(15, 23, 42, 0.06)`
- 顶部：20px 图标，颜色按指标语义（青/橙/红/绿）
- 标题：12px `#64748B`
- 数值：28px `#0F172A` weight 700
- 底部：11px 趋势标签，圆角 999px

**快捷入口网格卡片**
- 背景：`#FFFFFF`
- 圆角：16px
- 内边距：16px
- 4 列等分
- 每项：40px 圆形渐变/浅色底图标 + 12px 标签
- 选中/按压态：背景 `#F0FDFA`

**列表项卡片**
- 背景：`#FFFFFF`
- 圆角：16px
- 内边距：14px 16px
- 阴影：`0 4px 16px rgba(15, 23, 42, 0.05)`
- 左侧：40px 圆形图标，背景按类型语义色（浅底）
- 中间：标题 15px + 副标题 13px + 徽章
- 右侧：状态/箭头
- 按压态：背景 `#F8FAFC`

**风险详情时间线卡片**
- 左侧时间线轨道 24px
- 节点：10px 圆点，已完成 `#2DD4BF`、当前 `#0D9488`、未完成 `#CBD5E1`
- 连线：2px，已完成段 `#2DD4BF`、未完成段 `#E2E8F0`
- 内容卡片：背景 `#F8FAFC`，圆角 12px，内边距 14px
- 标题 14px weight 600，时间 12px `#64748B`，说明 13px `#334155`

**表单分组卡片**
- 背景：`#FFFFFF`
- 圆角：16px
- 内边距：16px
- 标题 16px weight 600 + 14px 分组说明 `#64748B`
- 表单项垂直排列，间距 16px

### Inputs

**文本输入框**
- 背景：`#FFFFFF`
- 边框：1px solid `#E2E8F0`
- 圆角：12px
- 内边距：13px 15px
- 字体：14px `#334155`
- 聚焦：边框 `#0D9488`，光晕 `0 0 0 3px rgba(13, 148, 136, 0.12)`
- 占位符：`#94A3B8`

**搜索框**
- 背景：`#F1F5F9`
- 无边框
- 圆角：999px
- 内边距：10px 16px
- 左侧搜索图标 18px `#94A3B8`
- 右侧清空按钮（有内容时显示）

**选择器（Picker）**
- 外观同输入框，右侧向下箭头图标
- 底部弹出选择 Sheet，背景毛玻璃

**照片上传区域**
- 背景：`#F8FAFC`
- 边框：2px dashed `#CBD5E1`
- 圆角：12px
- 占位：相机图标 + “点击拍照或从相册选择”
- 已选照片：横向滚动，缩略图 72px，圆角 10px

### Badges & Chips

**风险等级徽章**
- 内边距：4px 9px
- 圆角：8px
- 字号：11px，weight 600
- 颜色按风险等级表

**筛选标签（Filter Chip）**
- 默认：背景 `#F1F5F9`，文字 `#64748B`
- 选中：背景 `#CCFBF1`，文字 `#0F766E`，1px 边框 `#0D9488`
- 圆角：999px
- 内边距：6px 14px

**状态徽章**
- 同徽章尺寸，颜色按状态表
- 已关闭带小勾图标

### Navigation

**底部 Tab Bar**
- 背景：毛玻璃 `linear-gradient(180deg, rgba(255,255,255,0.92) 0%, rgba(255,255,255,0.76) 100%)` + `backdrop-filter: blur(24px)`
- 高度：68px（含底部安全区）
- 顶部 1px 高光线 `rgba(255,255,255,0.8)`
- 上阴影：`0 -4px 16px rgba(15, 23, 42, 0.05)`
- 5 个 Tab：首页、巡检、隐患、应急、我的
- 图标 24px，标签 11px
- 未选中 `#94A3B8`，选中 `#0D9488`
- 中央“+”快捷上报按钮：圆形 56px，主渐变背景，白色加号，悬浮于 Tab Bar 上方 10px，阴影 `0 12px 36px rgba(13, 148, 136, 0.32)`

**顶部 AppBar**
- 背景：页面背景或白色
- 高度：56px
- 左侧：返回箭头（非根页面）+ 页面标题 18px weight 600
- 右侧：搜索/添加/更多图标 24px

### Empty States
- 居中插画：120px 线性 SVG，主色渐变描边
- 标题：16px `#0F172A` weight 600
- 说明：14px `#64748B`
- 主操作按钮：次要按钮样式，下方 24px

---

## 5. Layout Principles

### Spacing System
- 基础单位：4px
- 常用刻度：4, 8, 12, 16, 20, 24, 32, 40, 48, 64
- 页面水平边距：16px
- 卡片内边距：16px
- 卡片间距：12px
- 模块间距：24px
- 长页面底部安全区：≥100px

### Container
- 内容区最大宽度：390px，上限 420px
- 水平居中，禁止全宽铺满
- 卡片在内容区内撑满

### Grid
- 首页统计：2×2 网格，间距 12px
- 快捷入口：4 列网格，间距 12px
- 列表：单列卡片列表

### Whitespace
- 页面顶部预留 20-24px
- 模块标题与内容间距 12px
- 表单分组间距 16px
- 列表底部预留足够空间，不被 Tab Bar 遮挡

---

## 6. Depth & Elevation

| 层级 | 处理 | 用途 |
|---|---|---|
| Level 0 | 无阴影 | 普通文本区域 |
| Level 1 | `0 4px 16px rgba(15,23,42,0.05)` | 列表项卡片 |
| Level 2 | `0 6px 22px rgba(15,23,42,0.06)` | 统计卡片 |
| Level 3 | `0 10px 28px rgba(15,23,42,0.10)` | 列表项悬浮态 |
| Level 4 | `0 10px 28px rgba(13,148,136,0.28)` | 主按钮 |
| Level 5 | `0 12px 36px rgba(13,148,136,0.32)` | 悬浮快捷按钮 |
| Level 6 | `0 18px 48px rgba(13,148,136,0.20)` | Hero 渐变卡片 |
| Glass | 毛玻璃 + blur 24px | 底部 Tab Bar、顶部筛选栏 |

---

## 7. Do's and Don'ts

### Do
- 使用深海青到薄荷绿的渐变作为品牌核心。
- 卡片使用圆角 16-20px + 柔和阴影。
- 风险/状态色遵循语义，并用浅色底降低压迫感。
- 为每个 SVG 提供语义化 `<title>`。
- 底部 Tab 固定，内容区底部预留安全区。
- 空状态提供明确操作按钮。
- 主按钮使用弥散阴影强化行动召唤。

### Don't
- 不使用 emoji 或 Unicode 图标。
- 不把 Tab 放在侧边或顶部。
- 不让内容区在 PC 浏览器全宽拉伸。
- 不一个页面使用超过 3 种主色。
- 不为装饰元素分配 `data-ui-id`。
- 不省略风险等级的颜色+文字双重提示。
- 不使用纯黑背景作为主界面。

---

## 8. Responsive Behavior

### 断点
- 标准手机：360-420px
- 大屏手机：420-480px

### 规则
- 内容区最大 420px，始终居中。
- 统计 2×2 网格保持。
- 快捷入口 4 列保持。
- 列表项文字截断，保留右侧操作。
- 底部 Tab Bar 宽度与 body 一致。

---

## 9. Semantic UI Binding

绑定 `.arkpilot/designs/ui-tree.json`。

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

### 关键语义目标

#### 首页
- `home-header-title`
- `home-stat-today-inspection`、`home-stat-pending-risk`、`home-stat-overdue-risk`、`home-stat-closed-rate`
- `home-quick-action-report`、`home-quick-action-inspection`、`home-quick-action-contact`
- `home-chart-risk-distribution`
- `home-recent-activity-list`、`home-empty-activity`

#### 巡检
- `inspection-segment-today/pending/history`
- `inspection-task-list`、`inspection-empty-task`、`inspection-add-task`
- `inspection-task-start-{id}`
- `inspection-detail-title`、`inspection-detail-checklist`
- `inspection-checkitem-pass-{id}`、`inspection-checkitem-fail-{id}`、`inspection-checkitem-note-{id}`
- `inspection-submit-result`

#### 隐患
- `risk-filter-all/pending/inprogress/review/closed`
- `risk-add-button`、`risk-search-input`、`risk-list`、`risk-empty-list`、`risk-item-{id}`
- `risk-detail-title`、`risk-detail-status`、`risk-detail-level`
- `risk-detail-progress-timeline`
- `risk-action-assign`、`risk-action-remind`、`risk-action-submit-fix`
- `risk-action-review-pass`、`risk-action-review-reject`

#### 上报隐患
- `report-risk-title-input`、`report-risk-type-picker`、`report-risk-level-picker`
- `report-risk-location-input`、`report-risk-desc-input`、`report-risk-photos`
- `report-risk-deadline-picker`、`report-risk-handler-picker`
- `report-risk-submit`

#### 应急
- `emergency-search-input`、`emergency-add-contact`
- `emergency-contact-list`、`emergency-empty-contact`
- `emergency-contact-call-{id}`

#### 我的
- `profile-avatar`、`profile-name`、`profile-role`
- `profile-setting-export`、`profile-setting-about`

### Events
保持 ui-tree.json 中所有事件名不变。

### 设计变更请求
- 建议在首页增加可选扩展 ID `home-chart-risk-trend`，不强制修改 ui-tree.json。

---

## 10. Iconography

- 全部使用 SVG；每个 `<svg>` 首子元素为 `<title>`，语义反映业务动作。
- 示例：
  - 首页 Tab：`<title>打开首页统计看板</title>`
  - 上报按钮：`<title>上报新的风险隐患</title>`
  - 一键拨号：`<title>拨打该应急联系人电话</title>`
- 尺寸：Tab 24px、列表类型 20px、按钮内 18px、装饰 40-120px。
- 描边 2px，端点/拐角 round。

---

## 11. Sample Data Notes

HTML artifacts 中示例数据仅用于视觉真实感，不作为产品默认数据。真实首运行应为空状态。
