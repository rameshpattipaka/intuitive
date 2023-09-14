resource_group_name  = "intuitive_group"
location = "west us"
vm_size = 10
admin_username = "intuitive_lab"
variable "admin_password" {
  description = "Admin password for the VM"
  default = "intuitive@123"
  type = string
  sensitive  = true
}
data_disk_size_gb = 25
