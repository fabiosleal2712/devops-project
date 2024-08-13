variable "aws_region" {
  description = "Região da AWS onde o RDS será provisionado"
  type        = string
  default     = "us-west-2"
}

variable "db_name" {
  description = "Nome do banco de dados"
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

variable "allocated_storage" {
  description = "Armazenamento alocado para o banco de dados (em GB)"
  type        = number
  default     = 20
}

variable "engine" {
  description = "Motor do banco de dados (ex: mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Versão do motor do banco de dados"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "Classe da instância do banco de dados"
  type        = string
  default     = "db.t3.micro"
}

variable "parameter_group_name" {
  description = "Nome do grupo de parâmetros do RDS"
  type        = string
  default     = "default.mysql8.0"
}

variable "publicly_accessible" {
  description = "Se o banco de dados será publicamente acessível"
  type        = bool
  default     = false
}

variable "security_group_id" {
  description = "ID do Security Group associado ao RDS"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de subnets IDs para o RDS"
  type        = list(string)
}

variable "db_host" {
  description = "Endpoint do banco de dados RDS"
  type        = string
}


