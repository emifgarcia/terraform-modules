variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string

}

variable "rg_location" {
  description = "Location of the resource group"
  type        = string
  default     = "East US"

}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string

}

variable "vnet_address_space" {
  description = "Address space of the virtual network"
  type        = list(string)

}

variable "vnet_tags" {
  description = "Tags to be applied to the virtual network"
  type        = map(string)

}

