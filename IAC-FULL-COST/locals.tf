locals {
  name_prefix = "${var.environment}-infra"

  common_tags = {
    Environment = var.environment
    Project     = "terraform-aws-infra"
    ManagedBy   = "terraform"
  }
}