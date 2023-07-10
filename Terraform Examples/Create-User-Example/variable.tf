variable "aws_user_name"{
    default     = "terraform_user_1"
    description = "enter the name"
    type        = string
}

variable "user_policy"{
  description   = "ARN of policy to be associated with the created IAM user"
  type          = string
  default       = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}