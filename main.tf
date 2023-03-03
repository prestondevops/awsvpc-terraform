provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web2" {
  ami = "ami-006dcf34c09e50022" 
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver1"
  }
  
}
resource "aws_instance" "web3" {
  ami = "ami-006dcf34c09e50022" 
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver2"
  }
  
}
resource "aws_instance" "web3" {
  ami = "ami-006dcf34c09e50022" 
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver3"
  }
  
}
