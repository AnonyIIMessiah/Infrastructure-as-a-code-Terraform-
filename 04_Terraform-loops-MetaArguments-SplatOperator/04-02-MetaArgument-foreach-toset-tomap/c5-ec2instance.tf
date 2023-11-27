# Availability Zones Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


# Resource: EC2 Instance
resource "aws_instance" "myec2ins" {
  ami           = data.aws_ami.amzLinux2.id
  instance_type = var.instance_type
  # instance_type = var.instance_type_list[0] #for list
  # instance_type = var.instance_type_map["dev"]
  user_data = file("${path.module}/app1-install.sh")
  key_name  = var.instance_keypair

  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]
  # Create EC2 Instance in all Availability Zones of a VPC
  for_each          = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key # You can also use each.value because for list items each.key == each.value
  tags = {
    "Name" = "for_each-Demo-${each.value}"
  }
}


/*
# Drawbacks of using count in this example
- Resource Instances in this case were identified using index numbers 
instead of string values like actual subnet_id
- If an element was removed from the middle of the list, 
every instance after that element would see its subnet_id value 
change, resulting in more remote object changes than intended. 
- Even the subnet_ids should be pre-defined or we need to get them again 
using for_each or for using various datasources
- Using for_each gives the same flexibility without the extra churn.
*/


