# PawLog 宠迹 · 视觉设计系统 v2

## 1. 视觉主题 & 氛围

PawLog 的视觉氛围是“清晨宠物咖啡店靠窗的座位”——自然光、薄荷香气、柔软肉垫触感的综合体。我们以薄荷绿作为品牌主色，象征活力与健康；以肉垫粉作为情感辅色，赋予记录与提醒温柔的温度。整体设计追求“圆润治愈”：没有尖锐边角，所有卡片与按钮都像被精心打磨过的鹅卵石，配合渐变、毛玻璃与柔和阴影，营造一种既清新又有高级感的数字空间。

为了区别于常见的 AI 模板化 App，我们在配色策略上做了更丰富的处理：不依赖单一品牌色块，而是构建了一个包含薄荷绿、肉垫粉、阳光黄、天空蓝、薰衣草紫、珊瑚橙的柔和功能色板。每种记录类型与提醒类型都拥有专属色彩，同时通过降低饱和度保持整体和谐。卡片大量使用同色系渐变、半透明高光与细腻投影，使界面在浅色背景下依然拥有清晰的层次与质感。

**关键词**：薄荷绿、肉垫粉、圆润、治愈、毛玻璃、轻拟物、渐变、层次、宠物友好。

## 2. 色彩体系

### 2.1 品牌主色（Mint 薄荷绿系）
| 名称 | 色值 | 用途 |
|------|------|------|
| Mint 400 | `#7DE8D4` | 渐变高光、图标 hover |
| Mint 500 | `#5DD9C1` | 品牌主按钮、Tab 激活态、核心图标 |
| Mint 600 | `#3CB5A0` | 按下状态、图表主线、强调文字 |
| Mint 100 | `#E6FAF6` | 浅色衬底、选中态背景、输入框聚焦光晕 |
| Mint 50 | `#F2FDFB` | 页面淡色区块背景 |
| Gradient Mint Start | `#8EEDDB` | 主按钮/英雄卡片渐变起点 |
| Gradient Mint End | `#45C4AD` | 主按钮/英雄卡片渐变终点 |

### 2.2 情感辅色（Paw Pink 肉垫粉系）
| 名称 | 色值 | 用途 |
|------|------|------|
| Pink 300 | `#FFD6E0` | 渐变高光、空状态背景 |
| Pink 400 | `#FFB8C9` | 高亮标签、饮食/关爱图标、情感卡片 |
| Pink 500 | `#F28DA6` | 删除/柔和警告、驱虫提醒、确认删除按钮 |
| Pink 100 | `#FFF0F3` | 浅粉卡片背景、选中态、体重卡片 |
| Gradient Pink Start | `#FFDDE6` | 情感卡片渐变起点 |
| Gradient Pink End | `#FF9DAF` | 情感卡片渐变终点 |

### 2.3 中性色
| 名称 | 色值 | 用途 |
|------|------|------|
| Ink 900 | `#1F2937` | 主标题、深色正文 |
| Ink 700 | `#4B5563` | 次要文字、图标默认态 |
| Ink 500 | `#9CA3AF` | 占位符、禁用态、分割线 |
| Ink 200 | `#E5E7EB` | 细边框、分割线 |
| Ink 100 | `#F3F4F6` | 页面背景、列表背景、输入框底色 |
| White | `#FFFFFF` | 卡片、按钮文字、浮层 |

### 2.4 功能色（低饱和和谐色板）
| 名称 | 色值 | 用途 |
|------|------|------|
| Sun 400 | `#FFD166` | 待办提醒、疫苗标签、排泄计数 |
| Sun 100 | `#FFF8E6` | 提醒卡片背景 |
| Sky 300 | `#A8DADC` | 用药记录标签、饮水图表 |
| Sky 100 | `#EDF7F7` | 用药相关卡片背景 |
| Lilac 300 | `#CAB8F0` | 家庭成员头像、体重图表第二色 |
| Lilac 100 | `#F3EEFC` | 成员卡片背景 |
| Coral 400 | `#FF9F8E` | 就医/病历标签、紧急提醒 |
| Coral 100 | `#FFF0ED` | 病历卡片背景 |

### 2.5 渐变规范
- **主按钮**：`linear-gradient(135deg, #8EEDDB 0%, #45C4AD 100%)`
  - 阴影：`0 14px 28px rgba(69,196,173,0.32)`
- **情感/饮食卡片**：`linear-gradient(135deg, #FFDDE6 0%, #FF9DAF 100%)`
  - 阴影：`0 12px 24px rgba(242,141,166,0.24)`
- **顶部英雄区**：`linear-gradient(180deg, #E6FAF6 0%, #F3F4F6 60%)`
- **图表面积填充**：指标色从 40% 透明度渐变到 0%
- **毛玻璃浮层**：`linear-gradient(180deg, rgba(255,255,255,0.9) 0%, rgba(255,255,255,0.75) 100%)`
- **删除按钮**：`linear-gradient(135deg, #FFB8C9 0%, #F28DA6 100%)`

### 2.6 毛玻璃（Glassmorphism）
用于：底部 TabBar、顶部 Header、弹窗 Header、Sheet 顶部、悬浮按钮托盘。
- 背景：`rgba(255,255,255,0.8)`
- `backdrop-filter: blur(24px) saturate(150%)`
- 边框：`1px solid rgba(255,255,255,0.65)`
- 投影：`0 4px 14px rgba(31,41,55,0.05)`

## 3. 字体系统

### 3.1 字体家族
- 中文：`"PingFang SC", "Microsoft YaHei", sans-serif`
- 英文/数字：`"SF Pro Display", "SF Pro Text", -apple-system, BlinkMacSystemFont, sans-serif`
- 等宽数字（图表/体重）：`"SF Mono", "SF Pro Display", monospace`

### 3.2 字号层级

| 角色 | 大小 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| Hero Greeting | 30px | 800 | 1.14 | -0.7px | 首页“早安，豆豆” |
| Page Title | 24px | 700 | 1.22 | -0.5px | 页面主标题 |
| Section Title | 20px | 700 | 1.24 | -0.35px | 卡片组标题 |
| Card Title | 18px | 700 | 1.26 | -0.2px | 卡片内标题 |
| Body | 15px | 400 | 1.52 | 0 | 列表项正文、说明 |
| Body Strong | 15px | 700 | 1.52 | 0 | 用户名、宠物名、数值 |
| Caption | 13px | 400 | 1.42 | 0 | 时间、地点、辅助信息 |
| Tiny | 11px | 700 | 1.32 | 0.3px | 胶囊标签、徽章、Tab 文字 |
| Big Number | 42px | 800 | 1.06 | -1.4px | 体重、待办数量、记录数 |
| Chart Label | 12px | 500 | 1.3 | 0 | 图表坐标轴 |

## 4. 组件样式

### 4.1 主按钮（Primary Button）
- 背景：薄荷渐变
- 文字：白色，15px，weight 700
- 高度：56px
- 圆角：28px（全药丸）
- 内边距：0 32px
- 阴影：`0 14px 28px rgba(69,196,173,0.32)`
- 按下：scale 0.96，亮度降低 7%，阴影收缩

### 4.2 次级按钮（Secondary Button）
- 背景：`#E6FAF6`
- 文字：`#3CB5A0`，15px，weight 700
- 高度：48px
- 圆角：24px
- 按下：背景 `#CEF2EC`

### 4.3 幽灵按钮（Ghost Button）
- 背景：透明
- 边框：`1.5px solid #E5E7EB`
- 文字：`#4B5563`，14px，weight 600
- 圆角：22px
- 按下：背景 `#F9FAFB`

### 4.4 图标按钮（Icon Button）
- 尺寸：44px × 44px
- 背景：白色
- 圆角：14px
- 图标颜色：`#4B5563`
- 阴影：`0 4px 14px rgba(31,41,55,0.07)`
- 按下：背景 `#F3F4F6`，scale 0.95

### 4.5 卡片（Card）
- 背景：白色
- 圆角：24px
- 内边距：20px
- 阴影：`0 12px 32px rgba(31,41,55,0.08)`
- 按下：阴影加深至 `0 16px 40px rgba(31,41,55,0.12)`
- 顶部 1px 高光边框：`1px solid rgba(255,255,255,0.75)`

### 4.6 输入框（Input）
- 背景：`#F3F4F6`
- 圆角：16px
- 高度：52px
- 内边距：0 18px
- 占位符：`#9CA3AF`
- 聚焦：边框 `2px solid #5DD9C1`，背景变白，外部光晕 `0 0 0 4px #E6FAF6`

### 4.7 头像
- 宠物头像：64px 圆形，白色 3px 边框，阴影 `0 8px 20px rgba(31,41,55,0.12)`
- 用户头像：48px 圆形
- 成员头像：44px 圆形，备用背景按角色：管理员薄荷、成员薰衣草、待激活灰

### 4.8 徽章/标签（Chip）
| 类型 | 背景 | 文字 |
|------|------|------|
| 饮食 | `#E6FAF6` | `#3CB5A0` |
| 排泄 | `#FFF8E6` | `#C98A0A` |
| 体重 | `#F3EEFC` | `#8B6ACB` |
| 用药 | `#EDF7F7` | `#4A9B9E` |
| 疫苗 | `#FFF8E6` | `#C98A0A` |
| 驱虫 | `#FFF0F3` | `#D96680` |
| 就医 | `#FFF0ED` | `#D96C5A` |

- 圆角：10px
- 内边距：5px 11px
- 字号：11px，weight 700

### 4.9 图表卡片（Chart Card）
- 背景：白色
- 圆角：24px
- 迷你图高度：120px
- 折线宽度：3.5px，端点圆角
- 面积填充：指标色从 40% 到 0% 的垂直渐变
- 数据点：8px 圆形，白色 2.5px 边框
- 坐标轴/网格线：`#E5E7EB`，虚线

### 4.10 底部 TabBar
- 背景：毛玻璃白色
- 高度：76px（含底部安全区）
- 图标：24px
- 激活色：`#5DD9C1`
- 未激活色：`#9CA3AF`
- 文字：11px，weight 700
- 中央悬浮“+”按钮：56px，薄荷渐变，白色加号，阴影 `0 14px 36px rgba(69,196,173,0.38)`，向上凸出 18px

### 4.11 时间轴记录项
- 左侧：时间胶囊（12px，背景 `#F3F4F6`，圆角 8px）
- 中间：渐变色彩节点（16px 圆形，按类型着色，白色 2px 边框，阴影）
- 右侧：内容卡片（白色，圆角 20px，阴影）
- 节点之间用 2px 浅色竖线连接

### 4.12 弹窗 / Sheet
- Sheet：圆角 30px 顶部，白色背景，头部带 36px 拖动指示条（`#E5E7EB`）
- Dialog：圆角 26px，白色背景，内边距 26px
- 背景遮罩：`rgba(31,41,55,0.48)`，带 `backdrop-filter: blur(4px)`

### 4.13 提醒胶囊（Reminder Capsule）
- 背景：Sun 100 或 Pink 100
- 圆角：18px
- 内边距：10px 14px
- 左侧 4px 彩色竖条：Sun 400 / Pink 500
- 阴影：`0 4px 12px rgba(31,41,55,0.05)`

## 5. 布局原则

### 5.1 容器
- 内容最大宽度：**390px**，居中
- 页面水平内边距：20px
- 卡片间距：16px
- 大区块间距：30px
- 列表项间距：14px

### 5.2 首屏约束
- 首页：Header（84px）+ 问候卡片（约 130px）+ 快捷记录入口（约 150px）+ 今日提醒预览（约 110px）必须在 600vp 内可见。
- 其余内容通过滚动展开。

### 5.3 圆角体系
| 级别 | 数值 | 用途 |
|------|------|------|
| xs | 10px | 标签、徽章 |
| sm | 14px | 图标按钮、输入框 |
| md | 20px | 列表项、时间轴卡片 |
| lg | 24px | 主卡片、Sheet |
| xl | 30px | Sheet 顶部 |
| pill | 999px | 主按钮、时间胶囊 |
| full | 50% | 头像、FAB |

### 5.4 阴影体系
| 级别 | 数值 | 用途 |
|------|------|------|
| card | `0 12px 32px rgba(31,41,55,0.08)` | 普通卡片 |
| elevated | `0 16px 40px rgba(31,41,55,0.13)` | 按下/悬浮卡片 |
| fab | `0 14px 36px rgba(69,196,173,0.38)` | 中央悬浮按钮 |
| button | `0 14px 28px rgba(69,196,173,0.32)` | 主按钮 |
| avatar | `0 8px 20px rgba(31,41,55,0.12)` | 宠物头像 |

## 6. 动效与交互

- 页面进入：向上位移 12px + opacity 0→1，260ms，cubic-bezier(0.25, 0.46, 0.45, 0.94)
- 按钮按下：scale 0.96，100ms，ease-out
- 卡片按下：阴影由 card 变 elevated，scale 0.98，120ms
- 列表项进入：stagger 45ms，opacity 0→1 + translateY 14px→0
- 图表加载：路径 stroke-dashoffset 动画 750ms，面积 opacity 0→1 550ms
- Tab 切换：图标 scale 弹跳 0.9→1.08→1，200ms
- Sheet 弹出：从底部 translateY 100%→0，320ms，cubic-bezier(0.32, 0.72, 0, 1)，遮罩淡入

## 7. 图标与插图

- 线性图标，描边 2px，圆角端点，视觉重量一致。
- 优先使用本地 SVG；若无合适资源，可内联简洁 SVG。
- 所有内联 SVG 首元素必须是 `<title>`，描述该图标在当前 UI 中的业务语义。
- 不使用 emoji 作为图标。
- 空状态插画：柔和的宠物剪影 + 肉垫粉/薄荷渐变圆形背景，配温和文案。

## 8. Semantic UI Binding

### 8.1 Surfaces / Pages

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home | home-page | pages/HomePage | tab-home |
| records | records-page | pages/RecordsPage | tab-records |
| health | health-page | pages/HealthPage | tab-health |
| family | family-page | pages/FamilyPage | tab-family |
| profile | profile-page | pages/ProfilePage | tab-profile |
| pet-editor | pet-editor-page | pages/PetEditorPage | — |
| record-editor | record-editor-page | pages/RecordEditorPage | — |
| record-detail | record-detail-page | pages/RecordDetailPage | — |
| chart-detail | chart-detail-page | pages/ChartDetailPage | — |
| reminder-editor | reminder-editor-page | pages/ReminderEditorPage | — |
| medical-record-editor | medical-record-editor-page | pages/MedicalRecordEditorPage | — |
| medical-record-detail | medical-record-detail-page | pages/MedicalRecordDetailPage | — |
| member-invite | member-invite-page | pages/MemberInvitePage | — |
| pet-picker | pet-picker-sheet | — | — |
| record-type-picker | record-type-sheet | — | — |
| confirm-delete | confirm-delete-dialog | — | — |

### 8.2 Important Semantic Targets

| ID | Role | Event / Binding | Visual Mapping |
|----|------|-----------------|----------------|
| home-pet-switcher | action | open-pet-picker | 顶部宠物头像卡片，点击展开底部 Sheet |
| home-current-pet-name | assertion | /pets/selected/name | 头像旁宠物昵称，Body Strong |
| home-quick-log-button | action | open-record-type-sheet | 首页中央 72px 薄荷渐变圆形主按钮 |
| home-reminder-list | list | /reminders/today | 横向可滚动提醒胶囊列表 |
| home-recent-record-list | list | /records/recent | 最近 5 条记录时间轴 |
| records-add-button | action | open-record-editor | 记录页 Header 右侧白色图标按钮 |
| records-search-input | input | search-records | 顶部圆角搜索输入框 |
| records-timeline-list | list | /records/filtered | 按日期分组的时间轴列表 |
| health-pet-switcher | action | open-pet-picker | 健康页顶部宠物切换条 |
| health-weight-chart-card | action | open-chart-detail | 体重趋势迷你图卡片 |
| health-add-reminder-button | action | open-reminder-editor | 提醒区块右上角“+”图标按钮 |
| health-add-medical-record-button | action | open-medical-record-editor | 病历区块右上角“+”图标按钮 |
| family-invite-button | action | open-member-invite | 家庭成员区块顶部薄荷渐变邀请按钮 |
| family-member-list | list | /family/members | 成员头像+信息卡片列表 |
| profile-manage-pets-button | action | go-to-pet-list | 我的页面“管理宠物档案”列表行 |
| pet-editor-save-button | action | save-pet | 表单底部全宽主按钮 |
| record-editor-save-button | action | save-record | 表单底部全宽主按钮 |
| reminder-editor-save-button | action | save-reminder | 表单底部全宽主按钮 |
| medical-editor-save-button | action | save-medical-record | 表单底部全宽主按钮 |
| confirm-delete-confirm-button | action | confirm-delete | 弹窗主按钮，Pink 500 渐变背景 |

### 8.3 Event Names Preserved

`open-pet-picker`, `open-record-type-sheet`, `open-record-editor`, `open-reminder-editor`, `open-medical-record-editor`, `open-member-invite`, `save-pet`, `delete-pet`, `save-record`, `delete-record`, `save-reminder`, `delete-reminder`, `save-medical-record`, `delete-medical-record`, `set-chart-period`, `copy-invite-code`, `share-invite-code`, `close-sheet`, `confirm-delete`, `cancel-delete`, `go-back`

### 8.4 Change Requests / Gaps

- 无变更请求。ui-tree.json 语义目标已覆盖全部关键交互与断言点，DESIGN2 在 DESIGN1 基础上进一步细化颜色、阴影、动效与组件规格，不修改语义 ID 与事件名。

## 9. Do's and Don'ts

### Do
- 使用 24px 大圆角卡片与全药丸按钮，强化圆润治愈感。
- 在卡片、按钮、顶部背景中使用同色系渐变，丰富视觉层次。
- 使用毛玻璃处理 Header、TabBar、Sheet 顶部、悬浮托盘。
- 为每个语义图标注入业务语义 `<title>`。
- 按类型使用彩色胶囊标签，让列表信息一眼可辨。
- 保持内容区 max-width 390px 居中，底部导航固定。

### Don't
- 使用直角或过小圆角（<10px）。
- 大面积使用单一纯色块。
- 使用 emoji 或 Unicode 图标替代 SVG。
- 全宽拉伸布局或将 TabBar 放在侧边。
- 阴影过重或层数过多，保持柔和细腻。
