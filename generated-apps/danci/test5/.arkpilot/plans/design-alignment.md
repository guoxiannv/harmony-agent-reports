# Design Alignment Plan — 单词翻翻乐

## 1. Visual Inputs

- Semantic UI protocol: `.arkpilot/designs/ui-tree.json`
- Final visual design artifact: `.arkpilot/designs/DESIGN2.md`
- HTML design artifact: `.arkpilot/designs/page-review-page.html`
- Route-worthy pages: `review-page` → `.arkpilot/designs/page-review-page.html`

## 2. Semantic UI Binding

### Surface / Page
| pageId | route | tabId |
|--------|-------|-------|
| review-page | pages/ReviewPage | — |

### Action / Input Targets
| semantic ID | event | ArkTS mapping hint |
|-------------|-------|--------------------|
| `review-flashcard` | `flip-card` | `Stack` / `Column` wrapping front/back card faces; `onClick` toggles flip animation state. |
| `review-known-button` | `mark-known` | `Button` component; removes current word from queue and increments known count. |
| `review-unknown-button` | `mark-unknown` | `Button` component; moves current word to bottom of queue. |
| `review-restart-button` | `restart-session` | `Button` shown only in completion state; reloads word bank into a fresh queue. |

### Assertion / State Targets
| semantic ID | binding | ArkTS mapping hint |
|-------------|---------|--------------------|
| `review-progress-total` | `/session/totalCount` | `Text` showing total word count. |
| `review-progress-remaining` | `/session/remainingCount` | `Text` showing words left in queue. |
| `review-progress-known` | `/session/knownCount` | `Text` inside trophy badge showing known count. |
| `review-card-front-word` | `/currentWord/word` | `Text` on front face of card. |
| `review-card-back-meaning` | `/currentWord/meaning` | `Text` on back face of card. |
| `review-card-back-phonetic` | `/currentWord/phonetic` | `Text` below meaning on back face. |
| `review-empty-state` | `/session/isComplete` | Conditional visibility of completion panel. |

### Repeated Items
None — the review session presents one card at a time.

## 3. Visual Requirements

### Page Canvas
- Max width 390px, centered.
- Background: linear gradient from `#E0F2FE` (top) to `#F0F9FF` (bottom).
- Two decorative radial blobs behind content:
  - Yellow blob at ~20% x / 60% y, `rgba(251,191,36,0.18)`.
  - Purple blob at ~80% x / 25% y, `rgba(167,139,250,0.20)`.

### Header (`ProgressHeader`)
- White panel with bottom radius 28px and soft shadow.
- Left: 44px rounded yellow-gradient icon (open-book SVG) + title “单词翻翻乐”.
- Right:
  - Glass pill: “剩余 {remaining} / {total}”.
  - Yellow-gradient badge with trophy SVG: “已会 {known}”.

### Flashcard
- 306×400 portrait card, max-width 88vw.
- White surface, 28px radius, layered shadow.
- 3D flip: `rotateY` with spring easing `cubic-bezier(0.34, 1.56, 0.64, 1)`, duration ~700ms.
- Front: large English word (54px, weight 800), small star decoration top-right, hint label at bottom.
- Back: Chinese meaning (36px, weight 800), thin divider, phonetic (20px, slate), faint ABC watermark.

### Action Buttons
- Two buttons side-by-side, 16px gap, equal flex.
- Known: yellow gradient, dark text, checkmark icon.
- Unknown: coral gradient, white text, rotate-ccw icon.
- Both 22px radius, min 60px height, shadow, press scale 0.96.
- Stack vertically on very narrow widths (<340px).

### Completion State
- White card 300px wide, 28px radius, shadow, centered.
- Yellow medal icon circle at top.
- Title + subtitle with known count.
- Full-width yellow restart button.

## 4. Non-Negotiable Constraints

- Do not rename semantic IDs, page IDs, routes, tab IDs, or event names.
- Treat `ui-tree.json` as the semantic binding protocol, not a layout tree.
- Treat the HTML artifact as the final visual reference.
- Keep all interactive targets bindable via the listed `data-ui-id` values.
- Target device: 1272×2756 phone; content max-width 390–420vp centered; bottom nav not applicable for single-page app.
- Do not add seeded demo data requirements; first-run word bank may be empty.
- Do not introduce extra screens or navigation tabs unless recorded as a change request.

## 5. HTML-to-ArkUI Mapping Notes

- The HTML `flashcard` wrapper with `transform-style: preserve-3d` maps to an ArkUI `Stack` with two `Column` children (front/back) and an `animation` + `rotate` applied to the `Stack`.
- The decorative blobs can be implemented as absolute-positioned `Shape`/`Circle` or background images.
- Glass pill can use `Column`/`Row` with semi-transparent background and `blur` if available; otherwise a solid white/low-opacity fill.
- SVG icons should be inline SVG components or `Image` sources; preserve semantic `<title>`-style labels via accessibility text or component naming.
- Shadows in ArkUI: use `shadow()` modifier with the RGBA/offset/blur values from the design tokens.

## 6. Open / Change Requests

None.
