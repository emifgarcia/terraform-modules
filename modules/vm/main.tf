resource "azurerm_linux_virtual_machine" "vm" {
  count                           = 0
  name                            = var.vm_name
  resource_group_name             = var.rg_name
  location                        = var.rg_location
  size                            = var.vm_size
  admin_username                  = var.vm_admin_username
  network_interface_ids           = var.nic_id
  admin_password                  = var.admin_password
  disable_password_authentication = false

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  tags = var.vm_tags
}