resource "azurerm_subnet" "subnet" {
  for_each = var.snet
  name                 = each.value.snetname
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.address_prefixes
}
