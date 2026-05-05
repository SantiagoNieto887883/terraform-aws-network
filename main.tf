module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = "${local.name_prefix}-xxxx"

  public_subnet_cidr  = var.public_subnet_cidr
  public_subnet_name = "${local.name_prefix}-public-subnet-xxx"
  
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_name = "${local.name_prefix}-asd"

  environment = var.environment
  


  tags = local.common_tags
}
