# Create EC2 instance

resource "aws_instance" "my-ec2-module" {
    ami = var.ami_value
    instance_type = var.instance_type_value
}