resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.snet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.nic_tags
}
