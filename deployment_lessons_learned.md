
### DPL-03: AWS CLI v2 Interactive Pager Suppression (`AWS_PAGER=""`)
- **Date:** 2026-11-13
- **Fix:** Export `AWS_PAGER=""` in every Git Bash harness block to prevent `more`/`less` interactive hangs.

### DPL-04: AWS Builder ID Project SCP (`p-czhev3f0` / `DenyRestrictedFeatures`) Release
- **Date:** 2026-11-13
- **Fix:** Activate **Advanced features** at `https://settings.aws.com/projects` (`Steven-Tuschman-Team` / `027006175590`) to detach `p-czhev3f0` from child account `698250246230` while retaining `$120.00` credits.

### DPL-05: MINGW64 4,096-Byte PTY Paste Ceiling
- **Date:** 2026-11-13
- **Fix:** Keep every Git Bash clipboard block strictly below `3,200` bytes (`MAX_CANON = 4096`) and scrub UTF-8 non-breaking spaces (`\xc2\xa0`) prior to `terraform fmt`.

### DPL-06: Windows Smart App Control (`VerifiedAndReputablePolicyState = 1`) Provider Block
- **Date:** 2026-11-13
- **Symptom:** `hashicorp/aws v5.100.0` failed on `fork/exec ... An Application Control policy has blocked this file`.
- **Root Cause:** Windows 11 Smart App Control blocked older un-embedded `v5.x` PE binaries extracted into user workspace directories.
- **Deterministic Fix:** Upgrade provider constraint to `>= 5.0` (`hashicorp/aws v6.73.0`), which carries embedded Authenticode PE signatures trusted natively by Windows Smart App Control.

### DPL-07: GitHub Fine-Grained PAT Scope Triad for OIDC Workflow Push
- **Date:** 2026-11-13
- **Symptom:** `git push` of commit containing `.github/workflows/*.yml` failed with `HTTP 403` when token held only `Actions` and `Secrets` write scopes.
- **Deterministic Fix:** Click `+ Add permissions` on Fine-Grained PAT to grant `Contents: Read and write`, `Workflows: Read and write`, and `Actions: Read and write`, and isolate Windows Git Credential Manager via `-c credential.helper=""`.

### DPL-08: GitHub Actions Job Logs 302 Redirect Header Bleed
- **Date:** 2026-11-13
- **Symptom:** `curl -sSL -H "Authorization: Bearer ..."` returned empty output on `/actions/jobs/{job_id}/logs`.
- **Deterministic Fix:** Capture `Location` header via `curl -sSI` with Bearer auth, then invoke `curl -sS "$LOG_URL"` without auth headers.

### DPL-09: AI Harness Drift & Dual-Ledger Desynchronization
- **Date:** 2026-11-13
- **Symptom:** AI omitted progress percentage / iteration headers and updated `deployment_lessons_learned.md` without `patch_ledger.md`.
- **Deterministic Fix:** Enforce `HARNESS-RULE-08` (`SRL-07`): mandatory 3-line telemetry header + synchronous `PCH-XX == DPL-XX` disk readback gate before advancing.

### DPL-10: GitHub Account-Level Hardened OIDC `sub` Claim (`@owner_id` / `@repo_id`)
- **Date:** 2026-11-13
- **Symptom:** `AssumeRoleWithWebIdentity` returned `AccessDenied` in Run `43512129647` (`EventId: 2778200d-22c8-47e9-9554-500e79eee365`).
- **Root Cause:** Account `Compcode1` enforces hardened OIDC subject claims (`repo:Compcode1@171821203/Compcode1-akcce-aws-autonomous-fleet-01@1457038661:ref:refs/heads/main`), rejecting legacy slug-only `sub` strings.
- **Deterministic Fix:** Bind Gate 2 `token.actions.githubusercontent.com:sub` directly to `${var.github_owner}@${var.github_owner_id}/${var.github_repo}@${var.github_repo_id}`.

### DPL-11: CloudTrail Raw JSON Scrollback Truncation & Federated Username Indexing
- **Date:** 2026-11-13
- **Symptom:** Raw `CloudTrailEvent` JSON pushed `[1/3]` and `[2/3]` off the Mintty scrollback window, and `AttributeKey=Username` returned `Events: []` for Secrets Manager calls.
- **Deterministic Fix:** Enforce JMESPath `--query` field projection on all CloudTrail CLI lookups and filter vault events by `EventSource=secretsmanager.amazonaws.com`.

### DPL-12: Multi-Line JSON Exceeding 24-Row Mintty Viewport & Context Budget
- **Date:** 2026-11-13
- **Symptom:** Multi-line `--output json` expanded 7 CloudTrail events to ~58 vertical lines, truncating viewport copy-paste and accelerating LLM context compression.
- **Deterministic Fix:** Enforce `--output text` (`<= 15` lines) for all terminal readbacks.

### DPL-13: LLM Context-Window Compression Causing Silent Harness Detachment
- **Date:** 2026-11-13
- **Symptom:** After large CLI/JSON pastes compressed the initial Phase 1 directive out of verbatim context, the AI fabricated approximate headers, lost `1/4-4/4` defect iteration tracking, and modified commands before logging patches.
- **Deterministic Fix:** Enforce `HARNESS-RULE-09` (`SRL-09`): mandatory Pre-Patch Tether Safety Valve (immediate halt if verbatim harness rules/counters are compressed) backed by an on-disk `.harness_heartbeat` file echoed into every turn's terminal output in v2.0.
