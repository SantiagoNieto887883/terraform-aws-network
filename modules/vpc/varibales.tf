variable "vpc_cidr" {}
variable "vpc_name" {}

variable "public_subnet_cidr" {}
variable "public_subnet_name" {}

variable "private_subnet_cidr" {}
variable "private_subnet_name" {}

variable "environment" {}

variable "tags" {
  type = map(string)
}