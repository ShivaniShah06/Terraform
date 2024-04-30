resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = var.vpc_tag
    }
}

resource "aws_subnet" "sub1" {
      vpc_id = aws_vpc.my_vpc.id
      cidr_block = var.sub1_cidr_block
      availability_zone = var.sub1_az
      map_public_ip_on_launch = var.sub1_public_ip_map
      tags = {
        Name = var.sub_1_tag
      }
}

resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.sub2_cidr_block
    availability_zone = var.sub2_az
    map_public_ip_on_launch = var.sub2_public_ip_map
    tags = {
        Name = var.sub_2_tag
    }
}

resource "aws_internet_gateway" "my_internet_gateway" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = var.igw_tag
    }
}

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

resource "aws_route_table_association" "my-rta1" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.my_rt.id
}

resource "aws_route_table_association" "my-rta2" {
    subnet_id = aws_subnet.sub2.id
    route_table_id = aws_route_table.my_rt.id
}

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

resource "aws_s3_bucket" "my-s3-bucket" {
    bucket = "shivani-s3-test-04-29-24"
}



