# 今天吃什么 — Visual Design System (v2)

## 1. Visual Theme & Atmosphere

A cozy, appetite-first decision kitchen. The interface reads like a modern recipe card collection: warm parchment backgrounds, confident coral accents, fresh mint and sunny yolk highlights, and soft, edible-shaped cards. The wheel is treated as a physical object with layered depth and a glowing pointer. Every screen rewards interaction with tactile press states and gentle motion hints.

The design avoids the cold, generic template look by:
- Using a warm, desaturated palette instead of pure white/gray.
- Combining multiple harmonious accent colors (coral, mint, yolk, berry) in controlled roles.
- Applying soft gradients, inner shadows on the wheel, and colored glows behind CTAs.
- Giving cards real weight with layered shadows and generous internal spacing.

## 2. Color Palette & Roles

### Backgrounds
- **Cream Canvas** `#FFF8F0` — primary page background.
- **Soft Peach** `#FFE9DE` — hero/header gradients, mood page top.
- **Warm Mist** `#F5EEE6` — secondary card fills, input backgrounds.

### Text
- **Deep Cocoa** `#3D2B1F` — primary text.
- **Warm Stone** `#6B5E52` — secondary text.
- **Ash Taupe** `#9E9185` — tertiary/disabled text.

### Accents
- **Coral CTA** `#FF6B4A` — primary actions, active chips, wheel pointer glow.
- **Mint Fresh** `#3DD9C7` — ingredient chips, success states.
- **Sunny Yolk** `#FFCC5C` — wheel sectors, warm tags.
- **Berry Blush** `#FF6B8B` — mood tags, share-card gradient end.

### Surfaces
- **Card White** `#FFFFFF` with subtle warm tint.
- **Pressed Cream** `#F0E8DF` — pressed chip/card state.
- **Glass White** `rgba(255,255,255,0.72)` with blur — modal scrim cards.

### Shadows
- **Card Shadow** `0 12px 32px rgba(61,43,31,0.08)`.
- **Elevated Shadow** `0 18px 44px rgba(61,43,31,0.12)`.
- **CTA Glow** `0 8px 24px rgba(255,107,74,0.32)`.

## 3. Typography Rules

| Role | Font | Size | Weight | Line Height | Letter Spacing |
|------|------|------|--------|-------------|----------------|
| Page Title | SF Pro Display / PingFang SC | 30px | 700 | 1.18 | -0.4px |
| Section Title | SF Pro Display / PingFang SC | 21px | 700 | 1.24 | -0.2px |
| Card Title | SF Pro Text / PingFang SC | 18px | 700 | 1.3 | -0.1px |
| Body | SF Pro Text / PingFang SC | 15px | 400 | 1.55 | 0 |
| Button | SF Pro Text / PingFang SC | 16px | 700 | 1 | 0.1px |
| Caption | SF Pro Text / PingFang SC | 13px | 600 | 1.35 | 0.1px |
| Micro | SF Pro Text / PingFang SC | 11px | 600 | 1.3 | 0.2px |

## 4. Component Stylings

### Primary Button
- Background: linear-gradient(135deg, `#FF6B4A` 0%, `#FF8A6D` 100%).
- Text: white.
- Padding: 16px 32px.
- Border radius: 18px.
- Shadow: CTA Glow.
- Pressed: brightness 0.96, scale 0.97.

### Secondary Button
- Background: `#FFFFFF`.
- Border: 1.5px solid `#FF6B4A`.
- Text: `#FF6B4A`.
- Border radius: 16px.
- Padding: 13px 24px.

### Wheel
- Outer ring: `#FFFFFF`, 16px border, shadow Elevated.
- Inner plate: conic gradient of Yolk, Mint, Peach, Berry, Lavender `#C4A8FF`, Coral.
- Pointer: Coral triangle with white border, shadow CTA Glow, fixed top.
- Center cap: white circle 56px with shadow.

### Filter Chips
- Default: white bg, `#6B5E52` text, 1px `#E8E0D6` border, 999px radius.
- Active: gradient bg (Coral to Berry), white text, no border.
- Padding: 10px 18px.

### Ingredient Chip
- Background: `#E5F9F6`.
- Text: `#1F7A71`.
- Remove icon inside chip.

### Recommendation Card
- White card, 20px radius.
- Left accent stripe 4px in Coral/Mint/Yolk.
- Match badge: Coral pill with white text.
- Tag row: small pills in warm mist.

### Log Entry Row
- White card, 18px radius.
- Left time pill in warm mist.
- Right share icon button.

### Share Card Preview
- 320 × 420 px rounded card.
- Gradient background: Soft Peach → Berry Blush diagonal.
- Large dish title in white, date below, small decorative pattern.

### Bottom Tab Bar
- White, 24px top radius.
- Shadow upward.
- 4 items: Home (chef-hat), Fridge (refrigerator), Mood (smile), Log (calendar).
- Active: Coral icon + label; inactive: Ash Taupe.

## 5. Layout Principles

- Centered container max 400vp.
- Page padding 22px.
- Card internal padding 20–24px.
- Section spacing 28px.
- Tab bar height 80px including safe area.

## 6. Depth & Elevation

- Background flat.
- Cards float with Card Shadow.
- Wheel floats with Elevated Shadow + inner gradient shine.
- Modal sheet floats over scrim `rgba(61,43,31,0.35)`.
- Active buttons have colored glow.

## 7. Semantic UI Binding

(Same as DESIGN.md — preserved.)

## 8. Page-Specific Polish

### Home Page
- Wheel card dominates first 600vp.
- Quick tip caption below wheel.
- Result card animates in after spin.
- "记录这顿" primary CTA spans full width.

### Fridge Page
- Add ingredient row sticky-feeling at top.
- Chips wrap with mint palette.
- Recommendation list ranked with match percentage.

### Mood Page
- Hero gradient from Peach to Cream.
- Mood chips in 2-row grid, active fills with gradients.
- Time selector as 4-segment pill.
- Result cards have one-tap log shortcut.

### Log Page
- Hero summary card with today count and streak hint.
- Timeline grouped by time of day.
- Empty state centered with chef-hat + CTA.

### Share Card Sheet
- Bottom sheet, 90% height.
- Card preview centered.
- Export/share primary CTA.
- Close as top-right icon.

## 9. Do's and Don'ts

- Do use gradients on active chips and primary CTAs.
- Do add inner shadows to the wheel for physical depth.
- Do keep iconography SVG-only with contextual `<title>`.
- Don't use pure black text or borders.
- Don't center body text; keep headlines and short labels centered.
- Don't let tab bar exceed 420vp width.
