terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "monkweb-${random_string.rand-str.id}"
}

resource "random_string" "rand-str" {
  length = 10
  special = false
  upper = false
}

resource "aws_s3_object" "bucket-object-data" {
    bucket = aws_s3_bucket.my-bucket.bucket
    source = "./myfile.txt"
    key ="mydata.txt"

}