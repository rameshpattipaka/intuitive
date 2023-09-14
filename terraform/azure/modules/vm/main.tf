resource "azurerm_resource_group" "intuitive" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "intuitive" {
  name                = var.name
  address_space       = var.address_space
  location            = azurerm_resource_group.intuitive.location
  resource_group_name = azurerm_resource_group.intuitive.name
}

resource "azurerm_subnet" "intuitive" {
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.intuitive.name
  virtual_network_name = azurerm_virtual_network.intuitive.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_network_interface" "intuitive" {
  name                = var.interfacename
  location            = azurerm_resource_group.intuitive.location
  resource_group_name = azurerm_resource_group.intuitive.name

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "intuitive" {
  name                  = "myVM"
  location              = azurerm_resource_group.intitive.location
  resource_group_name   = azurerm_resource_group.intuitive.name
  network_interface_ids = [azurerm_network_interface.intuitive.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_data_disk {
    name              = "datadisk"
    disk_size_gb      = var.data_disk_size_gb
    caching           = "ReadWrite"
    create_option     = "Empty"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = "myvm"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

output "vm_name" {
  description = "The name of the created Azure Virtual Machine"
  value       = azurerm_virtual_machine.intuitive.name
}
