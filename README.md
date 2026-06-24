# Harmony Agent Reports

HarmonyOS AI Agent 生成应用的**归档与报告分析**仓库。归档 Agent 自动生成的 App 工程产物（含 hap 包），并自动生成可视化报告：耗时统计、Token 用量、设计稿与实现截图对比、评分等。

## 仓库结构

```
harmony-agent-reports/
├── generated-apps/              # 归档的 App 工程产物（从 harmony-pilot 同步）
│   ├── danci/                    #   单词记忆 App
│   │   └── test1~test5/          #   每个含完整工程 + .arkpilot 状态 + hap 包
│   ├── diy/                      #   手作·印记 App
│   ├── eat-what/                 #   今天吃什么 App
│   ├── paw-log/                  #   宠物日志 App
│   └── pinankou/                 #   评测 App
├── scripts/
│   └── batch-test/
│       └── analyze-agent-traces.mjs   # 核心分析脚本
├── .arkpilot/
│   └── reports/                  # 报告输出目录（HTML + JSON）
│       └── comparison-images/    #   设计稿对比数据（截图 + problems.md）
├── docs/                         # GitHub Pages 部署目录
├── .github/
│   └── workflows/
│       └── deploy-report.yml     # CI：自动生成报告并部署
└── package.json
```

## 环境要求

- **Node.js** >= 18（使用 ESM 和内置 fs/path，无需安装依赖）

## 快速开始

```bash
# 生成报告（仅统计有 hap 包的 run）
npm run report

# 生成报告 + 同步到 docs/（用于 GitHub Pages）
npm run report:pages
```

生成后用浏览器打开报告：

```bash
open .arkpilot/reports/agent-trace-report.html
```

## 命令行参数

```bash
node scripts/batch-test/analyze-agent-traces.mjs [options]
```

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `--apps-dir DIR` | App 工程目录 | `generated-apps` |
| `--out DIR` | 报告输出目录 | `.arkpilot/reports` |
| `--latest-only` | 每个 test 目录只取最新一次运行 | 关 |
| `--include-open-now` | 未结束的 run 用当前时间估算耗时 | 关 |
| `--github-pages` | 将报告拷贝到 `docs/` | 关 |
| `--help` | 显示帮助 | — |

## 报告内容

报告只展示**构建出 hap 包**的 run（`entry/build/default/outputs/default/entry-default-unsigned.hap` 存在），包含以下板块：

| 板块 | 说明 |
|------|------|
| **指标概览** | Run 数量、Chain 耗时、Token 用量（输入/输出/缓存） |
| **最长 Chain Time** | 耗时排行（柱状图） |
| **按 App 汇总** | 每个 App 的运行次数、耗时统计、Token、评分均值（可展开查看各 test） |
| **设计稿与实现对比** | 设计稿截图 vs 实际截图 + 问题清单 + 评分 |

## 维护对比数据

报告依赖 `.arkpilot/reports/comparison-images/{app}-{test}/` 目录下的数据：

```
comparison-images/diy-test1/
├── design/          # 放设计稿截图（PNG/JPG）
├── actual/          # 放实际运行截图
└── problems.md      # Prompt、问题汇总、评分
```

`problems.md` 格式：

```markdown
# diy-test1

## Prompt
为这个 HarmonyOS 工程实现一个"手作·印记"App。功能：...

## 问题汇总

1. icon 有问题
2. 返回按钮缺失，有些按钮点击无响应
3. 选择材料弹窗打开空白

## Ratings

featureSuccess = 80
aesthetic = 80
designCompletion = 70
hapAvailable = yes
```

> 首次运行 `npm run report` 时，脚本会自动为每个有 hap 包的 run 创建目录和模板。

## GitHub Pages 部署

### 首次配置

1. 在 GitHub 仓库 **Settings → Pages** 中，将 Source 设为 **GitHub Actions**
2. 推送代码到 `main` 分支

### 自动部署

push 后，`.github/workflows/deploy-report.yml` 会自动：
1. 生成报告
2. 部署到 GitHub Pages

也可以手动触发（仓库 Actions 页面 → Deploy Report → Run workflow）。

## 数据来源

`generated-apps/` 下的工程产物来自 [harmony-pilot](../harmony-pilot) 仓库，由 AI Agent 自动生成。同步方式：

```bash
rsync -a --delete \
  --exclude='.DS_Store' \
  --exclude='*.zip' \
  /path/to/harmony-pilot/generated-apps/ \
  ./generated-apps/
```
