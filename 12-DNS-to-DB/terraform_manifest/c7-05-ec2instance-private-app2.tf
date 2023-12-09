## AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet

module "ec2_private_app2" {
  depends_on = [
    module.vpc
  ]
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "~> 5.5.0"
  for_each      = toset(["0", "1"])
  name          = "${var.environment}-app2"
  ami           = data.aws_ami.amzLinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #   monitoring             = true
  vpc_security_group_ids = [module.private_bastion_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, var.private_instance_count)

  user_data = file("${path.module}/app2-install.sh")
  tags      = local.common_tags
}

# Meta arguments depends on
