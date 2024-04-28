terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}

# Create an ec2 instance - make sure to fetch the AMI id from the correct region
resource "aws_instance" "my-ec2-instance" {
  ami                     = "ami-0827b6c5b977c020e"
  instance_type           = "t2.micro"
  key_name                = "dev-keypair"
  
  tags = {
    Name = "test-1"
  }
}