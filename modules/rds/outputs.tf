output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.this.endpoint
}

output "db_name" {
  description = "The name of the RDS database"
  value       = aws_db_instance.this.name
}

output "rds_secret_arn" {
  description = "ARN do Secret Manager associado ao RDS"
  value       = aws_secretsmanager_secret.rds_secret.arn
}
