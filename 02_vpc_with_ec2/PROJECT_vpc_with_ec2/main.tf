# Define VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = var.vpc_tag
    }
}

# Define subnet-1 associated with VPC created above
resource "aws_subnet" "sub1" {
      vpc_id = aws_vpc.my_vpc.id
      cidr_block = var.sub1_cidr_block
      availability_zone = var.sub1_az
      map_public_ip_on_launch = var.sub1_public_ip_map
      tags = {
        Name = var.sub_1_tag
      }
}

# Define subnet-2 associated with VPC created above
resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.sub2_cidr_block
    availability_zone = var.sub2_az
    map_public_ip_on_launch = var.sub2_public_ip_map
    tags = {
        Name = var.sub_2_tag
    }
}

# Define Internet Gateway associated with VPC for communication with other networks
resource "aws_internet_gateway" "my_internet_gateway" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = var.igw_tag
    }
}

# Define route table to define where the network traffic should be directed
resource "aws_route_table" "my_rt" {
    vpc_id = aws_vpc.my_vpc.id
     route {
        cidr_block = var.igw_cidr
        gateway_id = aws_internet_gateway.my_internet_gateway.id
     }
     tags = {
        Name = var.route_table_tag
     }
}

# Associate route table with subnet-1
resource "aws_route_table_association" "my-rta1" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.my_rt.id
}

# Associate route table with subnet-2
resource "aws_route_table_association" "my-rta2" {
    subnet_id = aws_subnet.sub2.id
    route_table_id = aws_route_table.my_rt.id
}

# Define security group to limit incoming and outgoing traffic 
resource "aws_security_group" "my-security-group" {
    name = var.sg_name
    vpc_id = aws_vpc.my_vpc.id

    egress {
    from_port        = var.egress_from_to_port
    to_port          = var.egress_from_to_port
    protocol         = var.egress_protocol
    cidr_blocks      = var.egress_cidr_blocks
  }

   ingress {
    description      = var.ingress_http_description
    from_port        = var.ingress_http_to_from_port
    to_port          = var.ingress_http_to_from_port
    protocol         = var.ingress_protocol
    cidr_blocks      = var.ingress_cidr
  }

   ingress {
    description      = var.ingress_ssh_description
    from_port        = var.ingress_ssh_to_from_port
    to_port          = var.ingress_ssh_to_from_port
    protocol         = var.ingress_protocol
    cidr_blocks      = var.ingress_cidr
  }
}

# Define S3 bucket
resource "aws_s3_bucket" "my-s3-bucket" {
    bucket = var.s3_bucket_name
}

# Define bucket ownership
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  rule {
    object_ownership = var.bucket_ownership
  }
}

# Define access to S3
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my-s3-bucket.id

  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets
}
# Define S3 Access Control List
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.my-s3-bucket.id
  acl    = var.s3_acl
}

# Define AWS EC2 instance-1
resource "aws_instance" "my-ec2-instance-1" {
    ami = var.ec2_ami
    instance_type = var.ec2_type
    vpc_security_group_ids = [aws_security_group.my-security-group.id]
    subnet_id = aws_subnet.sub1.id
    user_data = base64encode(file("userdata.sh"))
    key_name = var.ec2_key_pair
}

# Define AWS EC2 instance-2
resource "aws_instance" "my-ec2-instance-2" {
    ami = var.ec2_ami
    instance_type = var.ec2_type
    vpc_security_group_ids = [aws_security_group.my-security-group.id]
    subnet_id = aws_subnet.sub2.id
    user_data = base64encode(file("userdata1.sh"))
    key_name = var.ec2_key_pair
}

# Define Load Balancer
resource "aws_lb" "my-alb" {
    name = var.alb_name
    internal           = var.alb_internal
    load_balancer_type = var.alb_type
    security_groups    = [aws_security_group.my-security-group.id]
    subnets            = [aws_subnet.sub1.id, aws_subnet.sub2.id]
    tags = {
        Name = "web"
    }
}

# Define Load Balancer Target Group
resource "aws_lb_target_group" "my-alb-target-group" {
    name = var.aws_lb_tg_name
    vpc_id = aws_vpc.my_vpc.id
    port = var.tg_port
    protocol = var.tg_protocol

    health_check {
      path = var.tg_health_check_path
      protocol = var.tg_health_protocol
    }
}

# Adding instance-1 to load balancer targets
resource "aws_lb_target_group_attachment" "my-lb-target-group-attachment1" {
  target_group_arn = aws_lb_target_group.my-alb-target-group.arn
  target_id = aws_instance.my-ec2-instance-1.id
  port = var.tg_attachment_port
}

# Adding instance-2 to load balancer targets
resource "aws_lb_target_group_attachment" "my-lb-target-group-attachment2" {
  target_group_arn = aws_lb_target_group.my-alb-target-group.arn
  target_id = aws_instance.my-ec2-instance-2.id
  port = var.tg_attachment_port
}

# Attach target group and load balancer
resource "aws_lb_listener" "my-lb-listener" {
  load_balancer_arn = aws_lb.my-alb.arn
  port = var.lb_listener_port
  protocol = var.lb_listener_protocol
  default_action {
    type = var.lb_listener_default_type
    target_group_arn = aws_lb_target_group.my-alb-target-group.arn
  }
  
}
