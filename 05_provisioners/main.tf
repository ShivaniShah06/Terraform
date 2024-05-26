# Define VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr
}

# Define key
resource "aws_key_pair" "deployer" {
  key_name   = var.aws_key_name
  public_key = var.aws_public_key_location
}

# Define public subnet
resource "aws_subnet" "my-public-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.subnet_cidr
}

# Define internet gateway
resource "aws_internet_gateway" "my-ig" {
  vpc_id = aws_vpc.my-vpc.id
}

# Define route table
resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = var.rt_cidr
    gateway_id = aws_internet_gateway.my-ig.id
  }
}

# Define route table association to associate subnet with route table
resource "aws_route_table_association" "my-route-table-association" {
  subnet_id      = aws_subnet.my-public-subnet.id
  route_table_id = aws_route_table.my-route-table.id
}


resource "aws_security_group" "my-security-group" {
  name   = var.sg_name
  vpc_id = aws_vpc.my-vpc.id
  ingress {
    description = var.ingress1_description
    from_port   = var.ingress1_from_port
    to_port     = var.ingress1_to_port
    protocol    = var.ingress1_protocol
    cidr_blocks = var.ingress1_cidr
  }

  ingress {
    description = var.ingress2_description
    from_port   = var.ingress2_from_port
    to_port     = var.ingress2_to_port
    protocol    = var.ingress2_protocol
    cidr_blocks = var.ingress2_cidr
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr
  }

}

resource "aws_instance" "my-ec2-instance" {
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  key_name        = ""
  subnet_id       = ""
  security_groups = ""

  connection {
    type        = ""
    user        = ""
    private_key = ""
    host        = ""
  }

  provisioner "file" {
    source      = ""
    destination = ""

  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote-exec provisioner'",
      "sudo apt update -y",                  # Update all packages
      "sudo apt-get install -y python3-pip", # Example package installation
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo nohup python3 app.py"
    ]

  }
}