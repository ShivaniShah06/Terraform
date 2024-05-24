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

variable "s3_bucket_name" {
    default = "shivani-s3-test-04-29-24"
}

variable "bucket_ownership" {
    default = "BucketOwnerPreferred"
}

variable "s3_block_public_acls" {
    default = false
}

variable "s3_block_public_policy" {
    default = false
}

variable "s3_ignore_public_acls" {
    default = false
}

variable "s3_restrict_public_buckets" {
    default = false
}

variable "s3_acl" {
    default = "public-read"
}

variable "ec2_ami" {
    default = "ami-049f0d9414f242b2d"
}

variable "ec2_type" {
    default = "t2.micro"
}

variable "ec2_key_pair" {
    default = "dev-keypair"
  
}

variable "alb_name" {
    default = "my-alb"
}

variable "alb_internal" {
    default = false
}

variable "alb_type" {
    default = "application"
}

variable "aws_lb_tg_name" {
    default = "my-lb-target-group"
}

variable "tg_port" {
    default = 80
}

variable "tg_protocol" {
    default = "HTTP"
}

variable "tg_health_check_path" {
    default = "/"
}

variable "tg_health_protocol" {
    default = "HTTP"
}

variable "tg_attachment_port" {
    default = "80"
}

variable "lb_listener_default_type" {
    default = "forward"
  
}

variable "lb_listener_port" {
    default = "80"
  
}

variable "lb_listener_protocol" {
    default = "HTTP"
  
}

output "loadbalancerdns" {
    value = aws_lb.my-alb.dns_name
}