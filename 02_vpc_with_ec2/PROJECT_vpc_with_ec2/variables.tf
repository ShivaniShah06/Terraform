variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_tag" {
  default = "my-vpc"
}

variable "sub1_cidr_block" {
    default = "10.0.0.0/24"
}

variable "sub1_az" {
    default = "us-west-1a"
}

variable "sub1_public_ip_map" {
    default = true
}

variable "sub_1_tag" {
    default = "subnet-1"
}

variable "sub2_cidr_block" {
    default = "10.0.0.1/24"
}

variable "sub2_az" {
    default = "us-west-1b"
}

variable "sub2_public_ip_map" {
    default = true
}

variable "sub_2_tag" {
    default = "subnet-2"
}

variable "igw_cidr" {
    default = "0.0.0.0/0"
}

variable "igw_tag" {
    default = "my-igw"
}

variable "route_table_tag" {
    default = "my-route-table"
}

variable "sg_name" {
    default = "my-sg"
}

variable "egress_from_to_port" {
    default = 0
}

variable "egress_protocol" {
    default = "-1" 
}

variable "egress_cidr_blocks" {
    default = ["0.0.0.0/0"]
}

variable "ingress_http_description" {
    default = "HTTP from VPC"
}

variable "ingress_http_to_from_port" {
    default = "80"
}

variable "ingress_protocol" {
    default = "tcp"
}

variable "ingress_cidr" {
    default = ["0.0.0.0/0"]
}

variable "ingress_ssh_description" {
    default = "SSH"
} 

variable "ingress_ssh_to_from_port" {
    default = "22"
}