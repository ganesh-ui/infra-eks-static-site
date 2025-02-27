output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.eks_alb.dns_name
}

output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.eks_alb.arn
}

output "alb_target_group_arn" {
  description = "ARN of the ALB Target Group"
  value       = aws_lb_target_group.eks_tg.arn
}
