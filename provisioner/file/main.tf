terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_vm" {
    ami           = var.ami //Amazon Linux AMI
    instance_type = var.instance_type
    key_name = "aws_key"
    vpc_security_group_ids = ["${aws_security_group.webSG.id}"]
 
    provisioner "file" {
        source      = "letsdotech.txt"
        destination = "/home/ubuntu/letsdotech.txt"
        }

    connection {
        type        = "ssh"
        host        = self.public_ip
        user        = "ubuntu"
        private_key = file("aws_key.pem")
        timeout     = "4m"
        }
}

resource "aws_security_group" "webSG" {
  name        = "webSG"
  description = "Allow ssh  inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
}
