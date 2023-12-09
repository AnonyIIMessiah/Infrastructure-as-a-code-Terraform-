# SG for Public Load Balancer


module "rdsdb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "rdsdb_sg"
  description = "Security Group with http open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id
  # Ingress rule and cidr block
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule
  egress_rules = ["all-all"]
  tags         = local.common_tags
  ingress_with_cidr_blocks = [

    {
      from_port   = 3306
      to_port     = 3306
      protocol    = 6
      description = "Service name"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
