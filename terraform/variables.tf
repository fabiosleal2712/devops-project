variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0ae8f15ae66fe8cda"  # Exemplo de AMI ID para Amazon Linux 2
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "Username for the database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the database"
  type        = string
}

variable "wordpress_ami_id" {
  description = "AMI ID for the WordPress instance"
  type        = string
  default     = "ami-0ae8f15ae66fe8cda"  # Exemplo de AMI ID para Amazon Linux 2
}

variable "wordpress_instance_type" {
  description = "Type of WordPress EC2 instance"
  type        = string
  default     = "t2.micro"
}
