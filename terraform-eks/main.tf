provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source         = "./modules/vpc"
  cluster_name   = var.cluster_name
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
}

# Security Group Module
module "security_group" {
  source       = "./modules/security_group"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
}

# IAM Roles Module
module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

# EKS Cluster + Node Group Module
module "eks" {
  source              = "./modules/eks"
  cluster_name        = var.cluster_name
  subnet_ids          = module.vpc.public_subnet_ids
  sg_id               = module.security_group.sg_id
  cluster_role_arn    = module.iam.cluster_role_arn
  node_role_arn       = module.iam.node_role_arn
  eks_version         = var.eks_version
  node_desired_size   = var.node_desired_size
  node_max_size       = var.node_max_size
  node_min_size       = var.node_min_size
  node_instance_types = var.node_instance_types
  node_ami_type       = var.node_ami_type
  ec2_key_name        = var.ec2_key_name

  cluster_depends_on = [
    module.iam.cluster_role_arn
  ]
  node_depends_on = [
    module.iam.node_role_arn
  ]
}

