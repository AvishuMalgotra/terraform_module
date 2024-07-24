resource "azurerm_public_ip" "public-ip" {
  for_each = var.pip
  name                = each.value.pipname
  resource_group_name = each.value.rgname
  location            = each.value.location
  allocation_method   = "Static"
}