# 宠迹·PawLog 视觉设计系统（DESIGN.md）

## 1. Visual Theme & Atmosphere

宠迹·PawLog 的视觉语言是**圆润、柔软、治愈**的。我们不想做一个冷冰冰的医疗健康工具，而是让每一次打开 App 都像走进一间被阳光晒暖的宠物房：薄荷绿的清新空气、肉垫粉的温柔触感、大圆角卡片像云朵一样托起信息。

整体氛围的关键词：
- **清新（Fresh）**：薄荷绿作为主色，带来洁净、健康、自然的感觉。
- **温柔（Tender）**：肉垫粉作为辅助色，出现在头像光环、按钮高亮、空状态插画中。
- **可靠（Trustworthy）**：信息层级清晰，记录入口大而明确，减少主人的操作焦虑。
- **治愈（Healing）**：圆角、柔和阴影、微渐变、毛玻璃效果，让界面像宠物一样软萌。

与参考模板 TEMPLATE_DESIGN.md 的 Apple 风格不同，PawLog 不追求极简冷峻，而是在组件内部使用**多色和谐搭配**、**柔和渐变**与**细腻阴影**，营造出温暖亲切的治愈感。

## 2. Color Palette & Roles

### Primary（主色）
- **薄荷绿 500** `#5ED7B6`：品牌主色，用于主按钮、关键图标、选中态、图表主折线。
- **薄荷绿 600** `#3CB89A`：主色深一度，用于 hover/pressed 状态。
- **薄荷绿 100** `#E8FBF5`：极淡薄荷背景，用于卡片底色、选中 chip、气泡背景。
- **薄荷绿 50** `#F3FDF9`：页面级浅底、空状态背景。

### Secondary（辅助色）
- **肉垫粉 500** `#FFB3C1`：品牌辅助色，用于宠物头像光环、强调标签、空状态插画、情感化高亮。
- **肉垫粉 600** `#FF8FA3`：粉色深一度，用于选中态、 urgent 提醒背景。
- **肉垫粉 100** `#FFF0F3`：淡粉背景，用于提醒卡片、家庭共享入口背景。

### Accent & Functional
- **阳光黄 500** `#FFD166`：用于完成标记、星星、正向趋势标签。
- **阳光黄 100** `#FFF7E0`：完成态卡片背景。
- **薰衣草紫 500** `#B8B8E0`：用于病历、医疗相关图标与卡片描边。
- **薰衣草紫 100** `#F0F0FA`：病历卡片背景。
- **天空蓝 500** `#A0D8EF`：用于体重趋势、信息提示。
- **天空蓝 100** `#E8F6FC`：体重统计卡片背景。

### Neutrals（中性色）
- **深森绿 900** `#1A3C34`：主文本色，替代纯黑，更柔和。
- **深森绿 700** `#3D5A52`：二级文本。
- **深森绿 500** `#6B857E`：三级文本、占位符、禁用态。
- **深森绿 200** `#C5D3CF`：边框、分割线。
- **深森绿 100** `#E5EDEA`：卡片描边、浅色分割线。
- **米白 50** `#FAFDFC`：页面主背景。
- **纯白** `#FFFFFF`：卡片背景、输入框背景。

### Semantic Colors（语义色）
- **成功绿** `#4CAF79`
- **警告橙** `#FF9F5A`
- **错误红** `#FF6B6B`
- **信息蓝** `#5BBCE4`

## 3. Typography Rules

### Font Family
- **Display / Heading**：`HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, sans-serif
- **Body**：`HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, sans-serif

中文环境下不使用西文光学字号规则，采用更舒展的中文行高。

### Hierarchy

| Role | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|--------|-------------|----------------|-------|
| Display Hero | 32px | 700 | 1.25 | 0 | 深森绿 900 |
| Section Heading | 22px | 700 | 1.3 | 0 | 深森绿 900 |
| Card Title | 18px | 700 | 1.35 | 0 | 深森绿 900 |
| Sub-heading | 16px | 600 | 1.4 | 0 | 深森绿 900 |
| Body | 15px | 400 | 1.55 | 0.02em | 深森绿 700 |
| Body Emphasis | 15px | 600 | 1.5 | 0.01em | 深森绿 900 |
| Caption | 13px | 400 | 1.45 | 0.02em | 深森绿 500 |
| Caption Bold | 13px | 600 | 1.4 | 0 | 深森绿 700 |
| Micro | 11px | 500 | 1.35 | 0.02em | 深森绿 500 |
| Button Large | 17px | 600 | 1 | 0.01em | 纯白 |
| Button | 15px | 600 | 1 | 0.01em | 纯白 |

### Principles
- 标题使用较大字重（700）增强信赖感。
- 正文行高 1.55，中文阅读更舒适。
- 标签/时间戳使用 Caption 或 Micro，保持界面清爽。

## 4. Component Stylings

### Buttons

**Primary CTA（薄荷绿实心）**
- Background: `linear-gradient(135deg, #5ED7B6 0%, #3CB89A 100%)`
- Text: `#FFFFFF`
- Padding: 14px 24px
- Border Radius: 28px（大圆角药丸）
- Font: 16px, weight 600
- Shadow: `0 6px 16px rgba(94, 215, 182, 0.32)`
- Active: scale 0.98，背景加深

**Secondary Button（白底描边）**
- Background: `#FFFFFF`
- Border: 1.5px solid `#E5EDEA`
- Text: 深森绿 900
- Padding: 12px 20px
- Border Radius: 24px
- Active: 背景变为薄荷绿 50

**Soft Button（浅薄荷底）**
- Background: `#E8FBF5`
- Text: 薄荷绿 600
- Padding: 10px 16px
- Border Radius: 20px
- Active: 背景变为薄荷绿 100

**Filter Chip**
- Default: bg `#FFFFFF`, border 1px `#E5EDEA`, text 深森绿 700
- Selected: bg 薄荷绿 100, text 薄荷绿 600, border 薄荷绿 500
- Border Radius: 20px
- Padding: 8px 16px

### Cards & Containers

**Standard Card**
- Background: `#FFFFFF`
- Border Radius: 24px
- Padding: 20px
- Shadow: `0 4px 20px rgba(26, 60, 52, 0.06)`
- Border: 1px solid `rgba(197, 211, 207, 0.4)`（极淡描边）

**Hero Card（首页顶部汇总）**
- Background: `linear-gradient(135deg, #E8FBF5 0%, #FFFFFF 100%)`
- Border Radius: 28px
- Padding: 24px
- Shadow: `0 8px 28px rgba(94, 215, 182, 0.18)`

**Reminder Card**
- Urgent: bg 肉垫粉 100, border 肉垫粉 500, shadow 带粉色光晕
- Normal: bg `#FFFFFF`, border 深森绿 100
- Done: bg 阳光黄 100, opacity 0.85
- Border Radius: 20px

**Medical Card**
- Background: 薰衣草紫 100
- Border: 1px solid 薰衣草紫 500 / 30%
- Border Radius: 20px

### Inputs

**Text Field**
- Background: `#FAFDFC`
- Border: 1px solid `#E5EDEA`
- Border Radius: 16px
- Padding: 14px 16px
- Focus: border 薄荷绿 500, shadow `0 0 0 3px rgba(94, 215, 182, 0.15)`
- Placeholder: 深森绿 500

**Selector / Picker**
- Background: `#FFFFFF`
- Border: 1px solid `#E5EDEA`
- Border Radius: 16px
- Padding: 14px 16px
- Right icon: chevron-down

### Navigation

**Bottom Tab Bar**
- Background: `#FFFFFF`
- Height: 68px + safe area
- Border Top: 1px solid `#E5EDEA`
- Active icon/text: 薄荷绿 500
- Inactive icon/text: 深森绿 500
- Icon size: 24px
- Label: 11px, weight 500
- Top padding: 8px

**Top Header**
- Transparent or 米白 50
- Title: Section Heading, left aligned
- Right action: 肉垫粉 500 圆形按钮（+ / 设置）

## 5. Layout Principles

### Spacing System
- Base unit: 4px
- Scale: 4, 8, 12, 16, 20, 24, 28, 32, 40, 48, 64
- 卡片之间默认 16px
- 页面水平内边距：16px

### Grid & Container
- 移动端内容区最大宽度：390px，居中
- 页面内所有卡片/列表在 16px 水平内边距内
- 首页顶部宠物头像横向滚动，超出屏幕可滑动
- 底部 Tab Bar 固定，宽度与内容区一致，不超过 390px

### Whitespace Philosophy
- 顶部留出 44-56px 状态栏/标题区
- 首屏核心内容（header + 汇总卡片 + 快捷入口）控制在 600vp 内
- 卡片内部信息密度适中，留出呼吸感
- 空状态使用大幅插画 + 引导按钮，避免信息压迫

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影，仅背景色 | 页面底层、分隔区块 |
| Card | `0 4px 20px rgba(26,60,52,0.06)` | 标准卡片 |
| Elevated Card | `0 8px 28px rgba(94,215,182,0.18)` | 首页汇总、重要 CTA 卡片 |
| Floating Button | `0 8px 24px rgba(94,215,182,0.35)` | 悬浮添加按钮 |
| Sheet | 顶部圆角 28px，背景 `#FFFFFF`，上方 overlay `rgba(26,60,52,0.35)` | 底部弹层 |
| Focus | `0 0 0 3px rgba(94,215,182,0.2)` | 输入框聚焦 |

## 7. Do's and Don'ts

### Do
- 使用大圆角（20px-28px）营造柔软感。
- 在卡片、按钮、关键区域使用薄荷绿到深薄荷的渐变。
- 使用肉垫粉作为头像光环、情感化点缀、urgent 提醒背景。
- 为每个图标级 SVG 提供语义化的 `<title>`。
- 保持底部 Tab 固定，不侧滑、不满铺。
- 为空状态设计独立插画与明确引导。

### Don't
- 不要使用尖锐直角（小于 12px）。
- 不要让同一屏幕出现 4 种以上高饱和强调色。
- 不要使用 emoji 作为 UI 图标。
- 不要把 Tab 导航放到侧边或顶部。
- 不要在首页一次性展示过多数字图表。

## 8. Responsive Behavior

### Target Device
- 宽度：1272vp × 2756vp
- 内容区 max-width：390-420vp，居中
- 底部 Tab Bar 宽度跟随 body，不超过 390px，左右 auto margin
- 在 PC 浏览器上禁止全宽拉伸

### Touch Targets
- 主按钮高度 ≥ 48px
- 图标按钮触摸区域 ≥ 44px
- Tab item 高度 68px
- 快捷记录入口 ≥ 72px × 72px

## 9. Semantic UI Binding

### Surfaces & Routes

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home | home-page | pages/Home | tab-home |
| records | records-page | pages/Records | tab-records |
| trends | trends-page | pages/Trends | tab-trends |
| care | care-page | pages/Care | tab-care |
| profile | profile-page | pages/Profile | tab-profile |
| pet-picker | pet-picker-sheet | (sheet) | - |
| add-record | add-record-sheet | (sheet) | - |
| record-diet | record-diet-sheet | (sheet) | - |
| record-stool | record-stool-sheet | (sheet) | - |
| record-weight | record-weight-sheet | (sheet) | - |
| record-meds | record-meds-sheet | (sheet) | - |
| reminder-detail | reminder-detail-page | pages/ReminderDetail | - |
| medical-case | medical-case-page | pages/MedicalCase | - |
| medical-case-editor | medical-case-editor-page | pages/MedicalCaseEditor | - |
| family-invite | family-invite-sheet | (sheet) | - |
| pet-editor | pet-editor-page | pages/PetEditor | - |

### Key Semantic Targets to Preserve

- `home-pet-switcher`, `home-current-pet-avatar`, `home-current-pet-name`
- `home-quick-diet`, `home-quick-stool`, `home-quick-weight`, `home-quick-meds`
- `home-today-summary-list`, `home-reminder-list`, `home-empty-state`
- `records-filter-*`, `records-list`, `records-add-button`
- `trends-tab-*`, `trends-period-*`, `trends-chart`, `trends-stats-list`
- `care-tab-reminders`, `care-tab-medical`, `care-reminder-list`, `care-medical-list`
- `profile-manage-pets`, `profile-family`, `profile-settings`, `profile-about`
- Sheet 内的保存/关闭按钮：`record-*-save`, `record-*-close`, `add-record-*`, `pet-picker-*`
- 详情页：`reminder-detail-mark-done`, `reminder-detail-edit`, `reminder-detail-delete`
- 编辑器：`medical-editor-*`, `pet-editor-*`

### Event Names to Preserve

- `open-pet-picker`, `open-pet-editor`, `open-add-record`
- `open-record-diet`, `open-record-stool`, `open-record-weight`, `open-record-meds`
- `save-record-*`, `filter-records-*`, `switch-trends-*`, `set-period-*`
- `switch-care-reminders`, `switch-care-medical`, `open-reminder-editor`, `mark-reminder-done`, `delete-reminder`
- `open-medical-editor`, `save-medical-case`, `pick-medical-image`
- `open-family-invite`, `copy-invite-code`, `close-sheet`, `navigate-back`, `save-pet`

### Change Requests

- 无。当前语义协议已覆盖全部功能页面与关键交互目标。
