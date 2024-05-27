data "vault_kv_secret_v2" "my_vault_kv_secret" {
  mount = var.mount
  name  = var.kv_secret_name
}

resource "aws_instance" "vault_test" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  tags = {
    name = data.vault_kv_secret_v2.my_vault_kv_secret.data["username"] # For this case, I have saved username = shivani as my secret key and value on vault and I want `shivani` as the tag value for name key on my instance
  }
}