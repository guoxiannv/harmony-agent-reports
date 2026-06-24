# 单词翻翻乐 — Visual Design System (Final)

## 1. Visual Theme & Atmosphere

The app should feel like a friendly, tactile desk toy for children — bright, clean, and gently playful without becoming childish. The interface uses a soft pastel background, a single warm accent color, and rounded, squishy surfaces. Everything is large, legible, and finger-friendly.

- **Mood**: cheerful, calm, encouraging.
- **Visual metaphor**: a stack of illustrated flashcards on a colorful desk, floating above a gentle gradient sky.
- **Motion philosophy**: cards respond to touch with a springy 3D flip; buttons compress on press; progress updates with smooth counting; subtle background blobs drift slowly.

## 2. Color Palette & Roles

### Background
- **Sky Gradient Top** (`#E0F2FE`): upper page background.
- **Sky Gradient Bottom** (`#F0F9FF`): lower page background.
- Decorative radial blob left: `radial-gradient(circle at 20% 60%, rgba(251, 191, 36, 0.18) 0%, transparent 40%)`.
- Decorative radial blob right: `radial-gradient(circle at 80% 25%, rgba(167, 139, 250, 0.20) 0%, transparent 45%)`.

### Surfaces
- **Cloud White** (`#FFFFFF`): card surfaces, header area.
- **Glass White** (`rgba(255, 255, 255, 0.68)`): subtle secondary panels with `backdrop-filter: blur(14px)`.

### Text
- **Ink** (`#1F2937`): headings, word text, button labels.
- **Slate** (`#64748B`): secondary text, phonetic symbol, progress labels.
- **White** (`#FFFFFF`): text on colored buttons.

### Accents
- **Sunshine Yellow** (`#FBBF24`): primary positive action, progress highlight, known button, completion state.
- **Coral** (`#F87171`): re-queue / unknown action.
- **Mint Green** (`#34D399`): success counter accent (used only in small badge, not competing with yellow).

### Gradients
- **Known Button Gradient**: `linear-gradient(135deg, #FCD34D 0%, #F59E0B 100%)`.
- **Unknown Button Gradient**: `linear-gradient(135deg, #FCA5A5 0%, #EF4444 100%)`.
- **Progress Badge Gradient**: `linear-gradient(135deg, #FDE68A 0%, #FBBF24 100%)`.
- **Header Icon Gradient**: `linear-gradient(135deg, #FDE68A 0%, #FBBF24 100%)`.

### Shadows
- **Card Shadow** (`0 28px 56px rgba(31, 41, 55, 0.13), 0 10px 20px rgba(31, 41, 55, 0.08)`): layered, photographic shadow.
- **Button Shadow** (`0 12px 28px rgba(245, 158, 11, 0.32)`): warm lift for primary action.
- **Unknown Button Shadow** (`0 12px 28px rgba(239, 68, 68, 0.26)`).
- **Header Shadow** (`0 6px 24px rgba(31, 41, 55, 0.06)`).

## 3. Typography Rules

### Font Family
- **Display / Word**: rounded sans-serif (`"Nunito", "PingFang SC", "Helvetica Neue", sans-serif`).
- **Body / UI labels**: `"PingFang SC", "SF Pro Text", "Helvetica Neue", sans-serif`.

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Page Title | 24px | 800 | 1.2 | -0.2px | #1F2937 |
| Word (card front) | 54px | 800 | 1.05 | -0.6px | #1F2937 |
| Meaning (card back) | 36px | 800 | 1.25 | 0 | #1F2937 |
| Phonetic | 20px | 500 | 1.4 | 0.6px | #64748B |
| Progress Count | 18px | 800 | 1 | 0 | #1F2937 |
| Progress Label | 12px | 600 | 1.3 | 0 | #64748B |
| Button Label | 18px | 800 | 1 | 0.2px | #FFFFFF or #1F2937 |
| Empty Title | 24px | 800 | 1.25 | 0 | #1F2937 |
| Empty Body | 15px | 500 | 1.55 | 0 | #64748B |

## 4. Component Stylings

### Header (`ProgressHeader`)
- Background: white with bottom radius 28px.
- Padding: 22px horizontal, 24px vertical.
- Shadow: header shadow.
- Left cluster: app icon (44px circle, header icon gradient) + title “单词翻翻乐” (24px, weight 800).
- Right cluster:
  - Progress pill: glass white background, 18px radius, 10px 16px padding.
  - Text: “剩余” label + count in ink weight 800 + “/ 10” in slate.
  - Known badge: yellow gradient pill, trophy icon, “已会 2”.

### Flashcard
- Size: 306px × 400px, max-width 88vw.
- Border radius: 28px.
- Background: white.
- Shadow: layered card shadow.
- 3D flip: `transform-style: preserve-3d`, `transition: transform 0.7s cubic-bezier(0.34, 1.56, 0.64, 1)`.
- Front face:
  - English word centered, 54px, weight 800.
  - Subtle hint label at bottom: “点我查看释义”, slate, 13px.
  - Decorative top-right corner: small yellow star icon.
- Back face:
  - Chinese meaning centered, 36px, weight 800.
  - Phonetic below, 20px, slate.
  - Thin divider line (1px, rgba(100,116,139,0.12)) between meaning and phonetic.
  - Watermark: faint ABC letters at 4% opacity, bottom-right.

### Known Button
- Background: known button gradient.
- Text: ink (#1F2937) for strong contrast on yellow.
- Radius: 22px.
- Padding: 18px 28px.
- Shadow: button shadow.
- Icon: checkmark SVG, 22px, ink color, left of label.
- Pressed: scale 0.96, brightness 0.96.

### Unknown Button
- Background: unknown button gradient.
- Text: white.
- Radius: 22px.
- Padding: 18px 28px.
- Shadow: unknown button shadow.
- Icon: rotate/undo SVG, 22px, white, left of label.
- Pressed: scale 0.96.

### Completion State
- Centered card panel, 300px × auto, white, 28px radius, card shadow.
- Top: large medal/star SVG with yellow gradient.
- Title: “太棒了！全部复习完成”, 24px, ink, weight 800.
- Subtitle: “本次已掌握 X 个单词”, 15px, slate.
- Restart button: full-width yellow gradient pill, 18px label, shadow.

## 5. Layout Principles

### Container
- Max width: 390px, centered.
- Background: sky gradient.
- Decorative yellow and purple blobs fixed behind content.

### Page Layout (top to bottom)
1. `ProgressHeader` at top, white rounded panel.
2. 48px vertical space.
3. Flashcard centered.
4. 44px vertical space.
5. Action row: two buttons side by side, 16px gap, equal flex.
6. 32px bottom padding.

### Touch Targets
- Buttons: min 132px × 60px.
- Card: full card is tappable (306 × 400).

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Background | gradient + two radial blobs | page canvas |
| Header | white, bottom radius 28px, soft shadow | floating top bar |
| Card | layered shadow, 3D transform | hero interactive object |
| Buttons | gradient + colored shadow, press scale | action layer |
| Completion | white card, layered shadow | modal-like focus |

## 7. Do's and Don'ts

### Do
- Use rounded corners everywhere (22px+ for buttons, 28px for header/card).
- Use large, high-contrast text for children.
- Animate state changes with spring easing.
- Keep the page single-focus: one card, two actions.
- Use gradients on buttons to add life without extra colors.

### Don't
- Don't use thin strokes or small fonts.
- Don't add extra navigation tabs or sidebars.
- Don't use flat gray buttons.
- Don't clutter the card back with too much information.
- Don't use emoji or pictographic Unicode as icons.

## 8. Responsive Behavior

- Width 320-420px: card scales to 88vw, buttons stay side-by-side until 340px then stack.
- Height: ensure header + card + buttons fit within first 600vp; extra vertical space distributed between card and buttons.

## 9. Semantic UI Binding

### Surfaces
- `review-page` → route `pages/ReviewPage`

### Semantic Targets
| ID | Role | Visual Treatment |
|----|------|------------------|
| `review-progress-total` | assertion | shown inside progress pill as “/ total” |
| `review-progress-remaining` | assertion | shown inside progress pill as “剩余 N” |
| `review-progress-known` | assertion | trophy icon + “已会 N” |
| `review-flashcard` | action | the 3D flip card wrapper |
| `review-card-front-word` | assertion | large English word on card front |
| `review-card-back-meaning` | assertion | Chinese meaning on card back |
| `review-card-back-phonetic` | assertion | phonetic symbol on card back |
| `review-known-button` | action | yellow gradient “认识” button |
| `review-unknown-button` | action | coral gradient “不认识” button |
| `review-empty-state` | assertion | completion panel |
| `review-restart-button` | action | yellow “再复习一次” button |

### Events
- `flip-card` — triggered by tapping the card.
- `mark-known` — triggered by the yellow button.
- `mark-unknown` — triggered by the coral button.
- `restart-session` — triggered by the completion restart button.

### Bindings
- `/session/totalCount`, `/session/remainingCount`, `/session/knownCount` — bound to progress header.
- `/currentWord/word` — bound to front of card.
- `/currentWord/meaning`, `/currentWord/phonetic` — bound to back of card.
- `/session/isComplete` — controls visibility of completion state.

### ID Gaps / Change Requests
None identified during visual design.
