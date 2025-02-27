resource "aws_ecr_repository" "static_site" {
  name = "static-site-${var.env}"
  image_scanning_configuration {
    scan_on_push = true
  }
}
