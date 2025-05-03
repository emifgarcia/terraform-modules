variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string

}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string

}

variable "rg_location" {
  description = "Location of the resource group"
  type        = string
  default     = "East US"

}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"

}

variable "vm_admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "adminuser"
  sensitive   = true

}

variable "nic_id" {
  description = "ID of the network interface"
  type        = list(string)

}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  default     = "Itv@12345678"
  sensitive   = true
}

variable "os_disk_caching" {
  description = "Caching type for the OS disk"
  type        = string
  default     = "ReadWrite"

}

variable "storage_account_type" {
  description = "Storage account type for the OS disk"
  type        = string
  default     = "Standard_LRS"

}

variable "image_publisher" {
  description = "Publisher of the image"
  type        = string
  default     = "Canonical"

}

variable "image_offer" {
  description = "Offer of the image"
  type        = string
  default     = "ubuntu-24_04-lts"

}

variable "image_sku" {
  description = "SKU of the image"
  type        = string
  default     = "server"

}

variable "image_version" {
  description = "Version of the image to be used"
  type        = string
  default     = "latest"

}