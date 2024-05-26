# # Define backend to store the terraform.tfvars to maintain privacy and for security
# # This block also defines dynamodb table to be used for implementing the locking mechanism

# ##############################################################################################################
#  By using backend, you can securely store your Terraform state in S3 with state locking using DynamoDB,      # 
#  mitigating the disadvantages of storing sensitive information in version control systems and ensuring safe  #
#  concurrent access to your infrastructure                                                                    #
# ##############################################################################################################

# # Check README of this folder to see how it looks on AWS S3 UI

terraform {
  backend "s3" {
    bucket = "remote-backend-tf-test"
    key    = "remote-backend-shivani/terraform.tfstate"
    region = "us-west-1"
  }
}
