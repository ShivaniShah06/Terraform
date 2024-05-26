# Defining variables

variable "aws_region" {
  description = "Value for AWS region"
}

variable "ec2_ami" {
  description = "Value of EC2 instance AMI"
}

variable "ec2_type" {
  description = "Value of EC2 instance type"
}

variable "ec2_tag" {
  description = "Value for the name of the EC2 instance on console"
}

variable "ec2_tag2" {
  description = "Value for the name of the EC2 instance on console"
}

variable "s3_bucket_name" {
  description = "Value for name of the S3 bucket"
}

variable "dynamodb_name" {
  description = "Value for tha dynamodb table name"
}

variable "dynamodb_hashkey" {
  description = "Value for dynamodb table hashkey"
}

variable "dynamodb_billing_mode" {
  description = "Value for dynamodb billing mode"
}

variable "dynamodb_hashkey_type" {
  description = "Value for dynamodb hashkey type"
}