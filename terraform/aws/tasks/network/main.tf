module "vpc" {
  source      = "./aws/modules/network"
  vpc_cidr    = var. vpc_cidr
  public_subnets_cidrs = var.public_subnets_cidrs
  availability_zone = var.availability_zone
}
