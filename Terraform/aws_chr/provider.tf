terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "eu-west-1-tfstate-bucket"
    dynamodb_table = "eu-west-1-tfstate-lock"
    key            = "aws_tf_state/aws_chr.tfstate"
    region         = "eu-west-1"
    encrypt        = "true"
  }
}

provider "aws" {
  region  = var.aws_region
}