terraform {
   backend "s3" {
     bucket         = "terraform-20230710065939920900000001"  #replace with the bucket-name-created
     key            = "terraform.tfstate" 
     region         = "us-east-1"
     dynamodb_table = "terraform-state-locking"  #replace with your dynamotable name
     encrypt        = true
   }

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

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}