variable "resource_group_name" {
  description = "grupo de recursos para maquinas virtuales windows y linux"
  type        = string
  default     = "az69-rg8"
}

variable "location" {
  description = "location del grupo de recursos"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "virtualnet"
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "subne"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}