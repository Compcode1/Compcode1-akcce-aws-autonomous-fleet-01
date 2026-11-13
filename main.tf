terraform {
  required_version = ">= 1.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
  default_tags {
    tags = {
      Architecture       = "AKCCE-Zero-Trust-Machine-Identity"
      Project            = "akcce-aws-autonomous-fleet-01"
      GitHubOwnerID      = var.github_owner_id
      GitHubRepositoryID = var.github_repo_id
      ManagedBy          = "Terraform"
    }
  }
}

data "aws_caller_identity" "current" {}

# Gate 1: Singleton AWS IAM OIDC Trust Anchor
resource "aws_iam_openid_connect_provider" "github_actions" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1",
    "1c58a3a8518e8759bf075b76b750d4f2df264fcd"
  ]
}

# Gate 2: 60-Min Ephemeral Role & Exact Subject/Audience Claim Lock
data "aws_iam_policy_document" "github_oidc_assume_role" {
  statement {
    sid     = "EnforceGitHubActionsOIDCExactSubjectAndAudience"
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_actions.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.github_owner}/${var.github_repo}:ref:refs/heads/${var.github_branch}"]
    }
    condition {
      test     = "Null"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["false"]
    }
  }
}

resource "aws_iam_role" "autonomous_fleet_ota_signer" {
  name                 = "akcce-autonomous-fleet-01-ota-oidc-role"
  description          = "AKCCE OIDC role bound to Compcode1/Compcode1-akcce-aws-autonomous-fleet-01 (Repo ID 1457038661)"
  assume_role_policy   = data.aws_iam_policy_document.github_oidc_assume_role.json
  max_session_duration = 3600
}

# Gate 4A: Autonomous Fleet OTA Signing Secret (us-east-2)
resource "aws_secretsmanager_secret" "ota_firmware_signing_key" {
  name                    = "autonomy-prod/ota-firmware-signing-key"
  description             = "Simulated Ed25519 OTA firmware signing key metadata"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "ota_firmware_signing_key_v1" {
  secret_id = aws_secretsmanager_secret.ota_firmware_signing_key.id
  secret_string = jsonencode({
    key_id              = "akcce-ed25519-ota-prod-01"
    algorithm           = "Ed25519"
    fleet_domain        = "us-east-2-autonomous-fleet"
    bound_repo_node_id  = var.github_repo_id
    bound_owner_node_id = var.github_owner_id
    attestation_state   = "ZERO_STATIC_SECRETS_ENFORCED"
  })
}

# Gate 3: Identity-Based Least-Privilege Inline Policy
data "aws_iam_policy_document" "ota_secret_least_privilege" {
  statement {
    sid       = "AllowReadSingleOTASigningSecretOnly"
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue", "secretsmanager:DescribeSecret"]
    resources = [aws_secretsmanager_secret.ota_firmware_signing_key.arn]
  }
}

resource "aws_iam_role_policy" "autonomous_fleet_ota_signer_policy" {
  name   = "akcce-ota-secret-read-only"
  role   = aws_iam_role.autonomous_fleet_ota_signer.id
  policy = data.aws_iam_policy_document.ota_secret_least_privilege.json
}

# Gate 4B: Resource-Based Vault Guardrail Policy
data "aws_iam_policy_document" "ota_secret_resource_guardrail" {
  statement {
    sid    = "AllowOnlyFederatedAutonomousFleetRole"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.autonomous_fleet_ota_signer.arn]
    }
    actions   = ["secretsmanager:GetSecretValue", "secretsmanager:DescribeSecret"]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalAccount"
      values   = [var.aws_account_id]
    }
  }
}

resource "aws_secretsmanager_secret_policy" "ota_firmware_signing_key_policy" {
  secret_arn          = aws_secretsmanager_secret.ota_firmware_signing_key.arn
  policy              = data.aws_iam_policy_document.ota_secret_resource_guardrail.json
  block_public_policy = true
}
