resource "aws_secretsmanager_secret" "rds_secret" {
  name = var.secret_name

  tags = {
    Name = var.secret_name
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
    host     = var.db_host
    port     = var.db_port
    database = var.db_name
  })
}
