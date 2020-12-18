terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "example" {
  count			= 1
  ami           = "ami-0a91cd140a1fc148a"
  instance_type = "t2.micro"
  key_name		= "first_server"
  vpc_security_group_ids = ["sg-078c231d65f3a10c0"]
  tags = {
    Name = "Ubuntu Server ${count.index}"
  }
}