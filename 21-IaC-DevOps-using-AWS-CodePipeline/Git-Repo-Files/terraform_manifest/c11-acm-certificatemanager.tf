# ACM Module - To Create and Verify SSL Certificates

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = data.aws_route53_zone.myDomain.name
  zone_id     = data.aws_route53_zone.myDomain.zone_id

  validation_method = "DNS"

  subject_alternative_names = [
    # "*.devopscamp.shop"
    var.dns_name
  ]

  # wait_for_validation = true

  tags = local.common_tags
}

# Output ACM Certificate ARN
output "acm_certificate_arn" {
  description = "ACM Certificate ARN"
  value       = module.acm.acm_certificate_arn
}
