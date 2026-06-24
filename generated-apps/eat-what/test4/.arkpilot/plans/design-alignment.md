# Design Alignment Plan — 今天吃什么

## 1. Visual Inputs

- Semantic UI protocol: `.arkpilot/designs/ui-tree.json`
- Final visual design artifact: `.arkpilot/designs/DESIGN2.md`
- HTML design artifacts:
  - `.arkpilot/designs/page-home-page.html`
  - `.arkpilot/designs/page-fridge-page.html`
  - `.arkpilot/designs/page-mood-page.html`
  - `.arkpilot/designs/page-log-page.html`
  - `.arkpilot/designs/page-share-card-sheet.html`

Route-worthy page list: `home-page`, `fridge-page`, `mood-page`, `log-page`, `share-card-sheet`.

## 2. Semantic UI Binding

### Surfaces / Routes / Tabs

| pageId | route | tabId |
|--------|-------|-------|
| home-page | pages/Home | tab-home |
| fridge-page | pages/Fridge | tab-fridge |
| mood-page | pages/Mood | tab-mood |
| log-page | pages/Log | tab-log |
| share-card-sheet | (modal/sheet) | — |

### Action / Input / Assertion / List IDs to preserve in ArkTS `.id(...)`

Home:
- `home-spin-button` (action) — triggers `spin-wheel`
- `home-wheel` (assertion) — wheel surface/state
- `home-dish-result` (assertion) — current recommendation text
- `home-dish-card` (state) — result card container
- `home-log-button` (action) — triggers `log-current-dish`
- `home-filter-mood` (input) — mood chip group
- `home-filter-time` (input) — time chip group

Fridge:
- `fridge-ingredient-input` (input) — ingredient text field
- `fridge-add-button` (action) — triggers `add-ingredient`
- `fridge-ingredient-list` (list) — items use `fridge-ingredient-{id}`
- `fridge-recommend-button` (action) — triggers `recommend-by-ingredients`
- `fridge-recommendation-list` (list) — items use `fridge-recommendation-{id}`

Mood:
- `mood-mood-selector` (input) — mood chip group
- `mood-time-selector` (input) — time segment control
- `mood-apply-button` (action) — triggers `apply-mood-filters`
- `mood-dish-list` (list) — items use `mood-dish-{id}`
- `mood-log-button` (action) — triggers `log-selected-dish`

Log:
- `log-today-count` (assertion) — today’s logged meal count
- `log-entry-list` (list) — items use `log-entry-{id}`
- `log-share-button` (action) — triggers `open-share-card`

Share Card:
- `share-card-preview` (assertion) — card preview container
- `share-card-export-button` (action) — triggers `export-share-card`
- `share-card-close-button` (action) — triggers `close-share-card`

### Events

`spin-wheel`, `log-current-dish`, `add-ingredient`, `remove-ingredient`, `recommend-by-ingredients`, `apply-mood-filters`, `log-selected-dish`, `open-share-card`, `export-share-card`, `close-share-card`.

### Repeated Item Strategies

- `fridge-ingredient-{id}`
- `fridge-recommendation-{id}`
- `mood-dish-{id}`
- `log-entry-{id}`

### Empty / Loading / Error State IDs

- `fridge-empty-state`
- `fridge-no-match-state`
- `mood-empty-state`
- `log-empty-state`

## 3. Visual Requirements

### Color Tokens
- Page background: `#FFF8F0`
- Card background: `#FFFFFF`
- Primary text: `#3D2B1F`
- Secondary text: `#6B5E52`
- Tertiary text: `#9E9185`
- Primary CTA gradient: `linear-gradient(135deg, #FF6B4A, #FF8A6D)`
- Secondary CTA: white bg + `#FF6B4A` border/text
- Ingredient chips: `#E5F9F6` bg, `#1F7A71` text
- Accent gradient on active chips: Coral → Berry
- Mood page hero gradient: `#FFE9DE` → `#FFF8F0`
- Share card gradient: `#FFE9DE` → `#FF6B8B`

### Typography
- Display: SF Pro Display / PingFang SC / Microsoft YaHei fallback
- Body: SF Pro Text / PingFang SC fallback
- Page title: 30px weight 700
- Section title: 18px weight 700
- Card title: 18px weight 700
- Body: 15px weight 400
- Button: 16px weight 700

### Spacing
- Container max-width: 400vp, centered
- Page horizontal padding: 22px
- Card padding: 20–24px
- Section gap: 24–28px
- Tab bar height: 80px with safe-area padding

### Elevation
- Cards: `0 12px 32px rgba(61,43,31,0.08)`
- Elevated wheel: `0 18px 44px rgba(61,43,31,0.12)`
- CTA glow: `0 8px 24px rgba(255,107,74,0.32)`
- Tab bar upward shadow: `0 -6px 24px rgba(61,43,31,0.06)`
- Modal sheet: scrim `rgba(61,43,31,0.35)` + glass white card with blur

### Iconography
- Use local Lucide-style SVGs only.
- Every inline SVG has a contextual `<title>` as first child.
- Tab icons: chef-hat / refrigerator / smile / calendar.
- Action icons: plus, minus, share, download, x, refresh-like spin icon.

### Per-Page Polish Notes

**Home Page**
- Wheel card must be visible within top 600vp.
- Wheel diameter ~280vp, pointer at top center, center cap with utensils icon.
- Result card appears below wheel with dish name, time tag, and category tags.
- Primary CTA "记录这顿" full-width.

**Fridge Page**
- Search input + circular add button at top inside white card.
- Ingredient chips wrap below input.
- "推荐菜品" primary CTA spans full width.
- Recommendation cards have a left accent stripe and match badge.

**Mood Page**
- Peach-to-cream hero header.
- Mood chips in wrap grid; active state uses gradient + glow.
- Time selector as 4-segment pill control.
- Result cards with one-tap "记录" mini button.

**Log Page**
- Summary card with coral gradient and today count.
- Timeline entries in white cards with time pill and share icon.
- Empty state with chef-hat illustration and CTA.

**Share Card Sheet**
- Bottom sheet ~92% height over scrim.
- Centered 280×380 card preview with gradient.
- Export/share primary CTA full width.
- Close icon top-right.

## 4. HTML-to-ArkUI Mapping Notes

- `.app-shell` → outer `Stack` or centered `Column` constrained to 400vp.
- `.page` → scrollable `Scroll`/`List` with bottom padding for tab bar.
- `.tab-bar` → `Tabs` with bottom `TabContent` or custom bottom bar; width constrained to container.
- Cards → `Column` with background, borderRadius, shadow.
- Wheel → custom `Canvas` component or rotated `Stack` of sectors.
- Chips → `FlexWrap` or `List` of selectable items.
- Share card sheet → `Sheet` / `BindSheet` or full-screen overlay `Stack`.

## 5. Non-Negotiable Constraints

- Do not rename semantic IDs, page IDs, routes, tab IDs, or event names.
- Do not add feature behavior or data model assumptions not in the spec.
- Bottom tab bar must stay at the bottom and width-limited; no side tabs.
- All inline SVGs must include a contextual `<title>`.
- No emoji or pictographic Unicode as UI icons.
- Target device: 1272vp × 2756vp phone, content max-width 390–420vp.
- No seeded demo data required by default; sample data in HTML is visual-only.

## 6. Change Requests

None.
