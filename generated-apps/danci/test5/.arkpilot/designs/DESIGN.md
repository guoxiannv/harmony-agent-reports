# 单词翻翻乐 — Visual Design System

## 1. Visual Theme & Atmosphere

The app should feel like a friendly, tactile desk toy for children — bright, clean, and gently playful without becoming childish. The interface uses a soft pastel background, a single warm accent color, and rounded, squishy surfaces. Everything is large, legible, and finger-friendly.

- **Mood**: cheerful, calm, encouraging.
- **Visual metaphor**: a stack of illustrated flashcards on a colorful desk.
- **Motion philosophy**: cards respond to touch with a springy 3D flip; buttons compress on press; progress updates with smooth counting.

## 2. Color Palette & Roles

### Primary
- **Sky Blue** (`#E8F4FD`): main page background — soft, non-distracting, child-friendly.
- **Cloud White** (`#FFFFFF`): card surfaces, button fills, header area.
- **Ink** (`#1F2937`): primary text, strong contrast for readability.

### Accent
- **Sunshine Yellow** (`#FBBF24`): primary action highlights, progress ring, known button background, celebratory accents.
- **Coral** (`#F87171`): unknown/re-queue button background, soft warning tone.

### Semantic Surface
- **Known Green** (`#34D399`): optional success hint text or badge (used sparingly, not as a second accent).
- **Backstage Purple** (`#A78BFA`): optional decorative background blob behind the card.

### Text
- **Ink** (`#1F2937`): headings, word text, button labels.
- **Slate** (`#64748B`): secondary text, phonetic symbol, progress labels.
- **White** (`#FFFFFF`): text on colored buttons.

### Shadows
- **Card Shadow** (`0 20px 40px rgba(31, 41, 55, 0.16)`): large floating card.
- **Button Shadow** (`0 8px 20px rgba(251, 191, 36, 0.35)`): primary button lift.
- **Soft Shadow** (`0 4px 12px rgba(31, 41, 55, 0.08)`): header, small surfaces.

## 3. Typography Rules

### Font Family
- **Display / Word**: rounded sans-serif (`"Nunito", "PingFang SC", "Helvetica Neue", sans-serif`).
- **Body / UI labels**: `"PingFang SC", "SF Pro Text", "Helvetica Neue", sans-serif`.

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Page Title | 24px | 800 | 1.2 | -0.2px | #1F2937 |
| Word (card front) | 48px | 800 | 1.1 | -0.5px | #1F2937 |
| Meaning (card back) | 32px | 700 | 1.3 | 0 | #1F2937 |
| Phonetic | 20px | 400 | 1.4 | 0.5px | #64748B |
| Progress Count | 18px | 700 | 1 | 0 | #1F2937 |
| Progress Label | 12px | 500 | 1.3 | 0 | #64748B |
| Button Label | 18px | 700 | 1 | 0.2px | #FFFFFF or #1F2937 |
| Empty Title | 22px | 700 | 1.3 | 0 | #1F2937 |
| Empty Body | 15px | 400 | 1.5 | 0 | #64748B |

## 4. Component Stylings

### Header (`ProgressHeader`)
- Background: white, rounded 20px at bottom corners only, soft shadow.
- Padding: 20px horizontal, 24px vertical.
- Contents:
  - Left: app icon + title “单词翻翻乐”.
  - Right: progress pill showing “剩余 8 / 10” and a small trophy icon + “已会 2”.

### Flashcard
- Size: 300px × 380px (portrait), max-width 88vw.
- Border radius: 28px.
- Background: white.
- Shadow: card shadow.
- 3D flip: `transform-style: preserve-3d`, `transition: transform 0.65s cubic-bezier(0.34, 1.56, 0.64, 1)`.
- Front: centered English word, phonetic preview hidden.
- Back: Chinese meaning large, phonetic below in slate.
- Decorative back-of-card watermark: faint ABC pattern at 5% opacity.

### Known Button
- Background: `#FBBF24`.
- Text: `#1F2937` (dark text for strong contrast on yellow).
- Radius: 20px.
- Padding: 16px 28px.
- Shadow: button shadow.
- Icon: checkmark SVG (left of label).
- Pressed: scale 0.96, shadow reduces.

### Unknown Button
- Background: `#F87171`.
- Text: white.
- Radius: 20px.
- Padding: 16px 28px.
- Shadow: `0 8px 20px rgba(248, 113, 113, 0.3)`.
- Icon: circular-arrow/rotate SVG (left of label).
- Pressed: scale 0.96.

### Completion State
- Centered illustration area (placeholder: a star medal SVG).
- Title: “太棒了！全部复习完成”.
- Subtitle: “本次已掌握 X 个单词”.
- Restart button: yellow filled pill, label “再复习一次”.

## 5. Layout Principles

### Container
- Max width: 390px, centered.
- Background: sky blue fills full height.
- Top safe-area padding respected.

### Page Layout (top to bottom)
1. `ProgressHeader` at top, white rounded panel.
2. 40px vertical space.
3. Flashcard centered.
4. 36px vertical space.
5. Action row: two buttons side by side with 16px gap.
6. 24px bottom padding.

### Touch Targets
- Buttons: min 120px × 56px.
- Card: full card is tappable (300 × 380).

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Background | flat sky blue + decorative purple blob | page canvas |
| Header | white, bottom radius 20px, soft shadow | floating top bar |
| Card | large shadow, 3D transform | hero interactive object |
| Buttons | colored shadow, press scale | action layer |

## 7. Do's and Don'ts

### Do
- Use rounded corners everywhere (16px+ for cards, 20px for buttons).
- Use large, high-contrast text for children.
- Animate state changes with spring easing.
- Keep the page single-focus: one card, two actions.

### Don't
- Don't use thin strokes or small fonts.
- Don't add extra navigation tabs or sidebars.
- Don't use generic gray buttons.
- Don't clutter the card back with too much information.

## 8. Responsive Behavior

- Width 320-420px: card scales to 88vw, buttons remain side-by-side until 340px then stack.
- Height: ensure header + card + buttons fit within first 600vp; excess vertical space distributed between card and buttons.

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
| `review-known-button` | action | yellow “认识” button |
| `review-unknown-button` | action | coral “不认识” button |
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
