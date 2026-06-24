#!/usr/bin/env node
import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync, statSync, writeFileSync, cpSync } from "node:fs";
import { dirname, join, relative, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const repoRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..", "..");

function usage() {
  return [
    "Usage: node scripts/analyze-agent-traces.mjs [options]",
    "",
    "Options:",
    "  --apps-dir DIR       Generated apps directory, default generated-apps",
    "  --out DIR            Output directory, default .arkpilot/reports",
    "  --latest-only        Use only the newest tmux run file per test directory",
    "  --include-open-now   For open lanes, estimate duration through current time",
    "  --github-pages       Copy report to docs/ for GitHub Pages deployment",
    "  --help, -h           Show this help",
  ].join("\n");
}

function parseArgs(argv) {
  const options = {
    appsDir: join(repoRoot, "generated-apps"),
    outDir: join(repoRoot, ".arkpilot", "reports"),
    latestOnly: false,
    includeOpenNow: false,
    githubPages: false,
  };

  for (let i = 0; i < argv.length; i += 1) {
    const arg = argv[i];
    if (arg === "--apps-dir") options.appsDir = resolve(argv[++i] || options.appsDir);
    else if (arg === "--out") options.outDir = resolve(argv[++i] || options.outDir);
    else if (arg === "--latest-only") options.latestOnly = true;
    else if (arg === "--include-open-now") options.includeOpenNow = true;
    else if (arg === "--github-pages") options.githubPages = true;
    else if (arg === "--help" || arg === "-h") {
      console.log(usage());
      process.exit(0);
    } else {
      throw new Error(`Unknown argument: ${arg}`);
    }
  }

  return options;
}

function readJson(path) {
  return JSON.parse(readFileSync(path, "utf8"));
}

function isDirectory(path) {
  try {
    return statSync(path).isDirectory();
  } catch {
    return false;
  }
}

function walk(dir, predicate, found = []) {
  if (!isDirectory(dir)) return found;
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const fullPath = join(dir, entry.name);
    if (entry.isDirectory()) walk(fullPath, predicate, found);
    else if (predicate(fullPath, entry)) found.push(fullPath);
  }
  return found;
}

function parseDate(value) {
  if (!value) return null;
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? null : date;
}

function msBetween(start, end) {
  const startDate = parseDate(start);
  const endDate = parseDate(end);
  if (!startDate || !endDate) return null;
  const ms = endDate.getTime() - startDate.getTime();
  return ms >= 0 ? ms : null;
}

function formatDuration(ms) {
  if (!Number.isFinite(ms) || ms < 0) return "";
  const totalSeconds = Math.round(ms / 1000);
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const seconds = totalSeconds % 60;
  if (hours) return `${hours}h ${minutes}m ${seconds}s`;
  if (minutes) return `${minutes}m ${seconds}s`;
  return `${seconds}s`;
}

function shortIso(value) {
  if (!value) return "";
  const date = parseDate(value);
  if (!date) return String(value);
  return date.toISOString().replace("T", " ").replace(/\.\d{3}Z$/, "Z");
}

function formatTokens(value) {
  if (!Number.isFinite(value) || value === 0) return "0";
  if (value >= 1_000_000) return `${(value / 1_000_000).toFixed(1)}M`;
  if (value >= 1_000) return `${(value / 1_000).toFixed(1)}K`;
  return String(value);
}

function htmlEscape(value) {
  return String(value ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}

function percent(value, total) {
  if (!Number.isFinite(value) || !Number.isFinite(total) || total <= 0) return 0;
  return Math.max(0, Math.min(100, (value / total) * 100));
}

function percentile(values, p) {
  const sorted = values.filter(Number.isFinite).sort((a, b) => a - b);
  if (sorted.length === 0) return null;
  const index = (sorted.length - 1) * p;
  const lower = Math.floor(index);
  const upper = Math.ceil(index);
  if (lower === upper) return sorted[lower];
  return sorted[lower] + (sorted[upper] - sorted[lower]) * (index - lower);
}

function latestRunFiles(files) {
  const byTestDir = new Map();
  for (const file of files) {
    const testDir = dirname(dirname(dirname(dirname(file))));
    const previous = byTestDir.get(testDir);
    if (!previous || statSync(file).mtimeMs > statSync(previous).mtimeMs) {
      byTestDir.set(testDir, file);
    }
  }
  return [...byTestDir.values()];
}

function pathPartsForRun(appsDir, cwd) {
  const rel = relative(appsDir, cwd);
  const parts = rel.split(/[\\/]/).filter(Boolean);
  return {
    app: parts[0] || "",
    test: parts[1] || "",
    relDir: rel || ".",
  };
}

const IMAGE_EXTENSIONS = [".png", ".jpg", ".jpeg", ".gif", ".webp", ".svg"];

function sanitizeFolderName(name) {
  return String(name || "")
    .replace(/[^a-zA-Z0-9._-]+/g, "_")
    .replace(/^_+|_+$/g, "") || "unknown";
}

function getComparisonImages(imageDir) {
  if (!isDirectory(imageDir)) return [];
  return readdirSync(imageDir, { withFileTypes: true })
    .filter((entry) => entry.isFile() && IMAGE_EXTENSIONS.some((ext) => entry.name.toLowerCase().endsWith(ext)))
    .map((entry) => entry.name)
    .sort();
}

function readComparisonMd(mdPath) {
  const result = { prompt: "", problems: [], ratings: {} };
  if (!existsSync(mdPath)) return result;
  const text = readFileSync(mdPath, "utf8");
  const lines = text.split(/\r?\n/);
  let section = "";
  let problemIdx = -1;
  for (const line of lines) {
    const headingMatch = line.match(/^##\s+(.*)/);
    if (headingMatch) {
      const heading = headingMatch[1].trim().toLowerCase();
      if (heading.includes("prompt")) {
        section = "prompt";
      } else if (heading.includes("问题") || heading.includes("problem")) {
        section = "problems";
        problemIdx = -1;
      } else if (heading.includes("rating") || heading.includes("评分") || heading.includes("指标")) {
        section = "ratings";
      } else {
        section = "";
      }
      continue;
    }
    if (line.startsWith("#")) {
      section = "";
      continue;
    }
    if (section === "prompt") {
      if (result.prompt) result.prompt += "\n";
      result.prompt += line;
    } else if (section === "problems") {
      const match = line.match(/^\s*(\d+)\s*[.、:：]\s*(.*)/);
      if (match) {
        const idx = parseInt(match[1], 10) - 1;
        problemIdx = idx;
        while (result.problems.length <= idx) result.problems.push("");
        if (match[2]) result.problems[idx] = match[2];
      } else if (problemIdx >= 0 && line.trim()) {
        result.problems[problemIdx] += (result.problems[problemIdx] ? "\n" : "") + line.trim();
      }
    } else if (section === "ratings") {
      const kv = line.match(/^\s*([A-Za-z_][\w]*)\s*[=:：]\s*(.*)/);
      if (kv) {
        const key = kv[1];
        const raw = kv[2].trim();
        if (key === "hapAvailable") {
          result.ratings[key] = raw;
        } else {
          const val = Number(raw);
          if (Number.isFinite(val)) result.ratings[key] = val;
        }
      }
    }
  }
  result.problems = result.problems.filter((p) => p.trim());
  result.prompt = result.prompt.trim();
  return result;
}

function buildComparisonData(runs, outDir) {
  return runs.map((run) => {
    const label = `${run.app}-${run.test}`;
    const folder = sanitizeFolderName(label);
    const itemDir = join(outDir, "comparison-images", folder);
    const md = readComparisonMd(join(itemDir, "problems.md"));
    return {
      label,
      folder,
      designImages: getComparisonImages(join(itemDir, "design")),
      actualImages: getComparisonImages(join(itemDir, "actual")),
      prompt: md.prompt,
      problems: md.problems,
      ratings: md.ratings,
    };
  });
}

function ensureComparisonDirs(comparisonData, outDir) {
  const baseDir = join(outDir, "comparison-images");
  mkdirSync(baseDir, { recursive: true });
  for (const item of comparisonData) {
    const itemDir = join(baseDir, item.folder);
    mkdirSync(join(itemDir, "design"), { recursive: true });
    mkdirSync(join(itemDir, "actual"), { recursive: true });
    const mdPath = join(itemDir, "problems.md");
    if (!existsSync(mdPath)) {
      const template = [
        `# ${item.label}`,
        "",
        "## Prompt",
        "",
        "",
        "",
        "## 问题汇总",
        "",
        "1. ",
        "2. ",
        "3. ",
        "",
        "## Ratings",
        "",
        "featureSuccess = ",
        "aesthetic = ",
        "designCompletion = ",
        "hapAvailable = ",
        "",
      ].join("\n");
      writeFileSync(mdPath, template, "utf8");
    }
  }
}

function avgRatings(runs, ratingsMap) {
  let fSum = 0, aSum = 0, dSum = 0, count = 0;
  let hapYes = 0, hapTotal = 0;
  for (const run of runs) {
    const label = `${run.app}-${run.test}`;
    const r = ratingsMap.get ? ratingsMap.get(label) : ratingsMap[label];
    if (r && Number.isFinite(r.featureSuccess) && Number.isFinite(r.aesthetic)) {
      fSum += r.featureSuccess;
      aSum += r.aesthetic;
      count += 1;
    }
    if (r && Number.isFinite(r.designCompletion)) {
      dSum += r.designCompletion;
    }
    if (r && r.hapAvailable != null && r.hapAvailable !== "") {
      hapTotal += 1;
      const v = String(r.hapAvailable).trim().toLowerCase();
      if (v === "是" || v === "yes" || v === "true" || v === "1") {
        hapYes += 1;
      }
    }
  }
  const n = count || 0;
  return {
    featureSuccess: n ? Math.round(fSum / n) : null,
    hapAvailableRate: hapTotal ? Math.round((hapYes / hapTotal) * 100) : null,
    aesthetic: n ? Math.round(aSum / n) : null,
    designCompletion: n ? Math.round(dSum / n) : null,
  };
}

function readTranscriptMeta(path, cwd, sessionId) {
  // 优先尝试原始路径（绝对路径）
  if (path && existsSync(path)) {
    return readTranscriptContent(path);
  }

  // 原始路径不存在，尝试相对路径 .arkpilot/transcripts/{sessionId}.jsonl
  if (cwd && sessionId) {
    const relativePath = join(cwd, ".arkpilot", "transcripts", `${sessionId}.jsonl`);
    if (existsSync(relativePath)) {
      return readTranscriptContent(relativePath);
    }
  }

  return { exists: false, lineCount: 0, firstTimestamp: "", lastTimestamp: "", tokens: null };
}

function readTranscriptContent(path) {

  const text = readFileSync(path, "utf8");
  const lines = text.split(/\r?\n/).filter(Boolean);
  let firstTimestamp = "";
  let lastTimestamp = "";
  let inputTokens = 0;
  let outputTokens = 0;
  let cacheReadTokens = 0;
  let cacheCreationTokens = 0;

  for (const line of lines) {
    try {
      const item = JSON.parse(line);
      const timestamp = item.timestamp || item.created_at || item.createdAt || "";
      if (timestamp && !firstTimestamp) firstTimestamp = timestamp;
      if (timestamp) lastTimestamp = timestamp;
      const usage = item?.message?.usage || item?.usage;
      if (usage) {
        inputTokens += Number(usage.input_tokens) || 0;
        outputTokens += Number(usage.output_tokens) || 0;
        cacheReadTokens += Number(usage.cache_read_input_tokens) || 0;
        cacheCreationTokens += Number(usage.cache_creation_input_tokens) || 0;
      }
    } catch {
      // Transcript sidecars may contain non-message metadata; ignore malformed lines.
    }
  }

  return {
    exists: true,
    lineCount: lines.length,
    firstTimestamp,
    lastTimestamp,
    tokens: {
      inputTokens,
      outputTokens,
      cacheReadTokens,
      cacheCreationTokens,
      totalTokens: inputTokens + outputTokens,
    },
  };
}

function parseHookEvents(cwd) {
  const logPath = join(cwd, ".arkpilot", "logs", "arkpilot-hooks.log");
  if (!existsSync(logPath)) return [];

  const events = [];
  const linePattern = /^\[([^\]]+)\]\s+START\s+event=([^\s]+)(?:\s+tool=([^\s]+))?\s+script=([^\s]+)\s+session=([^\s]+)/;
  for (const line of readFileSync(logPath, "utf8").split(/\r?\n/)) {
    const match = line.match(linePattern);
    if (!match) continue;
    events.push({
      at: match[1],
      event: match[2],
      tool: match[3] || "",
      script: match[4],
      sessionId: match[5],
    });
  }
  return events.sort((a, b) => new Date(a.at).getTime() - new Date(b.at).getTime());
}

function readSessionResumeTimes(cwd) {
  const sessionsDir = join(cwd, ".arkpilot", "state", "sessions");
  const resumeTimes = new Map();
  if (!isDirectory(sessionsDir)) return resumeTimes;

  for (const entry of readdirSync(sessionsDir, { withFileTypes: true })) {
    if (!entry.isDirectory()) continue;
    const statePath = join(sessionsDir, entry.name, "autopilot-state.json");
    if (!existsSync(statePath)) continue;
    try {
      const state = readJson(statePath);
      if (state.resumed_at) {
        const list = resumeTimes.get(entry.name) || [];
        list.push(state.resumed_at);
        resumeTimes.set(entry.name, list.sort());
      }
    } catch {
      // Ignore partial state files from interrupted sessions.
    }
  }
  return resumeTimes;
}

function overlapMs(start, end, windowStart, windowEnd) {
  const startDate = parseDate(start);
  const endDate = parseDate(end);
  const windowStartDate = parseDate(windowStart);
  const windowEndDate = parseDate(windowEnd);
  if (!startDate || !endDate || !windowStartDate || !windowEndDate) return 0;
  const clippedStart = Math.max(startDate.getTime(), windowStartDate.getTime());
  const clippedEnd = Math.min(endDate.getTime(), windowEndDate.getTime());
  return Math.max(0, clippedEnd - clippedStart);
}

function clipInterval(start, end, windowStart, windowEnd) {
  const startDate = parseDate(start);
  const endDate = parseDate(end);
  const windowStartDate = parseDate(windowStart);
  const windowEndDate = parseDate(windowEnd);
  if (!startDate || !endDate || !windowStartDate || !windowEndDate) return null;
  const clippedStart = Math.max(startDate.getTime(), windowStartDate.getTime());
  const clippedEnd = Math.min(endDate.getTime(), windowEndDate.getTime());
  if (clippedEnd <= clippedStart) return null;
  return {
    startAt: new Date(clippedStart).toISOString(),
    endAt: new Date(clippedEnd).toISOString(),
    durationMs: clippedEnd - clippedStart,
  };
}

function mergeIntervals(intervals) {
  const normalized = intervals
    .map((interval) => ({
      ...interval,
      startMs: parseDate(interval.startAt)?.getTime(),
      endMs: parseDate(interval.endAt)?.getTime(),
    }))
    .filter((interval) => Number.isFinite(interval.startMs) && Number.isFinite(interval.endMs) && interval.endMs > interval.startMs)
    .sort((a, b) => a.startMs - b.startMs);
  const merged = [];

  for (const interval of normalized) {
    const previous = merged[merged.length - 1];
    if (!previous || interval.startMs > previous.endMs) {
      merged.push({ ...interval });
      continue;
    }
    previous.endMs = Math.max(previous.endMs, interval.endMs);
    previous.endAt = new Date(previous.endMs).toISOString();
    previous.sources = [...new Set([...(previous.sources || [previous.source]), interval.source])];
    previous.sessionIds = [...new Set([...(previous.sessionIds || [previous.sessionId]), interval.sessionId])];
  }

  return merged.map(({ startMs, endMs, ...interval }) => ({
    ...interval,
    durationMs: endMs - startMs,
    source: interval.sources ? interval.sources.join(",") : interval.source,
    sessionId: interval.sessionIds ? interval.sessionIds.join(",") : interval.sessionId,
  }));
}

function collectPauseIntervals({ cwd, lanes, startAt, endAt }) {
  if (!startAt || !endAt) return [];

  const sessionIds = new Set(lanes.map((lane) => lane.sessionId).filter(Boolean));
  const hookEvents = parseHookEvents(cwd).filter((event) => sessionIds.has(event.sessionId));
  const resumeTimes = readSessionResumeTimes(cwd);
  const intervals = [];

  for (let i = 0; i < hookEvents.length; i += 1) {
    const event = hookEvents[i];
    if (event.event !== "Stop") continue;

    const stopAt = event.at;
    const stopDate = parseDate(stopAt);
    if (!stopDate) continue;

    const resumeFromState = (resumeTimes.get(event.sessionId) || [])
      .find((value) => parseDate(value) && parseDate(value).getTime() > stopDate.getTime());
    const nextActivity = hookEvents
      .slice(i + 1)
      .find((candidate) => candidate.sessionId === event.sessionId && candidate.event !== "Stop" && candidate.event !== "SessionEnd");
    const candidates = [
      resumeFromState ? { at: resumeFromState, source: "autopilot-state.resumed_at" } : null,
      nextActivity ? { at: nextActivity.at, source: `next-${nextActivity.event}` } : null,
    ].filter(Boolean).sort((a, b) => new Date(a.at).getTime() - new Date(b.at).getTime());

    const resume = candidates[0];
    if (!resume) continue;

    const clipped = clipInterval(stopAt, resume.at, startAt, endAt);
    if (!clipped) continue;
    intervals.push({
      sessionId: event.sessionId,
      startAt: clipped.startAt,
      endAt: clipped.endAt,
      durationMs: clipped.durationMs,
      source: resume.source,
    });
  }

  return mergeIntervals(intervals);
}

function laneEndTime(lane, run, transcriptMeta, options) {
  if (transcriptMeta.lastTimestamp) return { value: transcriptMeta.lastTimestamp, source: "transcript" };
  if (lane.last_idle_at) return { value: lane.last_idle_at, source: "last_idle_at" };
  if (lane.failed_at) return { value: lane.failed_at, source: "failed_at" };
  if (run.updated_at) return { value: run.updated_at, source: "run.updated_at" };
  if (options.includeOpenNow) return { value: new Date().toISOString(), source: "now" };
  return { value: "", source: "" };
}

function analyzeRun(file, options) {
  const run = readJson(file);
  // Always derive cwd from file location for repo portability
  // file = {cwd}/.arkpilot/state/tmux-runs/{name}.json → 4 levels up = cwd
  const cwd = dirname(dirname(dirname(dirname(file))));
  const parts = pathPartsForRun(options.appsDir, cwd);
  const lanes = Object.entries(run.lanes || {}).map(([laneName, lane]) => {
    const transcriptPath = lane.transcript_path || lane.agent_transcript_path || "";
    const sessionId = lane.agent_session_id || lane.claude_session_id || lane.codex_session_id || "";
    const transcriptMeta = readTranscriptMeta(transcriptPath, cwd, sessionId);
    const end = laneEndTime(lane, run, transcriptMeta, options);
    const launchedMs = msBetween(lane.launched_at || lane.started_marker_seen_at || lane.prompt_sent_at, end.value);
    const promptMs = msBetween(lane.prompt_sent_at || lane.started_marker_seen_at || lane.launched_at, end.value);
    const markerMs = msBetween(lane.started_marker_seen_at || lane.launched_at || lane.prompt_sent_at, end.value);

    return {
      laneName,
      status: lane.status || "",
      stage: lane.current_stage || lane.current_prompt_stage || "",
      model: lane.model || "",
      effort: lane.effort || "",
      runtime: lane.agent_runtime || run.agent_runtime || "",
      sessionId: lane.agent_session_id || lane.claude_session_id || lane.codex_session_id || "",
      transcriptPath,
      transcriptExists: transcriptMeta.exists,
      transcriptLineCount: transcriptMeta.lineCount,
      tokens: transcriptMeta.tokens,
      launchedAt: lane.launched_at || "",
      startedAt: lane.started_marker_seen_at || "",
      promptSentAt: lane.prompt_sent_at || "",
      idleAt: lane.last_idle_at || "",
      failedAt: lane.failed_at || "",
      endAt: end.value,
      endSource: end.source,
      launchedDurationMs: launchedMs,
      promptDurationMs: promptMs,
      markerDurationMs: markerMs,
      error: lane.error || "",
      handoffSourceSessionId: lane.handoff_source_session_id || "",
    };
  });

  const executionLane = lanes.find((lane) => lane.laneName === "execution")
    || lanes.find((lane) => lane.laneName === "implementation")
    || null;
  const planningLane = lanes.find((lane) => lane.laneName === "planning")
    || lanes.find((lane) => lane.laneName === "design")
    || null;
  const chainStartAt = planningLane?.startedAt
    || lanes.map((lane) => lane.startedAt).filter(Boolean).sort()[0]
    || "";
  const laneEndTimes = lanes
    .map((lane) => lane.endAt)
    .filter(Boolean)
    .sort();
  const chainEndAt = laneEndTimes.length ? laneEndTimes[laneEndTimes.length - 1] : "";
  const chainEndSource = chainEndAt
    ? lanes.find((lane) => lane.endAt === chainEndAt)?.laneName || ""
    : "";
  const rawChainDurationMs = msBetween(chainStartAt, chainEndAt);
  const pauseIntervals = Number.isFinite(rawChainDurationMs)
    ? collectPauseIntervals({ cwd, lanes, startAt: chainStartAt, endAt: chainEndAt })
    : [];
  const pauseDurationMs = pauseIntervals.reduce((sum, interval) => sum + interval.durationMs, 0);
  const netChainDurationMs = Number.isFinite(rawChainDurationMs)
    ? Math.max(0, rawChainDurationMs - pauseDurationMs)
    : null;

  const tokenUsage = lanes.reduce((acc, lane) => {
    const t = lane.tokens;
    if (!t) return acc;
    acc.inputTokens += t.inputTokens;
    acc.outputTokens += t.outputTokens;
    acc.cacheReadTokens += t.cacheReadTokens;
    acc.cacheCreationTokens += t.cacheCreationTokens;
    acc.totalTokens += t.totalTokens;
    return acc;
  }, { inputTokens: 0, outputTokens: 0, cacheReadTokens: 0, cacheCreationTokens: 0, totalTokens: 0 });

  const hapPath = join(cwd, "entry", "build", "default", "outputs", "default", "entry-default-unsigned.hap");
  const hapExists = existsSync(hapPath);

  return {
    app: parts.app,
    test: parts.test,
    relDir: parts.relDir,
    cwd,
    runFile: file,
    runName: run.run_name || "",
    status: run.status || "",
    currentStage: run.current_stage || "",
    activeLane: run.active_lane || "",
    createdAt: run.created_at || "",
    updatedAt: run.updated_at || "",
    originalTask: run.originalTask || "",
    workflowVariant: run.workflow_variant || "",
    planSkill: run.plan_skill || "",
    planningLane,
    executionLane,
    chainStartAt,
    chainEndAt,
    chainEndSource,
    rawChainDurationMs,
    pauseDurationMs,
    netChainDurationMs,
    pauseIntervals,
    tokenUsage,
    hapExists,
    hapPath,
    lanes,
  };
}

function buildSummary(runs) {
  const chainDurations = runs
    .map((run) => run.netChainDurationMs)
    .filter(Number.isFinite);
  const byApp = new Map();
  for (const run of runs) {
    const item = byApp.get(run.app) || {
      app: run.app,
      runs: 0,
      complete: 0,
      open: 0,
      failed: 0,
      chainMs: [],
      pauseMs: 0,
      tokens: { inputTokens: 0, outputTokens: 0, cacheReadTokens: 0, cacheCreationTokens: 0, totalTokens: 0 },
    };
    item.runs += 1;
    if (run.status === "complete") item.complete += 1;
    else if (run.status === "failed" || run.status === "cancelled") item.failed += 1;
    else item.open += 1;
    if (Number.isFinite(run.netChainDurationMs)) {
      item.chainMs.push(run.netChainDurationMs);
    }
    item.pauseMs += run.pauseDurationMs || 0;
    if (run.tokenUsage) {
      item.tokens.inputTokens += run.tokenUsage.inputTokens;
      item.tokens.outputTokens += run.tokenUsage.outputTokens;
      item.tokens.cacheReadTokens += run.tokenUsage.cacheReadTokens;
      item.tokens.cacheCreationTokens += run.tokenUsage.cacheCreationTokens;
      item.tokens.totalTokens += run.tokenUsage.totalTokens;
    }
    byApp.set(run.app, item);
  }

  const appSummaries = [...byApp.values()].map((item) => {
    const total = item.chainMs.reduce((sum, value) => sum + value, 0);
    return {
      app: item.app,
      runs: item.runs,
      complete: item.complete,
      open: item.open,
      failed: item.failed,
      avgChainMs: item.chainMs.length ? total / item.chainMs.length : null,
      minChainMs: item.chainMs.length ? Math.min(...item.chainMs) : null,
      maxChainMs: item.chainMs.length ? Math.max(...item.chainMs) : null,
      pauseMs: item.pauseMs,
      tokens: item.tokens,
    };
  }).sort((a, b) => a.app.localeCompare(b.app));

  const totalTokens = runs.reduce((acc, run) => {
    if (!run.tokenUsage) return acc;
    acc.inputTokens += run.tokenUsage.inputTokens;
    acc.outputTokens += run.tokenUsage.outputTokens;
    acc.cacheReadTokens += run.tokenUsage.cacheReadTokens;
    acc.cacheCreationTokens += run.tokenUsage.cacheCreationTokens;
    acc.totalTokens += run.tokenUsage.totalTokens;
    return acc;
  }, { inputTokens: 0, outputTokens: 0, cacheReadTokens: 0, cacheCreationTokens: 0, totalTokens: 0 });

  return {
    runs: runs.length,
    complete: runs.filter((run) => run.status === "complete").length,
    open: runs.filter((run) => run.status !== "complete" && run.status !== "failed" && run.status !== "cancelled").length,
    failed: runs.filter((run) => run.status === "failed" || run.status === "cancelled").length,
    avgChainMs: chainDurations.length
      ? chainDurations.reduce((sum, value) => sum + value, 0) / chainDurations.length
      : null,
    p50ChainMs: percentile(chainDurations, 0.5),
    p90ChainMs: percentile(chainDurations, 0.9),
    maxChainMs: chainDurations.length ? Math.max(...chainDurations) : null,
    totalPauseMs: runs.reduce((sum, run) => sum + (run.pauseDurationMs || 0), 0),
    totalTokens,
    appSummaries,
  };
}

function renderMetric(label, value) {
  return `<div class="metric"><div class="metric-label">${htmlEscape(label)}</div><div class="metric-value">${htmlEscape(value)}</div></div>`;
}

function renderStatus(status) {
  const kind = status === "complete" ? "good" : status === "failed" || status === "cancelled" ? "bad" : "open";
  return `<span class="status ${kind}">${htmlEscape(status || "unknown")}</span>`;
}

function renderHtml(report) {
  const maxChainMs = Math.max(
    1,
    ...report.runs.map((run) => run.netChainDurationMs || 0),
  );
  const longestRuns = [...report.runs]
    .filter((run) => Number.isFinite(run.netChainDurationMs))
    .sort((a, b) => b.netChainDurationMs - a.netChainDurationMs)
    .slice(0, 10);

  return `<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Agent Trace Chain Time Report</title>
  <style>
    :root {
      color-scheme: light;
      --bg: #f6f7f9;
      --panel: #ffffff;
      --text: #17202a;
      --muted: #617083;
      --line: #dbe1e8;
      --accent: #1b7f79;
      --accent-2: #c86536;
      --good: #147a41;
      --open: #9a6500;
      --bad: #b42318;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.45;
    }
    header {
      padding: 28px 32px 18px;
      border-bottom: 1px solid var(--line);
      background: var(--panel);
    }
    h1 { margin: 0; font-size: 28px; letter-spacing: 0; }
    h2 { margin: 28px 0 12px; font-size: 18px; }
    .subtle { color: var(--muted); margin-top: 8px; font-size: 14px; }
    main { padding: 24px 32px 40px; }
    .metrics {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
      gap: 12px;
      margin-bottom: 24px;
    }
    .metric {
      background: var(--panel);
      border: 1px solid var(--line);
      border-radius: 8px;
      padding: 14px 16px;
    }
    .metric-label { color: var(--muted); font-size: 12px; text-transform: uppercase; }
    .metric-value { font-size: 22px; font-weight: 700; margin-top: 4px; }
    .panel {
      background: var(--panel);
      border: 1px solid var(--line);
      border-radius: 8px;
      padding: 16px;
      margin-bottom: 18px;
      overflow-x: auto;
    }
    table { width: 100%; border-collapse: collapse; min-width: 980px; }
    th, td {
      border-bottom: 1px solid var(--line);
      padding: 9px 10px;
      vertical-align: top;
      text-align: left;
      font-size: 13px;
    }
    th {
      color: var(--muted);
      font-weight: 700;
      background: #fbfcfd;
      position: sticky;
      top: 0;
    }
    tr:last-child td { border-bottom: 0; }
    code {
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
      font-size: 12px;
      color: #26313f;
    }
    .status {
      display: inline-block;
      border-radius: 999px;
      padding: 2px 8px;
      font-size: 12px;
      font-weight: 700;
    }
    .status.good { color: var(--good); background: #e8f5ee; }
    .status.open { color: var(--open); background: #fff3d6; }
    .status.bad { color: var(--bad); background: #fdecea; }
    .bar-row {
      display: grid;
      grid-template-columns: minmax(180px, 260px) 1fr 92px;
      align-items: center;
      gap: 12px;
      padding: 8px 0;
      border-bottom: 1px solid var(--line);
      font-size: 13px;
    }
    .bar-row:last-child { border-bottom: 0; }
    .bar-track {
      height: 12px;
      background: #e8edf2;
      border-radius: 999px;
      overflow: hidden;
    }
    .bar {
      height: 100%;
      background: linear-gradient(90deg, var(--accent), var(--accent-2));
      border-radius: inherit;
    }
    .muted { color: var(--muted); }
    .nowrap { white-space: nowrap; }
    .task {
      max-width: 420px;
      color: var(--muted);
    }
    .tree-toggle {
      display: inline-block;
      width: 16px;
      cursor: pointer;
      user-select: none;
      font-size: 11px;
      color: var(--muted);
      transition: transform 0.15s ease;
    }
    .tree-parent.expanded .tree-toggle { transform: rotate(90deg); }
    .tree-child { display: none; }
    .tree-child.visible { display: table-row; }
    .tree-child td:first-child { padding-left: 36px; }
    .tree-parent { cursor: pointer; }
    .tree-parent:hover { background: #f3f5f8; }
    .comparison-app {
      background: var(--panel);
      border: 1px solid var(--line);
      border-radius: 8px;
      margin-bottom: 14px;
    }
    .comparison-app-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 12px 16px;
      cursor: pointer;
      user-select: none;
    }
    .comparison-app-header:hover {
      background: #f3f5f8;
    }
    .comparison-app-title {
      font-size: 16px;
      font-weight: 600;
      margin: 0;
    }
    .comparison-app-toggle {
      font-size: 12px;
      color: var(--muted);
      transition: transform 0.15s ease;
    }
    .comparison-app.collapsed .comparison-app-toggle {
      transform: rotate(90deg);
    }
    .comparison-app-content {
      padding: 0 16px 16px;
      display: block;
    }
    .comparison-app.collapsed .comparison-app-content {
      display: none;
    }
    .prompt-display {
      background: #f9fafb;
      border: 1px solid var(--line);
      border-radius: 6px;
      padding: 10px 12px;
      margin-bottom: 12px;
      font-size: 13px;
      line-height: 1.5;
      white-space: pre-wrap;
      word-break: break-word;
      color: #3a4858;
      min-height: 24px;
    }
    .prompt-display:empty::before {
      content: "（请在 problems.md 中填写 Prompt）";
      color: var(--muted);
      font-size: 12px;
    }
    .sub-section-title {
      font-size: 13px;
      font-weight: 600;
      color: var(--muted);
      margin: 0 0 6px;
    }
    .comparison-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 8px;
      margin-bottom: 10px;
    }
    .comparison-grid .img-slot {
      border: 1px solid var(--line);
      border-radius: 4px;
      padding: 4px;
      text-align: center;
      min-height: 80px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .comparison-grid .img-slot img {
      max-width: 100%;
      max-height: 280px;
      object-fit: contain;
      border-radius: 2px;
      cursor: zoom-in;
    }
    .comparison-grid .img-slot.empty {
      color: var(--muted);
      font-size: 12px;
      grid-column: span 3;
      border-style: dashed;
    }
    .problems-section { margin-top: 6px; }
    .problem-item {
      display: grid;
      grid-template-columns: 56px 1fr;
      gap: 8px;
      align-items: start;
      margin-bottom: 4px;
    }
    .problem-item label {
      font-size: 13px;
      font-weight: 600;
      color: var(--muted);
      padding-top: 2px;
    }
    .problem-item .problem-text {
      font-size: 13px;
      line-height: 1.5;
      color: var(--text);
      white-space: pre-wrap;
      word-break: break-word;
      min-height: 20px;
    }
    .problem-item .problem-text:empty::before {
      content: "—";
      color: var(--muted);
    }
    .comparison-hint {
      color: var(--muted);
      font-size: 13px;
      margin-bottom: 12px;
    }
    .comparison-hint code { font-size: 12px; }
    .lightbox {
      display: none;
      position: fixed;
      inset: 0;
      z-index: 9999;
      background: rgba(0, 0, 0, 0.85);
      align-items: center;
      justify-content: center;
      cursor: zoom-out;
    }
    .lightbox.open { display: flex; }
    .lightbox img {
      max-width: 92vw;
      max-height: 92vh;
      border-radius: 4px;
      box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
    }
  </style>
</head>
<body>
  <header>
    <h1>Agent Trace Chain Time Report</h1>
    <div class="subtle">Time = max(all lane endAt) - planning.started_marker_seen_at - pause gaps · Token = sum of transcript usage · 仅显示含 HAP 产物的 run · 生成时间：${htmlEscape(shortIso(report.generatedAt))} · 扫描目录：<code>${htmlEscape(report.appsDir)}</code></div>
  </header>
  <main>
    <section class="metrics">
      ${renderMetric("Run 数", report.summary.runs)}
      ${renderMetric("Complete", report.summary.complete)}
      ${renderMetric("Chain 平均", formatDuration(report.summary.avgChainMs) || "n/a")}
      ${renderMetric("Total Tokens", formatTokens(report.summary.totalTokens?.totalTokens || 0))}
      ${renderMetric("Avg Tokens/App", formatTokens(report.summary.complete ? (report.summary.totalTokens?.totalTokens || 0) / report.summary.complete : 0))}
      ${renderMetric("Input Tokens", formatTokens(report.summary.totalTokens?.inputTokens || 0))}
      ${renderMetric("Output Tokens", formatTokens(report.summary.totalTokens?.outputTokens || 0))}
      ${renderMetric("Cache Read", formatTokens(report.summary.totalTokens?.cacheReadTokens || 0))}
    </section>

    <h2>最长 Chain Time</h2>
    <section class="panel">
      ${longestRuns.map((run) => `
        <div class="bar-row">
          <div><strong>${htmlEscape(`${run.app}/${run.test}`)}</strong><div class="muted">${htmlEscape(run.runName)}</div></div>
          <div class="bar-track"><div class="bar" style="width: ${percent(run.netChainDurationMs, maxChainMs).toFixed(2)}%"></div></div>
          <div class="nowrap">${htmlEscape(formatDuration(run.netChainDurationMs))}</div>
        </div>
      `).join("") || `<div class="muted">没有可计算的 chain time。</div>`}
    </section>

    <h2>按 App 汇总</h2>
    <section class="panel">
      <table>
        <thead>
          <tr>
            <th>App / Test</th>
            <th>Runs</th>
            <th>Chain Avg</th>
            <th>Chain Min</th>
            <th>Chain Max</th>
            <th>Pause</th>
            <th>Total Tokens</th>
            <th>Input</th>
            <th>Output</th>
            <th>Feature Success</th>
            <th>HAP Available</th>
            <th>Aesthetic</th>
            <th>Design Completion</th>
          </tr>
        </thead>
        <tbody>
          ${(() => {
            const appMap = new Map();
            for (const run of report.runs) {
              if (!appMap.has(run.app)) appMap.set(run.app, []);
              appMap.get(run.app).push(run);
            }
            const ratingsMap = new Map();
            for (const item of report.comparison || []) {
              ratingsMap.set(item.label, item.ratings || {});
            }
            const rows = [];
            for (const item of report.summary.appSummaries) {
              const appRuns = appMap.get(item.app) || [];
              const safeApp = htmlEscape(item.app);
              const agg = avgRatings(appRuns, ratingsMap);
              const fmtRate = (v) => v != null ? `${v}%` : "—";
              rows.push(`
                <tr class="tree-parent" data-app="${safeApp}">
                  <td><span class="tree-toggle">▶</span> <strong>${safeApp}</strong></td>
                  <td>${item.runs}</td>
                  <td class="nowrap">${htmlEscape(formatDuration(item.avgChainMs) || "n/a")}</td>
                  <td class="nowrap">${htmlEscape(formatDuration(item.minChainMs) || "n/a")}</td>
                  <td class="nowrap">${htmlEscape(formatDuration(item.maxChainMs) || "n/a")}</td>
                  <td class="nowrap">${htmlEscape(formatDuration(item.pauseMs) || "0s")}</td>
                  <td>${htmlEscape(formatTokens(item.tokens?.totalTokens || 0))}</td>
                  <td>${htmlEscape(formatTokens(item.tokens?.inputTokens || 0))}</td>
                  <td>${htmlEscape(formatTokens(item.tokens?.outputTokens || 0))}</td>
                  <td>${fmtRate(agg.featureSuccess)}</td>
                  <td>${fmtRate(agg.hapAvailableRate)}</td>
                  <td>${fmtRate(agg.aesthetic)}</td>
                  <td>${fmtRate(agg.designCompletion)}</td>
                </tr>
              `);
              for (const run of appRuns) {
                const t = run.tokenUsage || {};
                const label = `${run.app}-${run.test}`;
                const r = ratingsMap.get(label) || {};
                const fmtRate = (v) => Number.isFinite(v) ? `${v}%` : "—";
                const fmtHap = (v) => {
                  if (v == null || v === "") return "—";
                  const s = String(v).trim().toLowerCase();
                  if (s === "是" || s === "yes" || s === "true" || s === "1") return "是";
                  if (s === "否" || s === "no" || s === "false" || s === "0") return "否";
                  return "—";
                };
                rows.push(`
                  <tr class="tree-child" data-parent="${safeApp}">
                    <td>${htmlEscape(run.test)} <span class="muted">${htmlEscape(run.runName)}</span></td>
                    <td>1</td>
                    <td class="nowrap">${htmlEscape(formatDuration(run.netChainDurationMs) || "n/a")}</td>
                    <td class="nowrap">${htmlEscape(formatDuration(run.netChainDurationMs) || "n/a")}</td>
                    <td class="nowrap">${htmlEscape(formatDuration(run.netChainDurationMs) || "n/a")}</td>
                    <td class="nowrap">${htmlEscape(formatDuration(run.pauseDurationMs) || "0s")}</td>
                    <td>${htmlEscape(formatTokens(t.totalTokens || 0))}</td>
                    <td>${htmlEscape(formatTokens(t.inputTokens || 0))}</td>
                    <td>${htmlEscape(formatTokens(t.outputTokens || 0))}</td>
                    <td>${fmtRate(r.featureSuccess)}</td>
                    <td>${fmtHap(r.hapAvailable)}</td>
                    <td>${fmtRate(r.aesthetic)}</td>
                    <td>${fmtRate(r.designCompletion)}</td>
                  </tr>
                `);
              }
            }
            return rows.join("");
          })()}
        </tbody>
      </table>
    </section>

    <h2>设计图与实际实现对比</h2>
    <p class="comparison-hint">每个工程目录下 <code>design/</code> 放设计稿截图，<code>actual/</code> 放实际实现截图，<code>problems.md</code> 维护 Prompt 和问题汇总。</p>
    ${(report.comparison || []).map((item) => `
      <div class="comparison-app" data-folder="${htmlEscape(item.folder)}">
        <div class="comparison-app-header">
          <h3 class="comparison-app-title">${htmlEscape(item.label)}</h3>
          <span class="comparison-app-toggle">▶</span>
        </div>
        <div class="comparison-app-content">
          <div class="prompt-display">${htmlEscape(item.prompt || "")}</div>
          <p class="sub-section-title">设计稿</p>
          <div class="comparison-grid">
            ${item.designImages.length > 0
              ? item.designImages.map((img) => `
                <div class="img-slot">
                  <img src="comparison-images/${encodeURIComponent(item.folder)}/design/${encodeURIComponent(img)}" alt="${htmlEscape(img)}" loading="lazy" />
                </div>
              `).join("")
              : `<div class="img-slot empty">将设计稿放入 <code>comparison-images/${htmlEscape(item.folder)}/design/</code></div>`
            }
          </div>
          <p class="sub-section-title">实际实现</p>
          <div class="comparison-grid">
            ${item.actualImages.length > 0
              ? item.actualImages.map((img) => `
                <div class="img-slot">
                  <img src="comparison-images/${encodeURIComponent(item.folder)}/actual/${encodeURIComponent(img)}" alt="${htmlEscape(img)}" loading="lazy" />
                </div>
              `).join("")
              : `<div class="img-slot empty">将实现截图放入 <code>comparison-images/${htmlEscape(item.folder)}/actual/</code></div>`
            }
          </div>
          <div class="problems-section">
            <p class="sub-section-title">问题汇总</p>
            ${(item.problems || []).map((problem, i) => `
              <div class="problem-item">
                <label>问题 ${i + 1}</label>
                <div class="problem-text">${htmlEscape(problem)}</div>
              </div>
            `).join("")}
          </div>
        </div>
      </div>
    `).join("")}
  </main>
  <div class="lightbox" id="lightbox"><img id="lightbox-img" src="" alt="" /></div>
  <script>
    (function () {
      var lb = document.getElementById('lightbox');
      var lbImg = document.getElementById('lightbox-img');
      document.querySelectorAll('.comparison-grid .img-slot img').forEach(function (img) {
        img.addEventListener('click', function (e) {
          e.stopPropagation();
          lbImg.src = img.src;
          lb.classList.add('open');
        });
      });
      lb.addEventListener('click', function () { lb.classList.remove('open'); });
      document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') lb.classList.remove('open');
      });
      document.querySelectorAll('.tree-parent').forEach(function (row) {
        row.addEventListener('click', function () {
          var app = row.dataset.app;
          var expanded = row.classList.toggle('expanded');
          document.querySelectorAll('.tree-child[data-parent="' + CSS.escape(app) + '"]').forEach(function (child) {
            if (expanded) child.classList.add('visible');
            else child.classList.remove('visible');
          });
        });
      });
      document.querySelectorAll('.comparison-app-header').forEach(function (header) {
        header.addEventListener('click', function () {
          header.parentElement.classList.toggle('collapsed');
        });
      });
    })();
  </script>
</body>
</html>
`;
}

function main() {
  const options = parseArgs(process.argv.slice(2));
  if (!isDirectory(options.appsDir)) {
    throw new Error(`Generated apps directory not found: ${options.appsDir}`);
  }

  const allRunFiles = walk(
    options.appsDir,
    (path) => path.includes(`${join(".arkpilot", "state", "tmux-runs")}`) && path.endsWith(".json"),
  ).sort();
  const runFiles = options.latestOnly ? latestRunFiles(allRunFiles).sort() : allRunFiles;
  const allRuns = runFiles.map((file) => analyzeRun(file, options))
    .sort((a, b) => `${a.app}/${a.test}/${a.runName}`.localeCompare(`${b.app}/${b.test}/${b.runName}`));
  const runs = allRuns.filter((run) => run.hapExists);
  const skipped = allRuns.length - runs.length;
  const report = {
    generatedAt: new Date().toISOString(),
    appsDir: options.appsDir,
    latestOnly: options.latestOnly,
    includeOpenNow: options.includeOpenNow,
    summary: buildSummary(runs),
    runs,
  };

  mkdirSync(options.outDir, { recursive: true });
  report.comparison = buildComparisonData(runs, options.outDir);
  ensureComparisonDirs(report.comparison, options.outDir);

  const jsonPath = join(options.outDir, "agent-trace-report.json");
  const htmlPath = join(options.outDir, "agent-trace-report.html");
  writeFileSync(jsonPath, JSON.stringify(report, null, 2) + "\n", "utf8");
  writeFileSync(htmlPath, renderHtml(report), "utf8");

  const imageDirs = report.comparison.filter((item) => item.designImages.length > 0 || item.actualImages.length > 0).length;
  console.log(`Scanned ${allRuns.length} tmux run file(s), ${runs.length} with HAP${skipped ? `, ${skipped} skipped (no HAP)` : ""}.`);
  console.log(`Comparison images: ${imageDirs}/${report.comparison.length} item(s) have images.`);
  console.log(`JSON: ${jsonPath}`);
  console.log(`HTML: ${htmlPath}`);

  if (options.githubPages) {
    const docsDir = join(repoRoot, "docs");
    rmSync(docsDir, { recursive: true, force: true });
    mkdirSync(docsDir, { recursive: true });
    cpSync(options.outDir, docsDir, { recursive: true });
    console.log(`\nGitHub Pages: copied to docs/ — commit and push to deploy.`);
    console.log(`  git add docs/ && git commit -m "publish report" && git push`);
  }
}

try {
  main();
} catch (error) {
  console.error(error instanceof Error ? error.message : String(error));
  process.exit(1);
}
