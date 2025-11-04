
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

resource "aws_instance" "my-server" {
  ami = "ami-01760eea5c574eb86"
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2-config.v_size
    volume_type = var.ec2-config.v_type
  }
  tags = merge(var.additional_tags, {
    Name = "my-server"
  })
}

