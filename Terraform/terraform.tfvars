instance_type     = "t3.large"
region            = "eu-west-9"
availability_zone = "eu-west-9a"
environment       = "production"
project_name      = "web-application"
vpc_id            = "vpc-0abcd1234efgh5678"
subnet_ids        = ["subnet-0123456789abcdef0", "subnet-0fedcba9876543210"]
ami_id            = "ami-0abcdef1234567890"
key_name          = "my-ssh-key"
tags = {
  Owner       = "devops-team"
  Project     = "web-application"
  Environment = "production"
}