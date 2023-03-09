variable "aws_region" {
  description = "This describes the variable for the region"
  type = "string"
}
variable "TerraVpc_cidr" {
  description = "This describes the variable for the TerraVpc cidr"
  type = "string"
}
variable "Public_Subnet_1_cidr" {
  description = "This describes the variable for the Public_Subnet_1"
  type = "string"
}
variable "availability_zone_TerraVpc" {
    description = "This describes the variable for the availability zone for the Subnets in TerraVpc "
    type = list (string)
}
variable "Public_Subnet_2_cidr" {
  description = "This describes the variable for the Public_Subnet_2"
  type = "string"
}
variable "Private_Subnet_1_cidr" {
  description = "This describes the variable for the Private_Subnet_1"
  type = "string"
}
variable "Private_Subnet_2_cidr" {
  description = "This describes the variable for the Private_Subnet_2"
  type = "string"
}