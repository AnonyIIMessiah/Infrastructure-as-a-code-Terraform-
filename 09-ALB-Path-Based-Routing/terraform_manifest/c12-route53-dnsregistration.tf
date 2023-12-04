# DNS Registration
resource "aws_route53_record" "app_dns" {
  zone_id = data.aws_route53_zone.myDomain.zone_id
  name    = "apps.devopscamp.shop"
  type    = "A"
  alias {
    name                   = module.alb.this_lb_dns_name
    zone_id                = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }
}
