data "aws_route53_zone" "main" {
  name = var.r53_domain
}
