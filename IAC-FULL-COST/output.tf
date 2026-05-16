data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "debug_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}