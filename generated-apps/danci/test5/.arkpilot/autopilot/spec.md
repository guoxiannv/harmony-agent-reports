# Kids Vocabulary Review App — Product Spec

## Classification
CONCRETE — the user provided a focused feature description: a single-screen flashcard review flow for children with 3D flip animation and known/unknown self-assessment.

## Value Proposition
Help children independently review words they have already learned in a low-pressure, tactile flashcard experience. The app turns passive word lists into an active recall game that adapts to the child’s confidence by re-queueing missed words until they are mastered.

## Product Category & Primary User Scenario
- **Category**: Education / Kids’ language-learning tool.
- **Primary scenario**: A child opens the app, sees one word at a time on a large card, tries to remember its meaning and pronunciation, taps the card to reveal the answer, then self-reports “认识” or “不认识”. The app either removes the word from the current stack or sends it to the back of the queue for another round.

## Core Jobs-to-be-Done
1. Load the current study set from a word bank so the child reviews only words they have already encountered.
2. Present one word at a time on a large, tappable card with clear English on the front.
3. Reveal the Chinese meaning and phonetic symbol with a playful 3D flip animation.
4. Let the child mark a word as known or unknown with big, friendly buttons.
5. Update the review queue and score: known words leave the stack; unknown words go to the bottom for re-review.

## Page Structure
- `review-page` — the only route-worthy surface. Contains:
  - Header with progress (remaining count / total, correct count).
  - Flashcard stage (one card, front + back).
  - Action row with two large buttons: “认识” and “不认识”.
  - Completion empty state when the stack is exhausted.

## Navigation Model
- Single-page app. No tabs, no deep navigation.
- Optional future extension: a settings or word-list management page is out of scope.

## Data Source Strategy
- The app loads words from a local in-code word bank (array/JSON) scoped to the child’s current learning stage.
- First-run state is real: the word bank may be empty or populated by the parent/teacher outside this scope.
- The review session creates an in-memory working queue from the loaded words.
- Progress (known count, remaining count, current queue order) lives only for the active session; persistence is out of scope.
- No preset demo/seed data is required as a functional product requirement.

## Component Structure
- `ReviewPage` — top-level page, owns session state.
- `Flashcard` — presents the current card, handles tap-to-flip and 3D animation.
- `ProgressHeader` — shows title, remaining count, and correct count.
- `ActionBar` — contains the “认识” and “不认识” buttons.
- `CompletionState` — shown when the queue is empty.

## Target Device
- 屏幕分辨率：1272vp × 2756vp（宽 × 高）
- 设备类型：普通手机（非折叠机、非平板）
- 像素密度倍率：3x（即HTML设计稿390px = 设备上1170vp物理像素，但ArkTS使用vp单位时1px≈1vp）
- 布局策略：内容区max-width约束在390-420vp内居中，禁止全宽铺满。**注意：Tab导航栏等必须在底部，且若使用 `position: fixed` 必须限制宽度与body一致（如 `width: 100%; max-width: 390px; margin: 0 auto; left: 0; right: 0;`），严禁在PC浏览器上全宽拉伸。严禁生成在侧边（如右边/左边）**。
- 特殊注意：2756px高度意味着屏幕很长，滚动区域充足，但需确保首屏关键内容（Header+核心卡片）在顶部600vp内可见

## Acceptance Criteria
- [ ] The app loads a list of words and displays the first word on a card.
- [ ] Tapping the card triggers a smooth 3D flip animation revealing Chinese meaning + phonetic symbol.
- [ ] Tapping “认识” removes the current card, increments the correct count, and shows the next card.
- [ ] Tapping “不认识” moves the current card to the bottom of the queue and shows the next card.
- [ ] When all cards are marked known, a completion state is shown.
- [ ] The header shows current progress: remaining count and correct count.
- [ ] The UI is visually appealing, child-friendly, and optimized for the declared target device.

## Non-Goals
- User accounts, login, or cloud sync.
- Parent/teacher word-bank editing UI.
- Audio pronunciation, spelling input, or quiz modes.
- Persistent session history or spaced-repetition scheduling.
- Seeded demo data required at first launch.

## Open Questions
- Should the word bank be hard-coded in ArkTS or loaded from a local JSON file? (Execution decides based on project conventions.)
- Should the “不认识” button also flip the card back to the front face when the word reappears? (Recommended: yes, auto-reset to front.)
