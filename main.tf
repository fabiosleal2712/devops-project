# Referência ao módulo VPC
module "vpc" {
  source                  = "./modules/vpc"
  project_name            = "my-devops-project"
  vpc_cidr                = "10.0.0.0/16"
  public_subnets_cidr     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones      = ["us-west-2a", "us-west-2b"]
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}


# Referência ao módulo Security Groups
module "security_groups" {
  source                 = "./modules/security-groups"
  vpc_id                 = module.vpc.vpc_id
  security_group_name    = "my-app"
  allowed_ssh_cidr_blocks = ["203.0.113.0/24"]
  allowed_mysql_cidr_blocks = ["10.0.0.0/16"]
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}

# Referência ao módulo Secrets Manage
module "secrets_manager" {
  source       = "./modules/secrets-manager"
  secret_name  = "rds-credentials"
  environment  = "prod"
  db_username  = "admin"
  db_password  = "?(h*NoBfNg9i-%%:f"
  db_host      = module.rds.db_endpoint
  db_port      = 3306
  db_name      = "mydatabase"
}



# Referência ao módulo CDN
module "cdn" {
  source             = "./modules/cdn"
  aws_region         = "us-east-1"
  origin_domain_name = "myapp.example.com"
  acm_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abcde12345-6789-0abc-def1-23456gh78901"
  default_ttl        = 86400
  max_ttl            = 31536000
  price_class        = "PriceClass_100"
}


# Referência ao módulo EKS
module "eks" {
  source                     = "./modules/eks"
  aws_region                 = "us-west-2"
  cluster_name               = "my-eks-cluster"
  cluster_version            = "1.21"
  vpc_id                     = module.vpc.vpc_id
  subnet_ids                 = module.vpc.subnet_ids
  node_group_desired_capacity = 2
  node_group_max_capacity    = 3
  node_group_min_capacity    = 1
  node_instance_type         = "t3.medium"
  key_name                   = "my-ssh-key"
  tags                       = {
    Environment = "dev"
    Project     = "my-project"
  }
}


module "rds" {
  source             = "./modules/rds"
  db_name            = "wordpress_db"
  db_username        = "admin"
  db_password        = "password123"
  security_group_id  = module.security_groups.mysql_security_group_id
  db_subnet_group    = module.vpc.private_subnet_ids
  tags               = {
    Environment = "dev"
  }
}

module "wordpress" {
  source      = "./modules/wordpress"
  db_host     = module.rds.db_endpoint   # Passa o output do RDS como db_host
  db_name     = module.rds.db_name
  db_password = "password123"
}