terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-90batch" # The name of your existing S3 bucket
    key            = "roboshop-bastion.tfstate"             # The path and filename inside the bucket
    region         = "us-east-1"                         # The region where the bucket lives
    encrypt        = true                                # Encrypts the state file at rest
    use_lockfile   = true # Enables native S3 state locking (Terraform 1.10+)
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}