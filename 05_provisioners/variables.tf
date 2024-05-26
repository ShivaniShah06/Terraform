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

variable "ingress1_description" {
  description = "Value for Ingress1 description"
}

variable "ingress1_from_port" {
  description = "Value for Ingress1 from port"
}

variable "ingress1_to_port" {
  description = "Value for Ingress1 to port"

}

variable "ingress1_protocol" {
  description = "Value for Ingress1 protocol"

}

variable "ingress1_cidr" {
  description = "Value for Ingress1 CIDR"
}

variable "ingress2_description" {
  description = "Value for Ingress2 description"
}

variable "ingress2_from_port" {
  description = "Value for Ingress2 from port"
}

variable "ingress2_to_port" {
  description = "Value for Ingress2 to port"

}

variable "ingress2_protocol" {
  description = "Value for Ingress2 protocol"

}

variable "ingress2_cidr" {
  description = "Value for Ingress2 CIDR"
}

variable "egress_description" {
  description = "Value for Egress description"
}

variable "egress_from_port" {
  description = "Value for Egress from port"
}

variable "egress_to_port" {
  description = "Value for Egress to port"

}

variable "egress_protocol" {
  description = "Value for Egress protocol"

}

variable "egress_cidr" {
  description = "Value for Egress CIDR"
}

variable "ec2_ami" {
  description = "Value for EC2 AMI"
}

variable "ec2_instance_type" {
  description = "Value for EC2 instance type"
}

variable "key_name" {
  description = "Value for the name of the public key to be used for EC2 connection"
}

variable "ec2_provisioner_connection_type" {
  description = "Value for the type of connection to the EC2 instance"

}

variable "ec2_provisioner_user" {
  description = "Value for the user used for EC2 connection"
}

variable "ec2_provisioner_private_key" {
  description = "Value for the private key used for EC2 connection"
}

variable "ec2_provisioner_host" {
  description = "Value for the EC2 host to be used for connection"

}

variable "provisioner_file_source" {
  description = "Value for the Provisioner file source"
}

variable "provisioner_file_destination" {
  description = "Value for the Provisioner file destination"
}