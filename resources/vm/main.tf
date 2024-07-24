resource "azurerm_network_interface" "network-ic" {
  for_each = var.vm
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet-vm[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip-vm[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  for_each = var.vm
  name                = each.value.vmname
  resource_group_name = each.value.rgname
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password = "Adminuser@123"
  network_interface_ids = [
    azurerm_network_interface.network-ic[each.key].id,
  ]

disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}