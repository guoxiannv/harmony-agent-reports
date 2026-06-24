# 平安扣 Pinankou - 设计对齐计划

## 1. Visual Inputs

- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Artifact**: `.arkpilot/designs/DESIGN2.md`
- **Reference Template**: `references/TEMPLATE_DESIGN.md`
- **HTML Artifacts**:
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-hazard-page.html`
  - `.arkpilot/designs/page-hazard-detail-page.html`
  - `.arkpilot/designs/page-hazard-edit-page.html`
  - `.arkpilot/designs/page-patrol-page.html`
  - `.arkpilot/designs/page-contacts-page.html`
  - `.arkpilot/designs/page-stats-page.html`
  - `.arkpilot/designs/page-profile-page.html`
- **Route-worthy Page List**: home-page, hazard-page, patrol-page, contacts-page, stats-page, profile-page（均有 Tab）；hazard-detail-page 与 hazard-edit-page 为子页面栈。

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home-page | home-page | pages/Home | tab-home |
| hazard-page | hazard-page | pages/Hazard | tab-hazard |
| hazard-detail-page | hazard-detail-page | pages/HazardDetail | - |
| hazard-edit-page | hazard-edit-page | pages/HazardEdit | - |
| patrol-page | patrol-page | pages/Patrol | tab-patrol |
| contacts-page | contacts-page | pages/Contacts | tab-contacts |
| stats-page | stats-page | pages/Stats | tab-stats |
| profile-page | profile-page | pages/Profile | tab-profile |

### Action / Input / Assertion IDs to Preserve in ArkTS `.id(...)`

| ID | Role | Event / Binding |
|----|------|-----------------|
| home-add-hazard-button | action | navigate-to-hazard-edit |
| home-start-patrol-button | action | navigate-to-patrol |
| home-emergency-call-button | action | call-primary-emergency-contact |
| home-summary-pending-count | assertion | /summary/pendingHazards |
| home-summary-today-patrol-count | assertion | /summary/todayPatrols |
| home-summary-completion-rate | assertion | /summary/completionRate |
| home-todo-list | list | /todos |
| home-notification-button | action | open-notifications |
| hazard-create-button | action | navigate-to-hazard-edit |
| hazard-search-input | input | /hazards/filter/keyword |
| hazard-status-filter | input | /hazards/filter/status |
| hazard-list | list | /hazards |
| hazard-empty-state | assertion | - |
| hazard-detail-back-button | action | navigate-back |
| hazard-detail-edit-button | action | navigate-to-hazard-edit |
| hazard-detail-title | assertion | /hazard/title |
| hazard-detail-status | assertion | /hazard/status |
| hazard-detail-urge-button | action | urge-rectification |
| hazard-detail-accept-button | action | accept-rectification |
| hazard-detail-progress-list | list | /hazard/progress |
| hazard-edit-back-button | action | navigate-back |
| hazard-edit-title-input | input | /hazardForm/title |
| hazard-edit-location-input | input | /hazardForm/location |
| hazard-edit-level-picker | input | /hazardForm/level |
| hazard-edit-description-input | input | /hazardForm/description |
| hazard-edit-photo-button | action | take-photo |
| hazard-edit-assignee-picker | input | /hazardForm/assignee |
| hazard-edit-deadline-picker | input | /hazardForm/deadline |
| hazard-edit-save-button | action | save-hazard |
| patrol-route-list | list | /patrol/routes |
| patrol-start-button | action | start-patrol |
| patrol-checkpoint-list | list | /patrol/checkpoints |
| patrol-checkin-button | action | checkin-patrol-point |
| patrol-report-abnormal-button | action | report-abnormal-at-checkpoint |
| patrol-complete-button | action | complete-patrol |
| contacts-search-input | input | /contacts/filter/keyword |
| contacts-group-filter | input | /contacts/filter/group |
| contacts-list | list | /contacts |
| contacts-call-button | action | call-contact |
| contacts-add-button | action | add-contact |
| stats-time-filter | input | /stats/filter/timeRange |
| stats-hazard-total | assertion | /stats/hazardTotal |
| stats-completion-rate | assertion | /stats/completionRate |
| stats-patrol-coverage | assertion | /stats/patrolCoverage |
| stats-trend-chart | assertion | /stats/trend |
| stats-rank-list | list | /stats/rank |
| profile-avatar | assertion | /profile/avatar |
| profile-name | assertion | /profile/name |
| profile-settings-button | action | open-settings |
| profile-sync-button | action | sync-data |
| profile-about-button | action | open-about |

### Repeated Item ID Patterns

| List ID | Item Pattern |
|---------|--------------|
| home-todo-list | home-todo-{id} |
| hazard-list | hazard-item-{id} |
| hazard-detail-progress-list | hazard-progress-{id} |
| patrol-route-list | patrol-route-{id} |
| patrol-checkpoint-list | patrol-checkpoint-{id} |
| contacts-list | contact-item-{id} |
| stats-rank-list | stats-rank-{id} |

### Event Names Preserved

navigate-to-hazard-edit, navigate-to-patrol, call-primary-emergency-contact, open-notifications, navigate-back, save-hazard, take-photo, urge-rectification, accept-rectification, start-patrol, checkin-patrol-point, report-abnormal-at-checkpoint, complete-patrol, call-contact, add-contact, open-settings, sync-data, open-about.

## 3. Visual Requirements

### Color Tokens

- **品牌主色**: `#0D9488`（Teal 600）
- **品牌渐变**: `linear-gradient(135deg, #0F766E 0%, #14B8A6 50%, #2DD4BF 100%)`
- **页面背景**: `linear-gradient(180deg, #F0F9FF 0%, #F0FDFA 50%, #F0F4F8 100%)`
- **卡片背景**: `#FFFFFF`
- **卡片边框**: `1px solid #E2E8F0`
- **深色卡片**: `linear-gradient(135deg, #0F766E 0%, #134E4A 100%)`，内发光边框 `1px solid rgba(45,212,191,0.28)`
- **玻璃**: `rgba(255,255,255,0.82)` + `backdrop-filter: blur(24px) saturate(170%)`
- **成功/警告/危险/信息**: `#10B981` / `#F59E0B` / `#F43F5E` / `#3B82F6`
- **文字**: 标题 `#0F172A`、正文 `#334155`、次要 `#64748B`、禁用 `#94A3B8`、反白 `#FFFFFF` / `rgba(255,255,255,0.74)`

### Typography

- 页面标题 22px / 700
- 区块标题 16-18px / 700
- 卡片标题 16px / 600
- 正文 15px / 400 / line-height 1.5
- 标签/徽章 11-13px
- 数据大数字 28-34px / 700 / -0.5px letter-spacing

### Spacing

- 页面水平内边距 16px
- 内容最大宽度 420px，居中
- 卡片间距 10-14px
- 区块间距 18-24px
- 底部预留 TabBar 安全区

### Elevation

- 普通卡片：`0 6px 20px rgba(15,23,42,0.05)`
- 悬浮/ hover：`0 10px 28px rgba(15,23,42,0.08)` + `translateY(-2px)`
- 主按钮：`0 4px 12px rgba(13,148,136,0.24)`
- FAB：`0 6px 20px rgba(13,148,136,0.40)`
- 底部 Sheet：`0 -8px 30px rgba(15,23,42,0.10)`

### Radius

- 卡片 18-20px
- 按钮 12-14px
- 输入框 12px
- 徽章 999px（pill）
- 头像/圆形按钮 50%

### Per-Page Polish Notes

#### 工作台（home-page）
- 顶部深青渐变横幅：问候语 + 通知铃铛
- 横幅下方重叠 3 个横向数据卡片（前两个白色，第三个深色强调）
- 快捷入口 4 列网格：新建隐患、开始巡检、一键呼救、更多
- 今日待办列表带左侧状态色竖条
- HTML 中首页首屏高度约 560vp

#### 隐患管理（hazard-page）
- 搜索栏 + 横向滚动状态筛选 pill
- 隐患卡片左侧 5px 状态色竖条（高/中/低/已完成）
- 右下角 FAB 新建
- 空状态需引导新建

#### 隐患详情（hazard-detail-page）
- 顶部深色渐变英雄区：标题 + 等级徽章 + 状态徽章
- 2 列信息网格：位置、上报人、责任人、截止时间
- 整改时间线：左侧竖线 + 圆点
- 底部双按钮：催办（secondary）+ 验收通过（primary）

#### 隐患编辑（hazard-edit-page）
- 表单分组：基本信息 / 现场照片 / 指派信息
- 拍照上传区域使用虚线边框
- 底部固定保存按钮

#### 巡检打卡（patrol-page）
- 当前路线深色卡片：名称、点位数、进度条、开始巡检按钮
- 点位列表：已完成青绿勾、未完成空心圆、打卡按钮
- 底部 Sheet：上报异常 / 扫码 / 完成巡检

#### 应急联系人（contacts-page）
- 搜索 + 分组筛选 pill
- 联系人卡片：头像（首字）+ 姓名 + 角色电话 + 渐变呼叫按钮

#### 统计看板（stats-page）
- 时间筛选（本周/本月/本年）
- 顶部 3 个深色指标卡片横向滑动
- 趋势图占位：浅青到天蓝渐变面积图
- 区域排名列表带奖牌色数字

#### 我的（profile-page）
- 顶部深色用户信息卡片：渐变头像环 + 姓名 + 角色
- 菜单列表：设置、同步数据、关于

### Responsive Constraints

- 基准宽度 390px，最大宽度 420px
- 所有内容居中，禁止 PC 全宽拉伸
- TabBar 宽度与 body 一致，居中固定
- 字号不随宽度放大

### HTML-to-ArkUI Mapping Notes

- HTML 中 `.app-shell` 对应 ArkUI `Column` 容器，限制 `maxWidth('100%')` 与 `constraintSize({ maxWidth: 420 })`
- 顶部横幅使用 `LinearGradient` 背景 + `Column`
- 卡片使用 `Column` + `borderRadius(20)` + `shadow()` + `border({ width: 1, color: '#E2E8F0' })`
- 底部 TabBar 使用 `Tabs` 组件，TabContent 对应各页面；或自定义 `Row` 固定在底部
- 列表使用 `List` + `ListItem`，item ID 通过 `ListItem` 的 `.id()` 绑定
- 趋势图占位先用自定义 `Shape` / `Path` 或柱状图组件实现，不引入第三方
- 头像环使用 `Stack` 嵌套圆形 `Shape`

## 4. Non-Negotiable Constraints

1. **不要修改语义 ID、page ID、route、tab ID 或事件名**。
2. HTML 产物作为最终视觉参考，ArkTS 实现需还原其布局、颜色、圆角、阴影、渐变与图标。
3. `ui-tree.json` 是语义绑定协议，不是布局树；允许视觉层级与 HTML 中实际 DOM 结构自由组织。
4. 所有 ArkTS 交互与断言目标必须绑定到正确的 `data-ui-id` 对应 ID。
5. 不要在本阶段添加未记录的功能行为、数据模型变更或脚手架假设。
6. 不要生成 HarmonyOS 源码或实现计划；本计划仅用于设计到执行的对齐。
7. 每个 inline SVG 必须带有语义化 `<title>`；实现阶段如使用 SymbolFont / 本地 SVG，需保持语义可访问。

## 5. Change Requests

- 无。`ui-tree.json` 已覆盖全部页面与核心交互语义目标。

## 6. Verification Evidence

- `spec.md` 包含强制 Target Device 声明。
- `ui-tree.json` 为合法 JSON，包含所有 route-worthy surfaces 及子页面。
- `DESIGN.md`、`DESIGN1.md`、`DESIGN2.md` 已生成并遵循 TEMPLATE_DESIGN.md 结构。
- 8 个 HTML 设计产物已生成，每个 route-worthy surface 与子页面均有对应文件。
- 所有 inline SVG 均包含 `<title>` 首子元素。
- 内容宽度限制在 420px 内，底部 TabBar 不侧边、不全宽拉伸。
