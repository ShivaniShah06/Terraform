# Terraform
Learning Terraform for Infrastructure as Code


### COMMANDS ###
1. After the code is ready in a new directory, initialize terraform by running:

   ```shell
   terraform init
   ```

2. To review what will terraform create from your definition files or to dry-run configs:

   ```shell
   terraform plan
   ```

3. To build your infrastructure as shown by `terraform plan` command:
   
    ```shell
    terraform apply
    ```

4. To destroy your infrastructure that was created using terraform:

   ```shell
   terraform destroy
   ```

### **What is Terraform `.tfstate` file?**
- It is a file where terraform records what resources it has created along with sensitive information about them. So, if you make any changes to an existing infrastructure or run `terraform destroy`, this is what it refers in order to perform necessary and relevant actions.