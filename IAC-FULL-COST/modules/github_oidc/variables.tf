# modules/github_oidc/variables.tf

variable "role_name" {
  type = string
}

variable "github_org" {
  type = string
}

variable "github_repo" {
  type = string
}

variable "allowed_actions" {
  type = list(string)
}

variable "tags" {
  type = map(string)
  default = {}
}