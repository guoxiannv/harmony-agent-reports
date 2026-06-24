# PawLog 视觉对齐计划

## 1. Visual Inputs

- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Spec**: `.arkpilot/designs/DESIGN2.md`
- **HTML Artifacts**:
  - `page-home-page.html`
  - `page-pets-page.html`
  - `page-pet-detail-page.html`
  - `page-records-page.html`
  - `page-trends-page.html`
  - `page-health-page.html`
  - `page-family-page.html`
  - `page-add-record-page.html`
  - `page-add-pet-page.html`
  - `page-add-reminder-page.html`
  - `page-add-medical-page.html`
- **Route-worthy Pages**: home-page, pets-page, records-page, trends-page, health-page, family-page, pet-detail-page, add-record-page, add-pet-page, add-reminder-page, add-medical-page

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs

| Page ID | Route | Tab ID |
|---|---|---|
| home-page | pages/Home | tab-home |
| pets-page | pages/Pets | tab-pets |
| pet-detail-page | pages/PetDetail | — |
| records-page | pages/Records | tab-records |
| trends-page | pages/Trends | tab-trends |
| health-page | pages/Health | tab-health |
| family-page | pages/Family | tab-family |
| add-record-page | pages/AddRecord | — |
| add-pet-page | pages/AddPet | — |
| add-reminder-page | pages/AddReminder | — |
| add-medical-page | pages/AddMedical | — |

### Action / Input / Assertion IDs to Preserve in ArkTS `.id(...)`

**Home**
- `home-pet-switcher`, `home-add-pet-button`, `home-quick-record-food`, `home-quick-record-waste`, `home-quick-record-weight`, `home-quick-record-medicine`, `home-floating-record-button`, `home-empty-add-pet`
- Assertions: `home-today-food-count`, `home-today-waste-count`, `home-latest-weight`, `home-today-medicine-count`
- Lists: `home-reminder-list` (items `home-reminder-{id}`), `home-recent-record-list` (items `home-record-{id}`)

**Pets**
- `pets-add-button`, `pets-list` (items `pets-item-{id}`)

**Pet Detail**
- `pet-detail-back`, `pet-detail-edit`, `pet-detail-delete`, `pet-detail-add-record`
- Assertions: `pet-detail-name`, `pet-detail-avatar`, `pet-detail-info-breed`, `pet-detail-info-age`, `pet-detail-info-weight`
- List: `pet-detail-record-list` (items `pet-detail-record-{id}`)

**Records**
- `records-filter-pet`, `records-filter-type`, `records-add-button`
- List: `records-list` (items `records-item-{id}`)

**Trends**
- `trends-pet-selector`, `trends-metric-selector`, `trends-period-7d`, `trends-period-30d`, `trends-period-90d`
- Assertions: `trends-chart`, `trends-summary-value`

**Health**
- `health-add-reminder`, `health-add-medical`
- Lists: `health-reminder-list` (items `health-reminder-{id}`, toggles `health-reminder-{id}-toggle`), `health-medical-list` (items `health-medical-{id}`)

**Family**
- `family-invite-button`, `family-share-toggle`
- List: `family-member-list` (items `family-member-{id}`, removes `family-member-{id}-remove`)

**Forms**
- Add record: `add-record-back`, `add-record-pet-picker`, `add-record-type-food/waste/weight/medicine`, `add-record-value`, `add-record-datetime`, `add-record-note`, `add-record-save`, `add-record-cancel`
- Add pet: `add-pet-back`, `add-pet-avatar`, `add-pet-name`, `add-pet-breed`, `add-pet-birthday`, `add-pet-gender`, `add-pet-weight`, `add-pet-save`, `add-pet-cancel`
- Add reminder: `add-reminder-back`, `add-reminder-pet-picker`, `add-reminder-type-vaccine`, `add-reminder-type-deworm`, `add-reminder-name`, `add-reminder-date`, `add-reminder-repeat`, `add-reminder-save`, `add-reminder-cancel`
- Add medical: `add-medical-back`, `add-medical-pet-picker`, `add-medical-date`, `add-medical-hospital`, `add-medical-diagnosis`, `add-medical-prescription`, `add-medical-attachment`, `add-medical-save`, `add-medical-cancel`

### Events to Preserve

`open-pet-switcher`, `navigate-add-pet`, `quick-record-*`, `navigate-pet-detail`, `delete-pet`, `open-add-record`, `filter-by-pet`, `filter-by-type`, `select-pet-for-trend`, `select-metric`, `select-period-7d/30d/90d`, `navigate-add-reminder`, `navigate-add-medical`, `toggle-reminder`, `open-medical-detail`, `invite-family-member`, `toggle-family-share`, `remove-family-member`, `navigate-back`, `select-pet`, `select-record-type-*`, `input-record-*`, `save-record`, `cancel-record`, `select-avatar`, `input-pet-*`, `select-pet-gender`, `save-pet`, `cancel-pet`, `select-reminder-type-*`, `input-reminder-*`, `save-reminder`, `cancel-reminder`, `input-medical-*`, `add-medical-attachment`, `save-medical`, `cancel-medical`

### Repeated Item ID Strategy

- 列表容器使用 `data-ui-id` 对应 list role 的 id。
- 列表项 id 模板在 ui-tree 中定义，渲染时把 `{id}` 替换为实体 ID（如 UUID、数据库主键或索引）。
- Empty/loading/error 状态使用 ui-tree 中定义的 `emptyStateId` 作为断言目标。

## 3. Visual Requirements

### Color Tokens

| Token | Hex / Value | Usage |
|---|---|---|
| mint-500 | `#7FDEB8` | 主品牌、按钮、导航选中、曲线 |
| mint-400 | `#9BE8CA` | 渐变起点、hover |
| mint-50 | `#EEFCF6` | 页面背景、卡片浅色底 |
| mint-700 | `#4BBF9A` | 深色强调、图标描边 |
| pink-400 | `#FFB8C1` | 次品牌、提醒卡片 |
| pink-600 | `#E88694` | 危险/删除、驱虫主题 |
| cream | `#FFFBF7` | 主背景 |
| fog-100 | `#EDE9E5` | 边框、分隔线 |
| dark-900 | `#2E2B29` | 标题 |
| dark-700 | `#5C5856` | 正文 |
| blue | `#5DB9F0` | 就医/信息 |
| purple | `#B8A9E8` | 家庭成员 |

### Typography

- 中文优先 `HarmonyOS Sans SC` / `PingFang SC`。
- 标题 22-30px extra-bold，正文 15px regular，辅助 12-13px semi-bold。
- 所有数字指标使用 extra-bold，字距 -0.02em。

### Spacing

- 页面水平内边距 16px；内容区最大宽度 390px 居中。
- 卡片内边距 14-18px；卡片间距 12px。
- 底部 Tab 高度 76px + 安全区；内容 padding-bottom 至少 130px。

### Components

- **Bottom Tab Bar**: 5 Tabs + 中央悬浮 FAB；毛玻璃 `rgba(255,255,255,0.92)` + `backdrop-filter: blur(24px)`；顶部圆角 30px；图标 24px，标签 11px。
- **FAB**: 60px 圆形，薄荷渐变，阴影 `0 8px 24px rgba(75,191,154,0.42)`，位于 Tab 中央上方 bottom 30px。
- **Metric Card**: 白底，22px 圆角，左上 44px 图标圆，26px 数值，12px 标签。
- **Reminder Card**: 粉渐变，20px 圆角，左侧 5px 彩色条，逾期/即将到期颜色变化。
- **Timeline**: 左 12px 彩色圆点，虚线连接器，右侧卡片。
- **Input**: 雾灰底，16px 圆角，focus 薄荷色 border + 4px 光晕。
- **Buttons**: Primary 薄荷渐变胶囊，Secondary 白底薄荷边框，Destructive 粉色渐变。

### Per-Page Polish Notes

- **home-page**: 首屏 Hero 渐变背景，顶部宠物切换器，快捷记录 4 按钮，今日概览 2×2 metric cards，upcoming 提醒与最近记录时间线，FAB 悬浮。
- **pets-page**: 宠物卡片列表，头像 + 名称/品种/年龄/体重 + 状态标签 + 右箭头。
- **pet-detail-page**: 居中大头像、名称、三列信息卡、记一笔 + 删除按钮、近期记录时间线。
- **records-page**: 顶部筛选 chips + 记录时间线，支持按宠物/类型筛选。
- **trends-page**: 宠物/指标选择器 + 周期 7/30/90 按钮 + 趋势图表 + 摘要三宫格 + 健康洞察卡片。
- **health-page**: 顶部两个 action cards（添加提醒/就医记录），疫苗驱虫提醒列表（含开关），就医病历列表。
- **family-page**: 家庭信息卡片（共享开关 + 邀请按钮），成员列表（头像/权限/移除）。
- **add-* pages**: 表单页，统一 header（返回 + 标题 + 保存），输入框分组，底部取消/保存按钮。

### Responsive Constraints

- 内容始终 390px max-width 居中；420px 以上不放大；375px 以下字号/内边距减 1 级。
- Tab bar 与 FAB 宽度限制在 body 同宽 (`max-width: 390px; left:50%; transform:translateX(-50%)`)，禁止 PC 全宽拉伸。
- 首屏关键内容（Header + 核心卡片）保证在 600vp 内可见。

### HTML-to-ArkUI Mapping Notes

- 页面级渐变可用 `linearGradient` + `Column` 背景实现；卡片白底用 `backgroundColor('#FFFFFF')` + `borderRadius(22)` + `shadow(ShadowStyle.OUTER_DEFAULT_XS)`。
- FAB 与 Bottom Tab 使用 `Stack` + `Align.Bottom` 组合，FAB 用 `position` 绝对定位在 Tab 中央上方。
- 图表区域可用自定义 `Canvas` / `Path` 或 HarmonyOS 图表组件；按 ui-tree 保留 `trends-chart` 作为断言目标。
- 输入框 focus 状态用 `stateStyles({ focused: ... })` 或 `onFocus`/`onBlur` 切换 border/shadow。
- 列表项的动态 ID 在 ArkTS 中用 `.id(itemIdPattern.replace('{id}', entityId))` 绑定。

## 4. Non-Negotiable Constraints

1. **Do not change** semantic IDs, page IDs, routes, tab IDs, or action event names silently.
2. Treat HTML artifacts as the final visual reference; replicate colors, shadows, gradients, rounded corners, and spacing faithfully.
3. Treat `ui-tree.json` as a semantic binding protocol, not a layout tree. Visual wrappers, decorative elements, and extra containers are allowed as long as semantic targets are bound correctly.
4. Final ArkTS page/component structure should follow HTML/design-alignment artifacts while preserving semantic IDs on the correct interactive and assertion targets.
5. Do not add new feature behavior, data model changes, or scaffold assumptions here unless recorded as change requests.
6. No HarmonyOS source files or implementation plans should be produced by this design-lane skill.

## Semantic Change Requests

- 无。
