output "secret_arn" {
  description = "ARN do segredo no Secrets Manager"
  value       = aws_secretsmanager_secret.rds_secret.arn
}

output "secret_version_id" {
  description = "ID da versão do segredo no Secrets Manager"
  value       = aws_secretsmanager_secret_version.rds_secret_version.version_id
}
