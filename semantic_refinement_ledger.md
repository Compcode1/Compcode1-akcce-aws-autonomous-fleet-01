
### SRL-06: Canonical Repository Casing & Immutable Node-ID Binding
- **Date:** 2026-11-13
- **Refinement:** Bound `Compcode1/Compcode1-akcce-aws-autonomous-fleet-01` (`Owner ID: 171821203`, `Repo ID: 1457038661`, `Branch: main`) against verified Greenfield AWS OIDC state.

### SRL-07: HARNESS-RULE-08 — Mandatory Telemetry Tether & Synchronous Dual-Ledger Gate
- **Date:** 2026-11-13
- **Invariant:** Every turn must emit `[PHASE] | [OVERALL PROGRESS %]`, `[MODE] | [ITERATION X/4]`, and `[LEDGER PARITY]`. Zero forward execution is permitted while `patch_ledger.md` and `deployment_lessons_learned.md` are out of parity.

### SRL-08: Cryptographic Node-ID Enforcement in AWS IAM OIDC `sub` Predicate
- **Date:** 2026-11-13
- **Refinement:** Upgraded AWS Gate 2 from tag-only Node-ID metadata to active cryptographic `StringEquals` enforcement on `repo:Compcode1@171821203/Compcode1-akcce-aws-autonomous-fleet-01@1457038661:ref:refs/heads/main`, eliminating namespace-rename spoofing vectors.

### SRL-09: HARNESS-RULE-09 — Pre-Patch Tether Safety Valve & On-Disk State Heartbeat
- **Date:** 2026-11-13
- **Invariant:** Volatile chat memory cannot be sole source of truth for state-machine governance. (1) Before any patch, AI must execute a 4-point Tether Valve: verify verbatim rule access (or halt immediately on context compression—never improvise headers), freeze Progress %, track `Attempt N/4` per `PCH-XX`, and commit `PCH-XX == DPL-XX` to disk first. (2) Directive v2.0 must maintain a local `.harness_heartbeat` file echoed at the bottom of every terminal block to re-anchor the AI every turn, paired with `<= 15`-line `--output text` hygiene.
