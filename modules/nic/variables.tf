variable "nic_name" {
  description = "Name of the network interface"
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

variable "snet_id" {
  description = "ID of the subnet"
  type        = string

}