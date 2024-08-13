variable "aws_region" {
  description = "Região da AWS onde o EKS será provisionado"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versão do Kubernetes para o cluster EKS"
  type        = string
  default     = "1.21"
}

variable "vpc_id" {
  description = "ID da VPC onde o cluster EKS será criado"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets para o cluster EKS"
  type        = list(string)
}

variable "node_group_desired_capacity" {
  description = "Capacidade desejada para o grupo de nós"
  type        = number
  default     = 2
}

variable "node_group_max_capacity" {
  description = "Capacidade máxima para o grupo de nós"
  type        = number
  default     = 3
}

variable "node_group_min_capacity" {
  description = "Capacidade mínima para o grupo de nós"
  type        = number
  default     = 1
}

variable "node_instance_type" {
  description = "Tipo de instância dos nós de trabalho"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Nome da chave SSH para acessar os nós de trabalho"
  type        = string
}

variable "tags" {
  description = "Tags adicionais para o cluster EKS e os nós"
  type        = map(string)
  default     = {}
}
