terraform {
  backend "remote" {
    organization = "gravesmj"
    workspaces {
      prefix = "mgraves-"
    }
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_iam_user" "default" {
  name = "tf-cloud-test-${var.workspace}"
  tags = {
    foo = "bar"
  }
}
