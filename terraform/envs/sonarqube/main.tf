module "vpc" {
  source = "../../modules/vpc"
  # vpc
  vpc_name       = var.environment
  vpc_cidr_block = var.vpc_cidr

  # az 
  number_of_az = var.number_of_az
  vpc_azs      = var.vpc_azs

  # public subnets
  number_of_public_subnets  = var.number_of_public_subnets
  public_subnets_cidr_block = var.public_subnets_cidr_block

  # private subnets
  number_of_private_subnets  = var.number_of_private_subnets
  private_subnets_cidr_block = var.private_subnets_cidr_block
}

module "sg" {
  source = "../../modules/sg"

  environment      = var.environment
  vpc_id           = module.vpc.vpc_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
  tags             = var.tags
}

module "ec2" {
  source = "../../modules/ec2"

  instance_type        = var.instance_type
  subnet_id            = module.vpc.public_subnet_ids[0]
  sg_id                = module.sg.firewall_sg_id
  key_name             = var.key_name
  root_volume_type     = var.root_volume_type
  root_volume_size     = var.root_volume_size
  delete_on_termination = var.delete_on_termination
  tags                 = var.tags
  environment          = var.environment

  iam_instance_profile = aws_iam_instance_profile.firewall.name
}
