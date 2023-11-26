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
