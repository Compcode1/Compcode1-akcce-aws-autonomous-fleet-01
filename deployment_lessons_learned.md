
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
