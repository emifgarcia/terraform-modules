variable "snet_name" {
  description = "Name of the subnet"
  type        = string

}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string

}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string

}

variable "snet_address_prefix" {
  description = "Address prefix of the subnet"
  type        = list(string)

}