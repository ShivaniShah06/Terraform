# Define variables again to be able to generate terraform.tfvars

variable "ami_value" {
  description = "The value for defining EC2 OS image"
}

variable "instance_type_value" {
  description = "The value for EC2 instance type"
}