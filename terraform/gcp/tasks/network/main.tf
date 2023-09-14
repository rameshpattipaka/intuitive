module "intuitive-vpc" {
  source = "../../gcp/modules/network"
  vpc_name = var.vpc_name
  subnet_name =  var.subnet_name
  cidr_range = var.cidr_range 
  region  = var.region  
  nic_count = var.nic_count
  nic_name_region_prefix = var.nic_name_region_prefix
  nic_name = var.nic_name
  
