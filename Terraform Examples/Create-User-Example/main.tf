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
  profile = "default"
}

# Create an User profile

resource "aws_iam_user" "user" {
  name = var.aws_user_name
}

# Attach the IAM policy to the user
resource "aws_iam_policy_attachment" "attach_user" {
  name       = "aws_iam_policy_attachment"
  users      = [aws_iam_user.user.name]
  policy_arn = var.user_policy
}