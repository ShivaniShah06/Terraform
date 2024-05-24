# Using predefined module for ec2 creation

module "ec2_module" {
  source              = "./modules/ec2_instance"
  ami_value           = var.ami_value
  instance_type_value = var.instance_type_value
}