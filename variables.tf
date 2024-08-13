variable "k8s_cluster_endpoint" {
  description = "Endpoint do cluster Kubernetes"
  type        = string
}

variable "k8s_cluster_token" {
  description = "Token de autenticação do cluster Kubernetes"
  type        = string
}

variable "k8s_cluster_ca_certificate" {
  description = "Certificado CA do cluster Kubernetes"
  type        = string
}

variable "db_host" {
  description = "Endpoint do banco de dados RDS"
  type        = string
}

variable "db_password" {
  description = "Senha do banco de dados RDS"
  type        = string
}
