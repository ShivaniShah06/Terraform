## HOW TO MIGRATE AN EXISTING INFRASTRUCTURE FROM AWS TO TERRAFORM?
**Assuming that you have an EC2 instance which was created manually on AWS and you want to now manage it using Terraform**

1. Write a `main.tf` file with the aws provider block and region where your instance reside
2. Run `terraform plan -generate-config-out=="<name.tf>"` to fetch all the details of the existing infrastructure and generate a file with the code of all the configs
3. Now copy the entire content from this config file, delete the config file (so that terraform doesn't throw error of duplicate resources later), remove the import block from the main.tf file, and replace it with the copied content
4. Now run `terraform import <aws_resource>.<resource_name> <resource_id>`