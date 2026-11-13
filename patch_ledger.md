# AKCCE Patch Ledger — akcce-aws-autonomous-fleet-01

### PCH-01: MINGW64 Deterministic Binary PATH Injection
- **Paired Lesson:** DPL-01 / DPL-02 | **Date:** 2026-11-13
- **Patch:** Export `/c/Program Files/Amazon/AWSCLIV2` and `$HOME/AppData/Local/Microsoft/WinGet/Packages/Hashicorp.Terraform*` at the top of every Git Bash block.

### PCH-02: Canonical GitHub Slug & Numeric Node-ID Binding
- **Paired Lesson:** SRL-06 | **Date:** 2026-11-13
- **Patch:** Reconciled repo slug `HTTP 404` delta to `Compcode1/Compcode1-akcce-aws-autonomous-fleet-01` (`Owner ID: 171821203`, `Repo ID: 1457038661`, `Branch: main`).

### PCH-03: AWS CLI v2 Pager Suppression & IAM-Toolbox Namespace
- **Paired Lesson:** DPL-03 | **Date:** 2026-11-13
- **Patch:** Export `AWS_PAGER=""` globally and route authorization decodes to `aws iam-toolbox get-request-authorization-details --region us-east-1`.

### PCH-04: AWS Builder ID Project SCP (`p-czhev3f0`) Release
- **Paired Lesson:** DPL-04 | **Date:** 2026-11-13
- **Patch:** Activated **Advanced features** at `https://settings.aws.com/projects` (`Steven-Tuschman-Team` / `027006175590`), detaching `DenyRestrictedFeatures` from `698250246230` while preserving `$120.00` credits.

### PCH-05: Mintty 4,096-Byte Paste Ceiling & NBSP Scrub
- **Paired Lesson:** DPL-05 | **Date:** 2026-11-13
- **Patch:** Cap all Git Bash blocks strictly `< 2,800` bytes and run `sed -i 's/\xc2\xa0/ /g'` prior to validation.

### PCH-06: Windows 11 Smart App Control Authenticode Provider Upgrade
- **Paired Lesson:** DPL-06 | **Date:** 2026-11-13
- **Patch:** Upgraded `hashicorp/aws` from blocked `v5.100.0` to Authenticode-signed `v6.73.0` (`>= 6.0`), satisfying `VerifiedAndReputablePolicyState = 1`.

### PCH-07: GitHub Fine-Grained PAT Triad & Credential Helper Isolation
- **Paired Lesson:** DPL-07 | **Date:** 2026-11-13
- **Patch:** Enabled `Contents: Read/Write`, `Workflows: Read/Write`, and `Actions: Read/Write` on PAT and isolated push via `git -c credential.helper=""`.

### PCH-08: GitHub Actions 302 Pre-Signed Log Redirect Isolation
- **Paired Lesson:** DPL-08 | **Date:** 2026-11-13
- **Patch:** Extract `Location:` via `curl -sSI` first, then fetch pre-signed blob URL without forwarding GitHub `Authorization` header.

### PCH-09: Mandatory AI Harness Telemetry & Synchronous Dual-Ledger Gate
- **Paired Lesson:** DPL-09 / SRL-07 | **Date:** 2026-11-13
- **Patch:** Enforced `HARNESS-RULE-08` requiring Phase/Progress-%/Iteration banner and verified `PCH-XX == DPL-XX` disk parity before advancing any step.

### PCH-10: GitHub Hardened Node-ID OIDC `sub` Claim Binding (`owner@owner_id/repo@repo_id`)
- **Paired Lesson:** DPL-10 / SRL-08 | **Date:** 2026-11-13
- **Patch:** Updated Gate 2 `aws_iam_policy_document.github_oidc_assume_role` `sub` condition to `repo:${var.github_owner}@${var.github_owner_id}/${var.github_repo}@${var.github_repo_id}:ref:refs/heads/${var.github_branch}` matching CloudTrail `WebIdentityUser` telemetry.

### PCH-11: CloudTrail Buffer Overflow & Secrets Manager EventSource Indexing
- **Paired Lesson:** DPL-11 | **Date:** 2026-11-13
- **Patch:** Project compact fields (`EventId,EventTime,EventName,Username`) via `--query` to prevent Mintty scrollback truncation, and query Secrets Manager telemetry via `AttributeKey=EventSource,AttributeValue=secretsmanager.amazonaws.com`.

### PCH-12: Single-Viewport `--output text` Formatting (`<= 15` Vertical Lines)
- **Paired Lesson:** DPL-12 | **Date:** 2026-11-13
- **Patch:** Replace multi-line `--output json` (`58+` lines) with single-line `--output text` (`<= 15` lines) to prevent 24-row Mintty viewport truncation and chat context bloat.

### PCH-13: Context-Compression Tether Failure & Pre-Patch Safety Valve
- **Paired Lesson:** DPL-13 / SRL-09 | **Date:** 2026-11-13
- **Patch:** Codified `HARNESS-RULE-09` enforcing a 4-point Pre-Patch Tether Check (Context-Loss Halt over header fabrication, frozen Progress %, `PCH-XX`-bound `1/4-4/4` counter, disk-first dual-ledger lock) plus an on-disk `.harness_heartbeat` echoed at the end of every v2.0 block.
