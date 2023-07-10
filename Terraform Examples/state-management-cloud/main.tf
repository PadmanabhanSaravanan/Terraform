terraform {
  cloud {
    organization = "padmanabhan1"

    workspaces {
      name = "my-terraform"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "<your-access-key>"
  secret_key = "<tour-secret-key>"
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
