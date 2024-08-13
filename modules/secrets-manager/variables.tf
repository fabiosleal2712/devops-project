variable "secret_name" {
  description = "Nome do segredo armazenado no Secrets Manager"
  type        = string
}

variable "environment" {
  description = "Ambiente em que o segredo será usado (ex: dev, prod)"
  type        = string
}

variable "db_username" {
  description = "Usuário do banco de dados"
  type        = string
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
}

variable "db_host" {
  description = "Endpoint do banco de dados"
  type        = string
}

variable "db_port" {
  description = "Porta do banco de dados"
  type        = number
}

variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
}
