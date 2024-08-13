output "cluster_id" {
  description = "ID do cluster EKS"
  value       = module.eks.cluster_id
}

output "cluster_arn" {
  description = "ARN do cluster EKS"
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Dados do certificado CA do cluster EKS"
  value       = module.eks.cluster_certificate_authority_data
}

output "node_security_group_id" {
  description = "ID do Security Group dos nós de trabalho do EKS"
  value       = module.eks.node_security_group_id
}
