# AKCCE AWS CloudTrail Server-Side Telemetry — us-east-2 (2026-11-13)

## Cryptographic & Adversarial Event Chain
| Timestamp (PST) | CloudTrail EventId | API Action | Session / Principal | Verdict |
| :--- | :--- | :--- | :--- | :--- |
| `2026-11-13T13:36:21-08:00` | `2778200d-22c8-47e9-9554-500e79eee365` | `AssumeRoleWithWebIdentity` | `repo:Compcode1@171821203/Compcode1-akcce-aws-autonomous-fleet-01@1457038661:ref:refs/heads/main` | **DENIED** (Pre-PCH-10 negative proof) |
| `2026-11-13T14:01:41-08:00` | `55ef265c-2a5b-4bf2-85e9-9dd9e6612668` | `GetResourcePolicy` | `8448d4c8-d081-7059-da2b-3dbde3377623` | **ALLOWED** (Gate 4 readback) |
| `2026-11-13T14:04:24-08:00` | `73d8d34f-9717-489f-b1b8-29f98143ae8c` | `AssumeRoleWithWebIdentity` | `repo:Compcode1@171821203/Compcode1-akcce-aws-autonomous-fleet-01@1457038661:ref:refs/heads/main` | **ALLOWED** (Gates 1 & 2 OIDC exchange) |
| `2026-11-13T14:04:28-08:00` | `3361b71b-66c3-4d7d-8ae8-32402c8b5b33` | `GetSecretValue` | `AKCCE-AutonomousFleet-OIDC-Proof` | **ALLOWED** (Gates 3 & 4 positive proof) |
| `2026-11-13T14:04:29-08:00` | `3c37b5af-392d-4ef5-893a-7947b78dd2b1` | `ListSecrets` | `AKCCE-AutonomousFleet-OIDC-Proof` | **DENIED** (Kill-chain lateral block) |
