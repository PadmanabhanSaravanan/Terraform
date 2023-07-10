# main.tf

terraform {
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
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

# variables.tf
variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}