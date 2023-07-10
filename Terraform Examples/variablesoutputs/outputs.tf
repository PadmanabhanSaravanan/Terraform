output "instance_ip_addr" {
  value = aws_instance.my_ec2_instance.public_ip
}