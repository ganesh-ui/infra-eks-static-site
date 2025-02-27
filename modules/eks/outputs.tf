output "eks_cluster_id" {
  description = "The ID of the EKS Cluster"
  value       = aws_eks_cluster.eks.id
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS Cluster"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_certificate" {
  description = "Certificate Authority data for the EKS cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "eks_node_group_id" {
  description = "ID of the EKS Node Group"
  value       = aws_eks_node_group.node_group.id
}
