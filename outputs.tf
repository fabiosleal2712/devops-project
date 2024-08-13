output "wordpress_service_ip" {
  description = "IP público do serviço WordPress"
  value       = kubernetes_service.wordpress.status[0].load_balancer[0].ingress[0].ip
}
