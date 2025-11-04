terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

data "aws_security_group" "name" {
  tags = {
    mywebserver = "http"
  }
}

data "aws_vpc" "name" {
  tags = {
    Name = "my_vpc"
  }
}

data "aws_ami" "name" {
  most_recent      = true
  owners           = ["amazon"]
}

data "aws_availability_zones" "name" {
  state = "available"
}

data "aws_subnet" "name" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.name.id]
  }
  tags = {
    Name = "my_private_subnet"
  }
}

resource "aws_instance" "datasource_server" {
  ami = data.aws_ami.name.id
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.name.id
  security_groups = [data.aws_security_group.name.id]
}