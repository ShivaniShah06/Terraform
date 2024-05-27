variable "aws_region" {
  description = "Value for defining AWS region"
}

variable "ec2_ami" {
  description = "Value for EC2 AMI"
}

variable "ec2_instance_type" {
  description = "Value for EC2 instance type"
  type        = map(string) # The value gets mapped to one of the values available in default block as per the logic written 
  #for this value in main.tf file

  default = {
    "dev"   = "t2.micro",
    "stage" = "t2.nano"
  }
}