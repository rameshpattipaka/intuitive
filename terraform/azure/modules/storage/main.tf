resource "azurerm_resource_group" "intuitive" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "intuitive" {
  name                      = var.storage_account_name
  resource_group_name       = azurerm_resource_group.intuitive.name
  location                  = azurerm_resource_group.intuitive.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

  tags = {
    environment = "production"
  }
}

output "storage_account_name" {
  description = "The name of the created Azure Storage Account"
  value       = azurerm_storage_account.intuitive.name
}
