provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

terraform {
  required_version = ">= 0.12"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "mit-tfstates-state"
    key            = "apps/tfcloud.tfstate"
    dynamodb_table = "mit-tfstates-state-lock"
    encrypt        = true
  }
}

resource "aws_iam_user" "default" {
  name = "tf-cloud-${workspace}"
}
