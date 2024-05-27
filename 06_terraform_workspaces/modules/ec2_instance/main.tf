# Define EC2 instance

resource "aws_instance" "workspace_test" {
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
  
}