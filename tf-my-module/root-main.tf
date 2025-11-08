provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./module/vpc"
  vpc-config = {
    cidr_block = "10.0.0.0/16"
    name = "my-vpc"
  }
  subnet-config = {
    "public-subnet" = {
        cidr_block = "10.0.0.0/24"
        az = "ap-south-1a"
        public = public
    }
    "private-subnet" ={
        cidr_block = "10.0.1.0/24"
        az = "ap-south-1b"
    }
  }
}

