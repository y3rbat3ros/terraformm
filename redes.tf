resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vn1" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
}

resource "azurerm_subnet" "subne" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vn1.name
  address_prefixes     = var.subnet_address_prefixes
}

output "subnet_id" {
  value = azurerm_subnet.subne.id
}