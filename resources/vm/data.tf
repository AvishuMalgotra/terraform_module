data "azurerm_subnet" "subnet-vm" {
  for_each = var.vm
  name                 = each.value.snetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}

data "azurerm_public_ip" "pip-vm" {
  for_each = var.vm
  name                = each.value.pipname
  resource_group_name = each.value.rgname
}