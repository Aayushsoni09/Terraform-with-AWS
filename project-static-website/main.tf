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



resource "aws_s3_bucket_public_access_block" "bucket-access" {
  bucket = aws_s3_bucket.my-bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "my-policy" {
  bucket = aws_s3_bucket.my-bucket.bucket
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "arn:aws:s3:::${aws_s3_bucket.my-bucket.bucket}/*"
        }
      ]
    }
  )
}

resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.my-bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.my-bucket.bucket
    source = "./index.html"
    key ="index.html"
    content_type = "text/html"

}
resource "aws_s3_object" "styles" {
    bucket = aws_s3_bucket.my-bucket.bucket
    source = "./style.css"
    key ="style.css"
    content_type = "text/html"

}

output "name" {
  value = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
}