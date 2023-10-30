#||||||||||||||||||||||||||||||||||||||||||||||Network|||||||||||||||||||||||||||||||||||||||||||||||
module "network" {
  source               = "./modules/network"
  vpc_cidr             = var.vpc_cidr
  env                  = var.env
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = var.repository_name
}

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>EKS<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

module "eks" {
  count              = 1
  source             = "./modules/eks"
  vpc                = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids

}

#=================================================RDS=================================================
module "rds" {
  source     = "./modules/rds"
  username   = var.username
  vpc_id     = module.network.vpc_id
  vpc_cidr   = var.vpc_cidr
  subnet_ids = module.network.private_subnet_ids
}

