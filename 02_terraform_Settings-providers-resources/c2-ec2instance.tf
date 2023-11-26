# Resource: EC2 Instance
resource "aws_instance" "myec2ins" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t3.micro"
  user_data     = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2-demo"
  }
}
