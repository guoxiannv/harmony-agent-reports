# 平安扣 Pinankou 视觉设计系统 v1.1

## 1. Visual Theme & Atmosphere

平安扣是一款面向一线安全员的安全生产工具。视觉核心围绕“安全感”展开：冷静、秩序、可信赖，同时必须具备工业现场的高可读性。整体采用**深海蓝绿 + 薄荷青 + 冰川蓝**的渐变体系，避免廉价高饱和，也避免单调单色调；通过微妙的双色渐变、毛玻璃叠层和柔和的弥散阴影，让界面在户外强光或车间弱光下都能快速扫读。

设计语言既保留 Apple 式的克制层级，又加入更丰富的材质变化：
- 背景不是单一浅灰，而是**冷调浅灰 `#F4F7F9`**，让白色卡片自然浮出；
- 主按钮和 Hero 区使用**蓝绿极光渐变**，从 `#0891B2`（深海青）过渡到 `#34D399`（薄荷绿），营造“安全守护”的情绪；
- 卡片采用**多层材质**：纯白底 + 极淡内阴影 + 柔和外阴影，避免扁平单调；
- 状态色严格遵循语义，但用**低饱和色板**（如风险的“中”用琥珀 `#F59E0B` 但背景是极浅的 `#FFFBEB`），减少告警压迫感；
- 底部 Tab 使用**毛玻璃导航条**，带有微妙的顶部高光和投影，增强悬浮感；
- 图标全部使用线性 SVG，配合语义 title，确保测试和无障碍。

**Key Characteristics:**
- 主渐变：`linear-gradient(135deg, #0891B2 0%, #34D399 100%)`。
- 副渐变（用于卡片高光）：`linear-gradient(180deg, rgba(255,255,255,0.95) 0%, rgba(255,255,255,0.75) 100%)`。
- 页面背景：`#F4F7F9`。
- 卡片背景：`#FFFFFF` + 内阴影 `inset 0 1px 0 rgba(255,255,255,0.8)`。
- 主文字：`#0F172A`；正文：`#334155`；辅助：`#64748B`。
- 主按钮文字：白色；次要按钮：青蓝色 `#0E7490` 在 `#E0F2FE` 背景上。
- 圆角：卡片 18px、按钮 14px、输入框 12px、标签 8px、全胶囊 999px。
- 阴影层级：卡片 `0 6px 24px rgba(15,23,42,0.06)`，悬浮按钮 `0 10px 30px rgba(8,145,178,0.28)`，Hero 卡片 `0 16px 48px rgba(8,145,178,0.20)`。

---

## 2. Color Palette & Roles

### Primary
- **深海青** `#0891B2`：品牌主色，用于大标题强调、选中态、图标高亮。
- **薄荷绿** `#34D399`：正向完成、成功态、渐变的终点。
- **冰川蓝** `#38BDF8`：信息提示、图表辅助色、悬浮按钮阴影色。

### Gradient
- **主渐变（Hero / CTA）**：`linear-gradient(135deg, #0891B2 0%, #34D399 100%)`。
- **副渐变（ subtle 高光）**：`linear-gradient(135deg, #0EA5E9 0%, #22D3EE 100%)` —— 用于次要信息卡片。
- **玻璃底（Tab Bar / 顶部栏）**：`linear-gradient(180deg, rgba(255,255,255,0.90) 0%, rgba(255,255,255,0.70) 100%)` + `backdrop-filter: blur(24px)`。

### Functional
- **主按钮背景**：主渐变；文字 `#FFFFFF`。
- **次要按钮背景**：`#E0F2FE`；文字 `#0E7490`。
- **幽灵按钮**：透明背景 + 1px `#CBD5E1` 边框；文字 `#334155`。
- **危险**：`#EF4444` 文字/背景，浅底 `#FEE2E2`。
- **禁用**：背景 `#E2E8F0`；文字 `#94A3B8`。

### Text
- **页面标题**：`#0F172A`，24px，weight 700。
- **模块标题**：`#0F172A`，18px，weight 600。
- **正文**：`#334155`，14px，weight 400，line-height 1.55。
- **辅助/说明**：`#64748B`，12-13px。
- **占位符**：`#94A3B8`。
- **反白文字**：`#FFFFFF`，用于渐变和深色卡片。
- **链接/文字按钮**：`#0E7490`。

### Surface
- **页面背景**：`#F4F7F9`。
- **卡片背景**：`#FFFFFF`。
- **浅青底**：`#F0F9FF` 用于选中项、Hover/Pressed 状态。
- **浅绿底**：`#ECFDF5` 用于完成态背景。
- **分隔线**：`#E2E8F0`，1px。

### Risk Levels
| 等级 | 文字/图标色 | 浅色背景 | 说明 |
|---|---|---|---|
| 低 | `#16A34A` | `#DCFCE7` | 温和，不刺眼 |
| 中 | `#D97706` | `#FEF3C7` | 琥珀，提醒但不恐慌 |
| 高 | `#DC2626` | `#FEE2E2` | 明确警示 |
| 重大 | `#991B1B` | `#FECACA` | 最深红，最高优先级 |

### Status
| 状态 | 颜色 | 浅色背景 |
|---|---|---|
| 待整改 | `#64748B` | `#F1F5F9` |
| 整改中 | `#0EA5E9` | `#E0F2FE` |
| 待复核 | `#D97706` | `#FEF3C7` |
| 已关闭 | `#16A34A` | `#DCFCE7` |
| 逾期 | `#EA580C` | `#FFEDD5` |

### Shadows
- **卡片阴影**：`0 6px 24px rgba(15, 23, 42, 0.06)`。
- **卡片悬浮阴影**：`0 10px 32px rgba(15, 23, 42, 0.10)`。
- **主按钮阴影**：`0 10px 30px rgba(8, 145, 178, 0.28)`。
- **悬浮操作按钮阴影**：`0 12px 36px rgba(8, 145, 178, 0.32)`。
- **Hero 卡片阴影**：`0 16px 48px rgba(8, 145, 178, 0.20)`。
- **底部 Tab 阴影**：`0 -4px 16px rgba(15, 23, 42, 0.05)`。

---

## 3. Typography Rules

### Font Family
- 中文：`PingFang SC`, `Microsoft YaHei`, `Helvetica Neue`, Arial, sans-serif。
- 英文/数字：`SF Pro Display`（标题）、`SF Pro Text`（正文），fallback 到 `Helvetica Neue`, Arial。

### Hierarchy

| 角色 | 字号 | 字重 | 行高 | 字间距 | 颜色 |
|---|---|---|---|---|---|
| 页面大标题 | 24px | 700 | 1.22 | -0.3px | `#0F172A` |
| 模块标题 | 18px | 600 | 1.30 | -0.2px | `#0F172A` |
| 卡片标题 | 16px | 600 | 1.35 | 0 | `#0F172A` |
| 正文 | 14px | 400 | 1.55 | 0 | `#334155` |
| 辅助说明 | 12px | 400 | 1.45 | 0 | `#64748B` |
| 小标签 | 11px | 600 | 1.20 | 0 | 按语义 |
| 数据指标 | 32px | 700 | 1.10 | -0.5px | `#0F172A` |
| 数据指标（反白） | 32px | 700 | 1.10 | -0.5px | `#FFFFFF` |
| 按钮文字 | 15px | 600 | 1.00 | 0 | `#FFFFFF` 或 `#0E7490` |
| Tab 标签 | 11px | 500 | 1.20 | 0 | `#64748B` / 选中 `#0891B2` |

### Principles
- 数字指标使用更紧凑的负字间距，形成“仪表盘”观感。
- 正文行高 1.55，确保长备注在户外可读。
- 标题与正文之间通过颜色深浅和字重建立清晰层级。

---

## 4. Component Stylings

### Buttons

**主按钮（Primary CTA）**
- 背景：`linear-gradient(135deg, #0891B2 0%, #34D399 100%)`
- 文字：`#FFFFFF`，15px，weight 600
- 内边距：14px 28px
- 圆角：14px
- 阴影：`0 10px 30px rgba(8, 145, 178, 0.28)`
- 按压态：亮度降低 10%，缩放 0.98，阴影收缩
- 用于：上报隐患、提交巡检、保存联系人、提交整改

**次要按钮（Secondary）**
- 背景：`#E0F2FE`
- 文字：`#0E7490`，15px，weight 600
- 内边距：14px 28px
- 圆角：14px
- 用于：取消、返回、编辑

**幽灵按钮（Ghost）**
- 背景：透明
- 边框：1px solid `#CBD5E1`
- 文字：`#334155`
- 用于：筛选标签未选中、次级操作

**文字按钮（Text Button）**
- 背景：透明
- 文字：`#0E7490`，14px，weight 500
- 用于：查看更多、催办、切换

**危险按钮（Destructive）**
- 背景：`#FEE2E2`
- 文字：`#DC2626`，15px，weight 600
- 用于：删除、复核不通过

### Cards

**Hero 欢迎卡**
- 背景：主渐变
- 圆角：20px
- 内边距：22px
- 阴影：`0 16px 48px rgba(8, 145, 178, 0.20)`
- 文字反白，左侧标题 20px + 副标题 14px，右侧装饰性盾牌/勾图标（40px 反白描边 SVG）
- 内部可加一层半透明噪点/高光纹理，增强质感

**统计指标卡（2×2 网格）**
- 背景：`#FFFFFF`
- 圆角：18px
- 内边距：16px
- 阴影：`0 6px 24px rgba(15, 23, 42, 0.06)`
- 顶部小图标 20px（颜色按指标语义）
- 标题：12px `#64748B`
- 数值：28px `#0F172A` weight 700
- 底部趋势标签：11px，圆角 999px

**列表项卡片**
- 背景：`#FFFFFF`
- 圆角：14px
- 内边距：14px 16px
- 阴影：`0 4px 16px rgba(15, 23, 42, 0.05)`
- 左侧：类型图标 36px 圆形背景（浅色语义底）
- 中间：标题 15px + 副标题 13px + 徽章
- 右侧：状态/箭头
- 点击态：背景轻微变深 `#F8FAFC`

**风险详情时间线卡片**
- 时间线：左侧 24px 宽轨道，节点 10px 圆点
- 已完成节点：`#34D399`，当前节点：`#0891B2`，未完成：`#CBD5E1`
- 内容卡片：背景 `#F8FAFC`，圆角 12px，内边距 14px
- 标题 14px weight 600，时间 12px `#64748B`，说明 13px `#334155`

**表单分组卡片**
- 背景：`#FFFFFF`
- 圆角：16px
- 内边距：16px
- 标题 16px weight 600 + 14px 分组说明
- 表单项垂直排列，间距 16px

### Inputs

**文本输入框**
- 背景：`#FFFFFF`
- 边框：1px solid `#E2E8F0`
- 圆角：12px
- 内边距：13px 15px
- 字体：14px `#334155`
- 聚焦：边框色 `#0891B2`，外加 `0 0 0 3px rgba(8, 145, 178, 0.12)` 光晕
- 占位符：`#94A3B8`

**搜索框**
- 背景：`#F1F5F9`
- 无边框
- 圆角：999px
- 内边距：10px 16px
- 左侧搜索图标 18px `#94A3B8`
- 右侧清空按钮（有内容时显示）

**选择器（Picker）**
- 外观同输入框，右侧带向下箭头图标
- 点击后从底部弹出选择 Sheet，背景毛玻璃

**照片上传区域**
- 背景：`#F8FAFC`
- 边框：2px dashed `#CBD5E1`
- 圆角：12px
- 占位：相机图标 + “点击拍照或从相册选择”
- 已选照片：横向滚动，缩略图 72px 圆角 10px

### Badges & Chips

**风险等级徽章**
- 内边距：4px 9px
- 圆角：8px
- 字号：11px，weight 600
- 颜色与浅色背景按风险等级表

**筛选标签（Filter Chip）**
- 默认：背景 `#F1F5F9`，文字 `#64748B`
- 选中：背景 `#E0F2FE`，文字 `#0E7490`，1px 实线边框 `#0891B2`
- 圆角：999px
- 内边距：6px 14px

**状态徽章**
- 形状同风险徽章，颜色按状态表
- 已关闭带勾选小图标

### Navigation

**底部 Tab Bar**
- 背景：毛玻璃 `linear-gradient(180deg, rgba(255,255,255,0.92) 0%, rgba(255,255,255,0.78) 100%)` + `backdrop-filter: blur(24px)`
- 高度：68px（含底部安全区）
- 顶部 1px 高光线：`rgba(255,255,255,0.8)`
- 上阴影：`0 -4px 16px rgba(15, 23, 42, 0.05)`
- 5 个 Tab：首页、巡检、隐患、应急、我的
- 图标 24px，标签 11px，未选中 `#94A3B8`，选中 `#0891B2`
- 中央“+”快捷上报按钮：圆形 56px，主渐变背景，白色加号图标，悬浮于 Tab Bar 上方 10px，阴影 `0 12px 36px rgba(8, 145, 178, 0.32)`

**顶部 AppBar**
- 背景：页面背景或白色
- 高度：56px
- 左侧：返回箭头（非根页面）+ 页面标题 18px weight 600
- 右侧：搜索/添加/更多图标 24px

### Empty States
- 居中插画：线性 SVG，主色渐变描边，尺寸 120px
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
- 内容区最大宽度：390px（标准手机），上限 420px
- 水平居中
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
| Level 0 | 无阴影，贴合背景 | 普通文本区域 |
| Level 1 | `0 4px 16px rgba(15,23,42,0.05)` | 列表项卡片 |
| Level 2 | `0 6px 24px rgba(15,23,42,0.06)` | 统计卡片 |
| Level 3 | `0 10px 32px rgba(15,23,42,0.10)` | 列表项悬浮态 |
| Level 4 | `0 10px 30px rgba(8,145,178,0.28)` | 主按钮 |
| Level 5 | `0 12px 36px rgba(8,145,178,0.32)` | 悬浮快捷按钮 |
| Level 6 | `0 16px 48px rgba(8,145,178,0.20)` | Hero 渐变卡片 |
| Glass | 毛玻璃 + 模糊 24px | 底部 Tab Bar、顶部筛选栏 |

---

## 7. Do's and Don'ts

### Do
- 使用深海青到薄荷绿的渐变作为品牌核心。
- 卡片使用圆角 14-18px + 柔和阴影，避免死板扁平。
- 风险/状态色遵循语义，且用浅色底降低压迫感。
- 为每个 SVG 提供语义化 `<title>`。
- 底部 Tab 固定，内容区底部预留安全区。
- 在空状态提供明确操作按钮。
- 主按钮使用弥散阴影提升行动召唤感。

### Don't
- 不使用 emoji 或 Unicode 图标。
- 不把 Tab 放在侧边或顶部（底部固定）。
- 不让内容区在 PC 浏览器全宽拉伸。
- 不一个页面使用超过 3 种主色。
- 不为装饰元素分配 `data-ui-id`。
- 不省略风险等级的颜色+文字双重提示。
- 不使用纯黑背景作为主界面，避免工业现场的眩光问题。

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
- 底部 Tab Bar 宽度与 body 一致，不超出内容区。

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
- 建议在首页增加 `home-chart-risk-trend` 作为趋势图容器 ID（可选扩展），不强制修改 ui-tree.json。

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
