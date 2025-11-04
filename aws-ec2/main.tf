
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  region = var.region 
}

resource "aws_instance" "ec2-server" {
  ami = "ami-02b8269d5e85954ef"
  instance_type = "t2.micro"
  tags = {
    Name="TestServer"
  }
}