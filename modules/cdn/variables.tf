variable "aws_region" {
  description = "Região da AWS onde o CloudFront será provisionado"
  type        = string
  default     = "us-east-1"
}

variable "origin_domain_name" {
  description = "O nome do domínio de origem para a CDN (ex: S3 bucket ou ALB)"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN do certificado SSL no ACM para o CloudFront"
  type        = string
}

variable "default_ttl" {
  description = "Tempo de cache padrão em segundos"
  type        = number
  default     = 86400
}

variable "max_ttl" {
  description = "Tempo máximo de cache em segundos"
  type        = number
  default     = 31536000
}

variable "price_class" {
  description = "Classe de preço do CloudFront (PriceClass_100, PriceClass_200, etc.)"
  type        = string
  default     = "PriceClass_100"
}
