# Define VPC
resource "aws_vpc" "my-vpc" {
    cidr_block = ""
}

# Define key
resource "aws_key_pair" "deployer" {
  key_name   = ""
  public_key = ""
}

# Define public subnet
resource "aws_subnet" "my-public-subnet" {
    vpc_id = ""
    cidr_block = ""
}

# Define internet gateway
resource "aws_internet_gateway" "my-ig" {
    vpc_id = ""
}

# Define route table
resource "aws_route_table" "my-route-table" {
    vpc_id = ""

    route {
        cidr_block = ""
        gateway_id = ""
    }
}

# Define route table association to associate subnet with route table
resource "aws_route_table_association" "my-route-table-association" {
    subnet_id = ""
    route_table_id = ""
}


resource "aws_security_group" "my-security-group" {
    name = ""
    vpc_id = ""
    ingress {
        description = ""
        from_port = ""
        to_port = ""
        protocol = ""
        cidr_blocks = ""
    }

    ingress {
        description = ""
        from_port = ""
        to_port = ""
        protocol = ""
        cidr_blocks = ""
    }

    egress {
        description = ""
        from_port = ""
        to_port = ""
        protocol = ""
        cidr_blocks = ""
    }
  
}

resource "aws_instance" "my-ec2-instance" {
    ami = ""
    instance_type = ""
    key_name = ""
    subnet_id = ""
    security_groups = ""

    connection {
      type = ""
      user = ""
      private_key = ""
      host = ""
    }
    
    provisioner "file" {
        source = ""
        destination = ""
      
    }

    provisioner "remote-exec" {
        inline = [
            "echo 'Hello from the remote-exec provisioner'",
            "sudo apt update -y", # Update all packages
            "sudo apt-get install -y python3-pip", # Example package installation
            "cd /home/ubuntu",
            "sudo pip3 install flask",
            "sudo nohup python3 app.py"
        ]
      
    }
}