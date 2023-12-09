
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

# AWS EC2 Private key-pair
variable "instance_keypair" {
  description = "AWS key-pair that need to be associated with EC2"
  type        = string
  default     = "terraform-key"
}

# AWS EC2 Private Instance Count
variable "private_instance_count" {
  description = "AWS EC2 Private Instance Count"
  type        = number
  default     = 1
}
