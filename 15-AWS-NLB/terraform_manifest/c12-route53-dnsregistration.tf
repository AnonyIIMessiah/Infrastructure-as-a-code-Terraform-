# DNS Registration
# Default DNS
resource "aws_route53_record" "default_dns" {
  zone_id = data.aws_route53_zone.myDomain.zone_id
  name    = "nlb.devopscamp.shop"
  type    = "A"
  alias {
    name                   = module.nlb.lb_dns_name
    zone_id                = module.nlb.lb_zone_id
    evaluate_target_health = true
  }
}

# # App1 DNS
# resource "aws_route53_record" "app1_dns" {
#   zone_id = data.aws_route53_zone.myDomain.zone_id
#   name    = var.app1_dns_name
#   type    = "A"
#   alias {
#     name                   = module.alb.lb_dns_name
#     zone_id                = module.alb.lb_zone_id
#     evaluate_target_health = true
#   }
# }

# # App2 DNS
# resource "aws_route53_record" "app2_dns" {
#   zone_id = data.aws_route53_zone.myDomain.zone_id
#   name    = var.app2_dns_name
#   type    = "A"
#   alias {
#     name                   = module.alb.lb_dns_name
#     zone_id                = module.alb.lb_zone_id
#     evaluate_target_health = true
#   }
# }
