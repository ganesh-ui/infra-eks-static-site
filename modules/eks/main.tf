resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role-${var.env}"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_eks_cluster" "eks" {
  name     = "eks-${var.env}"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name  = aws_eks_cluster.eks.name
  node_group_name = "eks-node-group-${var.env}"
  node_role_arn  = aws_iam_role.eks_cluster_role.arn
  subnet_ids     = var.subnet_ids

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 5
  }

  instance_types = [var.instance_type]
}
