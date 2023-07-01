terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  backend "s3" {
    bucket         = "devops-directive-tf-state-config"
    key            = "organization-and-modules/web-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

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

variable "db_pass_1" {
  description = "password for database #1 more than 8 characters"
  type        = string
}

variable "db_pass_2" {
  description = "password for database #2 more than 8 characters"
  type        = string
}

module "web_app_1" {
  source = "../web-app-module"

  # Input Variables
  bucket_prefix    = "web-app-1-data"
  domain           = "devopsdeployed.com"
  app_name         = "web-app-1"
  environment_name = "production"
  instance_type    = "t2.micro"
  create_dns_zone  = true
  db_name          = "webapp1db"
  db_user          = "foo"
  db_pass          = var.db_pass_1
}

module "web_app_2" {
  source = "../web-app-module"

  # Input Variables
  bucket_prefix    = "web-app-2-data"
  domain           = "anotherdevopsdeployed.com"
  app_name         = "web-app-2"
  environment_name = "production"
  instance_type    = "t2.micro"
  create_dns_zone  = true
  db_name          = "webapp2db"
  db_user          = "bar"
  db_pass          = var.db_pass_2
}