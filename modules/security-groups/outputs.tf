output "ssh_security_group_id" {
  description = "ID do Security Group que permite SSH"
  value       = aws_security_group.allow_ssh.id
}

output "http_security_group_id" {
  description = "ID do Security Group que permite HTTP"
  value       = aws_security_group.allow_http.id
}

output "https_security_group_id" {
  description = "ID do Security Group que permite HTTPS"
  value       = aws_security_group.allow_https.id
}

output "mysql_security_group_id" {
  description = "ID do Security Group que permite MySQL"
  value       = aws_security_group.allow_mysql.id
}
