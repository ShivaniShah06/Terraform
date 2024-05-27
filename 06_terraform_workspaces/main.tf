# Use module to define ec2 resource

module "workspace_test" {
  source  = "./modules/ec2_instance"
  ec2_ami = var.ec2_ami
  # terraform.workspaces variable is a default variable available in terraform which will be set to the current workspace and will compare values available in map function 
  # in variables.tf. If value is matched, it will select the instance type value available for that value else it uses the default value

  # lookup will look up the value `stage` or `dev` as per the workspace value in variable called `ec2_instance_type`
  ec2_instance_type = lookup(var.ec2_instance_type, terraform.workspace, "t2.micro")
  aws_region        = var.aws_region
}