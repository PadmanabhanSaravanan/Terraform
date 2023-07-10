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

module "web_app_1" {
  source = "../web_app_module"

  # Input Variables
  instance_type    = "t2.micro"
}