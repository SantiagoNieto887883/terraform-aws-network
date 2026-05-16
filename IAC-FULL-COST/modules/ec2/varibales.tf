variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type = list(string)
}
variable "name" {}
variable "associate_public_ip" {}

variable "key_name" {}

variable "user_data" {
  type    = string
  default = null
}