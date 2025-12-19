output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "instance_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.web.private_ip
}