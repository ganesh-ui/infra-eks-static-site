output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.static_site.repository_url
}
