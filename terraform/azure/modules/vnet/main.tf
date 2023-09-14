resource "azurerm_virtual_network" "intuitive" {
  name                = var.vnet_name
  address_space       = [var.vnet_cidr_block]
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "vnet_id" {
  description = "intuitive lab"
  value       = azurerm_virtual_network.intuitive.id
}
