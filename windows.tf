resource "azurerm_network_interface" "net2" {
  name                = "networkinter2"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subne.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm1" {
  count                 = 1
  name                  = "az104-vm1"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_DC4s_v3"
  admin_username        = "localadmin"
  admin_password        = "P@$$w0rd1234!"
  network_interface_ids = [azurerm_network_interface.net2.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-datacenter-core-g2"
    version   = "latest"
  }
}
