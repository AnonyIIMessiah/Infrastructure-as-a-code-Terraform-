# AWS EC2 Security Group Terraform Module
# SG for Public Bastion Host

module "private_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "private_bastion_sg"
  description = "Security Group with http and SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id
  # Ingress rule and cidr block
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  # Egress Rule
  egress_rules = ["all-all"]
  tags         = local.common_tags
}
