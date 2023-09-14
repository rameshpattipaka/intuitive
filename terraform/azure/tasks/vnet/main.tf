module "intuitive_azure_vnet" {
  source              = "../../azure/modules/vnet"
  vnet_name           = var.vnet_name 
  vnet_cidr_block     = var.vnet_cidr_block
  location            = var.location
  resource_group_name = var.resource_group_name
}
