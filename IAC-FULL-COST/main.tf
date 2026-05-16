module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = "${local.name_prefix}-vpc"

  public_subnet_cidr  = var.public_subnet_cidr
  public_subnet_name = "${local.name_prefix}-public-subnet"
  
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_name = "${local.name_prefix}-private-subnet"

  environment = var.environment
  


  tags = local.common_tags
}

module "sg_private" {
  source = "./modules/security-group"

  vpc_id = module.vpc.vpc_id
  name   = "${local.name_prefix}-private-sg"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.1.0/24"]
    }
  ]
}

module "private_ec2" {
  source = "./modules/ec2"

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = module.vpc.private_subnet_id
  security_group_ids     = [module.sg_private.sg_id]
  name                   = "${local.name_prefix}-private"
  associate_public_ip    = false

  key_name = aws_key_pair.this.key_name

}

module "bastion" {
  source = "./modules/ec2"

  ami                 = data.aws_ami.amazon_linux.id
  instance_type       = "t3.micro"
  subnet_id           = module.vpc.public_subnet_id
  security_group_ids  = [module.sg_bastion.sg_id]
  name                = "${local.name_prefix}-bastion"
  associate_public_ip = true

  key_name = aws_key_pair.this.key_name
}

module "sg_bastion" {
  source = "./modules/security-group"

  vpc_id = module.vpc.vpc_id
  name   = "${local.name_prefix}-bastion-sg"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["190.145.240.172/32"]
    }
  ]
}