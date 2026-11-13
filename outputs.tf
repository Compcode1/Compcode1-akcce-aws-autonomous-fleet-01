output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.github_actions.arn
}
output "federated_iam_role_arn" {
  value = aws_iam_role.autonomous_fleet_ota_signer.arn
}
output "ota_secret_arn" {
  value = aws_secretsmanager_secret.ota_firmware_signing_key.arn
}
