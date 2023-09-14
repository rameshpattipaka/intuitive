module "intuitive_azure_vm" {
  source               = "../../aure/modules/vm"
  resource_group_name  = var.resource_group_name
  location             =  var.location
  vm_size              = var..vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  data_disk_size_gb    = var.data_disk_size_gb
}
