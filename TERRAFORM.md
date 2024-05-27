## IMPORTANT INFORMATION

### COMMANDS ###
1. After the code is ready in a new directory, initialize terraform by running:

   ```shell
   terraform init
   ```
2. Check if your code is valid:

   ```shell
   terraform validate
   ```

3. Format your .tf files:

   ```shell
   terraform fmt
   ```

4. To review what will terraform create from your definition files or to dry-run configs:

   ```shell
   terraform plan
   ```

5. To build your infrastructure as shown by `terraform plan` command:

    ```shell
    terraform apply
    ```

6. To destroy your infrastructure that was created using terraform:

   ```shell
   terraform destroy
   ```

7. To read terraform state file:
   
   ```shell
   terraform show
   ```

8. To refresh your .tfstate file as per remote infrastructure:

   ```shell
   terraform refresh
   ```

9. To create a new workspace or environment:

   ```shell
   terraform workspace new dev|stage|prod
   ```

10. To switch to a new workspace
 
   ```shell
   terraform workspace select dev|stage|prod
   ```


### **What is Terraform `.tfstate` file?**
- It is a file where terraform records what resources it has created along with sensitive information about them. So, if you make any changes to an existing infrastructure or run `terraform destroy`, this is what it refers in order to perform necessary and relevant actions.

### **What are Providers?**
- Providers are plugins for Terraform which tells Terraform where (which cloud) the resources needs to be created.

### **What is the significance of `terraform.tfvars` file?
- You can define values for your variables in this file in the key-value format. Terraform will directly overwrite the default values for all the variables in this file with the values mentioned in this file during `terraform apply`. If you give a different name like `dev.tfvars`, then you will have to pass a flag like this: `-var-file=dev.tfvars` during terraform apply.

## **What are output variables in Terraform?**
- If you want to get value for any parameter of the resource created by terraform, you can request for the same by using `output` keyword and defining what you want in output. For eg: If you want terraform to print the public_ip of the instance after it is created so that you don't have to go to UI to get this information, you can create an output variable for the same and terraform will print the value for this once it is done building your infrastructure.