# terraform o/p values


# output - For Loop with List
output "for-output_list" {
  description = "For loop with list"
  value       = [for instance in aws_instance.myec2ins : instance.public_dns]
}


# output - For Loop with map
output "for-output_map1" {
  description = "For loop with map"
  value = {
    for instance in aws_instance.myec2ins : instance.id => instance.public_dns
  }
}

# output - For Loop with map advanced
output "for-output_map2" {
  description = "For loop with map - advanced"
  value = {
    for c, instance in aws_instance.myec2ins : c => instance.public_dns
  }
}


# Output for Legacy Splat Operator (Legacy) - returns a List

output "legacy_splat_instance_publicdns" {
  description = "Legacy splat operator"
  value       = aws_instance.myec2ins.*.public_dns
}

# Output for Latest generalized Splat Operator (Legacy) - returns a List

output "latest_legacy_splat_instance_publicdns" {
  description = "Generaliszed lates splat operator"
  value       = aws_instance.myec2ins[*].public_dns
}

# # EC Instance Public IP

# output "instance_publicIP" {
#   description = "EC2 Public IP"
#   value       = aws_instance.myec2ins.public_ip
# }

# #EC Instance Public DNS

# output "instance_publicdns" {
#   description = "EC2 Public IP"
#   value       = aws_instance.myec2ins.public_dns
# }

