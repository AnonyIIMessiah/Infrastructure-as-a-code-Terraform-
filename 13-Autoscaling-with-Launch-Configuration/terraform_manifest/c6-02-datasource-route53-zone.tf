# Get DNS information from AWS Route53
data "aws_route53_zone" "myDomain" {
  name = "devopscamp.shop"
}
# Output MyDomain Zone ID
output "myDomain_zoneid" {
  description = "value"
  value       = data.aws_route53_zone.myDomain.zone_id
}

# Output MyDomain name
output "myDomain_name" {
  description = "value"
  value       = data.aws_route53_zone.myDomain.name
}
