resource "aws_s3_bucket" "example" {
  bucket = "martin-cicd-bucket"

  tags = {
    Name        = "My CICD bucket"
    Environment = "Dev"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "martin-cicd-state-bucket"
    region = "us-east-1"
    key    = "martincicd.tfstate"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
