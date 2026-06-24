# Pipeline Run Summary

- Run: eat-what-test1-20260623-141316-run
- Status: complete
- Workflow variant: autopilot-html-tmux-uitree-team-split
- Generated at: 2026-06-23T07:10:34.281Z
- Report directory: /Users/huaweiide/Desktop/fe/code/harmony-pilot/generated-apps/eat-what/test1/.arkpilot/reports/eat-what-test1-20260623-141316-run-2026-06-23T07-10-34.278Z

## Pipeline Stages

| Stage | Status | Iterations | Started | Completed | Duration | Estimate | Error |
| --- | --- | --- | --- | --- | --- | --- | --- |
| plan | complete | 0 | 2026-06-23T06:13:19.904Z | 2026-06-23T06:16:16.518Z | 2m 57s |  |  |
| execution | complete | 0 | 2026-06-23T06:16:16.518Z | 2026-06-23T07:01:25.395Z | 45m 9s |  |  |
| qa | complete | 0 | 2026-06-23T07:01:25.396Z | 2026-06-23T07:10:34.278Z | 9m 9s |  |  |

## Lane Runtime

| Lane | Session | Runtime | Status | Current stage | Started | Completed | Duration | Estimate | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| design | b71c91c1-b65b-4b70-8dfc-69e2bca987e0 | claude | active | plan | 2026-06-23T06:13:20.500Z | 2026-06-23T06:37:07.228Z | 23m 47s |  | tmux markers |
| implementation | 18539292-baa5-419b-99da-d6a5d8c2080c | claude | active | execution | 2026-06-23T06:13:21.499Z | 2026-06-23T07:01:24.511Z | 48m 3s |  | tmux markers |
| api_reference | ed4bd1a5-8429-47dc-8fa5-c73fa9a83216 | claude | idle | api-reference | 2026-06-23T06:14:50.502Z | 2026-06-23T06:17:56.532Z | 3m 6s |  | tmux markers |
| ui-qa | 9277243c-9f2f-4b5b-a361-3493fb7fc52d | claude | running | qa | 2026-06-23T07:03:51.113Z | 2026-06-23T07:10:33.147Z | 6m 42s |  | tmux markers |

## Lane Tokens

| Lane | Available | Parser | Input | Cache creation | Cache read | Output | Reasoning | Total | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| design | yes | claude | 82995 | 0 | 2423808 | 62963 | 0 | 145958 | message.usage by unique message.id |
| implementation | yes | claude | 457319 | 0 | 10743296 | 79190 | 0 | 536509 | message.usage by unique message.id |
| api_reference | yes | claude | 52818 | 0 | 663168 | 8692 | 0 | 61510 | message.usage by unique message.id |
| ui-qa | yes | claude | 49249 | 0 | 1407680 | 7626 | 0 | 56875 | message.usage by unique message.id |

## Transcripts

| Lane | Session | Copied path | Original path | Error |
| --- | --- | --- | --- | --- |
| design | b71c91c1-b65b-4b70-8dfc-69e2bca987e0 | transcripts/design-b71c91c1-b65b-4b70-8dfc-69e2bca987e0.jsonl | /Users/huaweiide/.claude/projects/-Users-huaweiide-Desktop-fe-code-harmony-pilot-generated-apps-eat-what-test1/b71c91c1-b65b-4b70-8dfc-69e2bca987e0.jsonl |  |
| implementation | 18539292-baa5-419b-99da-d6a5d8c2080c | transcripts/implementation-18539292-baa5-419b-99da-d6a5d8c2080c.jsonl | /Users/huaweiide/.claude/projects/-Users-huaweiide-Desktop-fe-code-harmony-pilot-generated-apps-eat-what-test1/18539292-baa5-419b-99da-d6a5d8c2080c.jsonl |  |
| api_reference | ed4bd1a5-8429-47dc-8fa5-c73fa9a83216 | transcripts/api_reference-ed4bd1a5-8429-47dc-8fa5-c73fa9a83216.jsonl | /Users/huaweiide/.claude/projects/-Users-huaweiide-Desktop-fe-code-harmony-pilot-generated-apps-eat-what-test1/ed4bd1a5-8429-47dc-8fa5-c73fa9a83216.jsonl |  |
| ui-qa | 9277243c-9f2f-4b5b-a361-3493fb7fc52d | transcripts/ui-qa-9277243c-9f2f-4b5b-a361-3493fb7fc52d.jsonl | /Users/huaweiide/.claude/projects/-Users-huaweiide-Desktop-fe-code-harmony-pilot-generated-apps-eat-what-test1/9277243c-9f2f-4b5b-a361-3493fb7fc52d.jsonl |  |
