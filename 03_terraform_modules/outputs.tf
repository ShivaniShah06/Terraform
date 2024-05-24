# Get output from module's output

output "public_ip_from_module" {
    value = module.ec2_module.instance_public_ip
}