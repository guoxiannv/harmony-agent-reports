# 宠迹·PawLog 设计对齐计划

## 1. Visual Inputs

| 输入类型 | 路径 |
|----------|------|
| 产品规格 | `.arkpilot/autopilot/spec.md` |
| 语义 UI 协议 | `.arkpilot/designs/ui-tree.json` |
| 视觉设计定稿 | `.arkpilot/designs/DESIGN2.md` |
| 首页 | `.arkpilot/designs/page-home-page.html` |
| 记录页 | `.arkpilot/designs/page-records-page.html` |
| 趋势页 | `.arkpilot/designs/page-trends-page.html` |
| 照护页 | `.arkpilot/designs/page-care-page.html` |
| 我的页 | `.arkpilot/designs/page-profile-page.html` |
| 宠物选择 Sheet | `.arkpilot/designs/page-pet-picker-sheet.html` |
| 添加记录 Sheet | `.arkpilot/designs/page-add-record-sheet.html` |
| 饮食记录 Sheet | `.arkpilot/designs/page-record-diet-sheet.html` |
| 排泄记录 Sheet | `.arkpilot/designs/page-record-stool-sheet.html` |
| 体重记录 Sheet | `.arkpilot/designs/page-record-weight-sheet.html` |
| 用药记录 Sheet | `.arkpilot/designs/page-record-meds-sheet.html` |
| 提醒详情页 | `.arkpilot/designs/page-reminder-detail-page.html` |
| 病历详情页 | `.arkpilot/designs/page-medical-case-page.html` |
| 病历编辑页 | `.arkpilot/designs/page-medical-case-editor-page.html` |
| 家庭共享 Sheet | `.arkpilot/designs/page-family-invite-sheet.html` |
| 宠物编辑页 | `.arkpilot/designs/page-pet-editor-page.html` |

## 2. Semantic UI Binding

### Surfaces, Routes, Tabs

| Surface ID | Page ID | Route | Tab ID | HTML Artifact |
|------------|---------|-------|--------|---------------|
| home | home-page | pages/Home | tab-home | page-home-page.html |
| records | records-page | pages/Records | tab-records | page-records-page.html |
| trends | trends-page | pages/Trends | tab-trends | page-trends-page.html |
| care | care-page | pages/Care | tab-care | page-care-page.html |
| profile | profile-page | pages/Profile | tab-profile | page-profile-page.html |
| pet-picker | pet-picker-sheet | (sheet) | - | page-pet-picker-sheet.html |
| add-record | add-record-sheet | (sheet) | - | page-add-record-sheet.html |
| record-diet | record-diet-sheet | (sheet) | - | page-record-diet-sheet.html |
| record-stool | record-stool-sheet | (sheet) | - | page-record-stool-sheet.html |
| record-weight | record-weight-sheet | (sheet) | - | page-record-weight-sheet.html |
| record-meds | record-meds-sheet | (sheet) | - | page-record-meds-sheet.html |
| reminder-detail | reminder-detail-page | pages/ReminderDetail | - | page-reminder-detail-page.html |
| medical-case | medical-case-page | pages/MedicalCase | - | page-medical-case-page.html |
| medical-case-editor | medical-case-editor-page | pages/MedicalCaseEditor | - | page-medical-case-editor-page.html |
| family-invite | family-invite-sheet | (sheet) | - | page-family-invite-sheet.html |
| pet-editor | pet-editor-page | pages/PetEditor | - | page-pet-editor-page.html |

### Action / Input / Assertion IDs to Preserve

#### 首页
- `home-pet-switcher` → 打开宠物选择器
- `home-add-pet-button` → 打开宠物编辑页
- `home-current-pet-avatar` / `home-current-pet-name` → 当前宠物展示
- `home-quick-diet` / `home-quick-stool` / `home-quick-weight` / `home-quick-meds` → 一键记录入口
- `home-today-summary-list` / `home-summary-{type}` → 今日汇总网格
- `home-reminder-list` / `home-reminder-{id}` → 近期提醒列表
- `home-empty-state` → 无宠物空状态

#### 记录页
- `records-filter-all` / `records-filter-diet` / `records-filter-stool` / `records-filter-weight` / `records-filter-meds`
- `records-list` / `records-item-{id}`
- `records-add-button`

#### 趋势页
- `trends-tab-weight` / `trends-tab-diet` / `trends-tab-stool`
- `trends-period-week` / `trends-period-month`
- `trends-chart`
- `trends-stats-list` / `trends-stat-{key}`
- `trends-empty-state`

#### 照护页
- `care-tab-reminders` / `care-tab-medical`
- `care-reminder-list` / `care-reminder-{id}` / `care-reminder-add`
- `care-medical-list` / `care-medical-{id}` / `care-medical-add`

#### 我的页
- `profile-manage-pets` / `profile-family` / `profile-settings` / `profile-about`
- `profile-avatar` / `profile-nickname`

#### Sheet / 详情 / 编辑页
- `pet-picker-list` / `pet-picker-item-{id}` / `pet-picker-add` / `pet-picker-close`
- `add-record-diet` / `add-record-stool` / `add-record-weight` / `add-record-meds` / `add-record-close`
- `record-diet-*` / `record-stool-*` / `record-weight-*` / `record-meds-*`（含 save/close/input）
- `reminder-detail-*`（title/due/status/mark-done/edit/delete/back）
- `medical-case-*`（title/date/hospital/diagnosis/images/edit/back）
- `medical-editor-*`（title-input/date/hospital/diagnosis/note/add-image/save/back）
- `family-invite-code` / `family-invite-copy` / `family-member-list` / `family-member-{id}` / `family-invite-close`
- `pet-editor-*`（avatar/name/species/breed/birthday/gender/neutered/weight/notes/save/back）

### Event Names to Preserve

`open-pet-picker`, `open-pet-editor`, `open-add-record`, `open-record-diet`, `open-record-stool`, `open-record-weight`, `open-record-meds`, `save-record-diet`, `save-record-stool`, `save-record-weight`, `save-record-meds`, `filter-records-all`, `filter-records-diet`, `filter-records-stool`, `filter-records-weight`, `filter-records-meds`, `switch-trends-weight`, `switch-trends-diet`, `switch-trends-stool`, `set-period-week`, `set-period-month`, `switch-care-reminders`, `switch-care-medical`, `open-reminder-editor`, `mark-reminder-done`, `delete-reminder`, `open-medical-editor`, `save-medical-case`, `pick-medical-image`, `open-family-invite`, `copy-invite-code`, `open-settings`, `open-about`, `close-sheet`, `navigate-back`, `save-pet`。

## 3. Visual Requirements

### Color Tokens
- 主色：`#3FC0A0`（薄荷绿 600）、`#5ED7B6`（薄荷绿 500）
- 辅色：`#FFB3C1`（肉垫粉 500）、`#FF9AAE`（肉垫粉 600）
- 功能色：`#FFD166`（阳光黄）、`#87CEEB`（天空蓝）、`#B8B8E0`（薰衣草紫）、`#F4D0A4`（奶油杏）
- 中性色：`#163832`（深森绿 900，主文本）、`#3D5A52`（深森绿 700）、`#6F8983`（深森绿 500）
- 背景：`#FAFDFC`（页面底）、`#FFFFFF`（卡片面）

### Typography
- 标题：18-22px，weight 700-800
- 正文：15px，weight 400，line-height 1.55-1.6
- 标签/辅助：12-13px，weight 500-600
- 数字使用 tabular-nums

### Spacing
- 页面水平 padding：16px
- 卡片间距：16px
- 卡片内部 padding：16-20px
- 列表项间距：10-12px
- 底部 Tab Bar 高度：68px + safe area

### Elevation
- 标准卡片：`0 6px 22px rgba(22,56,50,0.05), 0 2px 8px rgba(22,56,50,0.04)`
- 玻璃卡片：半透明 + `backdrop-filter: blur(20px) saturate(150%)` + 白色内描边
- 主按钮阴影：`0 8px 24px rgba(63,192,160,0.36)` + inset 高光
- Sheet overlay：`rgba(22,56,50,0.35)`

### Radius
- 卡片：24px
- 按钮/主 CTA：28px
- 输入框：16px
- 头像/图标容器：14-18px
- 快捷按钮：24px

### Icons
- 全部使用 SVG，禁止 emoji。
- 每个 SVG 必须包含语义化 `<title>` 作为第一个子元素。
- Tab 图标使用 stroke 风格，24px。

### Per-Page Polish Notes

#### 首页
- 顶部宠物切换条横向可滚动，当前选中宠物头像外环使用薄荷绿到肉垫粉渐变。
- 汇总卡片使用 Glass Card 效果。
- 四大快捷入口分别使用不同辅色底 + 渐变图标容器。
- 提醒卡片区分 urgent / normal / done 三种视觉状态。

#### 记录页
- 顶部筛选 chip 选中态使用薄荷绿 100 底 + 薄荷绿 500 边框。
- 时间轴按日期分组，日期左侧带小圆点。
- 每种记录类型有专属图标背景色与标签色。

#### 趋势页
- 图表使用面积图 + 渐变填充 + 圆润数据点 + 虚线网格。
- 统计卡片使用四色区分（最新/平均/最高/最低）。
- 周期切换与维度切换使用 chip 样式。

#### 照护页
- 提醒列表左侧 4px 状态条，urgent 使用肉垫粉，normal 使用薄荷绿，done 使用阳光黄。
- 病历卡片使用薰衣草紫 100 背景 + 薰衣草紫 500 图标容器。
- 病历缩略图 56px，12px 圆角。

#### 我的页
- 用户信息卡片使用毛玻璃渐变。
- 家庭成员卡片使用肉垫粉 100 背景。
- 菜单项左侧彩色图标容器，右侧箭头。

#### Sheet 表单
- 顶部 28px 圆角，白色背景。
- 表单输入框使用薄荷绿 50 底，focus 时带薄荷绿光环。
- 保存按钮使用主色渐变大圆角药丸按钮。

#### 详情页
- 提醒详情页顶部使用urgent色大卡片。
- 病历详情页使用薰衣草紫系卡片 + 图片网格。

## 4. Non-Negotiable Constraints

1. **语义 ID 不可改**：所有 `data-ui-id` 必须与 `ui-tree.json` 中的 ID 一致；page ID、route、tab ID、事件名不得静默修改。
2. **HTML 为最终视觉参考**：ArkTS 实现应以 HTML artifact 的视觉层级、颜色、圆角、阴影为准。
3. **ui-tree.json 是语义协议而非布局树**：允许 ArkTS 实现使用不同的布局容器/组件嵌套，只要语义目标和事件绑定正确。
4. **底部 Tab 固定**：Tab 导航必须在底部，宽度不超过 390vp/420vp，禁止侧边或顶部导航。
5. **无种子数据**：首次运行必须真实空状态；HTML 中的示例数据仅作视觉参考。
6. **SVG 语义化**：每个 inline SVG 必须有 `<title>`，且 title 反映业务语义而非图形描述。
7. **目标设备**：1272vp × 2756vp 普通手机，内容区 max-width 390-420vp 居中。
8. **不要超范围**：本计划不引入云端同步、AI 诊断、硬件接入、社交商城等功能。

## 5. HTML-to-ArkUI Mapping Notes

| HTML 元素/效果 | ArkUI 映射建议 |
|----------------|----------------|
| `max-width: 390px; margin: 0 auto` | `Column().width('100%').maxWidth(390).constraintSize({ maxWidth: 390 })`；外层容器居中 |
| 底部固定 Tab Bar | `Row().position({ x: 0, y: '100%' }).translate({ y: '-100%' }).width('100%').height(Theme.bottomTabHeight)` 或 `Tabs` + `TabContent` |
| Glass Card | `Stack` + `Blur` + `Background` + 半透明色 |
| 主按钮渐变 | `LinearGradient` + `borderRadius` + `shadow` |
| 快捷按钮网格 | `Grid()` 或 `Flex({ justifyContent: FlexAlign.SpaceAround })` |
| 图表区域 | 使用 `Shape` / `Polyline` / `Path` 自定义绘制，或接入图表库 |
| Sheet | `bindSheet` / `bindMenu` / 自定义 `Stack` 层 + 底部滑入动画 |
| 输入框 focus 光环 | `.focusStyle()` 或自定义 `stateStyles` |
| 宠物头像外环 | `Stack` 嵌套：外层 `Circle` 渐变，内层 `Image` 圆形裁剪 |
| 状态徽章 | `Text().backgroundColor().borderRadius()` |

## 6. Semantic Change Requests

- 无。
