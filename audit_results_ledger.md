# AKCCE Audit Results Ledger — akcce-aws-autonomous-fleet-01

## End-to-End Zero-Trust Attestation Summary (2026-11-13)
- **Repository:** `Compcode1/Compcode1-akcce-aws-autonomous-fleet-01` (`Owner ID: 171821203` | `Repo ID: 1457038661`)
- **Attested Git Commit SHA:** `3d0bcda93c837976baaa74352933c2847604f35d`
- **Green GitHub Actions Run ID:** `43516181033` (`conclusion: success`)
- **AWS Account & Region:** `698250246230` (`us-east-2`)
- **Static Credentials Stored in GitHub:** `0` (`ZERO_STATIC_SECRETS_ENFORCED`)

## 4-Gate Verification Matrix
| Gate | Security Control | Live Result | Forensic Evidence |
| :--- | :--- | :--- | :--- |
| **Gate 1** | AWS IAM OIDC Provider (`token.actions.githubusercontent.com`) | **PASS** | `aud = sts.amazonaws.com`, TLS 1.3 `X25519MLKEM768` |
| **Gate 2** | Ephemeral Role + Node-ID `sub` Lock (`3600s` max) | **PASS** | Rejected slug-only JWT (`2778200d-...`); issued STS role for `@171821203`/`@1457038661` (`73d8d34f-...`) |
| **Gate 3** | Inline Least-Privilege Secret Policy | **PASS** | Allowed `GetSecretValue` (`akcce-ed25519-ota-prod-01`); blocked `ListSecrets` (`exit 254`) |
| **Gate 4** | Secrets Manager Resource Policy (`block_public_policy`) | **PASS** | Restricted exclusively to `akcce-autonomous-fleet-01-ota-oidc-role` in `698250246230` |
