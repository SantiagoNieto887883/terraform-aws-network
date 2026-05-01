variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}
variable "env" {
  description = "environment name"
  type = string
}
variable "vpc_cidr" {
  description = "vpc value"
  type = string
}