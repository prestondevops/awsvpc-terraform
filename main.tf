terraform {
  cloud {
    organization = "preston"
    workspaces {
      name = "awsvpc-terraform"
    }
  }
}
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web2" {
  ami = "ami-006dcf34c09e50022" 
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver2"
  }
  
}
