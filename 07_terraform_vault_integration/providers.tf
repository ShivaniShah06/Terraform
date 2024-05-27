provider "aws" {
  region = var.aws_region
}

provider "vault" {
  address          = var.instance_address
  skip_child_token = var.skip_child_token

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.login_approle_role_id
      secret_id = var.login_approle_secret_id
    }
  }

}