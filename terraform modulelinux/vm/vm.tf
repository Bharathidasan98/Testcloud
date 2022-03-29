resource "azurerm_linux_virtual_machine" "vm" {
  name                = "example-machine"
  resource_group_name = var.res_group
  location            = var.res_group_loc
  size                = "Standard_F2"
  disable_password_authentication = false
  admin_username = var.admin_username
  admin_password = var.admin_password 
  network_interface_ids = [
    var.nic2,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/httpd.sh")
}
