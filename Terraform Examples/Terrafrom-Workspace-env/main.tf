terraform {
  backend "s3" {
     bucket         = "terraform-20230710103647038900000001"  #replace with the bucket-name-created
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

module "web_app_1" {
  source = "../modules/web_app_module"

  # Input Variables
  instance_type    = "t2.micro"
}