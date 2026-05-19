provider "aws" {
  region = var.aws_region
  profile = "santiago"

  assume_role {
    role_arn    = "arn:aws:iam::015688123302:role/OrganizationAccountAccessRole"
  }
  
  default_tags {
    tags = local.common_tags
  }
}