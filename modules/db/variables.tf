variable "server_name" {
  description = "The name of the PostgreSQL server."
  type        = string

}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string

}

variable "rg_location" {
  description = "The location of the resource group."
  type        = string
  default     = "East US"

}


variable "server_version" {
  description = "The version of the PostgreSQL server."
  type        = string
  default     = "16"

}

variable "admin_username" {
  description = "The administrator username for the PostgreSQL server."
  type        = string
  default     = "adminuser"
  sensitive   = true

}

variable "admin_password" {
  description = "The administrator password for the PostgreSQL server."
  type        = string
  default     = "Itv@12345678"
  sensitive   = true

}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = true

}
