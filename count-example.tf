
# Variable to specify the AMI ID for EC2 instances
variable "ami_id" {
  description = "AMI ID used to launch EC2 instances"
  type        = string
  default     = "ami-0abcdef12345748393" # Example AMI ID
}

# Example: Using count to create multiple EC2 instances
resource "aws_instance" "web" {
  count = 3 # Creates 3 EC2 instances using one resource block

  ami           = var.ami_id # Uses the AMI ID defined in the variable
  instance_type = "t3.micro"

  tags = {
    # count.index starts from 0: web-0, web-1, web-2
    Name = "web-${count.index}"
  }
}

# count.index provides the zero-based index of each instance.
# The Name tag uses count.index to give each instance a unique name.
