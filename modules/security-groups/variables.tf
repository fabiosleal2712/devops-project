variable "vpc_id" {
  description = "ID da VPC onde os Security Groups serão criados"
  type        = string
}

variable "security_group_name" {
  description = "Nome base para os Security Groups"
  type        = string
}

variable "allowed_ssh_cidr_blocks" {
  description = "Lista de CIDR blocks permitidos para acesso SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_mysql_cidr_blocks" {
  description = "Lista de CIDR blocks permitidos para acesso MySQL"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags adicionais para os Security Groups"
  type        = map(string)
  default     = {}
}
