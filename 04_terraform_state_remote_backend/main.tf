# Create EC2 instance
resource "aws_instance" "my_ec2_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  tags = {
    Name = var.ec2_tag
  }
}

resource "aws_instance" "my_ec2_instance2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  tags = {
    Name = var.ec2_tag2
  }
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_dynamodb_table" "my-dynamodb-table" {
  name         = var.dynamodb_name
  hash_key     = var.dynamodb_hashkey
  billing_mode = var.dynamodb_billing_mode

  attribute {
    name = var.dynamodb_hashkey
    type = var.dynamodb_hashkey_type
  }
}