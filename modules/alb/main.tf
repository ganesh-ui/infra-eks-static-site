resource "aws_lb" "eks_alb" {
  name               = "eks-alb-${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets           = var.subnet_ids
}

resource "aws_lb_target_group" "eks_tg" {
  name     = "eks-target-group-${var.env}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.eks_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.eks_tg.arn
  }
}
