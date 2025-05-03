variable "rg_name" {
  description = "Name of the resource group"
  type        = string

}

variable "rg_location" {
  description = "Location of the resource group"
  type        = string
  default     = "East US"

}

variable "rg_tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)

}
