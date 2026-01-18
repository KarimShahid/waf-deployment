#default vpc discovery (if needed)
data "aws_vpc" "default" {
  default = true
}

#custom vpc
module "vpc" {

    source = "./modules/vpc"
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





