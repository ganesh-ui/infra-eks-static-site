provider "aws" {
  region = var.region
}

# VPC
module "vpc" {
  source = "./modules/vpc"
  env    = var.env
  vpc_cidr = "10.0.0.0/16"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  availability_zones = var.availability_zones
}

# ECR
module "ecr" {
  source = "./modules/ecr"
  env    = var.env
}

# EKS
module "eks" {
  source = "./modules/eks"
  env    = var.env
  subnet_ids = module.vpc.private_subnets
  instance_type = var.instance_type
}

# ALB
module "alb" {
  source = "./modules/alb"
  env    = var.env
  subnet_ids = module.vpc.public_subnets
  security_groups = var.security_groups
  vpc_id = module.vpc.vpc_id
}
