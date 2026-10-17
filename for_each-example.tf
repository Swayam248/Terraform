# Variable containing the environments for which EC2 instances will be created
variable "environments" {
  type    = set(string)
  default = ["dev", "staging", "prod"]
}

# Example AMI ID (replace with a valid AMI ID for your AWS region)
variable "ami_id" {
  type    = string
  default = "ami-0abcdef1234567890"
}

# Creates one EC2 instance for each environment in the set
resource "aws_instance" "web" {
  for_each      = var.environments
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    # each.key refers to the current environment name
    Name = each.key
  }
}

/*
aws_instance.web["dev"]
aws_instance.web["staging"]
aws_instance.web["prod"]
*/
