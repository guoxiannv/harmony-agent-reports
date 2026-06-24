# 今天吃什么 — Visual Design System (Final)

## 1. Visual Theme & Atmosphere

A warm, appetite-first decision kitchen. The interface feels like flipping through a friendly recipe box: cream paper cards, confident coral accents, fresh mint and sunny yolk highlights, and a physical prize-wheel centerpiece. Every interaction is tactile — chips glow when selected, cards lift when pressed, and the share card looks good enough to post.

To avoid the generic AI-template look, the system uses:
- A warm, food-inspired palette instead of cold neutrals.
- Multiple harmonious accents with clear, consistent jobs.
- Soft gradients on active elements and share-card surfaces.
- Layered shadows and a glassy modal treatment.

## 2. Color Palette & Roles

### Backgrounds
- **Cream Canvas** `#FFF8F0` — primary page background.
- **Soft Peach** `#FFE9DE` — header gradients, share-card start.
- **Warm Mist** `#F5EEE6` — secondary cards, inputs, chip defaults.

### Text
- **Deep Cocoa** `#3D2B1F` — primary text.
- **Warm Stone** `#6B5E52` — secondary text.
- **Ash Taupe** `#9E9185` — tertiary/disabled text.

### Accents
- **Coral CTA** `#FF6B4A` — primary buttons, active chips, wheel pointer, links.
- **Mint Fresh** `#3DD9C7` — ingredient chips, success states.
- **Sunny Yolk** `#FFCC5C` — wheel sectors, warm tags.
- **Berry Blush** `#FF6B8B` — mood tags, share-card gradient end.
- **Lavender** `#C4A8FF` — additional wheel sector color.

### Surfaces
- **Card White** `#FFFFFF` (slightly warm).
- **Pressed Cream** `#F0E8DF`.
- **Glass White** `rgba(255,255,255,0.78)` with `backdrop-filter: blur(18px)`.

### Shadows
- **Card Shadow**: `0 12px 32px rgba(61,43,31,0.08)`.
- **Elevated Shadow**: `0 18px 44px rgba(61,43,31,0.12)`.
- **CTA Glow**: `0 8px 24px rgba(255,107,74,0.32)`.
- **Chip Glow**: `0 4px 12px rgba(255,107,74,0.18)`.

## 3. Typography Rules

| Role | Size | Weight | Line Height | Letter Spacing |
|------|------|--------|-------------|----------------|
| Page Title | 30px | 700 | 1.18 | -0.4px |
| Section Title | 21px | 700 | 1.24 | -0.2px |
| Card Title | 18px | 700 | 1.3 | -0.1px |
| Body | 15px | 400 | 1.55 | 0 |
| Button | 16px | 700 | 1 | 0.1px |
| Caption | 13px | 600 | 1.35 | 0.1px |
| Micro | 11px | 600 | 1.3 | 0.2px |

Font stacks: `SF Pro Display`, `PingFang SC`, `Microsoft YaHei`, sans-serif for display; `SF Pro Text`, `PingFang SC`, sans-serif for body.

## 4. Component Stylings

### Primary Button
- Gradient `linear-gradient(135deg, #FF6B4A, #FF8A6D)`.
- White text, 18px radius, 16px 32px padding.
- CTA Glow shadow.
- Pressed scale 0.97.

### Secondary Button
- White bg, 1.5px Coral border, Coral text, 16px radius.

### Wheel
- 280px diameter white outer ring, 16px padding.
- Inner plate conic gradient across Yolk/Mint/Peach/Berry/Lavender/Coral.
- Subtle inner shadow inset.
- Coral pointer at top with white border and glow.
- White center cap 56px with shadow.

### Filter / Mood Chips
- Default: white bg, `#6B5E52` text, 1px `#E8E0D6` border, 999px radius.
- Active: gradient Coral→Berry, white text, Chip Glow.
- Padding 10px 18px.

### Ingredient Chip
- `#E5F9F6` bg, `#1F7A71` text, 999px radius, close icon inside.

### Recommendation Card
- White card, 20px radius, left 4px accent stripe.
- Match badge Coral pill.
- Tag row of small warm-mist pills.

### Log Entry Row
- White card, 18px radius, time pill on left, share icon on right.

### Share Card Preview
- 320 × 420px rounded card, gradient Soft Peach → Berry Blush.
- White title, date, small sparkle decoration.

### Bottom Tab Bar
- White bg, 24px top radius, upward shadow.
- 4 tabs: Home (chef-hat), Fridge (refrigerator), Mood (smile), Log (calendar).
- Active Coral, inactive Ash Taupe.
- Width constrained to container max-width.

## 5. Layout Principles

- Container max-width: 400vp, centered.
- Page horizontal padding: 22px.
- Card padding: 20–24px.
- Section gap: 28px.
- Tab bar height: 80px with safe area.

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| 0 | Flat Cream Canvas background |
| 1 | Cards with Card Shadow |
| 2 | Wheel with Elevated Shadow + inner shine |
| 3 | Primary CTA with CTA Glow |
| 4 | Modal sheet over scrim `rgba(61,43,31,0.35)` + Glass White card |

## 7. Semantic UI Binding

### Surfaces / Routes / Tabs
- `home-page` → `pages/Home`, tab `tab-home`
- `fridge-page` → `pages/Fridge`, tab `tab-fridge`
- `mood-page` → `pages/Mood`, tab `tab-mood`
- `log-page` → `pages/Log`, tab `tab-log`
- `share-card-sheet` → modal/sheet, no route

### Action / Input / Assertion / List IDs
Home: `home-spin-button`, `home-wheel`, `home-dish-result`, `home-dish-card`, `home-log-button`, `home-filter-mood`, `home-filter-time`.

Fridge: `fridge-ingredient-input`, `fridge-add-button`, `fridge-ingredient-list`, `fridge-recommend-button`, `fridge-recommendation-list`.

Mood: `mood-mood-selector`, `mood-time-selector`, `mood-apply-button`, `mood-dish-list`, `mood-log-button`.

Log: `log-today-count`, `log-entry-list`, `log-share-button`.

Share: `share-card-preview`, `share-card-export-button`, `share-card-close-button`.

### Events
`spin-wheel`, `log-current-dish`, `add-ingredient`, `remove-ingredient`, `recommend-by-ingredients`, `apply-mood-filters`, `log-selected-dish`, `open-share-card`, `export-share-card`, `close-share-card`.

### Repeated Item Patterns
- `fridge-ingredient-{id}`
- `fridge-recommendation-{id}`
- `mood-dish-{id}`
- `log-entry-{id}`

### Empty State IDs
`fridge-empty-state`, `fridge-no-match-state`, `mood-empty-state`, `log-empty-state`.

### Change Requests
None.

## 8. Page-Specific Notes

### Home Page
- Wheel is the hero within top 600vp.
- Quick filter chips under wheel for mood/time.
- Result card animates below after spin.
- "记录这顿" full-width primary CTA.

### Fridge Page
- Add ingredient input row at top.
- Ingredient chips wrap below.
- "推荐菜品" primary CTA spans width.
- Recommendations ranked by match percentage.

### Mood Page
- Header gradient peach-to-cream.
- Mood chips in 2-row grid.
- Time selector as 4-segment pill.
- Result cards have log shortcut.

### Log Page
- Summary card shows today count + streak.
- Timeline entries grouped by time of day.
- Empty state with chef-hat and CTA.

### Share Card Sheet
- Bottom sheet, ~90% height.
- Centered card preview.
- Export/share primary CTA + close icon.

## 9. Do's and Don'ts

- Do use SVG icons with contextual `<title>` tags.
- Do center content within max-width container.
- Do keep the tab bar at the bottom, never side.
- Don't use emoji or pictographic Unicode.
- Don't use pure black text or borders.
- Don't allow full-width stretch on wide viewports.
