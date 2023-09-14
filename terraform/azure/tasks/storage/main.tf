module "intuitive_azure_storage_account" {
  source                 = "../../azure/modules/storage"
  resource_group_name    = var.resource_group_name
  location               = var.location
  storage_account_name   = var.storage_account_name
  account_tier           = var.account_tier
  account_replication_type = var.account_replication_type
  enable_https_traffic_only = true              
