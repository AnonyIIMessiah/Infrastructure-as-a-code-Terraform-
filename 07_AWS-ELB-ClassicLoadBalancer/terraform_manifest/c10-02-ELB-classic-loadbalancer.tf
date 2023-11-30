# Terraform AWS Classic Load Balancer

module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.1"

  name = "${local.name}-myelb"

  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]
  security_groups = [module.loadbalancer_sg.security_group_id]
  #   internal        = false

  listener = [
    {
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 80
      lb_protocol       = "http"
    },
    {
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 81
      lb_protocol       = "http"
      #            Note about SSL:
      #            This line is commented out because ACM certificate has to be "Active" (validated and verified by AWS, but Route53 zone used in this example is not real).
      #            To enable SSL in ELB: uncomment this line, set "wait_for_validation = true" in ACM module and make sure that instance_protocol and lb_protocol are https or ssl.
      #            ssl_certificate_id = module.acm.acm_certificate_arn

    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  #   access_logs = {
  #     bucket = "my-access-logs-bucket"
  #   }

  // ELB attachments
  number_of_instances = var.private_instance_count
  instances = [
    for ec2private in module.ec2_private : ec2private.id
  ]


  tags = local.common_tags
}
