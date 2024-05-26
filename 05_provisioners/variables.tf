# Defining variables
variable "aws_region" {
  description = "Value for AWS region"
}

variable "vpc_cidr" {
  description = "Value for VPC CIDR block"
}

variable "aws_key_name" {
   description = "Value for AWS key name"
}

variable "aws_public_key_location" {
    description = "Value for the public key location with name"
}

variable "subnet_cidr" {
    description = "Value for CIDR for public subnet"
}

variable "rt_cidr" {
     description = "Value for Route Table CIDR"
}

variable "sg_name" {
      description = "Value for Security Group name"
}

variable "ingress_description" {
      description = "Value for Ingress description"
}