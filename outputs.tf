output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "ecr_repository_url" {
  value = module.ecr.ecr_repository_url
}

output "eks_cluster_id" {
  value = module.eks.eks_cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "eks_cluster_certificate" {
  value = module.eks.eks_cluster_certificate
}

output "eks_node_group_id" {
  value = module.eks.eks_node_group_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
