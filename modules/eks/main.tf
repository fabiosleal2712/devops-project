provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.node_group_desired_capacity
      max_capacity     = var.node_group_max_capacity
      min_capacity     = var.node_group_min_capacity
      instance_type    = var.node_instance_type
      key_name         = var.key_name
    }
  }

  tags = var.tags
}

resource "aws_iam_role" "eks_role" {
  name = "eksClusterRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  ]
}

resource "aws_iam_role_policy_attachment" "worker_node_eks_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSCNIPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "ec2_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_role.name
}

resource "aws_launch_configuration" "eks_node_launch_config" {
  name          = "${var.cluster_name}-launch-config"
  image_id      = data.aws_ami.eks_worker_ami.id
  instance_type = var.node_instance_type
  iam_instance_profile = aws_iam_instance_profile.eks_node_instance_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "eks_nodes" {
  launch_configuration = aws_launch_configuration.eks_node_launch_config.name
  min_size             = var.node_group_min_capacity
  max_size             = var.node_group_max_capacity
  desired_capacity     = var.node_group_desired_capacity
  vpc_zone_identifier  = var.subnet_ids

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-eks-node"
    propagate_at_launch = true
  }
}
