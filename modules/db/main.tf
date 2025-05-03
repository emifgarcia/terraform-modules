resource "azurerm_postgresql_flexible_server" "psql" {
  name                          = var.server_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  version                       = var.server_version
  administrator_login           = var.admin_username
  administrator_password        = var.admin_password
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.psql_tags
  sku_name                      = var.sku_name

}