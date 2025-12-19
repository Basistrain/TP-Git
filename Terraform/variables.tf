variable "instance_type" {
  type        = string
  description = "EC2 instance type for the web server"
  default     = "t2.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the web server will be deployed"
}
variable "region" {
  type        = string
  description = "AWS region for resource deployment"
  default     = "eu-west-9"
}


