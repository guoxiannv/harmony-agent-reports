# 今天吃什么 — Visual Design System

## 1. Visual Theme & Atmosphere

A warm, appetite-friendly decision companion. The app mixes soft culinary cream with a confident coral accent and fresh mint highlights to feel like a friendly kitchen rather than a generic utility. Surfaces are light and breathable, with rounded food-shaped cards and subtle gradients that evoke a cozy recipe card or bistro menu.

The vibe is **playful but polished**: the wheel is the hero, ingredients feel tactile like fridge magnets, and the log reads like a personal food diary. Depth comes from layered cards with soft shadows and gentle color-field transitions, not heavy chrome.

## 2. Color Palette & Roles

### Primary
- **Cream Canvas** `#FFF8F0` — primary page background; warm, kitchen-paper feel.
- **Soft Peach** `#FFE5D6` — secondary page background; used for mood page header and share-card gradient base.
- **Deep Cocoa** `#3D2B1F` — primary text; rich dark brown instead of harsh black.

### Accent
- **Coral CTA** `#FF6B4A` — primary buttons, active chips, wheel pointer, key highlights.
- **Mint Fresh** `#4ECDC4` — success/confirm states, ingredient chips, secondary accent.
- **Sunny Yolk** `#FFD166` — wheel sector fill, ratings, warm emphasis.
- **Berry** `#FF6F91` — mood filters, tags, tertiary emphasis.

### Neutrals
- **Warm Gray 100** `#F7F1EA` — card backgrounds, input fields.
- **Warm Gray 200** `#E8E0D6` — dividers, disabled surfaces.
- **Warm Gray 400** `#A89F94` — secondary text, placeholders.
- **Warm Gray 600** `#6B6258` — tertiary text.

### Semantic
- **Success** `#4ECDC4`
- **Warning** `#FFD166`
- **Danger** `#E63946`
- **Info** `#4A90E2`

## 3. Typography Rules

- **Display / Headlines**: `SF Pro Display` fallback to `PingFang SC`, `Microsoft YaHei`, sans-serif.
- **Body**: `SF Pro Text` fallback to system Chinese sans-serif.
- Use tight tracking for large Chinese headlines to avoid looseness.

| Role | Size | Weight | Line Height | Letter Spacing |
|------|------|--------|-------------|----------------|
| Page Title | 28px | 700 | 1.2 | -0.5px |
| Section Title | 20px | 700 | 1.3 | -0.3px |
| Card Title | 18px | 700 | 1.3 | -0.2px |
| Body | 15px | 400 | 1.5 | 0 |
| Caption | 13px | 500 | 1.4 | 0 |
| Micro | 11px | 500 | 1.3 | 0.2px |

## 4. Component Stylings

### Primary Button
- Background: `#FF6B4A`
- Text: `#FFFFFF`
- Padding: 14px 28px
- Border radius: 16px
- Font: 16px, weight 700
- Shadow: `0 8px 20px rgba(255,107,74,0.28)`
- Pressed: scale 0.97, shadow tighter

### Secondary Button
- Background: `#FFFFFF`
- Border: 1.5px solid `#FF6B4A`
- Text: `#FF6B4A`
- Padding: 12px 22px
- Border radius: 14px
- Font: 15px, weight 700

### Filter Chip
- Default: `#FFFFFF` bg, `#6B6258` text, 1px `#E8E0D6` border
- Active: `#FF6B4A` bg, white text, no border
- Border radius: 999px
- Padding: 8px 16px
- Font: 14px weight 600

### Ingredient Chip
- Background: `#EAF9F7` mint tint
- Text: `#2A6B66`
- Border radius: 999px
- Padding: 8px 14px
- Remove icon: `#2A6B66` 16px

### Card
- Background: `#FFFFFF`
- Border radius: 20px
- Shadow: `0 10px 30px rgba(61,43,31,0.08)`
- Padding: 20px

### Bottom Tab Bar
- Background: `#FFFFFF`
- Top border radius: 24px
- Shadow: `0 -6px 24px rgba(61,43,31,0.06)`
- Active item: `#FF6B4A` icon + label
- Inactive item: `#A89F94`
- Height: 76px including safe area padding

## 5. Layout Principles

- Max content width: 390–420vp, centered.
- Page horizontal padding: 20px.
- Vertical rhythm: 24px between sections.
- All cards have rounded corners (20px).
- Bottom tab bar fixed at bottom, constrained to max-width.

## 6. Depth & Elevation

- Level 0: flat page background.
- Level 1: cards `0 10px 30px rgba(61,43,31,0.08)`.
- Level 2: floating CTA / wheel pointer `0 12px 32px rgba(255,107,74,0.28)`.
- Level 3: modal sheet `0 -8px 40px rgba(61,43,31,0.12)`.

## 7. Page-Specific Notes

### Home Page
- Large wheel card centered near top 600vp.
- Wheel sectors in alternating yolk/mint/peach/coral.
- Pointer fixed at top center of wheel.
- Result card below wheel shows dish name, tags, time.
- Quick mood/time filter chips below result card.
- Primary "记录这顿" button under result card.

### Fridge Page
- Search input + add button at top.
- Ingredient chips in horizontal wrap.
- "推荐菜品" large CTA.
- Recommendations as ranked list cards with match-percent badge.

### Mood Page
- Header gradient peach-to-cream.
- Mood selector as a 2-row chip grid.
- Time selector as segmented control.
- Result list cards with one-tap log button.

### Log Page
- Today summary card with count and calorie hint.
- Timeline of logged entries; each with share trigger.
- Empty state with chef-hat illustration.

### Share Card Sheet
- Full-screen bottom sheet.
- Card preview with gradient background, dish name, date, decorative pattern.
- Export/share CTA and close button.

## 8. Semantic UI Binding

### Surfaces / Routes
- `home-page` → `pages/Home`, tab `tab-home`
- `fridge-page` → `pages/Fridge`, tab `tab-fridge`
- `mood-page` → `pages/Mood`, tab `tab-mood`
- `log-page` → `pages/Log`, tab `tab-log`
- `share-card-sheet` → modal/sheet (no route)

### Action / Input / Assertion IDs
- `home-spin-button`, `home-wheel`, `home-dish-result`, `home-dish-card`, `home-log-button`, `home-filter-mood`, `home-filter-time`
- `fridge-ingredient-input`, `fridge-add-button`, `fridge-ingredient-list`, `fridge-recommend-button`, `fridge-recommendation-list`
- `mood-mood-selector`, `mood-time-selector`, `mood-apply-button`, `mood-dish-list`, `mood-log-button`
- `log-today-count`, `log-entry-list`, `log-share-button`
- `share-card-preview`, `share-card-export-button`, `share-card-close-button`

### Events
- `spin-wheel`, `log-current-dish`, `add-ingredient`, `remove-ingredient`, `recommend-by-ingredients`, `apply-mood-filters`, `log-selected-dish`, `open-share-card`, `export-share-card`, `close-share-card`

### Repeated Item Patterns
- `fridge-ingredient-{id}`
- `fridge-recommendation-{id}`
- `mood-dish-{id}`
- `log-entry-{id}`

### Empty State IDs
- `fridge-empty-state`, `fridge-no-match-state`, `mood-empty-state`, `log-empty-state`

### Change Requests
- None.

## 9. Do's and Don'ts

- Do use warm cream backgrounds and coral CTAs consistently.
- Do round corners aggressively (14–24px) for food/appetite feel.
- Do keep wheel as the visual hero on Home.
- Don't use emoji as icons; use local SVGs only.
- Don't use harsh black `#000000`; Deep Cocoa is the darkest neutral.
- Don't let the tab bar stretch full-width on desktop preview.
