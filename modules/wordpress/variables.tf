variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versão do Kubernetes para o cluster EKS"
  type        = string
  default     = "1.21"
}

variable "subnets" {
  description = "Subnets onde o cluster EKS será criado"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID da VPC onde o cluster EKS será criado"
  type        = string
}

variable "key_name" {
  description = "Nome da chave SSH para acessar os nós EKS"
  type        = string
}

# No módulo wordpress
variable "db_host" {
  description = "Endpoint do banco de dados RDS"
  type        = string
}
