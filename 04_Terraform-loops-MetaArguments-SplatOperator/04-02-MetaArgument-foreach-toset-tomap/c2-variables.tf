#Input variables
#aws region
variable "aws_region" {
  description = "Region in which aws resources to be created"
  type        = string
  default     = "us-east-1"
}

#default EC Instance type
variable "instance_type" {
  description = "Ec2 Instance type"
  type        = string
  default     = "t2.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "instance_keypair"
  type        = string
  default     = "terraform-key"
}

# AWS EC Instance Type - List
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type        = list(string)
  default     = ["t2.micro", "t3.small"]
}


# AWS EC2 Instance Type - Map 
variable "instance_type_map" {
  description = "Ec2 instance type"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}
