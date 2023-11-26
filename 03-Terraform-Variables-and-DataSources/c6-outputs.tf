# terraform o/p values



# EC Instance Public IP

output "instance_publicIP" {
  description = "EC2 Public IP"
  value       = aws_instance.myec2ins.public_ip
}

#EC Instance Public DNS

output "instance_publicdns" {
  description = "EC2 Public IP"
  value       = aws_instance.myec2ins.public_dns
}
