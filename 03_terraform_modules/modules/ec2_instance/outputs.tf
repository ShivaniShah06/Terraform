# Define output to be shown after the resource has been created

output "instance_public_ip" {
    value = aws_instance.my-ec2-module.public_ip
}