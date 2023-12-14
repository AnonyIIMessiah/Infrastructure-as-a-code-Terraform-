# Public SG
output "public_bastion_sg_group_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_sg.security_group_id
}

output "public_bastion_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_sg.security_group_vpc_id
}

output "public_bastion_sg_group_name" {
  description = "The name of the security group"
  value       = module.public_bastion_sg.security_group_name
}

# Private SG

output "private_sg_group_id" {
  description = "The ID of the security group"
  value       = module.private_bastion_sg.security_group_id
}

output "sprivate_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_bastion_sg.security_group_vpc_id
}

output "private_sg_group_name" {
  description = "The name of the security group"
  value       = module.private_bastion_sg.security_group_name
}
