# 手作·印记 — Design Alignment Plan

## 1. Visual Inputs

- **Semantic UI protocol**: `.arkpilot/designs/ui-tree.json`
- **Final design artifact**: `.arkpilot/designs/DESIGN2.md`
- **HTML artifacts**:
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-members-page.html`
  - `.arkpilot/designs/page-member-detail-page.html`
  - `.arkpilot/designs/page-member-form-page.html`
  - `.arkpilot/designs/page-points-page.html`
  - `.arkpilot/designs/page-calendar-page.html`
  - `.arkpilot/designs/page-course-detail-page.html`
  - `.arkpilot/designs/page-course-form-page.html`
  - `.arkpilot/designs/page-inventory-page.html`
  - `.arkpilot/designs/page-inventory-log-page.html`
  - `.arkpilot/designs/page-settings-page.html`
- **Route-worthy pages** (11 total): home-page, members-page, member-detail-page, member-form-page, points-page, calendar-page, course-detail-page, course-form-page, inventory-page, inventory-log-page, settings-page.

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs

| pageId | route | tabId | HTML artifact |
|--------|-------|-------|---------------|
| home-page | pages/Home | tab-home | page-home-page.html |
| members-page | pages/Members | tab-members | page-members-page.html |
| member-detail-page | pages/MemberDetail | - | page-member-detail-page.html |
| member-form-page | pages/MemberForm | - | page-member-form-page.html |
| points-page | pages/Points | tab-points | page-points-page.html |
| calendar-page | pages/Calendar | tab-calendar | page-calendar-page.html |
| course-detail-page | pages/CourseDetail | - | page-course-detail-page.html |
| course-form-page | pages/CourseForm | - | page-course-form-page.html |
| inventory-page | pages/Inventory | tab-inventory | page-inventory-page.html |
| inventory-log-page | pages/InventoryLog | - | page-inventory-log-page.html |
| settings-page | pages/Settings | - | page-settings-page.html |

### Semantic IDs to Preserve in ArkTS `.id(...)`

#### Home (`home-page`)
- `home-checkin-button` (action)
- `home-today-course-list` (list, item pattern `home-today-course-{id}`, empty state `home-today-empty`)
- `home-dormant-alert-card` (assertion)
- `home-dormant-list-button` (action)
- `home-quick-add-member`, `home-quick-book-course`, `home-quick-inventory` (actions)

#### Members (`members-page`)
- `members-search-input` (input)
- `members-add-button`, `members-filter-button` (actions)
- `members-list` (list, item pattern `members-item-{id}`, empty state `members-empty-state`)

#### Member Detail (`member-detail-page`)
- `member-detail-edit-button` (action)
- `member-detail-checkin-button` (action)
- `member-detail-points-balance` (assertion)
- `member-detail-works-grid` (list, item pattern `member-work-{id}`, empty state `member-works-empty`)
- `member-detail-crafts-tags` (assertion)
- `member-detail-points-history-button`, `member-detail-bookings-button` (actions)

#### Member Form (`member-form-page`)
- `member-form-name-input`, `member-form-phone-input` (inputs)
- `member-form-crafts-selector` (input)
- `member-form-avatar-picker`, `member-form-works-picker` (inputs)
- `member-form-save-button`, `member-form-delete-button` (actions)

#### Points (`points-page`)
- `points-total-issued`, `points-total-redeemed` (assertions)
- `points-rule-setting-button`, `points-redeem-button` (actions)
- `points-record-list` (list, item pattern `points-record-{id}`, empty state `points-empty-state`)

#### Calendar (`calendar-page`)
- `calendar-view-switch` (input)
- `calendar-prev-button`, `calendar-next-button`, `calendar-today-button` (actions)
- `calendar-add-course-button` (action)
- `calendar-course-list` (list, item pattern `calendar-course-{id}`, empty state `calendar-empty-state`)

#### Course Detail (`course-detail-page`)
- `course-detail-edit-button` (action)
- `course-detail-book-button` (action)
- `course-detail-student-list` (list, item pattern `course-student-{id}`, empty state `course-students-empty`)
- `course-detail-material-list` (list, item pattern `course-material-{id}`, empty state `course-materials-empty`)
- `course-detail-deduct-button` (action)

#### Course Form (`course-form-page`)
- `course-form-title-input`, `course-form-teacher-input` (inputs)
- `course-form-time-picker`, `course-form-capacity-input` (inputs)
- `course-form-material-selector` (input)
- `course-form-save-button` (action)

#### Inventory (`inventory-page`)
- `inventory-add-button` (action)
- `inventory-low-stock-alert` (assertion)
- `inventory-list` (list, item pattern `inventory-item-{id}`, empty state `inventory-empty-state`)
- `inventory-log-button` (action)

#### Inventory Log (`inventory-log-page`)
- `inventory-log-filter-type` (input)
- `inventory-log-list` (list, item pattern `inventory-log-{id}`, empty state `inventory-log-empty`)

#### Settings (`settings-page`)
- `settings-dormant-threshold-input`, `settings-points-ratio-input` (inputs)
- `settings-backup-button`, `settings-restore-button` (actions)

### Events to Preserve

- `open-checkin-sheet`, `navigate-dormant-members`, `navigate-member-form`, `navigate-calendar`, `navigate-inventory`
- `member-checkin`, `navigate-points-history`, `navigate-member-bookings`
- `save-member`, `delete-member`
- `open-points-rule-sheet`, `open-redeem-sheet`
- `calendar-prev`, `calendar-next`, `calendar-today`, `navigate-course-form`
- `open-booking-sheet`, `deduct-course-materials`, `save-course`
- `open-inventory-form`, `navigate-inventory-log`
- `backup-data`, `restore-data`

### Repeated Item Strategies

- Member list: `members-item-{id}`
- Today's courses on home: `home-today-course-{id}`
- Member works: `member-work-{id}`
- Point records: `points-record-{id}`
- Calendar courses: `calendar-course-{id}`
- Course students: `course-student-{id}`
- Course materials: `course-material-{id}`
- Inventory items: `inventory-item-{id}`
- Inventory logs: `inventory-log-{id}`

## 3. Visual Requirements

### Color Tokens

| Token | Hex | Usage |
|-------|-----|-------|
| `--terracotta` | `#C67B5C` | Primary buttons, active states, FAB, accent |
| `--caramel` | `#B87D4B` | Stat numbers, points, highlight numbers |
| `--clay-white` | `#FAF6F0` | Page background |
| `--rice-paper` | `#F5EDE4` | Inputs, secondary backgrounds, tags |
| `--dark-umber` | `#3D2B1F` | Headings |
| `--body-brown` | `#5A4A3F` | Body text |
| `--clay-gray` | `#8C7D70` | Secondary text, placeholders |
| `--celadon` | `#A8B5A0` | Success / earn states |
| `--rust` | `#A0522D` | Warnings, low stock, delete, redeem-out |
| `--cobalt` | `#5A6F7C` | Links, tertiary text buttons |
| `--card-surface` | `#FFFDF9` | Card surface |
| `--card-gradient` | `linear-gradient(145deg, #FFFDF9 0%, #F8F1E9 55%, #F0E6DA 100%)` | Feature cards |

### Typography

- Display / Page Title: `ZCOOL XiaoWei, STKaiti, KaiTi, cursive`
- Body / UI: `PingFang SC, Hiragino Sans GB, Microsoft YaHei, sans-serif`
- Display Hero: 44px / line-height 1.18 / letter-spacing 0.02em
- Page Title: 30px / line-height 1.22
- Section Title: 20px / weight 700
- Card Title: 17px / weight 700
- Body: 15px / line-height 1.60
- Stat Number: 32-34px / `ZCOOL XiaoWei` / caramel

### Spacing

- Page horizontal padding: 20px
- Section vertical gap: 24-28px
- Card internal padding: 16-22px
- Card border-radius: 18-24px
- Button border-radius: 999px (pill)
- Input border-radius: 16px
- Tag border-radius: 999px

### Elevation

- Standard card: `0 2px 8px rgba(99,72,54,0.06), 0 10px 28px rgba(99,72,54,0.08)`
- Feature card: `0 4px 12px rgba(99,72,54,0.06), 0 18px 44px rgba(99,72,54,0.10)`
- FAB: `0 8px 24px rgba(198,123,92,0.36)`
- Bottom Tab Bar: `0 -6px 24px rgba(99,72,54,0.08)`

### Icons

- All icons are hand-drawn-style SVG line icons (2px stroke, round caps).
- Every inline SVG must include a `<title>` as its first child with business-context description.
- Do not use emoji or Unicode pictographs.

### Per-Page Polish Notes

#### Home
- Top feature card uses gradient background with welcome title in handwriting font.
- Quick action grid: 3 columns, icon + label, small card shadow.
- Dormant alert card: left rust accent bar, warning icon.
- Today's courses: time badge + course info card.

#### Members
- Search bar with icon, filter button in header.
- Member cards: circular avatar (initial), craft tags, points number on right.
- FAB bottom-right for add member.

#### Member Detail
- Large centered profile card with gradient, avatar, craft tags, stat row.
- Works grid: 3 columns, square thumbnails with placeholder camera icon.
- Info list card at bottom.

#### Member Form
- Form inputs with focus ring.
- Craft selector as toggle chips.
- Image pickers with dashed border for avatar and works.

#### Points
- Gradient summary card with total remaining points (large handwriting number).
- Two stat items: total issued / total redeemed.
- Point record list with + / - color coding.

#### Calendar
- Toolbar with prev/next arrows, month label, day/week/month segmented switch.
- Horizontal day strip with active/highlight states.
- Course cards with time dot, badges.
- FAB for add course.

#### Course Detail
- Hero card with title, teacher, capacity, category badges.
- Student list with status badge.
- Material list with deduct quantity.

#### Course Form
- Inputs for title, teacher, time, capacity.
- Material rows with name + quantity.

#### Inventory
- Low-stock alert card at top.
- Inventory cards with quantity on right (warn color if low).
- FAB for add item.

#### Inventory Log
- Filter tabs: 全部 / 入库 / 出库 / 自动扣减.
- Log items with type badge and +/- color.

#### Settings
- Form inputs for dormant threshold and points ratio.
- Backup / restore as list cards with chevron.

### Responsive Constraints

- Target device: 1272vp × 2756vp phone, 3x density.
- Content max-width: 390vp, centered.
- Bottom Tab Bar must be fixed at bottom, width constrained to 390vp, centered.
- No side navigation.
- First-run state is empty; HTML sample data is visual-only.

## 4. HTML-to-ArkUI Visual Mapping Notes

- **Background texture**: HTML uses an inline SVG noise filter at 3% opacity. In ArkUI, this can be a `Stack` with a subtle `LinearGradient` or omitted if performance-sensitive; the solid `#FAF6F0` is acceptable fallback.
- **Cards**: Use `Column` + `borderRadius(20/24)` + shadow + gradient background. In ArkUI, `linearGradient` on `Column` background works.
- **Buttons**: Capsule shape (`borderRadius(999)`) with `backgroundColor('#C67B5C')` and shadow.
- **Inputs**: `TextInput` with `backgroundColor('#F5EDE4')`, `borderRadius(16)`, focus state via `stateStyles`.
- **Tab Bar**: `Tabs({ barPosition: BarPosition.End })` or custom bottom `Row`. Must preserve tab IDs and active color.
- **Lists**: Use `List` + `ListItem` with `id()` set from item pattern, e.g. `id('members-item-' + item.id)`.
- **Empty states**: Use conditional rendering; empty state IDs must be on the container that appears when the list is empty.
- **FAB**: `Button` with `type(ButtonType.Circle)` or custom `Stack` with circle styling, fixed bottom-right but constrained to content width.
- **SVG icons**: Convert inline SVG paths to ArkTS `Path`/`Shape` or use `Image($rawfile('icon.svg'))`. If using SVG assets, ensure each asset's `<title>` is preserved or documented.

## 5. Non-Negotiable Constraints

- Do not rename semantic IDs, page IDs, routes, tab IDs, or event names.
- Treat HTML artifacts as the final visual reference.
- Treat `ui-tree.json` as a semantic binding protocol, not a layout tree.
- Final ArkTS structure follows HTML/DESIGN2.md while binding semantic IDs to correct interactive and assertion targets.
- Do not add feature behavior or data model changes unless recorded as change requests.
- First-run lists are empty; do not seed sample data from HTML into the app.
- Every SVG icon in final ArkTS must have an accessible label equivalent to the HTML `<title>`.

## 6. Semantic Change Requests

None.
