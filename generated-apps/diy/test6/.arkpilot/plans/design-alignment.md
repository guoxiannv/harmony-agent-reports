# Design Alignment Plan

## 1. Visual Inputs

- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Spec**: `.arkpilot/designs/DESIGN2.md`
- **HTML Artifacts**:
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-members-page.html`
  - `.arkpilot/designs/page-member-detail-page.html`
  - `.arkpilot/designs/page-member-edit-page.html`
  - `.arkpilot/designs/page-courses-page.html`
  - `.arkpilot/designs/page-course-detail-page.html`
  - `.arkpilot/designs/page-course-booking-page.html`
  - `.arkpilot/designs/page-points-page.html`
  - `.arkpilot/designs/page-point-record-page.html`
  - `.arkpilot/designs/page-inventory-page.html`
  - `.arkpilot/designs/page-inventory-edit-page.html`
  - `.arkpilot/designs/page-inventory-transaction-page.html`
- **Route-worthy Pages**: 12 surfaces mapped to `page-<page-id>.html` as listed above.

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs
| Surface ID | Route | Tab ID | HTML Artifact |
|------------|-------|--------|---------------|
| home-page | pages/Home | tab-home | page-home-page.html |
| members-page | pages/Members | tab-members | page-members-page.html |
| member-detail-page | pages/MemberDetail | — | page-member-detail-page.html |
| member-edit-page | pages/MemberEdit | — | page-member-edit-page.html |
| courses-page | pages/Courses | tab-courses | page-courses-page.html |
| course-detail-page | pages/CourseDetail | — | page-course-detail-page.html |
| course-booking-page | pages/CourseBooking | — | page-course-booking-page.html |
| points-page | pages/Points | tab-points | page-points-page.html |
| point-record-page | pages/PointRecord | — | page-point-record-page.html |
| inventory-page | pages/Inventory | tab-inventory | page-inventory-page.html |
| inventory-edit-page | pages/InventoryEdit | — | page-inventory-edit-page.html |
| inventory-transaction-page | pages/InventoryTransaction | — | page-inventory-transaction-page.html |

### Critical Semantic IDs to Preserve in ArkTS `.id(...)`

**Home**
- `home-today-date` (assertion)
- `home-reminder-banner` (assertion)
- `home-sleeping-count`, `home-sleeping-card` (assertion + action)
- `home-low-stock-count`, `home-low-stock-card` (assertion + action)
- `home-today-course-list` (list, `home-today-course-{id}`)
- `home-recent-point-list` (list, `home-recent-point-{id}`)
- `home-checkin-button` (action)
- `home-add-member-button` (action)
- `home-tab-bar` (navigation)

**Members**
- `members-search-input` (input)
- `members-filter-sleeping` (input)
- `members-list` (list, `members-item-{id}`)
- `members-add-button` (action)
- `members-total-count` (assertion)

**MemberDetail**
- `member-detail-name`, `member-detail-points`, `member-detail-crafts` (assertion)
- `member-detail-works-grid` (list, `member-work-{id}`)
- `member-detail-course-list` (list, `member-course-{id}`)
- `member-detail-edit-button`, `member-detail-checkin-button`, `member-detail-delete-button`, `member-detail-back-button` (action)

**MemberEdit**
- `member-edit-name-input`, `member-edit-phone-input`, `member-edit-nickname-input`, `member-edit-birthday-picker`, `member-edit-crafts-picker`, `member-edit-notes-input`, `member-edit-allergy-input` (input)
- `member-edit-works-uploader` (input)
- `member-edit-save-button`, `member-edit-cancel-button` (action)

**Courses**
- `courses-view-toggle` (input)
- `courses-calendar` (assertion)
- `courses-list` (list, `courses-item-{id}`)
- `courses-add-button` (action)

**CourseDetail**
- `course-detail-title`, `course-detail-datetime`, `course-detail-capacity` (assertion)
- `course-detail-material-list` (list, `course-material-{id}`)
- `course-detail-booking-list` (list, `course-booking-{id}`)
- `course-detail-book-button`, `course-detail-cancel-button`, `course-detail-edit-button`, `course-detail-back-button` (action)

**CourseBooking**
- `course-booking-member-picker`, `course-booking-remark-input`, `course-booking-use-points-toggle` (input)
- `course-booking-submit-button`, `course-booking-cancel-button` (action)

**Points**
- `points-total-balance` (assertion)
- `points-checkin-button`, `points-add-record-button` (action)
- `points-transaction-list` (list, `points-transaction-{id}`)
- `points-filter-type` (input)

**PointRecord**
- `point-record-member-picker`, `point-record-type-picker`, `point-record-amount-input`, `point-record-reason-input` (input)
- `point-record-save-button`, `point-record-cancel-button` (action)

**Inventory**
- `inventory-low-stock-count` (assertion)
- `inventory-add-button`, `inventory-transaction-button` (action)
- `inventory-list` (list, `inventory-item-{id}`)

**InventoryEdit**
- `inventory-edit-name-input`, `inventory-edit-spec-input`, `inventory-edit-unit-input`, `inventory-edit-stock-input`, `inventory-edit-safe-stock-input`, `inventory-edit-notes-input` (input)
- `inventory-edit-save-button`, `inventory-edit-cancel-button` (action)

**InventoryTransaction**
- `inventory-transaction-material-picker`, `inventory-transaction-type-picker`, `inventory-transaction-quantity-input`, `inventory-transaction-reason-input` (input)
- `inventory-transaction-save-button`, `inventory-transaction-cancel-button` (action)

### Events to Preserve
- `open-sleeping-members`, `open-low-stock`, `open-checkin`
- `navigate-member-edit`, `search-members`, `toggle-sleeping-filter`
- `member-checkin`, `delete-member`, `upload-work-image`, `save-member`, `cancel-edit`
- `toggle-calendar-list`, `filter-courses-by-date`, `navigate-course-edit`, `navigate-course-booking`, `cancel-course`
- `select-booking-member`, `submit-course-booking`, `cancel-booking-form`
- `daily-checkin`, `navigate-point-record`, `filter-point-type`
- `select-point-member`, `select-point-type`, `save-point-record`, `cancel-point-record`
- `navigate-inventory-edit`, `navigate-inventory-transaction`, `save-inventory`, `cancel-inventory-edit`
- `select-transaction-material`, `select-transaction-type`, `save-inventory-transaction`, `cancel-inventory-transaction`

## 3. Visual Requirements

### Color Tokens
- 主色：窑红陶土 `#9E4F2C`
- 辅色：赤陶浅褐 `#C98B6C`
- 背景：米浆白 `#F7F3ED`
- 卡片：白瓷白 `#FFFFFF`
- 标题：墨褐 `#3B2820`
- 正文：浅墨褐 `#6E5D53`
- 弱化文字：淡墨褐 `#9E8E84`
- 成功/安全：草木灰绿 `#7D9472`
- 提醒/沉睡：落霞柔粉 `#D9A89B`
- 错误/低库存：坯裂红 `#B85448`
- 点缀：天青釉 `#8BAAB8`

### Typography
- 手写体（Zhi Mang Xing）用于页面大标题与空状态 slogan，不用于小字号。
- 黑体用于正文、按钮、标签。
- 页面标题 44px，章节标题 20px bold，卡片标题 17px semibold，正文 15px，说明 13px。

### Spacing
- 页面水平内边距 22px，卡片内边距 18px，卡片圆角 20px。
- 列表卡片间距 14px，模块间距 28-36px。

### Elevation
- 卡片双层阴影：`rgba(74,48,36,0.10) 0px 10px 28px -6px, rgba(74,48,36,0.06) 0px 4px 8px -2px`
- 主按钮阴影：`rgba(158,79,44,0.34) 0px 10px 28px -4px`
- 底部 Tab 栏毛玻璃：`rgba(247,243,237,0.88)` + `backdrop-filter: blur(22px) saturate(165%)`

### Buttons
- Primary：陶土渐变填充，白字，圆角 16px，阴影。
- Secondary：透明底，陶土色描边，陶土色文字。
- Ghost：纯文字，陶土色，可带图标。
- FAB：58px 圆形陶土色，位于 bottom 102px / right 22px，避免遮挡 Tab。

### Icons
- 使用线性 SVG（Lucide 风格），stroke 1.8px，颜色按场景使用。
- 每个内联 SVG 必须包含语义化 `<title>` 作为第一个子元素。

### Per-Page Polish
- **Home**: 顶部手写标题，双列提醒卡（沉睡 + 低库存），今日课程卡片，积分动态，右下角签到 FAB。
- **Members**: 搜索 + 沉睡筛选，会员列表卡片带头像与工艺标签，空状态陶轮插画。
- **MemberDetail**: 顶部作品图墙横向滚动，信息卡 + 数据三宫格，操作按钮，课程列表与作品图墙。
- **MemberEdit**: 表单字段垂直排列，工艺标签多选，作品图上传占位网格。
- **Courses**: 日历/列表切换 pill，月历带课程圆点标记，课程列表。
- **CourseDetail**: 渐变课程信息卡，消耗物料列表，预约名单。
- **CourseBooking**: 会员选择器，备注，积分抵扣开关，预约须知。
- **Points**: 渐变积分余额大卡，签到 + 补录按钮，积分流水。
- **PointRecord**: 会员选择器，类型切换 pill，数值与原因输入。
- **Inventory**: 低库存预警横幅，物料清单带进度条。
- **InventoryEdit**: 物料基础信息表单，库存与安全库存双列。
- **InventoryTransaction**: 物料选择器，操作类型 pill，数量与原因。

### Responsive Constraints
- 所有内容区 max-width 390px 居中。
- 底部 Tab 栏与 FAB 宽度限制与 body 一致，禁止 PC 全宽拉伸。
- 禁止侧边导航。

## 4. HTML-to-ArkUI Mapping Notes

- HTML `.app-frame` 对应 ArkUI `Column` + 最大宽度约束。
- 底部 Tab 栏使用 ArkUI `Tabs` 组件，`barPosition: BarPosition.Bottom`。
- 卡片使用 `Column` + `borderRadius(20)` + `shadow` + `backgroundColor(Color.White)`。
- 渐变卡片/按钮使用 `linearGradient`。
- 列表使用 `List` + `ListItem`，列表项 ID 使用 `.id(itemIdPattern.replace('{id}', id))`。
- 表单输入使用 `TextInput` / `TextArea` / `DatePicker` / `Picker`，绑定对应 `data-ui-id`。
- 图片网格使用 `Grid` + `GridItem`；空占位使用虚线边框样式。
- 日历视图在 ArkUI 中可先用自定义 Grid 实现，或集成 `CalendarPicker`；日期圆点使用叠加小圆点。
- 毛玻璃 Tab 栏使用 `blur` / `backdropBlur` + `backgroundColor` 半透明。

## 5. Non-Negotiable Constraints

1. **Do not rename** semantic IDs, page IDs, routes, tab IDs, or event names.
2. Treat HTML artifacts as the final visual reference.
3. Treat `ui-tree.json` as a semantic binding protocol, not a layout tree.
4. Final ArkTS page/component structure follows HTML/design-alignment artifacts while binding semantic IDs to the correct interactive and assertion targets.
5. Do not add feature behavior, data model changes, or scaffold assumptions unless recorded as change requests.
6. All inline SVG icons must include a contextual `<title>` tag.
7. No emoji or pictographic Unicode as UI icons.
8. No seeded demo data requirement; HTML sample data is visual-only.

## 6. Change Requests

- 无。

---
*Design alignment version: 1.0 — generated by ArkPilot autopilot-html-tmux-design-a2ui-pro*
