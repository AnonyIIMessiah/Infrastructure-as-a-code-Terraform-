# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}

## ec2_bastion_public_ip
output "ec2_bastion_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_public.public_ip
}

# # Private EC2 Instances
# # Private EC2 Instances
# output "app1_ec2_private_instance_ids" {
#   description = "List of IDs of instances"
#   value       = [for ec2private in module.ec2_private_app1 : ec2private.id]
# }
# output "app1_ec2_private_ip" {
#   description = "List of private ip address assigned to the instances"
#   value       = [for ec2private in module.ec2_private_app1 : ec2private.private_ip]
# }

# # Private EC2 Instances
# output "app2_ec2_private_instance_ids" {
#   description = "List of IDs of instances"
#   value       = [for ec2private in module.ec2_private_app2 : ec2private.id]
# }
# output "app2_ec2_private_ip" {
#   description = "List of private ip address assigned to the instances"
#   value       = [for ec2private in module.ec2_private_app2 : ec2private.private_ip]
# }
