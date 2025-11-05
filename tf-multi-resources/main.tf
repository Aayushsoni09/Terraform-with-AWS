
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" 
}

locals {
  project = "project-01"
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}

resource "aws_subnet" "my-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count =2
   tags = {
    Name = "${local.project}-subnet-${count.index}"
  }
}

#creating 4 ec2 instance 2 in one subnet and other 2 in other subnets
# resource "aws_instance" "my-server" {
#   ami = "ami-02b8269d5e85954ef"
#   instance_type = "t2.micro"
#   subnet_id = element(aws_subnet.my-subnet[*].id,count.index % length(aws_subnet.my-subnet))
#   count = 4
#   tags = {
#     Name="${local.project}-instance-${count.index}"
#   }
# }

#creating ec2 having difference operating systems

# resource "aws_instance" "my-server" {
#   count = length(var.ec2-config)
#   ami = var.ec2-config[count.index].ami
#   instance_type = var.ec2-config[count.index].instance_type
#   subnet_id = element(aws_subnet.my-subnet[*].id,count.index % length(aws_subnet.my-subnet))
#   tags = {
#     Name="${local.project}-instance-${count.index}"
#   }
# }

#using map and forEach to achieve the same

resource "aws_instance" "my-server" {
  for_each = var.ec2-map
  ami = each.value.ami
  instance_type = each.value.instance_type
  subnet_id = element(aws_subnet.my-subnet[*].id, index(keys(var.ec2-map), each.key) % length(aws_subnet.my-subnet))
  tags = {
    Name="${local.project}-instance-${each.key}"
  }
}