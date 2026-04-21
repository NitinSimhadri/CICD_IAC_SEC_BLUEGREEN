module "vpc" {
  source = "./modules/vpc"
}
 
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}
 
module "iam" {
  source = "./modules/iam"
}
 
module "alb" {
  source          = "./modules/alb"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  alb_sg          = module.security.alb_sg
}
 
module "ec2" {
  source           = "./modules/ec2"
  private_subnets  = module.vpc.private_subnets
  ec2_sg           = module.security.ec2_sg
  instance_profile = module.iam.instance_profile
}
module "ecr" {
  source = "./modules/ecr"
} 
