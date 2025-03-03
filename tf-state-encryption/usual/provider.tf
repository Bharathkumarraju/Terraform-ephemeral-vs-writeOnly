terraform {
  required_version = "= 1.10.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.85.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
