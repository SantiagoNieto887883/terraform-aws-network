provider "aws" {
  region = var.aws_region
  profile = "santiago"
  
  default_tags {
    tags = local.common_tags
  }
}