terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
  backend "s3" {
    bucket = "monkweb-5m0cpelnd8"
    key = "backend-statetf"
    region = "ap-south-1"
  }
}
