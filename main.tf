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
resource "aws_instance" "web4" {
  ami = "ami-006dcf34c09e50022" 
  instance_type = var.webInstanceType
  tags = {
    "Name" = "webserver3"
  }
  
}
variable "webInstanceType"{}

output "web1IP" {
  value = aws_instance.web2.public_ip
  
}
output "web2IP" {
  value = aws_instance.web3.public_ip
  
}
output "web3IP" {
  value = aws_instance.web4.public_ip
  
  region = var.aws_region
}
resource "aws_vpc" "TerraVpc" {
  cidr_block = var.TerraVpc_cidr
  tags = {
    "Name" = "TestTerraVpc"
  }
}
resource "aws_subnet" "Public_Subnet_1" {
  vpc_id = aws_vpc.TerraVpc.id
  cidr_block = var.Public_Subnet_1_cidr
  tags = {
    "Name" = "TerraPublic_1"
  }
  availability_zone = var.availability_zone_TerraVpc[0]
}
resource "aws_subnet" "Public_Subnet_2" {
  vpc_id = aws_vpc.TerraVpc.id
  cidr_block = var.Public_Subnet_2_cidr
  tags = {
    "Name" = "TerraPublic_2"
  }
  availability_zone = var.availability_zone_TerraVpc[1]
}
resource "aws_subnet" "Private_Subnet_1" {
  vpc_id = aws_vpc.TerraVpc.id
  cidr_block = var.Private_Subnet_1_cidr
  tags = {
    "Name" = "TerraPrivate_1"
  }
  availability_zone = var.availability_zone_TerraVpc[0]
}
resource "aws_subnet" "Private_Subnet_2" {
  vpc_id = aws_vpc.TerraVpc.id
  cidr_block = var.Private_Subnet_2_cidr
  tags = {
    "Name" = "TerraPrivate_2"
  }
  availability_zone = var.availability_zone_TerraVpc[1]
}
resource "aws_internet_gateway" "TerraIgw" {
  vpc_id = aws_vpc.TerraVpc.id
  tags = {
    "Name" = "TerraVpcIgw"
  }
}
resource "aws_eip" "TerraEIP" {
  vpc = true
}
resource "aws_nat_gateway" "TerraNatGW" {
  allocation_id = aws_eip.TerraEIP.id
  subnet_id = aws_subnet.Public_Subnet_1.id
  tags = {
    "Name" = "TerraVpcNatGW"
  }
}
resource "aws_route_table" "TerraPublicRouteTable" {
  tags = {
    "Name" = "TerraVpcPublicRouteTable"
  }
  vpc_id = aws_vpc.TerraVpc.id
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.TerraIgw.id
  }

}
resource "aws_route_table" "TerraPrivateRouteTable" {
  tags = {
    "Name" = "TerraVpcPrivateRouteTable"
  }
  vpc_id = aws_vpc.TerraVpc.id
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.TerraNatGW.id
  }
}
resource "aws_route_table_association" "Public_association_1" {
  subnet_id = aws_subnet.Public_Subnet_1.id
  route_table_id = aws_route_table.TerraPublicRouteTable.id
}
resource "aws_route_table_association" "Public_association_2" {
  subnet_id = aws_subnet.Public_Subnet_2.id
  route_table_id = aws_route_table.TerraPublicRouteTable.id
}
resource "aws_route_table_association" "Private_association_1" {
  subnet_id = aws_subnet.Private_Subnet_1.id
  route_table_id = aws_route_table.TerraPrivateRouteTable.id
}
resource "aws_route_table_association" "Private_association_2" {
  subnet_id = aws_subnet.Private_Subnet_2.id
  route_table_id = aws_route_table.TerraPrivateRouteTable.id
}
