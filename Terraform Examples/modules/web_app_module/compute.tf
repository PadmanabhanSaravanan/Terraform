resource "aws_instance" "my_ec2_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF
}