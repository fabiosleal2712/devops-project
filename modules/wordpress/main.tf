provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  force_create_rds = [module.rds]  # Força a criação do RDS primeiro
}



resource "kubernetes_namespace" "wordpress" {
  metadata {
    name = "wordpress"
  }
}

resource "kubernetes_secret" "mysql_password" {
  metadata {
    name      = "mysql-password"
    namespace = kubernetes_namespace.wordpress.metadata[0].name
  }

  data = {
    password = base64encode(var.db_password)
  }
}

resource "kubernetes_deployment" "wordpress" {
  metadata {
    name      = "wordpress"
    namespace = kubernetes_namespace.wordpress.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "wordpress"
      }
    }

    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }

      spec {
        container {
          name  = "wordpress"
          image = "wordpress:latest"

          env {
            name  = "WORDPRESS_DB_HOST"
            value = var.db_host
          }

          env {
            name = "WORDPRESS_DB_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.mysql_password.metadata[0].name
                key  = "password"
              }
            }
          }

          port {
            container_port = 80
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "wordpress" {
  metadata {
    name      = "wordpress-service"
    namespace = kubernetes_namespace.wordpress.metadata[0].name
  }

  spec {
    selector = {
      app = "wordpress"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
