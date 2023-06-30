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
 
    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> private_ip.txt"
    }

}