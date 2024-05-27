variable "aws_region" {
  default = "us-west-1"
}

variable "auth_login_path" {
  default = "auth/approle/login"

}

variable "skip_child_token" {
  default = true
}

variable "login_approle_role_id" {
  default = "a6eb7942-e087-671b-5ca7-c8a1de693201"
}

variable "login_approle_secret_id" {
  default = "bdcb476e-9b37-412f-797e-531b2df41700"
}

variable "instance_address" {
  default = "http://13.57.25.88:8200"
}

variable "mount" {
  default = "kv"
}

variable "kv_secret_name" {
  default = "test-secret"
}

variable "ec2_ami" {
  default = "ami-08012c0a9ee8e21c4"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}